public with sharing class BL_EventAdmin_DashboardCon1 
{

//------------------------------------ Variable Declarations Start  ---------------------------------------
public Integer TotalAttendees{get; set;}
public Integer TotalVisitedAttendees{get; set;}
public Integer TotalMobileUsers{get; set;}
public Integer TotalScansNum{get; set;}
public LIST<ID> allEventsIds{get; set;}
public LIST<ID> eventIds {get; set;}
public String LoginUserId{get;set;}
public String EventString{get;set;}
public Boolean PageReportBool {get;set;} 
public LIST<SelectOption> events{get; set;}
public AggregateResult[] graphy {get;set;}  
public AggregateResult[] induchrt{get;set;}
public AggregateResult[] devicechart{get;set;} 
public AggregateResult[] scanchart{get;set;}
public LIST<LIST<Event_Attendee_Mapping__c>> indusreport{get;set;} 
public LIST<LIST<Event_Attendee_Mapping__c>> indusgridreport{get;set;}
public LIST<Event_Attendee_Mapping__c> query{get;set;} 
public LIST<Event_Attendee_Mapping__c> query1{get;set;}
public LIST<Event_Attendee_Mapping__c> an{get;set;}
public LIST<Event_Attendee_Mapping__c> gn{get;set;}
public LIST<GeographyInner> grphy{get;set;}   
public LIST<IndustryInner> indus{get;set;}  
public LIST<hourlyscansinner> hourlyscans{get;set;}
public LIST<iosdeviceinner> iosdevice{get;set;}
public Integer maxValueHourly{get; set;}
public Integer maxValueIndustry{get; set;}
public LIST<SelectOption> EventDate{get; set;} 
public String EventDates{get; set;}
public Boolean checkeventdates{ get; set; }
public String eventnameforDashboard{get; set; }
public Boolean noevents{get;set;}
public String noeventmessage{get;set;}
public LIST<User_Profile_Event__c> Events2{get;set;}
//------------------------------------- Variable Declarations End ----------------------------------------

//------------------------------------------ Constructor Start -------------------------------------------
public BL_EventAdmin_DashboardCon1() 
{
 allEventsIds= new LIST<ID>();
 // LoginUserId = Userinfo.getUserId();
 LoginUserId = '005O0000000qMdz';
 LIST<User_Profile_Event__c> Events2 = [SELECT id,Ev_id__r.Ev_Title__c,Ev_Id__c 
                                        FROM User_Profile_Event__c
                                        WHERE User_id__c =: LoginUserId 
                                        AND Ev_id__r.Ev_Title__c!=NUll
];                                      
 eventIds = new LIST<ID>();
 Events = new LIST<SelectOption>();   
 for(User_Profile_Event__c EventFromJun : Events2)
 {  
  if(EventFromJun.Ev_Id__c != null)
  {      
   Events.add(new SelectOption(EventFromJun.Ev_Id__c, EventFromJun.Ev_id__r.Ev_Title__c)); 
   eventIds.add(EventFromJun.Ev_Id__c);   
  }   
 }
 if(Events2.size()==0)
 {
  noevents=false;
 }
 else if(Events2.size()>0)
 {
  noevents=true;
  EventString =Events2[0].Ev_Id__c;
  eventnameforDashboard=Events2[0].Ev_id__r.Ev_Title__c;
  EventDetailDashBoard();
  PageReportBool=true;
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
  hourlyscanchart();
 }
 TotalAttendees = Attendeecount();
 TotalVisitedAttendees = Visitedattendeecount();
 TotalMobileUsers = Mobileusers();
 TotalScansNum = Totalscans();
}
//------------------------------------------- Constructor End --------------------------------------------

//------------------------------------------- Methods Start  ---------------------------------------------

//--------------------------------------- Overview Section Start -----------------------------------------
public integer getCurrentevent() 
{
LIST<User_Profile_Event__c> Events = [SELECT id,Ev_id__r.Ev_Title__c,Ev_Id__c 
                                        FROM User_Profile_Event__c
                                        WHERE User_id__c =: LoginUserId 
                                        AND Ev_id__r.Ev_Title__c!=NUll ];
integer eventCount=Events.size();
return eventCount;
}
 
public Integer Attendeecount() 
{
LIST<Event_Attendee_Mapping__c> attendeeCount = [SELECT AS_id__c
                                                 FROM Event_Attendee_Mapping__c
                                                 WHERE Ev_id__c IN: eventIds 
                                                 AND AS_id__c!=null];
integer attendeesCount=attendeeCount.size();
return attendeesCount;
}

public Integer Visitedattendeecount() 
{
Aggregateresult[] vistedattCount = [SELECT BVS_id__c
                                    FROM User_Event_BVS__c
                                    WHERE Ev_id__c IN: eventIds 
                                    AND BVS_id__c!=null
                                    GROUP BY BVS_id__c ];
integer vistedAttendees=vistedattCount.size();
return vistedAttendees;
}

public Integer getBoothcount() 
{
Aggregateresult[] boothCount =[SELECT Bt_Id__c
                               FROM User_Profile_Event__c
                               WHERE EventAdmin_Id__c =: LoginUserId 
                               AND Ev_id__c IN: eventIds                            
                               AND UEP_isActive__c=true      
                               AND Bt_Id__r.BT_isBoothActive__c=true                  
                               AND Bt_Id__c!=null
                               GROUP BY Bt_Id__c ];
integer boothsCount=boothCount.size();
return boothsCount;
} 
 
public Integer Mobileusers() 
{
LIST<DeviceUsage__c> mobileusersCount =[SELECT IMEI__c
                                        FROM DeviceUsage__c
                                        WHERE Ev_id__c IN: eventIds                                 
                                        AND IMEI__c!=null];
integer mobileCount=mobileusersCount.size();
return mobileCount;
}

public Integer Totalscans() 
{
Aggregateresult[] totalscans = [SELECT BVS_id__c
                                FROM User_Event_BVS__c
                                WHERE Ev_id__c  IN: eventIds 
                                AND BVS_id__c!=null
                                GROUP BY BVS_id__c ];
integer totalscancount=totalscans.size();
return totalscancount;
}
//---------------------------------------- Overview Section End ------------------------------------------

//--------------------------------------- Dashboard Section Start ----------------------------------------

//--------------------------------- Event Selection Action Support Start ---------------------------------
public void EventDetailDashBoard()
{    
 if(EventString != 'aa12b34c56d78e9'){    
  allEventsIds= new LIST<ID>();       
  allEventsIds.add(EventString);          
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
  hourlyscanchart();
 }
 else{       
  PageReportBool=true;
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
  hourlyscanchart();    
 }                 
}
//---------------------------------- Event Selection Action Support End ----------------------------------

//---------------------------------------- Geography Chart Start -----------------------------------------
 public void geoChart() 
 {     
  graphy = [SELECT AS_id__r.AS_Work_States__c w,count(id) 
            FROM Event_Attendee_Mapping__c 
            WHERE Ev_id__c  IN: allEventsIds 
            AND AS_id__r.AS_Work_States__c!=null
            AND AS_id__r.AS_Work_States__c!= 'None'  
            GROUP BY AS_id__r.AS_Work_States__c ];            
  grphy= new LIST<geographyinner>();     
  for (AggregateResult ta : graphy) 
  {
   geographyinner es = new geographyinner(ta);   
   grphy.add(es); 
  }     
 } 
//----------------------------------------- Geography Chart End ------------------------------------------

//---------------------------------------- Geography Grid Start ------------------------------------------
public void  geographyreport() 
{
 indusreport= new LIST<LIST<Event_Attendee_Mapping__c>>();
 integer recCount=0;
 query = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Work_States__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Email__c  
                FROM Event_Attendee_Mapping__c  
                WHERE Ev_id__c IN :allEventsIds 
                AND AS_id__r.AS_Work_States__c!=null 
                AND AS_id__r.AS_Work_States__c!= 'None' LIMIT 2250];
 an=new LIST<Event_Attendee_Mapping__c>();                
 for(Event_Attendee_Mapping__c s:query)     
 {
   s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
   s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
   s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
   s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
   s.AS_id__r.AS_Company__c= escapeSpecialCharacters(s.AS_id__r.AS_Company__c); 
   s.AS_id__r.AS_Work_States__c = escapeSpecialCharacters(s.AS_id__r.AS_Work_States__c);  
   recCount++;
   an.add(s);
   if(recCount==1000)
   {
    indusreport.add(an);
    an = new LIST<Event_Attendee_Mapping__c>();
    recCount=0;
   }      
  }
  if(recCount !=0)
  indusreport.add(an);
}
//---------------------------------------- Geography Grid End --------------------------------------------

