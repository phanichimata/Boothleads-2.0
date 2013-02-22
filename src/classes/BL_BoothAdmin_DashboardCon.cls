public with sharing class BL_BoothAdmin_DashboardCon 
{

//------------------------------------ Variable Declarations Start  ---------------------------------------
public LIST<ID> allEventsIds{get; set;}
public LIST<SelectOption> eventsAll{get; set;}
public MAP<id, String> eventsMap{get; set;}
public MAP<id, String> eventsMap1{get; set;}
public LIST<ID> eventsList{get; set;}
public LIST<ID> eventIds{get; set;}
public String EventString{get; set;}
public AggregateResult[] Mgraphy {get;set;} 
public AggregateResult[] Minduchrt{get;set;}
public AggregateResult[] MscanedPeople{get;set;}
public AggregateResult[] scanchart{get;set;}
public LIST<LIST<User_Event_BVS__c>> georep{get;set;} 
public LIST<LIST<User_Event_BVS__c>> indRep{get;set;}
public LIST<User_Event_BVS__c> query{get;set;} 
public LIST<User_Event_BVS__c> query1{get;set;}
public LIST<User_Event_BVS__c> an{get;set;}
public LIST<User_Event_BVS__c> gn{get;set;}
public Integer maxValueHourly{get; set;}
public Integer maxValueIndustry{get; set;}
public Integer maxValueLeads{get; set;}
public boolean booleanforDisplayBoothadminTab{get;set;}
public LIST<SelectOption> EventDate{get; set;} 
public String EventDates { get; set; }
public Boolean checkeventdates{get;set;}
public  Event__c eventtime{get; set;}  
public Integer eventStartTime{get; set;}
public Integer eventEndTime{get; set;} 
public list<GeographyInner> grphy{get;set;}  
public list<IndustryInner> indus{get;set;}  
public list<hourlyscansinner> hourlyscans{get;set;}
public LIST<scannedPeopleInner> scanedpeop{get;set;} 
public LIST<User_Profile_Event__c> UEBvs1{get;set;} 
//------------------------------------- Variable Declarations End ----------------------------------------

//------------------------------------------ Constructor Start -------------------------------------------
public BL_BoothAdmin_DashboardCon() 
{
 String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
if(browserType != null && browserType.contains('MSIE')){
Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
}
 allEventsIds= new LIST<ID>();
 eventsList = new LIST<ID>();
 eventsAll = new LIST<SelectOption>();
 eventIds = new LIST<ID>();
 LIST<User_Profile_Event__c> UEBvs1 = new LIST<User_Profile_Event__c>();

 eventsMap = new MAP<id, String>();
 // String ss = 'phani@globalnest.com';
 String ss = Userinfo.getUserName();
        
 UEBvs1= [SELECT ID, EV_id__c,EV_id__r.EV_Title__c,Profile_id__r.PR_Name__c
          FROM User_Profile_Event__c 
          WHERE User_id__r.Email=:UserInfo.getUserName()];
 booleanforDisplayBoothadminTab =false; 
  for(User_Profile_Event__c ube: UEBvs1)
  {   
   if(ube.EV_id__c != NULL && ube.Profile_id__r.PR_Name__c !='Attendee' && ube.Profile_id__r.PR_Name__c !='BoothPersonnel' )
   eventsMap.put(ube.EV_id__c , (String)ube.EV_id__r.EV_Title__c);   
   booleanforDisplayBoothadminTab = true;
  }
  for(id myid: eventsMap.keySet())
  {
   eventsAll.add(new selectOption(myid , eventsMap.get(myid) ));      
   eventIds.add(myid);
  }
  
 if(UEBvs1.size()>0)
 {
 EventString =UEBvs1[0].Ev_Id__c;
 EventDetailDashBoard();
 bvsgeography();
 bvsIndustry();
 bvsScaned();
 hourlyscanchart();
 }
}
//------------------------------------------- Constructor End --------------------------------------------

//------------------------------------------- Methods Start  ---------------------------------------------

//--------------------------------------- Overview Section Start -----------------------------------------
public Integer getBoothusers() 
{
LIST<User_Profile_Event__c> boothusers = [SELECT id 
                                          FROM User_Profile_Event__c 
                                          WHERE Profile_id__r.PR_Name__c = 'BoothPersonnel' 
                                          AND BoothAdmin_id__c=: Userinfo.getUserId()];
integer boothuser=boothusers.size()+1;
return boothuser;
}

public Integer getInactiveboothusers() 
{
LIST<User_Profile_Event__c> ibusers = [SELECT id 
                                       FROM User_Profile_Event__c 
                                       WHERE Profile_id__r.PR_Name__c = 'BoothPersonnel'
                                       AND BoothAdmin_id__c=: Userinfo.getUserId()
                                       AND Status__c='Inactive'];

integer ibuser=ibusers.size();
return ibuser;
}


public Integer getMobileboothusers() 
{
LIST<User_Profile_Event__c> mbusers = [SELECT id 
                                       FROM User_Profile_Event__c 
                                       WHERE Profile_id__r.PR_Name__c = 'BoothPersonnel'
                                       AND BoothAdmin_id__c=: Userinfo.getUserId()
                                       AND Status__c='Mobile only access'];
integer mbuser=mbusers.size();
return mbuser;
}

public Integer getMpboothusers() 
{
LIST<User_Profile_Event__c> mpbusers = [SELECT id 
                                        FROM User_Profile_Event__c 
                                        WHERE Profile_id__r.PR_Name__c = 'BoothPersonnel'
                                        AND BoothAdmin_id__c=: Userinfo.getUserId()
                                        AND Status__c='Mobile and Portal Access'];
integer mpbuser=mpbusers.size();
return mpbuser;
}

public Integer getScannedusers() 
{
LIST<User_Event_BVS__c> totalscans = [SELECT BVS_id__c
                                      FROM User_Event_BVS__c                                      
                                      WHERE UPE_id__r.BoothAdmin_id__c=: Userinfo.getUserId() 
                                      and BVS_id__r.EA_AttendeeBarcode__c!=null
                                      AND UPE_id__r.UEP_isActive__c=true
                                      AND BVS_id__c!=null
];                            
integer totalscancount=totalscans.size();
return totalscancount;
}

public Integer getMobileusers() 
{
List<DeviceUsage__c> androidusers =[SELECT IMEI__c
                                    FROM DeviceUsage__c
                                    WHERE Ev_id__c  IN: eventsList 
                                    AND User__c=: Userinfo.getUserId()
                                    AND OsVersion__c='Android'
                                    AND IMEI__c!=null];
integer androiduser=androidusers.size();
return androiduser;
}

public Integer getBlackberryMobileusers() 
{
List<DeviceUsage__c> blackberryusers =[SELECT IMEI__c
                                       FROM DeviceUsage__c
                                       WHERE Ev_id__c  IN: eventsList 
                                       AND User__c=: Userinfo.getUserId()
                                       AND OsVersion__c='Blackberry'
                                       AND IMEI__c!=null];
integer blackberryuser=blackberryusers.size();
return blackberryuser;
}

public Integer getApplemobileusers() 
{
List<DeviceUsage__c> appleusers=[SELECT IMEI__c
                                 FROM DeviceUsage__c
                                 WHERE Ev_id__c  IN: eventsList 
                                 AND User__c=: Userinfo.getUserId()
                                 AND OsVersion__c='iOS'
                                 AND IMEI__c!=null ];
integer appleuser=appleusers.size();
return appleuser;
}
//---------------------------------------- Overview Section End ------------------------------------------

//--------------------------------------- Dashboard Section Start ----------------------------------------

//--------------------------------- Event Selection Action Support Start ---------------------------------
public void EventDetailDashBoard()
{    
 if(EventString != 'a12b34c56d78e910')
 {    
  eventsList = new LIST<ID>();       
  eventsList.add(EventString);            
  bvsgeography();
  bvsIndustry();
  bvsScaned();
  hourlyscanchart();      
 }
 else 
 {       
  bvsgeography();
  bvsIndustry();
  bvsScaned();
  hourlyscanchart();
 }                 
} 
//---------------------------------- Event Selection Action Support End ----------------------------------

//---------------------------------------- Geography Chart Start -----------------------------------------
 public void bvsgeography()
 {
   Mgraphy = [SELECT BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c  w,count(id) 
             FROM User_Event_BVS__c 
             WHERE EV_id__c  IN: eventsList AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() and BVS_id__r.EA_AttendeeBarcode__c!=null and BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c !=null AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c != 'None'
             GROUP BY BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c];

  grphy= new list<geographyinner>();     
  for (AggregateResult ta : Mgraphy) 
  {
   grphy.add(new geographyinner(ta)); 
  }   
  bvsgeographyreport();   
 }
//----------------------------------------- Geography Chart End ------------------------------------------

//---------------------------------------- Geography Grid Start ------------------------------------------       
 public void bvsgeographyreport()
 {  
  georep = new LIST<LIST<User_Event_BVS__c>>();
  integer recCount=0;       
  query= [SELECT id, BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c 
           FROM User_Event_BVS__c 
           WHERE EV_id__c  IN: eventsList 
           AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() 
           AND BVS_id__r.EA_AttendeeBarcode__c!=null 
           AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c != null 
           AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c != 'None'
           ORDER BY BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c DESC NULLS LAST LIMIT 2250];
  gn=new List<User_Event_BVS__c>();          
  for(User_Event_BVS__c s:query)     
  {
   s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
   s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c);
   s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c);
   s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c);
   s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Work_States__c);  
   recCount++;
   gn.add(s);
   if(recCount==1000)
   {
    georep.add(gn);
    gn= new LIST<User_Event_BVS__c>();
    recCount=0;
   }      
  }
  if(recCount !=0)
  georep.add(gn);  
 }    
