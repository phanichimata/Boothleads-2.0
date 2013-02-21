public class Dashboardcntrltryjuly19 
{

// Constructor Start 

 public Dashboardcntrltryjuly19() 
 { 
  PageReportBool=true;
 
  getvalues();
  geoChart();
  geographyreport();
  industryAdminChart();
  indgridreport();
  ioschart();
 }

// Constructor End   
   
    public String escapeSpecialCharacters(String input)
    {
      
       if(input!= null && input != '' && (input.contains('"')  || input.contains('<')))
       {
        if(input!= null && input != '' && (input.contains('"') ))
        {
         input = input.replace('"','\\\"');
       
        }if(input!= null && input != '' && (input.contains('<') ))
        {
         input = input.replace('<','');
         
        }
        
      }  
    return input;
    
    }
   
   
   
 // page references 
 
 
    public PageReference Reportsaction()  { 
        return null;
    }


    public PageReference AttendeesAction() { 
        return null;
    }


    public PageReference Customeraction() { 
        return null;
    }


    public PageReference EventAction() { 
        return null;
    }


    public PageReference profileaction() {  
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
  
  public String eventName {get;set;}
  public String eventSelected {get;set;}
  public LIST<SelectOption> Items{get; set;}
  public List<Reports__c> evntReports{get;set;}
  
// Variable Declaration End 
 
   
// Methods start

 public void getvalues()
   {
   
       LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
       string ss = userInfo.getUserName();
       system.debug('ssssssssssssssssssssssssssssssssssssssssssss'+ss);
       Items = new LIST<selectoption>();
       //String ss = 'mallikarjunan@globalnest.com';
       
       events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c  FROM User_Profile_Event__c WHERE User_id__r.UserName =: ss ORDER BY CreatedDate ASC];
      /**
       List<Event__c> EV=new List<Event__c>();
       EV=[select id,name,  EV_Title__c  from Event__c where   Name in events.EV_id__c];
       system.debug('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'+EV);
       */
       if(!events.isEmpty())
       {
           for(User_Profile_Event__c Even: events)
           {
              
               Items.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
               eventSelected = Even.id;
           }
       }
            
   }

 public pagereference getevents()
    {
           string tt= userInfo.getUserName();
           evntReports = new list<Reports__c>();
           if(eventSelected != null || eventSelected !='')
           {
             integer reccount = 0;
             
             evntReports = [select id,RE_Description__c,RE_Name__c,CreatedDate from Reports__c WHERE  UPE_id__r.EV_id__r.EV_Title__c ='Anil Event' ]; 
            system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee and UPE_id__r.User_id__r.UserName =:\'Anil N\''+evntReports);
           for(Reports__c j:evntReports )
           {
               j.RE_Description__c = escapeSpecialCharacters(j.RE_Description__c);
               recCount++;
                
           system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'+evntReports);
                             
    } 
           }    
   return null;
    } 


// industry grid code
public void indgridreport() 
{

    indusgridreport = [select id,AS_id__r.AS_FirstName__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkState__c, 
                                   AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_CellPhone__c, 
                                   AS_id__r.AS_Email__c  from Event_Attendee_Mapping__c 
                                   where EV_id__r.EV_Title__c=:'Space Works' and AS_id__r.AS_PrimaryBusinessCategory1__c!=null  limit 10]; 
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
   graphy = [select AS_id__r.AS_WorkState__c w,count(id) from Event_Attendee_Mapping__c where EV_id__r.EV_Title__c=:'Space Works' and AS_id__r.AS_WorkState__c!=null group by AS_id__r.AS_WorkState__c  LIMIT 10];   // where EV_id__r.EV_Title__c=:'Space Works'   and AS_id__r.AS_WorkState__c!=null
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