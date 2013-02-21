/***********************************************************************************************
*   Controller Name : BL_EventAdmin_DashboardController
*   Date            : 07/08/2012 
*   Author          : Mahesh Sakunala
*   Purpose         : This class is for Displaying Dashboard components
*   
*       Date                 Programmer                        Reason
*   --------------      -------------------           ---------------------------
*   07/08/2012                Mahesh                    To Construct the Class
*   09/08/2012                 BMR                         Tabs LINKS
*   10/08/2012                Mahesh                      Working on Overview
*   11/08/2012                Mahesh                   Working on Hourly Scans Chart
**************************************************************************************************/

public with sharing class BL_EventAdmin_DashboardController 
{

// Variable Declaration Start  

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
public LIST<Event_Attendee_Mapping__c> indusreport{get;set;} 
public LIST<Event_Attendee_Mapping__c> indusgridreport{get;set;}

public LIST<GeographyInner> grphy{get;set;}   
public LIST<IndustryInner> indus{get;set;}  
public LIST<hourlyscansinner> hourlyscans{get;set;}
public LIST<iosdeviceinner> iosdevice{get;set;}

public Integer maxValueHourly{get; set;}
public Integer maxValueIndustry{get; set;}
public LIST<SelectOption> EventDate{get; set;} 
public String EventDates{get; set;}

// Variable Declaration End

// Overview Start

// Methods Start
public integer getCurrentevent() 
{
LIST<User_Profile_Event__c> Events = [SELECT id,Ev_id__r.Ev_Title__c,Ev_Id__c 
                                      FROM User_Profile_Event__c
                                      WHERE EventAdmin_Id__c =: LoginUserId 
                                      AND Profile_id__r.PR_Name__c = 'EventAdmin' 
                                      AND Ev_id__r.Ev_Title__c!=null];
integer eventCount=Events.size();
return eventCount;
}
 
public Integer Attendeecount() 
{
LIST<Event_Attendee_Mapping__c> attendeeCount = [SELECT AS_id__c
                                                 FROM Event_Attendee_Mapping__c
                                                 WHERE Ev_id__c  IN: eventIds 
                                                 AND AS_id__c!=null];
integer attendeesCount=attendeeCount.size();
return attendeesCount;
}

public Integer Visitedattendeecount() 
{
Aggregateresult[] vistedattCount = [SELECT BVS_id__c
                                    FROM User_Event_BVS__c
                                    WHERE Ev_id__c  IN: eventIds 
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
                               AND UEP_isActive__c=true                        
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
// Methods End

// Overview End

// Constructor Start

public BL_EventAdmin_DashboardController() 
{
 allEventsIds= new LIST<ID>();
 LoginUserId = Userinfo.getUserId();

 LIST<User_Profile_Event__c> Events2 = [SELECT id,Ev_id__r.Ev_Title__c,Ev_Id__c 
                                        FROM User_Profile_Event__c
                                        WHERE EventAdmin_Id__c =: LoginUserId 
                                        AND Profile_id__r.PR_Name__c = 'EventAdmin' 
                                        AND Ev_id__r.Ev_Title__c!=null];                                      
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
 
 if(Events2.size()>0)
 {
  EventString =Events2[0].Ev_Id__c;
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

// Constructor End 
    
// Event selection action support Start

public void EventDetailDashBoard()
{    
 if(EventString != 'aa12b34c56d78e9')
 {    
  allEventsIds= new LIST<ID>();       
  allEventsIds.add(EventString);          
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
  hourlyscanchart();
 }
 else 
 {       
  PageReportBool=true;
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
  hourlyscanchart();    
 }                 
}

// Event selection action support End

// Dashboard Start

// Methods start

// Geography chart code

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

// Geography grid code

public void  geographyreport() 
{
 indusreport = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,AS_id__r.AS_Work_States__c,AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Email__c  
                FROM Event_Attendee_Mapping__c  
                WHERE Ev_id__c IN :allEventsIds 
                AND AS_id__r.AS_Work_States__c!=null 
                AND AS_id__r.AS_Work_States__c!= 'None'  ];
}


// Industry chart code 

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
  if(maxValueIndustry == null )
  {
   maxValueIndustry =0;
  }         
  else if(maxValueIndustry <= 5 )
  {
   maxValueIndustry =5;
  }
  else if(maxValueIndustry <= 10)
  { 
   maxValueIndustry =10;
  }
  else if(maxValueIndustry <= 20)
  { 
   maxValueIndustry =20;
  }
  else if(maxValueIndustry <= 30)
  { 
   maxValueIndustry =30;
  }
  else if(maxValueIndustry <= 50)
  {
   maxValueIndustry = 50;
  } 
  else if(maxValueIndustry <=100)
  {  
   maxValueIndustry = 100;
  }
  else if(maxValueIndustry <=200)
  {  
   maxValueIndustry = 200;
  }
  else if(maxValueIndustry <=300)
  {  
   maxValueIndustry = 300;
  }
  else if(maxValueIndustry <=500)
  {  
   maxValueIndustry = 500;
  }
  else
  {
   Integer modmod = maxValueIndustry / 100;    
   maxValueIndustry = 100 *(modmod+1);    
  }
  return null;    
 } 


// Industry grid code

public void indgridreport() 
{
 indusgridreport = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Email__c  
                    FROM Event_Attendee_Mapping__c 
                    WHERE Ev_id__c IN: allEventsIds 
                    AND AS_id__r.AS_PrimaryBusinessCategory1__c!=null 
                    AND AS_id__r.AS_PrimaryBusinessCategory1__c!= 'None'];  
}
 
 
// Device Usage chart code
 
public pagereference ioschart()
{
 devicechart = [SELECT OsVersion__c s,count(id) 
                FROM DeviceUsage__c
                WHERE Ev_id__c IN: allEventsIds 
                GROUP BY OsVersion__c ];                
 iosdevice = new LIST<iosdeviceinner>();
 for(AggregateResult is : devicechart)
 {
  iosdeviceinner ss = new iosdeviceinner(is);
  iosdevice.add(ss);
 } 
 return null;
}
 
 
// Hourly Scan Chart Code                                       
  
 
public pagereference hourlyscanchart()
{ 
 scanchart= [SELECT HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)),count(id)
             FROM User_Event_BVS__c 
             WHERE Ev_id__c IN: allEventsIds
             AND HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c))!= NULL
             GROUP BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c)) 
             ORDER BY HOUR_IN_DAY(convertTimezone(BVS_id__r.ScanTime__c))];            
 hourlyscans = new LIST<hourlyscansinner>();
 EventDate = new LIST<SelectOption>();
 maxValueHourly =0;
 Event__c eventtime = [SELECT id, EV_EndTime__c, StartTime__c,EV_StartDate__c,EV_EndDate__c FROM Event__c WHERE ID = : Eventstring ];
 
 String ssss =  eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':'));
  
 Integer eventStartTime = Integer.ValueOf(eventtime.StartTime__c.SubString(0,eventtime.StartTime__c.lastIndexOf(':')));
 Integer eventEndTime;
 
 Integer eventdays = eventtime.EV_StartDate__c.daysBetween(eventtime.EV_EndDate__c);
 if(eventdays >0)
 {
  date startdate=eventtime.EV_StartDate__c;
  for(Integer i=0; i<=eventdays ; i++ )
  {
   EventDate.add(new SelectOption(String.valueOf(startdate),String.valueOf(startdate)));
   startdate+=1;
  }
 }
 
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
   hourlyscans.add(new hourlyscansinner(ii, scantimemap.get(ii), (ii>=12)?((ii==12)?(12)+'PM':(ii-12)+'PM'): ii+'AM' ));  
   if(maxValueHourly  < scantimemap.get(ii))
    maxValueHourly = scantimemap.get(ii); 
  }
  else
  {
   hourlyscans.add(new hourlyscansinner(ii, 0,(ii>=12)? ((ii==12)?(12)+'PM':(ii-12)+'PM'): ii+'AM'));
  }    
 }  
 if(maxValueHourly == null)
 {
  maxValueHourly =1;
 }
 else if(maxValueHourly <= 5)
 {
  maxValueHourly =5;
 }
 else if(maxValueHourly <= 10)
 { 
  maxValueHourly =10;
 }
 else if(maxValueHourly <= 20)
 { 
  maxValueHourly =20;
 }
 else if(maxValueHourly <= 30)
 { 
  maxValueHourly =30;
 }
 else if(maxValueHourly <= 50)
 {
  maxValueHourly = 50;
 } 
 else if(maxValueHourly <=100)
 {  
  maxValueHourly = 100;
 }
 else if(maxValueHourly <=200)
 {  
  maxValueHourly = 200;
 }
 else if(maxValueHourly <=300)
 {  
  maxValueHourly = 300;
 }
 else if(maxValueHourly <=500)
 {  
  maxValueHourly = 500;
 }
 else
 {
  Integer modmod = maxValueHourly / 100;    
  maxValueHourly = 100 *(modmod+1);    
 }
 return null;
}

// Event date Change


public void pickdate()
{

}

// Methods End

// Inner Classes Start

// Inner Class for Geography

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

//Inner Class for Industry 

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
 
// Inner Class for Device Usage

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

// Inner Class for Hourly Scans

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
 
//Inner Classes End
 
 
//Page Reference Start
    
public PageReference checkUserId()
{       
 if(UserInfo.getUserType()=='guest'){
  PageReference pg = new PageReference('/apex/BL_Eventadmin_signup');
  pg.setRedirect(true);
  return pg;
 }
 else{
  return null;
 }      
}
 
//Page Reference end
}