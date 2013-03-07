public class BL_EventAdmin_ReportsCon 
{

//------------------------------------ Variable Declarations Start  ---------------------------------------
public Boolean selecteventList{ get; set; }
public Boolean Choosedreportsbool { get; set; }
public Boolean GeographyReportBool {get;set;}
public Boolean IndustryReportBool {get;set;}
public Boolean PageReportBool {get;set;}
public Boolean EditReportBool {get;set;}
public LIST<Reports__c> reportTypes {get;set;}
public LIST<Reports__c> evntReports{get;set;}
public LIST<User_Profile_Event__c> events{get;set;}
public Reports__c editRep  {get;set;}
public String eventName {get;set;}
public String eventSelected {get;set;}
public String t{get;set;}
public String s{get;set;}
public String strNamesmult {get;set;}
public String gridtitle { get; set; }
public LIST<SelectOption> Items{get; set;}
public LIST<LIST<Event_Attendee_Mapping__c>> customers{get;set;}
public LIST<Event_Attendee_Mapping__c> query{get;set;} 
public LIST<Event_Attendee_Mapping__c> an{get;set;}
public LIST<LIST<Event_Attendee_Mapping__c>> attforexport{get;set;}
public LIST<Event_Attendee_Mapping__c> query2{get;set;}
public LIST<Event_Attendee_Mapping__c> bn{get;set;}
public LIST<Event_Attendee_Mapping__c> eventList{get;set;}
public string[] displayAlfabets{get;set;}
public string Workstates{get;set;}
//------------------------------------- Variable Declarations End ----------------------------------------

//------------------------------------------ Constructor Start -------------------------------------------
public BL_EventAdmin_ReportsCon()
{ 
 String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
 if(browserType != null && browserType.contains('MSIE')){
  Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
 }
 try{
 getvalues();
 PageReportBool=TRUE;
 selecteventList=TRUE;
 displayAlfabets =new string[]{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
 }
 catch(exception e){}  

}
//------------------------------------------- Constructor End --------------------------------------------

//------------------------------------------- Methods Start  ---------------------------------------------

//----------------------------------------- Events Fetch Start  ------------------------------------------
public void getevents() 
{
 try{
 string tt= userInfo.getUserName();
 evntReports = new LIST<Reports__c>();
 if(eventSelected != null || eventSelected !='')
 {
  integer reccount = 0;        
  evntReports = [SELECT id,RE_Description__c,RE_Name__c 
                 FROM Reports__c 
                 WHERE  UPE_id__r.EV_id__c =: eventSelected 
                 AND UPE_id__r.EV_id__c != null   
                 AND UPE_id__r.EventAdmin_Id__c=: UserInfo.getUserId() LIMIT 2];  
  for(Reports__c j:evntReports )
  {
   j.RE_Description__c = escapeSpecialCharacters(j.RE_Description__c);
   recCount++;
  } 
 } 
 }
 catch(exception e){}  
} 

public void getvalues() 
{
 try{
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
 catch(exception e){}  
}
//------------------------------------------ Events Fetch End  --------------------------------------------

//---------------------------------------- Choose Report Start --------------------------------------------
 public PageReference ChooseReport() 
 {
  String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
  if(browserType != null && browserType.contains('MSIE')){
   Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
  }
  try{
  PageReportBool=false;
  selecteventList=true;
  Choosedreportsbool =false;
  if(eventname !=null && eventname == 'Report By Industry')
  {
  selecteventList=false;
  Choosedreportsbool =true;
  IndustryReportBool = true;
  GeographyReportBool=false;
  gridtitle='Report by Industry';
  customers = new LIST<LIST<Event_Attendee_Mapping__c>> ();
  integer recCount=0;
  query =  [SELECT id,AS_id__r.AS_FirstName__c ,AS_id__r.AS_LastName__c,AS_id__r.AS_PrimaryBusinessCategory1__c,
                   AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,AS_id__r.AS_CellPhone__c 
            FROM Event_Attendee_Mapping__c 
            WHERE EV_id__c =: eventSelected 
            ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c LIMIT 4400];
  an=new LIST<Event_Attendee_Mapping__c>();       
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
  selecteventList=false;
  Choosedreportsbool =true;
  GeographyReportBool=true;
  IndustryReportBool = false;
  gridtitle='Report by Geography';               
  customers= new LIST<LIST<Event_Attendee_Mapping__c>> ();
  integer recCount=0;           
  query =[SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,
                 AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c 
          FROM Event_Attendee_Mapping__c 
          WHERE EV_id__c=:eventSelected 
          ORDER BY AS_id__r.AS_Work_States__c LIMIT 4400];
  map<string,string> states=new map<string,string>();
        states.put('None','None');
        states.put('Alabama','AL');
        states.put('Alaska', 'AK');
        states.put('Arizona','AZ');
        states.put('Arkansas','AR');
        states.put('California','CA');
        states.put('Colorado','CO');
        states.put('Connecticut','CT');
        states.put('Delaware','DE');
        states.put('District of Columbia','DC');
        states.put('Florida','FL');
        states.put('Georgia','GA');
        states.put('Hawaii','HI');
        states.put('Idaho','ID');
        states.put('Illinois','IL');
        states.put('Indiana','IN');
        states.put('Iowa','IA');
        states.put('Kansas','KS');
        states.put('Kentucky','KY');
        states.put('Louisiana','LA');
        states.put('Maine','ME');
        states.put('Maryland','MD');
        states.put('Massachusetts','MA');
        states.put('Michigan','MI');
        states.put('Minnesota','MN');
        states.put('Mississippi','MS');
        states.put('Missouri','MO');
        states.put('Montana','MT');
        states.put('Nebraska','NE');
        states.put('Nevada','NV');
        states.put('New Hampshire','NH');
        states.put('New Jersey','NJ');
        states.put('New Mexico','NM');
        states.put('New York','NY');
        states.put('North Carolina','NC');
        states.put('North Dakota','ND');
        states.put('Ohio','OH');
        states.put('Oklahoma','OK');
        states.put('Oregon','OR');
        states.put('Pennsylvania','PA');
        states.put('Rhode Island','RI');
        states.put('South Carolina','SC');
        states.put('South Dakota','SD');
        states.put('Tennessee','TN');
        states.put('Texas','TX');
        states.put('Utah','UT');
        states.put('Vermont','VT');
        states.put('Virginia','VA');
        states.put('Washington','WA');
        states.put('West Virginia','WV');
        states.put('Wisconsin','WI');
        states.put('Wyoming','WY');                     
        states.put('Andhra Pradesh','AP');
        states.put('Arunachal Pradesh','AR');
        states.put('Assam','AS');
        states.put('Bihar','BR');
        states.put('Chhattisgarh','CT');
        states.put('Goa','GA');
        states.put('Gujarat','GJ');
        states.put('Haryana','HR');
        states.put('Himachal Pradesh','HP');
        states.put('Jammu and Kashmir','JK');
        states.put('Jharkhand','JH');
        states.put('Karnataka','KA');
        states.put('Kerala','KL');
        states.put('Madhya Pradesh','MP');
        states.put('Maharashtra','MH');
        states.put('Manipur','MN');
        states.put('Meghalaya','ML');
        states.put('Mizoram','MZ');
        states.put('Nagaland','NL');
        states.put('Orissa','OR');
        states.put('Punjab','PB');
        states.put('Rajasthan','RJ');
        states.put('Sikkim','SK');
        states.put('Tamil Nadu','TN');
        states.put('Tripura','TR');
        states.put('Uttar Pradesh','UP');
        states.put('Uttarakhand','UT');
        states.put('West Bengal','WB');
        states.put('Andaman and Nicobar Islands','AN');
        states.put('Chandigarh','CH');
        states.put('Daman and Diu','DD');
        states.put('Dadra and Nagar Haveli','DN');
        states.put('National Capital Territory of Delhi','DL'); 
        states.put('Lakshadweep','LD');
        states.put('Puducherry','PY'); 
        states.put('AL','AL');
        states.put('AK','AK');
        states.put('AZ','AZ');
        states.put('AR','AR');
        states.put('CA','CA');
        states.put('CO','CO');
        states.put('CT','CT');
        states.put('DE','DE');
        states.put('DC','DC');
        states.put('FL','FL');
        states.put('GA','GA');
        states.put('HI','HI');
        states.put('ID','ID');
        states.put('IL','IL');
        states.put('IN','IN');
        states.put('IA','IA');
        states.put('KS','KS');
        states.put('KY','KY');
        states.put('LA','LA');
        states.put('ME','ME');
        states.put('MD','MD');
        states.put('MA','MA');
        states.put('MI','MI');
        states.put('MN','MN');
        states.put('MS','MS');
        states.put('MO','MO');
        states.put('MT','MT');
        states.put('NE','NE');
        states.put('NV','NV');
        states.put('NH','NH');
        states.put('NJ','NJ');
        states.put('NM','NM');
        states.put('NY','NY');
        states.put('NC','NC');
        states.put('ND','ND');
        states.put('OH','OH');
        states.put('OK','OK');
        states.put('OR','OR');
        states.put('PA','PA');
        states.put('RI','RI');
        states.put('SC','SC');
        states.put('SD','SD');
        states.put('TN','TN');
        states.put('TX','TX');
        states.put('UT','UT');
        states.put('VT','VT');
        states.put('VA','VA');
        states.put('WA','WA');
        states.put('WV','WV');
        states.put('WI','WI');
        states.put('WY','WY');                     

      map<string,string> countries = new map<string,string>();
      countries.put('India','India');
      countries.put('United States Of America','USA');  
  an = new LIST<Event_Attendee_Mapping__c>();
            
  for(Event_Attendee_Mapping__c t:query)
  {
   t.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(t.AS_id__r.AS_FirstName__c);
   t.AS_id__r.AS_LastName__c = escapeSpecialCharacters(t.AS_id__r.AS_LastName__c);
   t.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(t.AS_id__r.AS_CellPhone__c);
   t.AS_id__r.AS_Email__c = escapeSpecialCharacters(t.AS_id__r.AS_Email__c);
   t.AS_id__r.AS_Company__c= escapeSpecialCharacters(t.AS_id__r.AS_Company__c);  
   t.AS_id__r.AS_Work_States__c = escapeSpecialCharacters(t.AS_id__r.AS_Work_States__c);
   t.AS_id__r.AS_Work_States__c=states.get(t.AS_id__r.AS_Work_States__c);
   
   recCount++;
   an.add(t);
   if(recCount==1000)
   {
    customers.add(an);
    an= new LIST<Event_Attendee_Mapping__c>();
    recCount=0;
   }   
  } 
  if(recCount!=0)
  customers.add(an);
  }
 }
 catch(exception e){}  
 return null;
}
//----------------------------------------- Choose Report End ---------------------------------------------

//------------------------------------ Edit and Update Report Start ---------------------------------------
public PageReference EditReport()  
{
 try{
 EditReportBool=TRUE;
 EditRep = new Reports__c ();
 EditRep = [select id,RE_Description__c ,RE_Name__c from Reports__c where ID =: eventname];   
 }
 catch(exception e){}  
 return null;
}

public PageReference UpdateReport()  
{
 try{
 EditRep.RE_Description__c = EditRep.RE_Description__c;
 EditRep.RE_Name__c = EditRep.RE_Name__c;
 update EditRep;
 Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Reports');
 pg.setRedirect(true);
 return pg; 
 }
 catch(exception e){}  
 return null;
}
//------------------------------------- Edit and Update Report End ----------------------------------------

//------------------------------------ Back and Cancel Report Start ---------------------------------------
public void BackAction() 
{
 String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
 if(browserType != null && browserType.contains('MSIE')){
  Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
 }
 IndustryReportBool = false;
 GeographyReportBool = false;
 choosedreportsbool = false;
 PageReportBool= true;
 selecteventList=true;
}

public PageReference cancel()
{
 String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
 if(browserType != null && browserType.contains('MSIE')){
  Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
 }
 EditReportBool=False;
 return null;
}
//------------------------------------- Back and Cancel Report End ----------------------------------------

//-------------------------------------------- Export Start -----------------------------------------------
public PageReference seltoexport()
{
try{
attforexport= new LIST<LIST<Event_Attendee_Mapping__c>>();
integer recCount=0;  
query2=[SELECT id,TicketTypes__c,AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
                 AS_id__r.AS_BusinessEstablishedDate__c,AS_id__r.AS_BusinessRevenue__c,AS_id__r.AS_BusinessTaxId__c,AS_id__r.AS_CellPhone__c,
                 AS_id__r.AS_Company__c,DiversityType__c,AS_id__r.AS_Email__c,AS_id__r.AS_FaxNumber__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_Gender__c,
                 AS_id__r.AS_HomeAddress1__c,AS_id__r.AS_HomeAddress2__c,AS_id__r.AS_HomeCity__c,AS_id__r.As_Home_Country__c,AS_id__r.AS_HomePhone__c,
                 AS_id__r.AS_HomePoboxNo__c,AS_id__r.As_Home_State__c,AS_id__r.AS_HomeZip__c,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_LastName__c,AS_id__r.AS_NAICSCode1__c,
                 AS_id__r.AS_NAICSCode2__c,AS_id__r.AS_NAICSCode3__c,AS_id__r.AS_NAICSCode4__c,AS_id__r.AS_NAICSCode5__c,AS_id__r.AS_NumberOfEmployees__c,AS_id__r.As_prefixNew__c,
                 AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_SecondaryBusinessCategory1__c,AS_id__r.AS_ShippingAddress1__c,AS_id__r.AS_ShippingAddress2__c,
                 AS_id__r.AS_ShippingCity__c,AS_id__r.As_Shipping_Country__c,AS_id__r.AS_ShippingPhone__c,AS_id__r.AS_Shippingpoboxno__c,AS_id__r.As_Shipping_States__c,
                 AS_id__r.AS_shippingzip__c,AS_id__r.As_SuffixNew__c,AS_id__r.AS_ThroughEventBrite__c,AS_id__r.AS_Title__c,AS_id__r.AS_WebsiteUrl__c,AS_id__r.AS_WorkAddress1__c,
                 AS_id__r.AS_WorkAddress2__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_Work_Country__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_Workpoboxno__c,AS_id__r.AS_Work_States__c,
                 AS_id__r.AS_WorkZip__c
               FROM Event_Attendee_Mapping__c 
               WHERE EV_id__c=:eventSelected LIMIT 2900];
bn=new LIST<Event_Attendee_Mapping__c>(); 
for(Event_Attendee_Mapping__c s:query2)
{
     s.AS_id__r.AS_BlogUrl__c = escape(s.AS_id__r.AS_BlogUrl__c);
     s.AS_id__r.AS_BusinessDescription__c = escape(s.AS_id__r.AS_BusinessDescription__c);
     s.AS_id__r.AS_Company__c = escape(s.AS_id__r.AS_Company__c);
     s.AS_id__r.AS_DiversityType__c = escape(s.AS_id__r.AS_DiversityType__c);
     s.AS_id__r.AS_Email__c = escape(s.AS_id__r.AS_Email__c);
     s.AS_id__r.AS_FirstName__c = escape(s.AS_id__r.AS_FirstName__c);
     s.AS_id__r.AS_HomeAddress1__c = escape(s.AS_id__r.AS_HomeAddress1__c);
     s.AS_id__r.AS_HomeAddress2__c = escape(s.AS_id__r.AS_HomeAddress2__c);
     s.AS_id__r.AS_HomeCity__c = escape(s.AS_id__r.AS_HomeCity__c);
     s.AS_id__r.AS_HomeCountry__c = escape(s.AS_id__r.AS_HomeCountry__c);
     s.AS_id__r.AS_HomePhone__c = escape(s.AS_id__r.AS_HomePhone__c);
     s.AS_id__r.AS_LastName__c = escape(s.AS_id__r.AS_LastName__c);
     s.AS_id__r.AS_ShippingAddress1__c = escape(s.AS_id__r.AS_ShippingAddress1__c);
     s.AS_id__r.AS_ShippingAddress2__c = escape(s.AS_id__r.AS_ShippingAddress2__c);
     s.AS_id__r.AS_ShippingCity__c = escape(s.AS_id__r.AS_ShippingCity__c);
     s.AS_id__r.AS_Title__c = escape(s.AS_id__r.AS_Title__c);
     s.AS_id__r.AS_WebsiteUrl__c = escape(s.AS_id__r.AS_WebsiteUrl__c);
     s.AS_id__r.AS_WorkAddress1__c = escape(s.AS_id__r.AS_WorkAddress1__c);
     s.AS_id__r.AS_WorkAddress2__c = escape(s.AS_id__r.AS_WorkAddress2__c);
     s.AS_id__r.AS_WorkCity__c = escape(s.AS_id__r.AS_WorkCity__c);
     s.AS_id__r.AS_PrimaryBusinessCategory1__c = escape(s.AS_id__r.AS_PrimaryBusinessCategory1__c);    
     s.As_id__r.Registration_type__c = escape(s.As_id__r.Registration_type__c); 
     s.AS_id__r.AS_SecondaryBusinessCategory1__c = escape(s.AS_id__r.AS_SecondaryBusinessCategory1__c);
      
     
     recCount++;
     bn.add(s);
     if(recCount==1000)
     {
      attforexport.add(bn);
      bn = new LIST<Event_Attendee_Mapping__c>();
      recCount=0;
     }      
    }
  if(recCount !=0)
  attforexport.add(bn);       
  pagereference pg =page.BL_EventAdmin_ExportinReports;
  return pg;
 }
 catch(exception e){}  
return null;
}
//-------------------------------------------- Export End -----------------------------------------------

//-------------------------------------- Alphabet Sorting Start -----------------------------------------
/**
public void valuesOfeventswithselectedvalue() {
alphasorting= new LIST<Event_Attendee_Mapping__c>();
string str=  ApexPages.currentpage().getparameters().get('t');
if(eventSelected != null || eventSelected != ''){ 
if(str!='All'){
alphasorting = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected 
                 AND AS_id__r.AS_PrimaryBusinessCategory1__c like: str+'%' 
                 ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c];  
}
else{
alphasorting = [SELECT id,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,AS_id__r.AS_CellPhone__c,AS_id__r.AS_Work_States__c  
                 FROM Event_Attendee_Mapping__c 
                 WHERE EV_id__c=:eventSelected
                 ORDER BY AS_id__r.AS_PrimaryBusinessCategory1__c]; 
}
}
}
**/
//--------------------------------------- Alphabet Sorting End ------------------------------------------
//------------------------------------------- Methods End  ----------------------------------------------

//--------------------------------------- Page Reference Start ------------------------------------------
public PageReference login() {
 if(userInfo.getUserType()=='guest'){
  Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
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

public string escape(string s){
    if(s != null && s.contains(',')){  
    s=s.replaceAll('"','');
    s='"'+s+'"';
    } 
    return s;
    }
//----------------------------------- Escape Special Characters End --------------------------------------

//------------------------------------------ Test Method Start -------------------------------------------
  static testmethod void test_BL_EventAdmin_ReportsCon()
  {
   Profile p = [select id from profile where name='Standard User'];
   
   User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
   insert u;
   
   Event__c ev = new Event__c(EV_Title__c='TestEvent',
                             EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c=date.valueOf('2012-12-12 00:00:00'),
                             EV_StartDate__c=date.valueOf('2012-05-11 00:00:00'));
   insert ev;
   
   User_Profile_Event__c upe=new User_Profile_Event__c(EV_id__c=ev.id,BoothAdmin_id__c=u.id,EventAdmin_Id__c=u.id,User_id__c=u.id);
   insert upe;  
      
   AttendeeSummary__c att = new AttendeeSummary__c(AS_FirstName__c='testattendeesummaryfirstname',
                                                 AS_LastName__c='testattendeelastname',
                                                 AS_Email__c='test123@noemail.com',
                                                 AS_Company__c='testattendeecompany');    
   insert att;    
   
   Event_Attendee_Mapping__c eam=new Event_Attendee_Mapping__c(EV_id__c=ev.id,AS_id__c=att.id,DiversityType__c='xxxxxxx');
   insert eam;
     
   Reports__c r = new Reports__c(RE_Name__c='Report By Geography',RE_Description__c='Test Description',UPE_id__c=upe.id); 
   insert r;  
   
   list<User_Profile_Event__c> lupe = new list<User_Profile_Event__c>();
   lupe.add(upe);
   
   list<Reports__c> lr = new list<Reports__c>();
   lr.add(r);
       
   system.runAs(u){
   
   BL_EventAdmin_ReportsCon erc=new BL_EventAdmin_ReportsCon();    
   erc.events=lupe;
   erc.evntReports=lr;
   erc.getevents();
   erc.getvalues();   
   erc.ChooseReport();  
   erc.eventname='Report By Industry';
   erc.ChooseReport();      
   erc.eventname='Report By Geography';
   erc.ChooseReport();            
   erc.BackAction();
   erc.cancel();
   erc.seltoexport();
   erc.login();
   erc.escapeSpecialCharacters('m"k<c,\\h');
   erc.escape('m"k<c,\\h');   
   pageReference pg = Page.BL_EventAdmin_Reports;
   Test.setCurrentPage(pg);
   pg.getParameters().put('EditReport',r.id);
   erc.eventname=r.id;
   erc.EditReport();
   erc.UpdateReport();
   }
  }
//------------------------------------------ Test Method End -------------------------------------------

}