//--------------------------------------- Industry Chart Start -------------------------------------------
 public pagereference industryAdminChart() 
 {  
  induchrt= [SELECT AS_id__r.AS_PrimaryBusinessCategory1__c p,count(id) 
             FROM Event_Attendee_Mapping__c 
             WHERE Ev_id__C IN: allEventsIds 
             AND AS_id__r.AS_PrimaryBusinessCategory1__c!=null 
             AND AS_id__r.AS_PrimaryBusinessCategory1__c!= 'None'
             GROUP BY AS_id__r.AS_PrimaryBusinessCategory1__c]; 
  
  indus = new LIST<industryinner>();
  maxValueIndustry = 0;
  for(AggregateResult iat : induchrt)     
  {
   industryinner res = new industryinner(iat);             
   indus.add(res);
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
  else if(maxValueIndustry <= 50){
   maxValueIndustry = 50;
  } 
  else{
   Integer modmod = maxValueIndustry / 100;    
   maxValueIndustry = 100 *(modmod+1);    
  }
  return null;    
 } 
//---------------------------------------- Industry Chart End --------------------------------------------

//---------------------------------------- Industry Grid Start ------------------------------------------- 
public void indgridreport() 
{
 indusgridreport=new LIST<LIST<Event_Attendee_Mapping__c>>();
 integer recCount=0;
 query1 = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Email__c  
                    FROM Event_Attendee_Mapping__c 
                    WHERE Ev_id__c IN: allEventsIds 
                    AND AS_id__r.AS_PrimaryBusinessCategory1__c!=null 
                    AND AS_id__r.AS_PrimaryBusinessCategory1__c!= 'None' LIMIT 2250];
 gn = new LIST<Event_Attendee_Mapping__c>();
       
  for(Event_Attendee_Mapping__c v:query1)
  {
   v.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(v.AS_id__r.AS_FirstName__c);
   v.AS_id__r.AS_LastName__c = escapeSpecialCharacters(v.AS_id__r.AS_LastName__c);
   v.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(v.AS_id__r.AS_CellPhone__c);
   v.AS_id__r.AS_Email__c = escapeSpecialCharacters(v.AS_id__r.AS_Email__c);
   v.AS_id__r.AS_Company__c= escapeSpecialCharacters(v.AS_id__r.AS_Company__c);  
   v.AS_id__r.AS_PrimaryBusinessCategory1__c = escapeSpecialCharacters(v.AS_id__r.AS_PrimaryBusinessCategory1__c);
   recCount++;
   gn.add(v);
   if(recCount==1000)
   {
    indusgridreport.add(gn);
    gn= new LIST<Event_Attendee_Mapping__c>();
    recCount=0;
   }   
  } 
  if(recCount !=0)
  indusgridreport.add(gn);
}
//----------------------------------------- Industry Grid End --------------------------------------------   
 