//---------------------------------------- Geography Grid End --------------------------------------------

//--------------------------------------- Industry Chart Start -------------------------------------------    
 public void bvsIndustry()
 {       
  Minduchrt =  [SELECT BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c  p,count(id) 
                FROM User_Event_BVS__c 
                WHERE EV_id__c  IN: eventsList 
                AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() 
                AND BVS_id__r.EA_AttendeeBarcode__c!=null 
                AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c !=null 
                AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c != 'None' 
                GROUP BY BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c];
  indus = new list<industryinner>();
  maxValueIndustry = 0;
  for (AggregateResult iat : Minduchrt)     
  {
   indus.add(new industryinner(iat));
   if(maxValueIndustry <(integer)iat.get('expr0'))
   {
    maxValueIndustry = (integer)iat.get('expr0');
   }
  } 
  if(maxValueIndustry == null){ 
     maxValueIndustry =0;
    }
  else if(maxValueIndustry <= 10){ 
     maxValueIndustry =10;
    }
    else if(maxValueIndustry <= 30){ 
     maxValueIndustry =30;
    }
    else if(maxValueIndustry <= 50 ){
     maxValueIndustry = 50;
    } 
    else{
     Integer modmod = maxValueIndustry / 100;    
     maxValueIndustry = 100 *(modmod+1);    
    } 
  bvsIndustryreport();
 }
