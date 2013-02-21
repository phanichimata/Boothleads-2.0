public with sharing class attendeedetail {


    
    public string eventname1{get;set;}
    public boolean dolor{get;set;}
    public Event_Attendee_Mapping__c Ticketfordetail{get;set;}
    public AttendeeSummary__c attendee{get; set;}
    public boolean shippingstate{get;set;}
    public boolean workstate{get;set;}
    public boolean homestate{get;set;}
    public Boolean ReqFields{get; set;}
    public Boolean  Prefix{get; set;}
    public Boolean  sufix{get; set;}
    public Boolean  Degi{get; set;}
    public Boolean  mobile{get; set;}
    public Boolean  age{get; set;}
    public Boolean  gen{get; set;}
    public boolean registrationtype{get;set;}
    public Boolean  dob{get; set;}
    public Boolean  homeinfo{get; set;}
    public Boolean  Shippinginfo{get; set;}
    public Boolean  workinfo{get; set;}
    public Boolean  NAICSCode1{get; set;}
    public Boolean  NAICSCode2{get; set;}
    public Boolean  NAICSCode3{get; set;}
    public Boolean  PBC{get; set;}
    public Boolean  SBC{get; set;}
    public Boolean  NOEmp{get; set;}
    public Boolean  BEDate{get; set;}
    public Boolean  BRev{get; set;}
    public Boolean  BTaxID{get; set;}
    public Boolean  BDN{get; set;}
    public Boolean  webUrl{get; set;}
    public Boolean  blogURL{get; set;}
    public Boolean  DT{get; set;}
    public Boolean  BDesc{get; set;}
    public String sss {get; set;}
    public Boolean TicType{get;set;}
    public id userid {get;set;}
    public string Workstates{get;set;}
    public string Homestates{get;set;}
    public string Shippingstates{get;set;}
    public string Workcountry{get;set;}
    public string Homecountry{get;set;}
    public string Shippingcountry{get;set;}
      
    
//-------------------------------------------------------CONSTRUCTOR-------------------------------------------------
    public attendeedetail ()
    {
    userId =UserInfo.getUserId();
    attendee= new AttendeeSummary__c();
    Ticketfordetail=new Event_Attendee_Mapping__c();
    sss = UserInfo.getUserName();
        //  String sss='mallikarjunan+user35@globalnest.com';
       ReqFields = TRUE;
        Prefix = TRUE;
        sufix = TRUE;
        Degi = TRUE;
        mobile = TRUE;
        age = TRUE;
        gen = TRUE;
        registrationtype=true;
        dob = TRUE;
        homeinfo = TRUE;
        Shippinginfo = TRUE;
        workinfo = TRUE;
        NAICSCode1 = TRUE;
        NAICSCode2 = TRUE;
        NAICSCode3 = TRUE;
        PBC = TRUE;
        SBC = TRUE;
        NOEmp = TRUE;
        BEDate = TRUE;
        BRev = TRUE;
        BTaxID = TRUE;
        BDN = TRUE;
        webUrl = TRUE;
        blogURL = TRUE;
        DT = TRUE;
        BDesc = TRUE;
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
        states.put('Andhra Pradesh','Andhra Pradesh');
        states.put('Arunachal Pradesh','Arunachal Pradesh');
        states.put('Assam','Assam');
        states.put('Bihar','Bihar');
        states.put('Chhattisgarh','Chhattisgarh');
        states.put('Goa','Goa');
        states.put('Gujarat','Gujarat');
        states.put('Haryana','Haryana');
        states.put('Himachal Pradesh','Himachal Pradesh');
        states.put('Jammu and Kashmir','Jammu and Kashmir');
        states.put('Jharkhand','Jharkhand');
        states.put('Karnataka','Karnataka');
        states.put('Kerala','Kerala');
        states.put('Madhya Pradesh','Madhya Pradesh');
        states.put('Maharashtra','Maharashtra');
        states.put('Manipur','Manipur');
        states.put('Meghalaya','Meghalaya');
        states.put('Mizoram','Mizoram');
        states.put('Nagaland','Nagaland');
        states.put('Orissa','Orissa');
        states.put('Punjab','Punjab');
        states.put('Rajasthan','Rajasthan');
        states.put('Sikkim','Sikkim');
        states.put('Tamil Nadu','Tamil Nadu');
        states.put('Tripura','Tripura');
        states.put('Uttar Pradesh','Uttar Pradesh');
        states.put('Uttarakhand','Uttarakhand');
        states.put('West Bengal','West Bengal');
        states.put('Andaman and Nicobar Islands','Andaman and Nicobar Islands');
        states.put('Daman and Diu','Daman and Diu');
        states.put('Lakshadweep','Lakshadweep  ');
        states.put('National Capital Territory of Delhi','National Capital Territory of Delhi');                                     
    
        map<string,string> countries = new map<string,string>();
         countries.put('India','India');
         countries.put('United States Of America','USA');
    try{
     
      Ticketfordetail=[select id,TicketTypes__c,AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
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
                                 FROM Event_Attendee_Mapping__c WHERE Id=:ApexPages.currentPage().getParameters().get('id')];

      Workstates=states.get(Ticketfordetail.AS_id__r.AS_Work_States__c);
      system.debug(':::::::::::::::;;;HS:::::::::::::::'+Workstates);
      if(Workstates == null){
      Workstates=Ticketfordetail.AS_id__r.AS_Work_States__c;
      }
       system.debug(':::::::::::::::;;;HS:::::::::::::::'+Workstates);
      Homestates=states.get(Ticketfordetail.AS_id__r.As_Home_State__c);
      if(Homestates == null){
      Homestates=Ticketfordetail.AS_id__r.As_Home_State__c;
      }
      system.debug(':::::::::::::::;;;HS:::::::::::::::'+Homestates);
      shippingstates=states.get(Ticketfordetail.AS_id__r.As_Shipping_States__c);
      if(shippingstates == null){
     shippingstates=Ticketfordetail.AS_id__r.As_Shipping_States__c;
      }
      system.debug(':::::::::::::::;;;Ticketfordetail.AS_id__r.AS_Work_Country__c:::::::::::::::'+Ticketfordetail.AS_id__r.AS_Work_Country__c);
      workcountry=countries.get(Ticketfordetail.AS_id__r.AS_Work_Country__c);
       system.debug(':::::::::::::::;;;workcountry:::::::::::::::'+workcountry);
      Homecountry=countries.get(Ticketfordetail.AS_id__r.As_Home_Country__c);
      Shippingcountry=countries.get(Ticketfordetail.AS_id__r.As_Shipping_Country__c);
     if(Ticketfordetail.AS_id__r.AS_BusinessRevenue__c != null)
    {
    dolor=true;
    
    }
      if(Ticketfordetail.TicketTypes__c != null || Ticketfordetail.TicketTypes__c !='' )
      {
      TicType=true;
      }
         system.debug(':::::::::::::::;;;HS:::::::::::::::'+Ticketfordetail.DiversityType__c);
   /**   if(Ticketfordetail.AS_HomeState__c != 'None')
    {
    homestate=true;
    
    }
    
    if(attendee.AS_WorkState__c != 'None')
   {
   
   workstate=true;
   
   }
    if(attendee.AS_ShippingState__c != 'None')
    {
    
    shippingstate=true;
    }
     */   
    }
     
    catch(exception e){}
   
      
    }                                 
    
    
    
    
    
    
    
    
    public PageReference reportact() {
        pagereference pg = new pagereference('/apex/BL_Evntadmreports');
             pg.setredirect(true);
            return pg;
    }

     public PageReference Dashboardaction() {
    pagereference pg = new pagereference('/apex/BL_EventAdmin_Dashboard');
         pg.setredirect(true);
            return pg;
        
    }
    public PageReference Attendees() {
    pagereference pf=new pagereference('/apex/qrcode_eventadmin_attendees');
    
        return pf;
    }


    public PageReference CustomerAdminAct() {
        pagereference pg = new Pagereference('/apex/BL_EventAdmin_Booths');
            pg.setredirect(true);
                return pg;
    }


    public PageReference Events() {
         Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Events');
        Pg.setredirect(true);
        return pg;
    }


    public PageReference ProfileSettings() {
        Pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');
            Pg.setredirect(true);
            Return pg;
    }


    public PageReference checkUserId() {
     if(userInfo.getUserType()=='guest'){
            Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
            pg.setredirect(true);
            return pg;
       } else{
            return null;
       }    
    }
  
 //----------------------------------------------------------TEST CLASS-----------------
 
  static testmethod void attendeeDetail(){
    
        Profile p = [select id FROM profile where name='Standard User'];
        
        User u = new User(alias = 'test123', email='mallikarjunan+user7489@globalnest.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='mallikarjunan+user7489@globalnest.com');
                  
                  insert u;
                  
                  Event__c event = new Event__c(EV_Title__c='testEvent',EV_HostingTimeZone__c='Eastern Time(USA)',EV_EndDate__c=date.valueOf('2012-05-15 00:00:00'),EV_StartDate__c=date.valueOf('2012-05-11 00:00:00'),Event_Printer__c ='Avery 22806 easy peal square Badges',EventDiversityValues__c='Reception;monday pass');
                insert event;
                  string fieldsOf = 'AS_Age__c,isUpdated__c,AS_BirthDate__c,AS_BlogUrl__c,AS_BusinessDescription__c,AS_BusinessDunsNumber__c,AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_CellPhone__c,AS_Company__c,AS_DiversityType__c,Registration_type__c,AS_Email__c,AS_FaxNumber__c,AS_FirstName__c,AS_Gender__c,AS_HomeAddress1__c,AS_HomeAddress2__c,AS_HomeCity__c,AS_HomeCountry__c,AS_HomePhone__c,AS_HomePoBox__c,AS_HomeZip__c,AS_ImageUrl__c,AS_LastName__c,AS_NAICSCode1__c,AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_NumberOfEmployees__c,AS_PrefixNew__c,AS_PrimaryBusinessCategory1__c,AS_SecondaryBusinessCategory1__c,AS_ShippingAddress1__c,AS_ShippingAddress2__c,AS_ShippingCity__c,AS_ShippingCountry__c,AS_ShippingPhone__c,AS_shippingzip__c,AS_ShippingState__c,AS_ShippingZipcode__c,AS_SuffixNew__c,AS_ThroughEventBrite__c,AS_Title__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,AS_WorkAddress2__c,AS_WorkCity__c,AS_WorkCountry__c,AS_WorkPhone__c,AS_WorkPoBox__c,AS_Work_Country__c,AS_WorkZip__c,AS_Work_States__c,As_Home_Country__c,As_Home_State__c,As_Shipping_Country__c,As_Shipping_States__c';
                 SecurityControls__c  attsett = new SecurityControls__c(EV_id__c = event.id, EV_Fields__c = fieldsOf);
                 insert attsett; 
                  system.runAs(u){
      
          AttendeeDetail detail  = new AttendeeDetail();
          
          detail.CustomerAdminAct();
          detail.reportact();
          detail.Attendees();
          detail.Events();
          detail.ProfileSettings();
          detail.checkUserId(); 
          detail.Dashboardaction();        

      
      
      }
    
                  
                  }

}