//-------------------------------------- Hourly Scan Chart Start -----------------------------------------                                     
public  Event__c eventtime{get; set;}  
public Integer eventStartTime{get; set;}
public Integer eventEndTime{get; set;}

public void hourlyscanchart()
{ 
 hourlyscans = new LIST<hourlyscansinner>();
 EventDate = new LIST<SelectOption>();
 
 eventtime = [SELECT id, EV_EndTime__c, StartTime__c,EV_StartDate__c,EV_EndDate__c FROM Event__c WHERE ID = : Eventstring ];
 
 eventStartTime = Integer.ValueOf(eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':')));
 Integer eventStartTime1 = Integer.ValueOf(eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.indexOf(':')));
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
 maxValueHourly =0;
 String ssss =  eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':'));
 scanchart= [SELECT HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)),count(id)
             FROM User_Event_BVS__c 
             WHERE Ev_id__c IN: allEventsIds
             AND DAY_ONLY(convertTimezone(BVS_id__r.ScanTime__c))=:Date.ValueOf(EventDates) 
             AND HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c))!= NULL
             GROUP BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)) 
             ORDER BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c))];          
 if(eventtime.EV_EndTime__c.contains('PM'))
 {
  eventEndTime = Integer.ValueOf(eventtime.EV_EndTime__c.SubString(0,eventtime.EV_EndTime__c.lastIndexOf(':')))+12;
 }
 else 
  eventEndTime = Integer.ValueOf(eventtime.EV_EndTime__c.SubString(0,eventtime.EV_EndTime__c.lastIndexOf(':')));
 MAP<Integer, Integer> scantimemap= new MAP<Integer, Integer>();
 
 for(AggregateResult iq : scanchart)
 { 
  scantimemap.put((integer)iq.get('expr0'),(integer)iq.get('expr1'));
 } 
 
 for(Integer ii=eventStartTime; ii<= eventEndTime; ii++)
 {
  if(scantimemap.containsKey(ii))
  {  
   hourlyscans.add(new hourlyscansinner(ii, scantimemap.get(ii),(ii>=12)?((ii==12)?(12)+'PM':(ii-12)+'PM'): ii+'AM'));  
   if(maxValueHourly  < scantimemap.get(ii))
    maxValueHourly = scantimemap.get(ii); 
  }
  else
  {
   hourlyscans.add(new hourlyscansinner(ii, 0,(ii>=12)? ((ii==12)?(12)+'PM':(ii-12)+'PM'): ii+'AM'));
  }    
 }  
 if(maxValueHourly == null){
  maxValueHourly =0;
 }
 else if(maxValueHourly <= 10){ 
  maxValueHourly =10;
 } 
 else if(maxValueHourly <= 30){ 
  maxValueHourly =30;
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
//--------------------------------------- Hourly Scan Chart End -----------------------------------------
 
//------------------------------------- Device Usage Chart Start ----------------------------------------   
public pagereference ioschart()
{
 devicechart = [SELECT OsVersion__c s,count(id) 
                FROM DeviceUsage__c
                WHERE Ev_id__c IN: allEventsIds 
                AND OsVersion__c !=null 
                GROUP BY OsVersion__c ];                
 iosdevice = new LIST<iosdeviceinner>();
 for(AggregateResult is : devicechart)
 {
  iosdeviceinner ss = new iosdeviceinner(is);
  iosdevice.add(ss);
 } 
 return null;
}
//-------------------------------------- Device Usage Chart End ----------------------------------------- 
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
   // this.sTime = sTime.subString(0, sTime.lastIndexOf('AM'))+ 'AM';
  }
  else
  {
   this.sTime = sTime;
  }   
 }
}