//---------------------------------------- Industry Chart End --------------------------------------------

//---------------------------------------- Industry Grid Start -------------------------------------------         
 public void bvsIndustryreport()
 {   
  indRep = new LIST<LIST<User_Event_BVS__c>>();
  integer recCount=0;          
  query1= [SELECT id, BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c 
                FROM User_Event_BVS__c 
                WHERE EV_id__c  IN: eventsList 
                AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() 
                AND BVS_id__r.EA_AttendeeBarcode__c!=null 
                AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c !=null 
                AND  BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c != 'None' 
                ORDER BY BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c DESC NULLS LAST LIMIT 2250];       
  an=new List<User_Event_BVS__c>();          
  for(User_Event_BVS__c v:query1)     
  {
   v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
   v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c = escapeSpecialCharacters(v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c);
   v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c);
   v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c = escapeSpecialCharacters(v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c);
   v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c = escapeSpecialCharacters(v.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c);
   recCount++;
   an.add(v);
   if(recCount==1000)
   {
    indRep.add(an);
    an= new LIST<User_Event_BVS__c>();
    recCount=0;
   }      
  }
  if(recCount!=0)
  indRep.add(an);  
 }
//----------------------------------------- Industry Grid End --------------------------------------------   
 
//-------------------------------------- Hourly Scan Chart Start -----------------------------------------  
public void hourlyscanchart()
{ 
 hourlyscans = new list<hourlyscansinner>();
 EventDate = new LIST<SelectOption>();
 eventtime = [SELECT id, EV_EndTime__c, StartTime__c,EV_StartDate__c,EV_EndDate__c FROM Event__c WHERE ID =: Eventstring];
               
 eventStartTime = Integer.ValueOf(eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':')));
 
 EventDates=String.valueOf(eventtime.EV_StartDate__c);                 
 Integer eventdays = eventtime.EV_StartDate__c.daysBetween(eventtime.EV_EndDate__c);
 if(eventdays >0)
 {  
  checkeventdates=true;
  date startdate=eventtime.EV_StartDate__c; 
  for(Integer i=0; i<=eventdays ; i++ )
  {
   EventDate.add(new SelectOption(String.valueOf(startdate),String.valueOf(startdate)));
   startdate+=1; 
  }     
 }
 else if(eventdays==0)
 {
  checkeventdates=false;
 }
 scannedChartByDate();
}

