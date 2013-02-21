public class Evntadmreportscntrl 
{

public String strNamesmult { get; set; }

public PageReference login() {
   if(userInfo.getUserType()=='guest'){
    Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
    pg.setredirect(true);
        return pg;  
   } else{
   return null;
   }          
}
  
// Constructor Start 

public Evntadmreportscntrl()
{ 
 getvalues();
 PageReportBool = true;
 selectEventList=true;
 displayAlfabets =new string[]{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
}

// Constructor End


// Variable Declarations Start 
public Boolean  selectEventList { get; set; }
public Boolean  GeographyReportBool {get;set;}
public Boolean  IndustryReportBool {get;set;}
public Boolean PageReportBool {get;set;}
public Boolean EditReportBool {get;set;}
public List<Reports__c> reportTypes {get;set;}
public List<Reports__c> evntReports{get;set;}
public Reports__c editRep  {get;set;}
public String eventName {get;set;}
public String eventSelected {get;set;}
public LIST<SelectOption> Items{get; set;}
 
public LIST<LIST<Event_Attendee_Mapping__c>> geographycus{get;set;}
public LIST<LIST<Event_Attendee_Mapping__c>> customers{get;set;}
public LIST<Event_Attendee_Mapping__c> query{get;set;} 
public LIST<Event_Attendee_Mapping__c> query1{get;set;}
public LIST<Event_Attendee_Mapping__c> cus12{get;set;} 
public List<Event_Attendee_Mapping__c> an{get;set;}

public List<Event_Attendee_Mapping__c> gn{get;set;}
public string t{get;set;}
public string s {get;set;}

public List<Event_Attendee_Mapping__c> attforexport{get;set;}
public List<Event_Attendee_Mapping__c> eventlist{get;set;}
public List<Event_Attendee_Mapping__c> attforexport1{get;set;}
public List<Event_Attendee_Mapping__c> alphasorting{get;set;}
public List<Event_Attendee_Mapping__c> alphasorting1{get;set;}

public string[] displayAlfabets{get;set;}
// Variable Declarations End


// Methods Start

public void BackAction() 
{
 IndustryReportBool = false;
 GeographyReportBool = false;
 PageReportBool = true;
 selectEventList=true;
}


public void getevents() 
{
 string tt= userInfo.getUserName();
 evntReports = new list<Reports__c>();
 if(eventSelected != null || eventSelected !='')
 {
  integer reccount = 0;        
  evntReports = [select id,RE_Description__c,RE_Name__c from Reports__c WHERE  UPE_id__r.EV_id__c =: eventSelected and UPE_id__r.EventAdmin_Id__c=: UserInfo.getUserId() LIMIT 2];  
  for(Reports__c j:evntReports )
  {
   j.RE_Description__c = escapeSpecialCharacters(j.RE_Description__c);
   recCount++;
  } 
 } 
} 


public void getvalues() 
{
 LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
 string ss = userInfo.getUserName();
 Items = new LIST<selectoption>();       
 events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c  FROM User_Profile_Event__c WHERE User_id__r.UserName =: ss];
 MAP<id, String> eventsCheckMap = new MAP<id, String>();
      
 if(!events.isEmpty())
 {
  for(User_Profile_Event__c Even: events)
  {         
   if(Even.EV_id__c != null){
   if(!eventsCheckMap.containsKey(Even.EV_id__c))
   {
    Items.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
    eventsCheckMap.put(Even.EV_id__c, Even.EV_id__r.EV_Title__c);
    eventSelected =Even.EV_id__c;
   }
  }
  }   
  getevents();
 }
 }


 public PageReference ChooseReport() 
 {
  PageReportBool=false;
  selectEventList=true;
  if(eventname !=null && eventname == 'Report By Industry')
  {
  selectEventList=false;
  IndustryReportBool = TRUE;
  customers = new List<List<Event_Attendee_Mapping__c>> ();
  integer recCount=0;
  query =  [SELECT id,AS_id__r.AS_FirstName__c ,AS_id__r.AS_LastName__c,AS_id__r.AS_PrimaryBusinessCategory1__c,
                   AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,AS_id__r.AS_CellPhone__c 
            FROM Event_Attendee_Mapping__c 
            WHERE EV_id__c =: eventSelected ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c];
  an=new List<Event_Attendee_Mapping__c>();       
  for(Event_Attendee_Mapping__c s:query)     
  {
   s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
   s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
   s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
   s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
   s.AS_id__r.AS_Company__c= escapeSpecialCharacters(s.AS_id__r.AS_Company__c); 
   s.AS_id__r.AS_PrimaryBusinessCategory__c = escapeSpecialCharacters(s.AS_id__r.AS_PrimaryBusinessCategory1__c);  
   recCount++;
   an.add(s);
   if(recCount==1000)
   {
    customers.add(an);
    an = new LIST<Event_Attendee_Mapping__c>();
    recCount=0;
   }      
  }
  if(recCount !=0)
  customers.add(an);
 }  
 else if(eventname !=null && eventname== 'Report By Geography')
 {
  selectEventList=false;
  GeographyReportBool=TRUE;               
  geographycus = new list<list<Event_Attendee_Mapping__c>> ();
  integer recCount=0;           
  query =[SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                 AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c 
          FROM Event_Attendee_Mapping__c 
          WHERE EV_id__c=:eventSelected ORDER BY AS_id__r.AS_Work_States__c NULLS LAST];
  system.debug('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'+geographycus); 
  system.debug('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'+query);      
  gn = new List<Event_Attendee_Mapping__c>();
       
  for(Event_Attendee_Mapping__c t:query)
  {
   t.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(t.AS_id__r.AS_FirstName__c);
   t.AS_id__r.AS_LastName__c = escapeSpecialCharacters(t.AS_id__r.AS_LastName__c);
   t.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(t.AS_id__r.AS_CellPhone__c);
   t.AS_id__r.AS_Email__c = escapeSpecialCharacters(t.AS_id__r.AS_Email__c);
   t.AS_id__r.AS_Company__c= escapeSpecialCharacters(t.AS_id__r.AS_Company__c);  
   t.AS_id__r.AS_Work_States__c = escapeSpecialCharacters(t.AS_id__r.AS_Work_States__c);
   recCount++;
   gn.add(t);
   if(recCount==1000)
   {
    geographycus.add(gn);
    gn= new LIST<Event_Attendee_Mapping__c>();
    recCount=0;
   }   
  } 
  if(recCount !=0)
  geographycus.add(gn);
  }
 return null;
}


public PageReference EditReport()  
{
 system.debug('----------------------------'+eventname);
 EditReportBool=TRUE;
 EditRep = new Reports__c ();
 EditRep = [select id,RE_Description__c ,RE_Name__c from Reports__c where ID =: eventname];   
 return null;
}


public PageReference UpdateReport()  
{
 EditRep.RE_Description__c = EditRep.RE_Description__c;
 EditRep.RE_Name__c = EditRep.RE_Name__c;
 update EditRep;
 Pagereference pg = new Pagereference('/apex/BL_Evntadmreports');
 pg.setRedirect(true);
 return pg; 
}


public PageReference cancel()
{
 EditReportBool=False;
 return null;
}

// Export and alphabet sorting Start

public PageReference seltoexport(){
attforexport=new List<Event_Attendee_Mapping__c>();
attforexport=[SELECT id,AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
                      AS_id__r.AS_BusinessEstablishedDate__c,AS_id__r.AS_BusinessRevenue__c,AS_id__r.AS_BusinessTaxId__c,AS_id__r.AS_CellPhone__c,
                      AS_id__r.AS_Company__c,AS_id__r.AS_DiversityType__c,AS_id__r.AS_Email__c,AS_id__r.AS_FaxNumber__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_Gender__c,
                      AS_id__r.AS_HomeAddress1__c,AS_id__r.AS_HomeAddress2__c,AS_id__r.AS_HomeCity__c,AS_id__r.As_Home_Country__c,AS_id__r.AS_HomePhone__c,
                      AS_id__r.AS_HomePoBox__c,AS_id__r.As_Home_State__c,AS_id__r.AS_HomeZipcode__c,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_LastName__c,AS_id__r.AS_NAICSCode1__c,
                      AS_id__r.AS_NAICSCode2__c,AS_id__r.AS_NAICSCode3__c,AS_id__r.AS_NAICSCode4__c,AS_id__r.AS_NAICSCode5__c,AS_id__r.AS_NumberOfEmployees__c,AS_id__r.AS_PrefixNew__c,
                      AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_SecondaryBusinessCategory1__c,AS_id__r.AS_ShippingAddress1__c,AS_id__r.AS_ShippingAddress2__c,
                      AS_id__r.AS_ShippingCity__c,AS_id__r.As_Shipping_Country__c,AS_id__r.AS_ShippingPhone__c,AS_id__r.AS_ShippingPoBox__c,AS_id__r.As_Shipping_States__c,
                      AS_id__r.AS_ShippingZipcode__c,AS_id__r.AS_SuffixNew__c,AS_id__r.AS_ThroughEventBrite__c,AS_id__r.AS_Title__c,AS_id__r.AS_WebsiteUrl__c,AS_id__r.AS_WorkAddress1__c,
                      AS_id__r.AS_WorkAddress2__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_Work_Country__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_WorkPoBox__c,AS_id__r.AS_Work_States__c,AS_id__r.AS_WorkZipCode__c,
                      As_id__r.Registration_type__c
               FROM Event_Attendee_Mapping__c 
               WHERE EV_id__c=:eventSelected];
        
pagereference pg =page.BL_EventAdmin_ExportinReports;
return pg;
return null;
}




/**
public void valuesOfeventswithselectedvalue() {
alphasorting= new List<Event_Attendee_Mapping__c>();
string str=  ApexPages.currentpage().getparameters().get('t');

if(eventSelected != null || eventSelected != '')
{ 
if(str!='All')
{
alphasorting = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                                  AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected 
                 AND AS_id__r.AS_PrimaryBusinessCategory1__c like: str+'%' 
                 ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c];  
}
else
{
alphasorting = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                                  AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected
                 ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c]; 
}
}
}


public void valuesOfeventswithselectedvalue1(){
alphasorting1= new List<Event_Attendee_Mapping__c>();
string str1=  ApexPages.currentpage().getparameters().get('t');
if(eventSelected != null || eventSelected != '')
{ 
if(str1!='All')
{
alphasorting1 = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                                  AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected
                 AND AS_id__r.AS_Work_States__c like: str1+'%' 
                 ORDER BY AS_id__r.AS_Work_States__c];  
}
else
{
alphasorting1 = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                                  AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected 
                 ORDER BY AS_id__r.AS_Work_States__c]; 
}
}
}
**/
// Export and alphabet sorting End

// Methods End

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

public string escape(string s){
    if(s != null && s.contains(',')){  
    s=s.replaceAll('"','');
    s='"'+s+'"';
    } 
    return s;
    }
// Escape special Characters End



}