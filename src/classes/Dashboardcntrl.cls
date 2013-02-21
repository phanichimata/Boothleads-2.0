public class Dashboardcntrl 
{

    public String getScantimevalue() {
        return null;
    }




 

public LIST<ID> allEventsIds{get; set;}
// Constructor Start 

public Dashboardcntrl() 
{
allEventsIds= new LIST<ID>();
//LoginUserId = Userinfo.getUserId(); 
LoginUserId = '005O0000000ZGnt';  
getEvents();
PageReportBool=true;
geoChart();
geographyreport();
industryAdminChart();
indgridreport();
ioschart();


}

// Constructor End     

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
 }
 else 
 {       
  getEvents();
  PageReportBool=true;
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();       
 }                 
}

public String escapeSpecialCharacters(String input)
{
  if(input!= null && input != '' && (input.contains('\\') ))
  {
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


//Page Reference Start

public PageReference Reportsaction()  
{ 
pagereference pg = new pagereference('/apex/BL_Evntadmreports');
pg.setredirect(true);
return pg;

}

public PageReference AttendeesAction() 
{ 
  Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_Attendees');
pg.setRedirect(true);
return pg;

}

public PageReference Customeraction() 
{ 
pagereference pg = new Pagereference('/apex/BL_EventAdmin_Booths');
pg.setredirect(true);
return pg;

}

public PageReference EventAction() 
{ 
Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Events');
Pg.setredirect(true);
return pg;

}

public PageReference profileaction() 
{  
Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
Pg.setredirect(true);
Return pg;
}
    
// Page refrence End


//Event Retrieval start


public String LoginUserId{get;set;}
public string EventString{get;set;}

public List<selectOption> getEvents ()
{
  List<selectOption> SelEvent = new List<selectOption>();
  List<User_Profile_Event__c> Events = [select id,Ev_id__r.Ev_Title__c,Ev_Id__c from User_Profile_Event__c
                                          where EventAdmin_Id__c =: LoginUserId AND Profile_id__r.PR_Name__c = 'EventAdmin' and Ev_id__r.Ev_Title__c!=null];
  
  MAP<id, SObject> UPEIds = new MAP<ID, SObject>();
  
  
  
  system.debug(':::::::::::::'+Events );   
  SelEvent.add(new SelectOption('aa12b34c56d78e9','-- All Events --'));
  for(User_Profile_Event__c EventFromJun : Events)
  {  
   if(EventFromJun.Ev_Id__c != null)
   {      
    // UPEIds.put( EventFromJun.id, EventFromJun);
    SelEvent.add(new SelectOption(EventFromJun.Ev_Id__c,EventFromJun.Ev_id__r.Ev_Title__c)); 
    allEventsIds.add(EventFromJun.Ev_Id__c);   
   }   
  }  
  
 /* for(id myid: UPEIds.keySet() )
  {
      
    system.debug('9999999999'+ myid );
    
    system.debug('8888888888'+ (User_Profile_Event__c)UPEIds.get(myid) );
    
    
     User_Profile_Event__c upe = (User_Profile_Event__c)UPEIds.get(myid);
     SelEvent.add(new SelectOption(upe.Ev_Id__c,upe.Ev_id__r.Ev_Title__c)); 
  
  } */
                                   
 return SelEvent ;
}


//Event Retrieval end



// Variable Declaration Start  


public AggregateResult[] graphy {get;set;}  
public AggregateResult[] induchrt{get;set;}
public AggregateResult[] devicechart{get;set;} 
public Boolean PageReportBool {get;set;}  
public List<Event_Attendee_Mapping__c> indusreport {get;set;} 
public List<Event_Attendee_Mapping__c> indusgridreport {get;set;}


// Variable Declaration End 



// Methods start

// Geography chart code
 public void geoChart() 
 {   
  //system.debug('------eeeeeeeeeeeeee-------' +EventString );    
  graphy = [select AS_id__r.AS_WorkState__c w,count(id) from Event_Attendee_Mapping__c where Ev_id__c  IN: allEventsIds AND AS_id__r.AS_WorkState__c!=null group by AS_id__r.AS_WorkState__c ];   // where EV_id__r.EV_Title__c=:'Space Works'   and AS_id__r.AS_WorkState__c!=null
  system.debug('------chartgeo-------' +graphy );    
  grphy= new list<geographyinner>();     
  for (AggregateResult ta : graphy) 
  {
   geographyinner es = new geographyinner(ta);   
   grphy.add(es); 
  }   
  
 } 

// Geography grid code

public void  geographyreport() 
{
   indusreport = [select id,AS_id__r.AS_FirstName__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkState__c,
                           AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,
                           AS_id__r.AS_Email__c  from Event_Attendee_Mapping__c  
                           where Ev_id__c IN :allEventsIds and AS_id__r.AS_WorkState__c!=null ];
   system.debug('-------gridgeo---------' +indusreport); 
}


// Industry chart code 

 public pagereference industryAdminChart()    
 {
  try 
  {    
   induchrt= [select AS_id__r.AS_PrimaryBusinessCategory1__c p,count(id) from Event_Attendee_Mapping__c where Ev_id__C IN: allEventsIds  and AS_id__r.AS_PrimaryBusinessCategory1__c!=null group by AS_id__r.AS_PrimaryBusinessCategory1__c LIMIT 5]; 
   system.debug('-------chartindustry---------' +induchrt);  
   indus = new list<industryinner>();  
    for (AggregateResult iat : induchrt)     
     {
      industryinner res = new industryinner(iat);             
      indus.add(res);    
     } 
    } 
   catch (Exception e){}       
  return null;      
 } 


// Industry grid code

public void indgridreport() 
{
    indusgridreport = [select id,AS_id__r.AS_FirstName__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkState__c,
                                   AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,
                                   AS_id__r.AS_Email__c  from Event_Attendee_Mapping__c 
                                   where Ev_id__c IN: allEventsIds and AS_id__r.AS_PrimaryBusinessCategory1__c!=null LIMIT 10]; 
    system.debug('---------gridindustry---------' +indusgridreport); 
}
 
 
 // Device Usage chart code
 
 public pagereference ioschart()
 {
 
 devicechart = [ select UC_DeviceOsname__c s,count(id) from User_CheckinHistory__c
                        where Ev_id__c IN: allEventsIds group by  UC_DeviceOsname__c ];
 system.debug('---------Device Chart---------' +indusgridreport);
 iosdevice = new list<iosdeviceinner>();
 for(AggregateResult is : devicechart)
 {
  iosdeviceinner ss = new iosdeviceinner(is);
  iosdevice.add(ss);
 }
 
 return null;
 }
 


// Methods End


// Inner Classes Start

// Inner Class for Geography

public list<GeographyInner> grphy{get;set;}   

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

 public list<IndustryInner> indus{get;set;}  

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

public list<iosdeviceinner> iosdevice{get;set;}

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
 
//Inner Classes End
 
}