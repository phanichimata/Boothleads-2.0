public class DashboardTry 
{

// Constructor Start 

 public DashboardTry() 
 { 
  PageReportBool=true;
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
 }

// Constructor End   
   
 // page references 
 
 
    public PageReference Reportsaction()  
    { 
        return null;
    }


    public PageReference AttendeesAction() 
    { 
        return null;
    }


    public PageReference Customeraction() 
    { 
        return null;
    }


    public PageReference EventAction() 
    { 
        return null;
    }


    public PageReference profileaction() 
    {  
        return null;
    }

 
 
 
 // pagereferences end   
   
   
   
   
// Variable Declaration Start  


  public AggregateResult[] graphy {get;set;}   
  public AggregateResult[] induchrt{get;set;}  
  public AggregateResult[] devicechart{get;set;}  
  public Boolean PageReportBool {get;set;}   
  public List<Event_Attendee_Mapping__c> indusreport {get;set;}   
  public List<Event_Attendee_Mapping__c> indusgridreport {get;set;}  
  
   
// Variable Declaration End 
 
   
// Methods start

// industry grid code
public void indgridreport() 
{

    indusgridreport = [select id,AS_id__r.AS_FirstName__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkState__c,
                                   AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,
                                   AS_id__r.AS_Email__c  from Event_Attendee_Mapping__c 
                                   where EV_id__r.EV_Title__c=:'Space Works' limit 10]; 
    system.debug('check values of gridindus' +indusgridreport); 

}
// geography grid code
public void  geographyreport() 
{

   indusreport = [select id,AS_id__r.AS_FirstName__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkState__c,
                           AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c,
                           AS_id__r.AS_Email__c  from Event_Attendee_Mapping__c  
                           where EV_id__r.EV_Title__c=:'Space Works' and AS_id__r.AS_WorkState__c!=null limit 10];
   system.debug('check values of gridgeo' +indusreport); 

}
 
 // geography chart code
 public pagereference geoChart() 
 {       
   graphy = [select AS_id__r.AS_WorkState__c w,count(id) from Event_Attendee_Mapping__c where EV_id__r.EV_Title__c=:'Space Works' and AS_id__r.AS_WorkState__c!=null group by AS_id__r.AS_WorkState__c  LIMIT 5];   // where EV_id__r.EV_Title__c=:'Space Works'   and AS_id__r.AS_WorkState__c!=null
   system.debug('hiiiiiiiiiii@@@@' +graphy );    
   grphy= new list<geographyinner>();     
   for (AggregateResult ta : graphy) 
   {
    geographyinner es = new geographyinner(ta);   
    grphy.add(es); 
   }   
  return null; 
 } 
 
 
 // iosdevice usage chart code
 
 public pagereference ioschart()
 {
 
 devicechart = [ select UC_DeviceOsname__c s,count(id) from User_CheckinHistory__c
                        where EV_id__r.EV_Title__c=:'Space Works' group by  UC_DeviceOsname__c ];
 iosdevice = new list<iosdeviceinner>();
 for(AggregateResult is : devicechart)
 {
  iosdeviceinner ss = new iosdeviceinner(is);
  iosdevice.add(ss);
 }
 
 return null;
 }
 

// Industry chart code 

 public pagereference industryAdminChart()    
 {
  try 
  {    
   induchrt= [select AS_id__r.AS_PrimaryBusinessCategory1__c p,count(id) from Event_Attendee_Mapping__c where EV_id__r.EV_Title__c=:'Space Works' group by AS_id__r.AS_PrimaryBusinessCategory1__c limit 5]; 
   system.debug('aaaaaaaaaaaa' +induchrt);  
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


// Methods End     
   
  
// inner class  for geography  

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

// inner class for ios device

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


//inner class for industry 

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
   
}