public void scannedChartByDate()
{
 String ssss =  eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':'));
 scanchart= [SELECT HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)),count(id)
             FROM User_Event_BVS__c 
             WHERE Ev_id__c IN: eventsList 
             AND DAY_ONLY(convertTimezone(BVS_id__r.ScanTime__c))=:Date.ValueOf(EventDates)
             AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() 
             AND HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)) != NULL 
             and BVS_id__r.EA_AttendeeBarcode__c!=null
             GROUP BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)) 
             ORDER BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c))];
 if(eventtime.EV_EndTime__c.contains('PM'))
 {
  eventEndTime = Integer.ValueOf(eventtime.EV_EndTime__c.SubString(0,eventtime.EV_EndTime__c.lastIndexOf(':')))+12;
 }
 else 
  eventEndTime = Integer.ValueOf(eventtime.EV_EndTime__c.SubString(0,eventtime.EV_EndTime__c.lastIndexOf(':')));
 
 MAP<Integer, Integer> scanTimes = new MAP<Integer, Integer>();
 
 maxValueHourly = 0;
 
 for(AggregateResult iq : scanchart)
 { 
  scanTimes.put((integer)iq.get('expr0'), (integer)iq.get('expr1'));
 } 
 
 for(Integer ii=eventStartTime; ii<= eventEndTime; ii++ )
 {
 if(scanTimes.containsKey(ii))
 {
  String s12 = (ii>12)?(ii-12)+':00 PM': ii+':00 AM';
  hourlyscans.add(new hourlyscansinner(ii, scanTimes.get(ii), (ii>12)?(ii-12)+'PM': ii+'AM' ));
  
  if(maxValueHourly  < scanTimes.get(ii))
  maxValueHourly = scanTimes.get(ii); 
 }
 else
 {
  hourlyscans.add(new hourlyscansinner(ii, 0,(ii>12)?(ii-12)+'PM': ii+'AM'));
 }    
 }  

 if(maxValueHourly == null){
  maxValueHourly =0;
 }
 else if(maxValueHourly <= 10){ 
  maxValueHourly =10;
 }
 else if(maxValueHourly <= 30){
  maxValueHourly = 30;
 } 
 else if(maxValueHourly <= 50){
  maxValueHourly = 50;
 } 
 else{
  Integer modmod = maxValueHourly / 100;    
  maxValueHourly = 100 *(modmod+1);    
 }       
}

public void pickdate()
{
 hourlyscans = new LIST<hourlyscansinner>();
 scannedChartByDate();
}
//--------------------------------------- Hourly Scan Chart End ------------------------------------------
 