//---------------------------------- Inner Class for Device Usage --------------------------------------- 
public class iosdeviceinner
{
 public integer iosrecords{get;set;}
 public string  iosname{get;set;}
 public iosdeviceinner(AggregateResult os)
 {
  iosrecords = (integer)os.get('expr0'); 
  iosname = (string)os.get('s');   
 }
}

//---------------------------------------- Inner Classes End -------------------------------------------- 
 
//--------------------------------------- Page Reference Start ------------------------------------------   
public PageReference checkUserId()
{       
 if(UserInfo.getUserType()=='guest'){
  PageReference pg = new PageReference('/apex/BL_Eventadmin_signup');
  pg.setRedirect(true);
  return pg;
 }
 
 
  LIST<User_Profile_Event__c> ty =new  LIST<User_Profile_Event__c>();
      ty=[select Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:userInfo.getUserName() and Profile_id__r.PR_Name__c='BoothAdmin'];
       if(ty.size()>0){
       Pagereference pg = new pagereference('/apex/BL_BoothAdmin_Dashboard');
       pg.setredirect(true);
        return pg;      
       }
      else{
    return null;
   }                
}
//---------------------------------------- Page Reference End -------------------------------------------

//----------------------------------- Escape Special Characters Start -----------------------------------
public String escapeSpecialCharacters(String input)
{   
 if(input!= null && input != '' && (input.contains('"')  || input.contains('<')))
 {
  if(input!= null && input != '' && (input.contains('"') ))
  {
   input = input.replace('"','\\\"');
  }
  if(input!= null && input != '' && (input.contains('<') ))
  {
   input = input.replace('<','');
  }
 }  
 return input;
}
//----------------------------------- Escape Special Characters End --------------------------------------