//------------------------------ Leads Scanned by Booth Users Chart Start --------------------------------   
 public void bvsScaned()
 { 
  MscanedPeople = [SELECT BVS_id__r.User_id__r.FirstName f,BVS_id__r.User_id__r.LastName l, count(id) 
                   FROM User_Event_BVS__c 
                   WHERE EV_id__c  IN: eventsList AND UPE_id__r.BoothAdmin_id__c=:userinfo.getUserId() 
                   AND BVS_id__r.EA_AttendeeBarcode__c!=null 
                   AND BVS_id__r.User_id__r.LastName !=null
                   AND BVS_id__r.User_id__r.FirstName !=null
                   GROUP BY  BVS_id__r.User_id__r.FirstName,BVS_id__r.User_id__r.LastName];
  system.debug('checkboothusers'+MscanedPeople);
  scanedpeop = new LIST<scannedPeopleInner>();
  maxValueLeads=0;
  for (AggregateResult iat : MscanedPeople)     
  {
   scanedpeop.add(new scannedPeopleInner(iat)); 
   if(maxValueLeads <(integer)iat.get('expr0'))
   {
    maxValueLeads= (integer)iat.get('expr0');
   } 
  }
  if(maxValueLeads == null){
  maxValueLeads=0;
 }
 else if(maxValueLeads <= 10){ 
  maxValueLeads =10;
 }
  else if(maxValueLeads <= 30){
  maxValueLeads = 30;
 } 
  else if(maxValueLeads <= 50){
  maxValueLeads = 50;
 }
 else{
  Integer modmod = maxValueLeads/ 100;    
  maxValueLeads = 100 *(modmod+1);    
 }
}
//------------------------------- Leads Scanned by Booth Users Chart End ---------------------------------                                        
//--------------------------------------- Dashboard Section End ----------------------------------------- 
//------------------------------------------- Methods End  ----------------------------------------------

//--------------------------------------- Inner Classes Start ------------------------------------------- 

//------------------------------------ Inner Class for Geography ---------------------------------------- 
public class GeographyInner 
{
 public integer georecords{get;set;}  
 public string geogy{get;set;}  
 public GeographyInner(AggregateResult ge)  
 {
  georecords = (integer)ge.get('expr0');  
  geogy = (string)ge.get('w');      
 }
}

//------------------------------------ Inner Class for Industry -----------------------------------------
public class IndustryInner 
{
 public integer indusrec{get;set;} 
 public string industry{get;set;} 
 public IndustryInner(AggregateResult re)  
 {
  indusrec= (integer)re.get('expr0'); 
  industry= (string)re.get('p');  
 }
}
 
//---------------------------------- Inner Class for Hourly Scans ---------------------------------------
public class hourlyscansinner
{
 public integer scanrecords{get;set;}
 public integer scantime{get;set;}
 public string sTime{get; set;}
 public hourlyscansinner(Integer i1, Integer i2, String stime)
 {
  scanrecords= i2; 
  scantime= i1;  
  if(sTime.contains('12'))
  {
    
    this.sTime = sTime;
   //this.sTime = sTime.subString(0, sTime.lastIndexOf('AM'))+ 'AM';
  }
  else
  {
   this.sTime = sTime;
  }   
 }
}
 
//---------------------------------- Inner Class for Leads Scanned --------------------------------------- 
public Class scannedPeopleInner
{
 public integer scanpeople{get;set;} 
 public string personName{get;set;}    
 public scannedPeopleInner(AggregateResult re)  
 {
  scanpeople= (integer)re.get('expr0');
  personName= (string)re.get('f')+' '+(string)re.get('l');  
 }          
}
 
//---------------------------------------- Inner Classes End -------------------------------------------- 
 
//--------------------------------------- Page Reference Start ------------------------------------------   
public PageReference login() {
   if(userInfo.getUserType()=='guest'){
    Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
    pg.setredirect(true);
        return pg;   
   } 
  
   List<User_Profile_Event__c> ty =new  List<User_Profile_Event__c>();
      ty=[select Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:userInfo.getUserName() and Profile_id__r.PR_Name__c='eventadmin'];
       if(ty.size()>0){
       Pagereference pg = new pagereference('/apex/BL_EventAdmin_Dashboard');
       pg.setredirect(true);
        return pg;      
  }  
  List<User_Profile_Event__c> upelist1=new  List<User_Profile_Event__c>();
   upelist1=[select Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:userInfo.getUserName() And Profile_id__r.PR_Name__c='BoothAdmin' ];
 
   if(upelist1.size()>0){
    return null;
   }
   else{
    Pagereference pg = new pagereference('/apex/bl_eventadmin_events');
    pg.setredirect(true); 
    return pg;
   } 
}
//---------------------------------------- Page Reference End -------------------------------------------

//----------------------------------- Escape Special Characters Start -----------------------------------
public String escapeSpecialCharacters(String input){
    if(input!= null && input != '' && (input.contains('\\') )){
       input = input.replace('\\','\\\\');
       }
       if(input!= null && input != '' && (input.contains('"') )){
       input = input.replace('"','\\\"');
       }
       if(input!= null && input != '' && (input.contains('<') )){
       input = input.replace('<','');
       }
      return input;
    }
   
//----------------------------------- Escape Special Characters End --------------------------------------

//------------------------------------------ Test Method Start -------------------------------------------
static testmethod void test_BL_BoothAdmin_DashboardCon()
{
 Profile p = [select id from profile where name='Standard User'];
   
   User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing',firstname='FirstTesting', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
   insert u;
   
   Event__c ev = new Event__c(EV_Title__c='TestEvent',
                             EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/16/2014'),
                             EV_EndTime__c='09:00 PM',
                             StartTime__c='09:00 AM');
   insert ev;
   
   Event__c ev1 = new Event__c(EV_Title__c='TestEvent1',
                             EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
   insert ev1;
   
   User_Profile_Event__c upe=new User_Profile_Event__c(EV_id__c=ev.id,BoothAdmin_id__c=u.id,EventAdmin_Id__c=u.id,User_id__c=u.id);
   insert upe;  
      
   AttendeeSummary__c att = new AttendeeSummary__c(AS_FirstName__c='testattendeesummaryfirstname',
                                                 AS_LastName__c='testattendeelastname',
                                                 AS_Email__c='test123@noemail.com',
                                                 AS_Company__c='testattendeecompany',
                                                 AS_Work_States__c='Alabama',
                                                 AS_PrimaryBusinessCategory1__c='Accounting',
                                                 AS_CellPhone__c='9858590231');    
   insert att; 
   
   Event_Attendee_Mapping__c eam=new Event_Attendee_Mapping__c(EV_id__c=ev.id,AS_id__c=att.id,DiversityType__c='xxxxxxx',TicketTypes__c='Reception',EA_AttendeeBarcode__c='a0DO0000002nMqmMAE-a0EO0000002fPtZMAU');
   insert eam;
  
   BoothVisitSummary__c bvs=new BoothVisitSummary__c(ScanTime__c=datetime.valueOf('2012-05-15 00:00:00'),User_id__c=u.id,EA_AttendeeBarcode__c=eam.id);
   insert bvs;
  
   User_Event_BVS__c ueb=new User_Event_BVS__c(BVS_id__c=bvs.id,EV_id__c=ev.id,UPE_id__c=upe.id);
   insert ueb;

   List<Event_Attendee_Mapping__c> listOfEvent = new List<Event_Attendee_Mapping__c>();
   listOfEvent.add(eam);
      
   list<Event__c> lev = new list<Event__c>();
   lev.add(ev);
   
   list<User_Profile_Event__c> lupe = new list<User_Profile_Event__c>();
   lupe.add(upe);  
   
   List<id> listid =new List<id>();
   listid.add(eam.id);
   
   system.runAs(u)
   {               
    BL_BoothAdmin_DashboardCon bdc=new BL_BoothAdmin_DashboardCon();  
   
    bdc.UEBvs1=lupe;   
    bdc.eventsList=listid;
    bdc.EventString=ev.id;
    bdc.eventtime=ev;
    bdc.EventDates='2012-12-25';
    bdc.hourlyscanchart();
    bdc.bvsScaned();
    bdc.eventtime=ev1;
    bdc.EventString=ev1.id;
    bdc.hourlyscanchart();
    bdc.bvsScaned();
    bdc.getBoothusers();
    bdc.getInactiveboothusers();
    bdc.getMobileboothusers();
    bdc.getMpboothusers();
    bdc.getScannedusers();
    bdc.getMobileusers();
    bdc.getBlackberryMobileusers();
    bdc.getApplemobileusers();
    bdc.bvsgeography();
    bdc.bvsgeographyreport();
    bdc.bvsIndustry();
    bdc.bvsIndustryreport();
    bdc.bvsScaned(); 
    bdc.login();
    bdc.pickdate();
    bdc.escapeSpecialCharacters('m"k<c\\h');
   pageReference pg = Page.BL_BoothAdmin_Dashboard;
   Test.setCurrentPage(pg);
  }
}
//------------------------------------------- Test Method End --------------------------------------------

}