//------------------------------------------ Test Method Start -------------------------------------------
  static testmethod void test_BL_EventAdmin_DashboardCon()
  {
   Profile p = [select id from profile where name='Standard User'];
   
   User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
   insert u;                 
         
     // ------------------ Boothtadmin Insert ---------------------
         
       user bAdmin =  new User(alias = 'testboot', email='testboothadmin@noemail.com',
                 emailencodingkey='UTF-8',profileid = p.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='testboothadmin@noemail.com');
                  insert bAdmin ;
                  Id boothAdminId=bAdmin.id;
         
                  
       Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
       insert  customProfile;
       
       Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileBooth;           
       
      Id  profileId=customProfile.Id;
   
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
   DeviceUsage__c du=new DeviceUsage__c(OsVersion__c='Android',EV_id__c=ev.id,User__c=u.id);   
   insert du;
  Event_Attendee_Mapping__c eam=new Event_Attendee_Mapping__c(EV_id__c=ev.id,AS_id__c=att.id,DiversityType__c='xxxxxxx',TicketTypes__c='Reception');
  insert eam;
  
  BoothVisitSummary__c bvs=new BoothVisitSummary__c(ScanTime__c=datetime.valueOf('2012-05-15 00:00:00'));
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
   
   system.runAs(bAdmin){                
   
   BL_EventAdmin_DashboardCon edc=new BL_EventAdmin_DashboardCon();
   
   edc.checkUserId();

   }
     
   system.runAs(u){                
   
   BL_EventAdmin_DashboardCon edc=new BL_EventAdmin_DashboardCon();
   
   edc.LoginUserId=u.id;
   
   edc.Events2=lupe;   
   edc.eventids=listid;
   edc.allEventsIds=listid;
   edc.EventString=ev.id;
   edc.eventtime=ev;
   edc.EventDates='2012-12-25';
   edc.hourlyscanchart();
   edc.scannedChartByDate();
   edc.eventtime=ev1;
   edc.EventString=ev1.id;
   edc.hourlyscanchart();
   edc.scannedChartByDate();
   edc.getCurrentevent();
   edc.Attendeecount();
   edc.Visitedattendeecount();
   edc.getBoothcount();
   edc.Mobileusers();
   edc.Totalscans();
   edc.geoChart();
   edc.geographyreport();
   edc.industryAdminChart();
   edc.indgridreport(); 
   edc.ioschart();
   edc.checkUserId();
   edc.pickdate();
   edc.escapeSpecialCharacters('m"k<c\\h');
   pageReference pg = Page.BL_EventAdmin_Dashboard;
   Test.setCurrentPage(pg);
   }
  }
//------------------------------------------- Test Method End --------------------------------------------

}