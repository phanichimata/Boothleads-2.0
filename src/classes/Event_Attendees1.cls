public with sharing class Event_Attendees1{

    

  
  
  
//-----------------------------------------------------------------VARIABLE DECLARATION----------------------------------    
    public boolean emailalert{get;set;}
    public boolean emailstatuschange{get;set;}
    public string[] alphabet{get;set;}
    public boolean statuschange{get;set;}
    public boolean totalselectlist{get;set;}
    public boolean custombadge1{get;set;}
    public boolean print{get;set;}
    public boolean dymo{get;set;}
    public string statusvalue{get;set;}
    public string selectedfaceFir{get;set;}
    public string selectedfaceSec{get;set;}
    public string selectedfaceThr{get;set;}
    public String selfieldvalue { get; set; }
    public boolean allrecords{get;set;}
    public string fordel{get;set;}
    public document myimage{get;set;}
    public string selectedcolor{get;set;}
    public string selectedsize{get;set;}
    public String selectedcolorT { get; set; }
    public String selectedsizeT { get; set; }
    public String selectedsizesecond { get; set; }
    public String selFvalue { get; set; }
    public String selTvalue { get; set; }
    public String selectedsizeS { get; set; }
    public String selectedcolorS { get; set; }
    public String selLvalue { get; set; }
    public boolean checked{get;set;}
    public String eventName1 { get; set; }
    public string Brevenue{get; set;}
    public String ageMod{get; set;}
    public String BEDate{get; set;}
    public String attendeeNameAfterEdit{get;set;}
    public String BDnBId{get; set;}
    public String BwebSite{get; set;}
    public String BDescription{get; set;}
    public String wAddress{get; set;}
    public String WPhone{get; set;}
    public String WPOBox{get; set;}
    public String SAddress{get; set;}
    public String SPOBox{get; set;}
    public String SBlogURL{get; set;}
    public String Diversity{get; set;}
    public String wstate{get; set;}
    public String wcity{get; set;}
    public String wAdd2{get; set;}
    public String Scity{get; set;}
    public String Sstate{get; set;}
    Public String Homeaddress1{get;set;}
    Public String Homecity{get;set;}
    Public String Homestate{get;set;}
    public String HPOBox{get; set;}
    public String EditDate{get; set;}
    public String SAddress2{get; set;}
    public String duplicateAttendee {get; set;}
    public String eventIdVar{get;set;}
    public String FirstName{get; set;}
    public String LastName{get; set;}
    public String CompanyName{get; set;}
    public String EmailId{get; set;}
    public String NAICS1Mod{get; set;}
    public String NAICS2Mod{get; set;}
    public String NAICS3Mod{get; set;}
    public String NAICS4Mod{get; set;}
    public String NAICS5Mod{get; set;}
    public string  serarchstringvalue{get;set;}
    public string EventReqString1{get;set;}
    public String selectedvalues{get; set;}
    public Boolean EventReqStringbool{get; set;}
    public String EventReqString{get; set;}
    public Boolean foundHistoryBool{get; set;}
    public List<Event_Attendee_Mapping__c> cus12 {get;set;}
    public list<list<EventWrapper>> TotalAttendees { get; set; }
    public list<InnerForBadge> newstr{get;set;}
    public list<Event_Attendee_Mapping__c> attendees1234{get;set;}
    public list<AttendeeSummary__c> event1234{get;set;}
    public AttendeeSummary__c Event{get;set;}
    public list<eventwrapper> ew {get;set;}
    public id userid{get;set;}
    public Boolean  Shippinginfo{get; set;}
    public Boolean  workinfo{get; set;}
    public Boolean addattendee1{get; set;}
    public Boolean addattendee{get; set;}
    public Boolean ReqFields{get; set;}
    public Boolean onclickback { get; set;}
    public Boolean DataImportBool{get; set;}
    public Boolean  fbool{get; set;}
    public Boolean  Ebool{get; set;}
    public string Selected{get;set;}
    public Boolean EventEditpopup{get;set;}
    public boolean logo{get;set;}
    public Blob attendeeImageEdit{ get; set; }
    Public string slectedvalues{get;set;}
    public Boolean duplicateAttendeeBool{get; set;}
    public AttendeeSummary__c newAttendee  {get; set;} 
    public Event__c attach{get;set;}
    public string attendeeName{get;set;}
    public Blob attendeeImage { get; set; }  
    public LIST<selectoption> states{get; set;}
    public String eventSelected { get; set; }
    public List<id> attid{get;set;} 
    public list<Event__c> eventattendeelist{get;set;}
    public list<Event_Attendee_Mapping__c> eventlist{get;set;}
    public list<Event_Attendee_Mapping__c> attendeeslist{get;set;}
    public LIST<LIST<InnerForBadge>> LeftValues{get; set;}
    public LIST<LIST<InnerForBadge>> RightValues{get; set;} 
    public LIST<LIST<InnerForBadge>> MiddleValues{get; set;}
    public List<Event_Attendee_Mapping__c> str{get;set;}
    public List<InnerForBadge> newstr1{get;set;}
    public List<InnerForBadge> newstr2{get;set;}
    public list<inneremail> ss {get;set;}
    public Event_Attendee_Mapping__c event1{get;set;}
    public List<Event_Attendee_Mapping__c> checkedbadge{get;set;} 
    public List<Event_Attendee_Mapping__c> checkedbadge1{get;set;} 
    public List<Event_Attendee_Mapping__c> checkedbadge2{get;set;} 
    public List<Event_Attendee_Mapping__c> attforexport{get;set;}
    public pagereference pdf{get;set;}
    public  Blob b  {get;set;}
    public string message{get;set;} 
    public BL_AttendeeSettingsCon attendeeSetting123{get; set;} 
    public LIST<SelectOption> Items{get; set;}
    public BL_SecuritySettingsCon attendeesetting{get; set;}
    public LIST<DataImport_SavePoint__c> ImportHistory{get; set;}
    public Event_Attendee_Mapping__c deleterec{get;set;}
    public boolean EventReqStringBool2{get;set;}
    public boolean pdfbool{get;set;}
    public  Event_Attendee_Mapping__c attmap{get;set;}
    public  id attendeeevent{get;set;}
    public  Event_Attendee_Mapping__c eventatt{get;set;}   
    public Blob mallikImage{get; set;}
    public String myimageName{get; set;}    
    Public Boolean RegValu0{get;set;}
    Public Boolean RegValu1{get;set;}    
    Public Boolean RegValu2{get;set;}
    Public List<String> RegTypeList{get;set;}
    Public String RegTypeValues{get;set;}
    public document mydoc{get;set;}
     public list<TicketTypes__c> tickets{get;set;}
     
//--------------------------------------------------------VARIABLE DECLARATION------------------------------------
//-------------------------------------------------------CONSTRUCTOR---------------------------------
   
   public pagereference PrintBadge1(){
   
   return null;
   }
  
    public Event_Attendees1()
    {   
    
     alphabet=new string[]{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
    
         emailalert=false;
        fieldnames=new LIST<selectoption>();
        fieldnames.add(new selectoption('None','None'));
        fieldnames.add(new selectoption('AS_LastName__c','LastName'));
        fieldnames.add(new selectoption('AS_FirstName__c','FirstName'));
        fieldnames.add(new selectoption('AS_Title__c','Designation'));
        fieldnames.add(new selectoption('AS_Company__c','Company'));
        states = new LIST<selectoption>();
        states.add(new SelectOption('None','--None--'));
        states.add(new SelectOption('AL','Alabama'));
        states.add(new SelectOption('AK', 'Alaska'));
        states.add(new SelectOption('AZ','Arizona'));
        states.add(new SelectOption('AR','Arkansas'));
        states.add(new SelectOption('CA','California'));
        states.add(new SelectOption('CO','Colorado'));
        states.add(new SelectOption('CT','Connecticut'));
        states.add(new SelectOption('DE','Delaware'));
        states.add(new SelectOption('DC','District of Columbia'));
        states.add(new SelectOption('FL','Florida'));
        states.add(new SelectOption('GA','Georgia'));
        states.add(new SelectOption('HI','Hawaii'));
        states.add(new SelectOption('ID','Idaho'));
        states.add(new SelectOption('IL','Illinois'));
        states.add(new SelectOption('IN','Indiana'));
        states.add(new SelectOption('IA','Iowa'));
        states.add(new SelectOption('KS','Kansas'));
        states.add(new SelectOption('KY','Kentucky'));
        states.add(new SelectOption('LA','Louisiana'));
        states.add(new SelectOption('ME','Maine'));
        states.add(new SelectOption('MD','Maryland'));
        states.add(new SelectOption('MA','Massachusetts'));
        states.add(new SelectOption('MI','Michigan'));
        states.add(new SelectOption('MN','Minnesota'));
        states.add(new SelectOption('MS','Mississippi'));
        states.add(new SelectOption('MO','Missouri'));
        states.add(new SelectOption('MT','Montana'));
        states.add(new SelectOption('NE','Nebraska'));
        states.add(new SelectOption('NV','Nevada'));
        states.add(new SelectOption('NH','New Hampshire'));
        states.add(new SelectOption('NJ','New Jersey'));
        states.add(new SelectOption('NM','New Mexico'));
        states.add(new SelectOption('NY','New York'));
        states.add(new SelectOption('NC','North Carolina'));
        states.add(new SelectOption('ND','North Dakota'));
        states.add(new SelectOption('OH','Ohio'));
        states.add(new SelectOption('OK','Oklahoma'));
        states.add(new SelectOption('OR','Oregon'));
        states.add(new SelectOption('PA','Pennsylvania'));
        states.add(new SelectOption('RI','Rhode Island'));
        states.add(new SelectOption('SC','South Carolina'));
        states.add(new SelectOption('SD','South Dakota'));
        states.add(new SelectOption('TN','Tennessee'));
        states.add(new SelectOption('TX','Texas'));
        states.add(new SelectOption('UT','Utah'));
        states.add(new SelectOption('VT','Vermont'));
        states.add(new SelectOption('VA','Virginia'));
        states.add(new SelectOption('WA','Washington'));
        states.add(new SelectOption('WV','West Virginia'));
        states.add(new SelectOption('WI','Wisconsin'));
        states.add(new SelectOption('WY','Wyoming'));
    
        ReqFields=true;
        getvalues();
        getevents();
  //----------------- Getting Ticket Types Of an Event----------------
       selectedTicTypes=new String[]{};
       options = new List<SelectOption>();
       tickets=new list<TicketTypes__c>();
        tickets=[select TT_Name__c from TicketTypes__c where   EV_id__r.id =: eventSelected];
        for(TicketTypes__c Tic:tickets){
        options.add(new SelectOption((String)Tic.TT_Name__c, Tic.TT_Name__c));
        }
    // By Mallik For Data Import History Display 
       Integer countOfImport = [SELECT count() FROM DataImport_SavePoint__c WHERE User_id__c =: UserInfo.getUserId()]; 
       if(countOfImport > 0)
       foundHistoryBool = TRUE;
       try
    {
     attach=[select EV_EventLogo__c from Event__c where id =:eventSelected];
     logo=true;
    }catch(exception e)
    {
    logo=false;
    }    
    }
    //---------------------------------------------------------Getting events into picklist-----------------
    public void getvalues()
    {
   
       LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
       string ss = userInfo.getUserName();
       // string ss ='';
       Items = new LIST<selectoption>();
       events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c  FROM  User_Profile_Event__c 
                                                           WHERE  EventAdmin_Id__c != '' And
                                                           User_id__r.UserName =: ss And
                                                           EventAdmin_Id__r.UserName =: ss ORDER BY CreatedDate ASC];
       if(!events.isEmpty())
       {
           
           for(User_Profile_Event__c Even: events)
           {
               if(Even.EV_id__c != null){
               Items.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
               eventSelected =Even.EV_id__c;
               }
           }
       }
            
   }
    
    //-------------------------------------------------------------------------Escap method for specialcharecters---------
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
        if(input!= null && input != '' && (input.contains(',') ))
        {
         input = input.replace(',','');
         
        }
        if(input!= null && input != '' && (input.contains('.') ))
        {
         input = input.replace('.','');
         
        }
      }  
    return input;
    
    }
    //-------------------------------------------------------------------------Escap method for specialcharecters---------
    public PageReference selectedprint() 
   {
   
   if(selectedvalues == 'Avery 5392 Name badges')
   {
   fbool=false;
   system.debug('----------------Selected Values after--------------'+selectedvalues);
   printbadge();
   addattendee1=true;
   }
   else if(selectedvalues == 'Avery 22806 easy peal square Badges')
   {
   fbool=false;
   PrintBadgeforthree();
   addattendee1=true;
   }
   else if(selectedvalues == 'Dymo Label(30856)')
   {
   fbool=false;
   printbadge();
   dymo=true;
   }
   else
   {
   fbool=TRUE;
   EventReqString1 = 'Please Select a Template';
              EventReqStringBool = TRUE;
            
   }
        return null;
    }
    //------------------------------------------SELECT  TYPE OF BADGE-----------------------------------------------------
    public List<selectoption> getfields()
      { 
          fbool=true;
          List<selectoption> Option = new List<selectoption>();
          Option.add(new selectoption('Select','Select'));
          Option.add(new selectoption('Dymo Label(30856)','Dymo Label(30856,Single Label)'));
          Option.add(new selectoption('Avery 5392 Name badges','Avery 5392 Name badges'));
        
          Option.add(new selectoption('Avery 22806 easy peal square Badges','Avery 22806 easy peal square Badges'));
          return option;
       } 
    //------------------------------------------------------GRID VALUES-------------------------------------------  
    public List<Event_Attendee_Mapping__c> getevents()
    {
     EventReqStringBool=false;
     TotalAttendees=new list<list<eventwrapper>>();
     eventlist=new list<Event_Attendee_Mapping__c>();
     if(eventSelected != null || eventSelected != '')
     {
     integer recCount=0;
     eventlist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_ImageUrl__c,
                      AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                      EA_isBadgePrinted__c,AS_id__r.AS_Email__c,AS_id__r.Registration_type__c,IsPrifileUpdate__c
                      from Event_Attendee_Mapping__c where EV_id__r.id =: eventSelected ];      
     ew=new List<eventwrapper>();
     for(Event_Attendee_Mapping__c s:eventlist)
     {      
         s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
         s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
         s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
         s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
         s.AS_id__r.AS_Company__c = escapeSpecialCharacters(s.AS_id__r.AS_Company__c);
         s.AS_id__r.Registration_type__c=escapeSpecialCharacters(s.AS_id__r.Registration_type__c);
         
         recCount++;
         ew.add(new eventwrapper(s));
         if(recCount==1000)
         {
         TotalAttendees.add(ew);
         ew = new LIST<EventWrapper>();
         recCount=0;
          }
      
       }
       if(recCount !=0)
       TotalAttendees.add(ew);                          
                              
    }
    return null;
    }      
   //----------------------------------------------------------------------------------------------------
   public void Alphasorting() {
    system.debug('----------------------------------------------------------sort---');
    string alphas=ApexPages.currentPage().getParameters().get('alphabit');
   system.debug('---------'+alphas);
   
    TotalAttendees=new list<list<eventwrapper>>();
     eventlist=new list<Event_Attendee_Mapping__c>();
     if(eventSelected != null || eventSelected != '')
     {
     if(alphas != 'All'){
     integer recCount=0;
     eventlist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_ImageUrl__c,
                      AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                      EA_isBadgePrinted__c,AS_id__r.AS_Email__c,AS_id__r.Registration_type__c,IsPrifileUpdate__c
                      from Event_Attendee_Mapping__c where AS_id__r.AS_LastName__c like: alphas+'%'
                        AND EV_id__r.id =: eventSelected];      
    system.debug('---------'+eventlist);
     ew=new List<eventwrapper>();
     for(Event_Attendee_Mapping__c s:eventlist)
     {      
         s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
         s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
         s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
         s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
         s.AS_id__r.AS_Company__c = escapeSpecialCharacters(s.AS_id__r.AS_Company__c);
         s.AS_id__r.Registration_type__c=escapeSpecialCharacters(s.AS_id__r.Registration_type__c);
         
         recCount++;
         ew.add(new eventwrapper(s));
         if(recCount==1000)
         {
         TotalAttendees.add(ew);
         ew = new LIST<EventWrapper>();
         recCount=0;
          }
      
       }
       if(recCount !=0)
       TotalAttendees.add(ew);                          
      }
      else
      {
      getevents();
      }                        
    }
       
    }    
    //-------------------------------------------------------------------------------------------ADD ATTENDEE METHOD---------       
    public String[] selectedTicTypes{get;set;}     
    public  List<SelectOption> options{get;set;}
    
    public void CreateAttendee() {
    emailalert=false;
    Select0=false;
    Select1=false;
    Select2=false;
    Select3=false;
    Select4=false;
    Select5=false;
    Select6=false;
    Select7=false;
    Select8=false;
    Select9=false;
    Select10=false;
    Select11=false;
    Select12=false;
    Select13=false;
    Select14=false;
    RegValu0=false;
    RegValu1=false;
    RegValu2=false;     
   newAttendee = new AttendeeSummary__c();   
   EventReqStringBool=false;
   if(eventSelected == 'select' || eventSelected==null)
   {
    EventReqStringBool = TRUE;
    EventReqString = 'Please Select an Event';
   }
   else
   {
   attendeesetting = new BL_SecuritySettingsCon(eventSelected);  
   addattendee = TRUE;
   newAttendee = new AttendeeSummary__c();            
   }
   }
//-------------------------------------SAVING NEW ATTENDEE METHOD----------------------------------------------
   public void SaveAttendee() 
   {
   Saved();
   EventReqStringBool2=false;
   Savepoint sp = Database.setSavepoint();  
   if(attendeeImage != NULL && ( myimageName != '' || myimageName != NULL )){
   if(attendeeImage.size() != null)
   {
      if(attendeeImage.size()< 102400){
      mydoc =new document();
      mydoc.body = attendeeImage;
      mydoc.folderid = UserInfo.getUserId();
      mydoc.ispublic=true;
      mydoc.Name = myimageName;
      insert mydoc; 
      newattendee.AS_ImageUrl__c= mydoc.id;
      }
    }
    }
     AttendeeSummary__c myatt = new AttendeeSummary__c();
     myatt = newAttendee.clone(true);
     Database.UpsertResult myAttendeeSaveResult = Database.upsert(myatt,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField(), false);
     system.debug('-------------------------new attendee------------------'+myatt);
     if(myAttendeeSaveResult.isSuccess() )
     {
     if(myAttendeeSaveResult.iscreated())
     {
      attmap = new Event_Attendee_Mapping__c();
      attmap.AS_id__c = myAttendeeSaveResult.getId();
      attmap.Ev_id__c = eventSelected;
      attmap.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ eventSelected;
      attmap.EA_AttendeeBarcode__c = myAttendeeSaveResult.getId()+'-'+eventSelected;  
       system.debug('------------------------------------------------------------------REGTYPES::::::::::-----'+selectedTicTypes);    
      attmap.TicketTypes__c='';
      for(string str:selectedTicTypes){
      attmap.TicketTypes__c+=str+',';
      }
      system.debug('------------------------------------------------------------------REGTYPES::::::::::-----'+attmap.TicketTypes__c.removeEnd(','));
      Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);
      system.debug('-------------------------------save result---------------------'+myAttendeeJunction);
      addattendee=false;
      attendeeevent=myAttendeeJunction.id;
    
      eventatt=[select id,As_id__r.AS_FirstName__c,As_id__r.AS_LastName__c,As_id__r.AS_Company__c,EV_ID__C,
                       AS_id__r.Registration_type__c,EV_id__r.EV_Title__c,AS_id__r.AS_Title__c,EA_AttendeeBarcode__c 
                       from Event_Attendee_Mapping__c where id =:attendeeevent]; 
      }else{
      integer ev_att_Jun=[select count() from  Event_Attendee_Mapping__c 
                                             where  AS_id__c =: myAttendeeSaveResult.getId() and
                                             Ev_id__c   =: eventSelected];
    if(ev_att_Jun > 0)
    {
     EventReqStringBool2=true;
     EventReqString='Attendee is Already exist';
     Database.rollback(sp);
    }else{
      attmap = new Event_Attendee_Mapping__c();
      attmap.As_id__c = myAttendeeSaveResult.getId();
      attmap.Ev_id__c = eventSelected;
      attmap.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ eventSelected;
      attmap.EA_AttendeeBarcode__c = myAttendeeSaveResult.getId()+'-'+eventSelected;
     try{
       attmap.AS_id__r.AS_ImageUrl__c=mydoc.id;
       }
     catch(exception e){}         
      Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);
      attendeeevent=myAttendeeJunction.id;
      addattendee=false;
      eventatt=[select id,As_id__r.AS_FirstName__c,As_id__r.AS_LastName__c,As_id__r.AS_Company__c,EV_ID__C,
                       AS_id__r.Registration_type__c,EV_id__r.EV_Title__c,AS_id__r.AS_Title__c,
                       EA_AttendeeBarcode__c from Event_Attendee_Mapping__c where id =:attendeeevent];
     }           
     }
     }
     eventselected=eventselected;
     getevents();   
    }
//-------------------------------For Save And Print-----------------------
    public void saveandprint()
    {
    SaveAttendee();
    pdfbool=true;
    }   
//------------------------------------------------------------------------------
    public void changestatus()
    {
    statuschange=true;
    system.debug('----------------------'+statuschange);
    }
    public List<selectoption> getprintingstatus()
    {
    List<selectoption> Options = new List<selectoption>(); 
    Event_Attendee_Mapping__c attmap=[select EA_isBadgePrinted__c from Event_Attendee_Mapping__c where id=:eventname1];
    if(attmap.EA_isBadgePrinted__c == true)
    {               
     statusvalue='Printed';
     Options.add(new selectoption('Printed','Printed'));
     Options.add(new selectoption('Not printed','Not printed'));
    }
    else
    {
    statusvalue='Not Printed';               
    Options.add(new selectoption('Not printed','Not printed'));
    Options.add(new selectoption('Printed','Printed'));
    }       
    return Options;
    }
    public Event_Attendee_Mapping__c changingprintstatus()
    {
    Event_Attendee_Mapping__c attmap=[select EA_isBadgePrinted__c from Event_Attendee_Mapping__c where id=:eventname1];
    if(statusvalue == 'Printed')
    {
    attmap.EA_isBadgePrinted__c=true;
    
    }
    else
    {
    attmap.EA_isBadgePrinted__c=false;
    }
    update attmap;
    statuschange=false;
    getevents();
    return null;
    }         
    public void changeemailstatus()
    {
    emailstatuschange=true;    
    }
    public List<selectoption> getemailstatus()
    {
     List<selectoption> Options = new List<selectoption>(); 
     Event_Attendee_Mapping__c attmap=[select IsPrifileUpdate__c from Event_Attendee_Mapping__c where id=:eventname1];
     if(attmap.IsPrifileUpdate__c == true)
     {               
     statusvalue='Sent';
     Options.add(new selectoption('Sent','Sent'));
     Options.add(new selectoption('Send','Send'));
      }
      else
     {
     statusvalue='Send';  
     Options.add(new selectoption('Send','Send'));             
     Options.add(new selectoption('Sent','Sent'));
     }
     return Options;
     }
    public Event_Attendee_Mapping__c changingemailstatus()
    {
    Event_Attendee_Mapping__c attmap=[select IsPrifileUpdate__c from Event_Attendee_Mapping__c where id=:eventname1];
    if(statusvalue == 'Sent')
    {
    attmap.IsPrifileUpdate__c=true;
    
    }
    else
    {
    attmap.IsPrifileUpdate__c=false;
    }
    update attmap;
    
    system.debug('--------------------------------'+attmap.EA_isBadgePrinted__c);
    emailstatuschange=false;
    getevents();
    return null;
    }      
//---------------------------------------------------------------------END OF SAVE ATTENDEE-----------------------------       
    public PageReference deleteDataImportHistory() {
    DataImport_SavePoint__c dataImp=[select id, DS_ImportedId__c FROM DataImport_SavePoint__c 
                                             where id=: ApexPages.currentpage().getparameters().get('deleteDataImport')]; 
     LIST<ID> importids = dataImp.DS_ImportedId__c.split(','); 
     LIST<Event_Attendee_Mapping__c> eamap = [SELECT id FROM Event_Attendee_Mapping__c WHERE id IN: importids ];
     LIST<Database.DeleteResult> deljunction = Database.delete(eamap, false);
     Database.DeleteResult delmainrec= DataBase.delete(dataImp, false);
     DataImportBool = FALSE;
     return null;
    }
    //-----------------------------------------EDIT ATTENDEES---------------------
   public Event_Attendee_Mapping__c TicTypesforedit{get;set;}
    public PageReference editAttendee() 
    {
    system.debug(':::::::::::::::::::::::::::::::::::::::::::::::::;;;'+eventname1);
     TicTypesforedit=new Event_Attendee_Mapping__c();
    string TTT='';
    List<string> totaltypes=new list<string>();
    emailalert=false;
    attendeesetting=new BL_SecuritySettingsCon(eventSelected);
    for(TicketTypes__c tt:tickets){
    totaltypes.add(tt.TT_Name__c);
    }
    TicTypesforedit=[select TicketTypes__c from Event_Attendee_Mapping__c where id=:eventName1];
    try{
    TTT=TicTypesforedit.TicketTypes__c;
    list<string> regticket=TTT.split(',');
    selectedTicTypes=new String[]{};
    for(string reg:regticket){
    selectedTicTypes.add(reg);
    }}
    catch(exception e){}
    Event_Attendee_Mapping__c attendeeid = [select AS_id__c from Event_Attendee_Mapping__c where id=:eventName1];
    Event = new AttendeeSummary__c ();
    event1234=new list<AttendeeSummary__c>();
    event1234= [select id,name,AS_Age__c,isUpdated__c,AS_BirthDate__c,AS_BlogUrl__c,AS_BusinessDescription__c,AS_BusinessDunsNumber__c,
                                 AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_CellPhone__c,
                                 AS_Company__c,AS_DiversityType__c,Registration_type__c,AS_Email__c,AS_FaxNumber__c,AS_FirstName__c,AS_Gender__c,
                                 AS_HomeAddress1__c,AS_HomeAddress2__c,AS_HomeCity__c,AS_HomeCountry__c,AS_HomePhone__c,
                                 AS_HomePoBox__c,AS_HomeState__c,AS_HomeZipcode__c,AS_ImageUrl__c,AS_LastName__c,AS_NAICSCode1__c,
                                 AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_NumberOfEmployees__c,AS_Prefix__c,
                                 AS_PrimaryBusinessCategory1__c,AS_SecondaryBusinessCategory1__c,AS_ShippingAddress1__c,AS_ShippingAddress2__c,
                                 AS_ShippingCity__c,AS_ShippingCountry__c,AS_ShippingPhone__c,AS_ShippingPoBox__c,AS_ShippingState__c,
                                 AS_ShippingZipcode__c,AS_Suffix__c,AS_ThroughEventBrite__c,AS_Title__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,
                                 AS_WorkAddress2__c,AS_WorkCity__c,AS_WorkCountry__c,AS_WorkPhone__c,AS_WorkPoBox__c,AS_WorkState__c,AS_WorkZipCode__c
                                 FROM AttendeeSummary__c WHERE id=:attendeeid.AS_id__c];                              
        for(AttendeeSummary__c emEvent1 :event1234)
        {
            if(eventName1!= null && eventName1 !='')
            {
                EventReqStringBool=false;
                EventEditpopup= TRUE;
                Event = emEvent1;
                break;   
            } 
        }
        if(event.As_ImageUrl__c != null)
        {
        eventIdVar=event.As_ImageUrl__c;
        }
         if(Event.AS_Gender__c =='Male')
        {
            Selected= 'TRUE';
        }ELSE
        {
            selected = 'FALSE';
        }
       ageMod = String.valueOf(Event.AS_age__c);
        if(Event.AS_age__c != null)
        {
            if(ageMod != '0.0')
            {
                if(ageMod.contains('.0'))
                {
                ageMod.replaceAll('.0', '');
                }
            }else
            {
                ageMod = '';
            }
        }
       if(Event.AS_NAICSCode1__c > 10)
        {
            NAICS1Mod = String.valueOf(Event.AS_NAICSCode1__c);
            if(NAICS1Mod.contains('\''))
            {
                NAICS1MOd=NAICS1Mod.replaceAll('\'','');                    
            }
        }
        
        if(Event.As_NAICSCode2__c > 10)
        {
            NAICS2Mod = String.valueOf(Event.AS_NAICSCode2__c);
            if(NAICS2Mod.contains('\''))
            {
                NAICS2MOd=NAICS2Mod.replaceAll('\'','');                    
            }
        }
        if(Event.AS_NAICSCode3__c > 10)
        {
            NAICS3Mod = String.valueOf(Event.AS_NAICSCode3__c);
            if(NAICS3Mod.contains('\''))
            {
                NAICS3MOd=NAICS3Mod.replaceAll('\'','');                    
            }
        }
        if(Event.AS_NAICSCode4__c > 10)
        {
            NAICS4Mod = String.valueOf(Event.AS_NAICSCode4__c);
            if(NAICS4Mod.contains('\''))
            {
                NAICS4MOd=NAICS4Mod.replaceAll('\'','');                    
            }
        }
          if(Event.AS_NAICSCode5__c > 10)
        {
            NAICS5Mod = String.valueOf(Event.AS_NAICSCode5__c);
            if(NAICS5Mod.contains('\''))
            {
                NAICS5MOd=NAICS5Mod.replaceAll('\'','');                    
            }
        }
        EditDate =String.valueOf(Event.AS_BirthDate__c); 
        BEDate=String.valueOf(Event.AS_BusinessEstablishedDate__c);
        if(Event.AS_DiversityType__c != Null){ 
        if(Event.AS_DiversityType__c.contains('Minority Owned Business Enterprise'))
        Select0 = True;
        if(Event.AS_DiversityType__c.contains('Disadvantaged Business Enterprise'))
        Select1 = True;
        if(Event.AS_DiversityType__c.contains('Service Disabled Veteran Business Enterprise'))
        Select2 = True;
        if(Event.AS_DiversityType__c.contains('Small Business Enterprise'))
        Select3 = True;
        if(Event.AS_DiversityType__c.contains('Ability One'))
        Select4 = True;
        if(Event.AS_DiversityType__c.contains('Woman Owned Business Enterprise'))
        Select5 = True;
        if(Event.AS_DiversityType__c.contains('SBA 8(A) Program'))
        Select6 = True;
        if(Event.AS_DiversityType__c.contains('Veteran Owned Business Enterprise'))
        Select7 = True;
        if(Event.AS_DiversityType__c.contains('Lesbian Gay Bisexual Transgender Business'))
        Select8 = True;
        if(Event.AS_DiversityType__c.contains('Alaskan Native Corporation Owned Firm'))
        Select9 = True;
        if(Event.AS_DiversityType__c.contains('Small Disadvantaged Business'))
        Select10 = True;
        if(Event.AS_DiversityType__c.contains('Historically Underutilized Business Zone'))
        Select11 = True;
        if(Event.AS_DiversityType__c.contains('Disabled Business Enterprise'))
        Select12 = True;
        if(Event.AS_DiversityType__c.contains('Historically Black Colleges And Universities'))
        Select13 = True;
        if(Event.AS_DiversityType__c.contains('Self-Certified Small Disadvantaged Business'))
        Select14 = True;
      }
       
        return null;
    }

    //----------------------------------------------------------------------------------------END OF EDIT---------------------
//--------------------------------------------------------------------UPDATE ATTENDEE-------------------------
    public void UpdateAttendee() {
    try{
        Event.isUpdated__c=true;
        Event.AS_FirstName__c=Event.AS_FirstName__c;
        Event.AS_LastName__c=Event.AS_LastName__c;
        Event.AS_Company__c=Event.AS_Company__c;
        Event.AS_Email__c=Event.AS_Email__c;
        Event.AS_Prefix__c =Event.AS_Prefix__c ;
        Event.AS_Suffix__c =Event.AS_Suffix__c ;
        Event.AS_Title__c =Event.AS_Title__c ;
        Event.AS_CellPhone__c =Event.AS_CellPhone__c ;
        try{
        Event.AS_Age__c =Integer.valueOf(ageMod);
        } catch(Exception e)
        {
        Event.AS_Age__c = null;
        }
        Event.AS_HomePhone__c =Event.AS_HomePhone__c ;
        Event.AS_Gender__c =Event.AS_Gender__c;
        Event.AS_BirthDate__c = Event.AS_BirthDate__c;
        Event.AS_HomeAddress1__c =Event.AS_HomeAddress1__c ;
        Event.AS_BusinessDescription__c =Event.AS_BusinessDescription__c ;
        Event.AS_BusinessEstablishedDate__c =Event.AS_BusinessEstablishedDate__c;
        Event.AS_BusinessDunsNumber__c =Event.AS_BusinessDunsNumber__c;
        Event.AS_NumberOfEmployees__c =Event.AS_NumberOfEmployees__c ;
        Event.AS_BusinessRevenue__c =Event.AS_BusinessRevenue__c ;
        Event.AS_BusinessTaxId__c =Event.AS_BusinessTaxId__c ;
        Event.AS_PrimaryBusinessCategory1__c =Event.AS_PrimaryBusinessCategory1__c ;
        Event.AS_SecondaryBusinessCategory1__c =Event.AS_SecondaryBusinessCategory1__c ;
        Event.AS_WebsiteURL__c =Event.AS_WebsiteURL__c ;
        Event.AS_ShippingAddress1__c =Event.AS_ShippingAddress1__c ;
        Event.AS_ShippingPOBox__c =Event.AS_ShippingPOBox__c ;
        Event.AS_BlogURL__c =Event.AS_BlogURL__c ;
        Event.AS_WorkAddress1__c =Event.As_WorkAddress1__c ;
        Event.AS_WorkPhone__c =Event.AS_WorkPhone__c ;
        Event.AS_WorkPOBox__c =Event.AS_WorkPOBox__c ;
        Event.AS_DiversityType__c =Event.AS_DiversityType__c ;
        try
        {
        Event.AS_NAICSCode1__c =Integer.valueOf(NAICS1Mod);
        } catch(Exception e){}
        try{   
        Event.AS_NAICSCode2__c =Integer.valueOf(NAICS2Mod);
         }catch(Exception e){}
        try{
        Event.AS_NAICSCode3__c =Integer.valueOf(NAICS3Mod);
        } catch(Exception e){}
         try{
        Event.AS_NAICSCode4__c =Integer.valueOf(NAICS4Mod);
        }catch(Exception e){}
         try{
        Event.AS_NAICSCode5__c =Integer.valueOf(NAICS5Mod);
        }catch(Exception e){}
        Event.AS_shippingCity__c =Event.AS_shippingCity__c;
        Event.AS_shippingState__c = Event.AS_shippingState__c; 
        Event.AS_WorkAddress1__c = Event.AS_WorkAddress1__c;
        Event.AS_Workcity__c = Event.AS_Workcity__c;
        Event.AS_WorkState__c = Event.AS_WorkState__c;
        Event.AS_HomeAddress1__c = Event.AS_HomeAddress1__c;
        Event.AS_HomeCity__c =Event.AS_HomeCity__c;
        Event.AS_HomePOBox__c =Event.AS_HomePOBox__c;
        Event.AS_HomeState__c =Event.AS_HomeState__c;
        update Event ;
        Selvalue =new LIST<String> ();
        if(Select0 == TRUE)
        selValue.add('Minority Owned Business Enterprise');
        if(Select1== TRUE)
        selValue.add('Disadvantaged Business Enterprise');
        if(Select2== TRUE)
        selValue.add('Service Disabled Veteran Business Enterprise');
        if(Select3== TRUE)
        selValue.add('Small Business Enterprise');
        if(Select4== TRUE)
        selValue.add('Ability One');
        if(Select5== TRUE)
        selValue.add('Woman Owned Business Enterprise');
        if(Select6== TRUE)
        selValue.add('SBA 8(A) Program');
        if(Select7== TRUE)
        selValue.add('Veteran Owned Business Enterprise');
        if(Select8== TRUE)
        selValue.add('Lesbian Gay Bisexual Transgender Business');
        if(Select9== TRUE)
        selValue.add('Alaskan Native Corporation Owned Firm');
        if(Select10== TRUE)
        selValue.add('Small Disadvantaged Business');
        if(Select11== TRUE)
        selValue.add('Historically Underutilized Business Zone');
        if(Select12== TRUE)
        selValue.add('Disabled Business Enterprise');
        if(Select13== TRUE)
        selValue.add('Historically Black Colleges And Universities');
        if(Select14== TRUE)
        selValue.add('Self-Certified Small Disadvantaged Business');
        selectedvaluesfordiversity= '';
        for(string s: selValue)
        {
        selectedvaluesfordiversity+=s+';';
        Event.AS_DiversityType__c = selectedvaluesfordiversity;
        } 
        RegTypeList = new List<String>();    
        if(RegValu0 == True)
        RegTypeList.add('Full Convention');
        if(RegValu1 == True)    
        RegTypeList.add('Reception');
        if(RegValu2 == True)    
        RegTypeList.add('Tuesday Pass');
        RegTypevalues= '';
        for(String R: RegTypeList)
        {
        RegTypevalues+=R+',';
        Event.Registration_type__c = RegTypevalues;
        }   
       update Event ;
       system.debug('--------------------:::::::EVM:::::::::------'+TicTypesforedit.TicketTypes__c);
       system.debug('--------------------:::::::EVM:::::::::------'+selectedTicTypes);
       TicTypesforedit.TicketTypes__c='';
       for(string regtypes:selectedTicTypes){
       TicTypesforedit.TicketTypes__c+=regtypes+',';
       }
       system.debug('--------------------:::::::EVM:::::::::------'+TicTypesforedit.TicketTypes__c);
       update TicTypesforedit;
       system.debug('--------------------:::::::EVM:::::::::------'+TicTypesforedit.TicketTypes__c);
       if(eventIdVar != null && attendeeImageEdit != null && (attendeeNameAfterEdit != null || attendeeNameAfterEdit != '' ))
       {
        document doc=[select id from document where id =: eventIdVar];
        delete doc;
       }
       if(attendeeImageEdit != null && (attendeeNameAfterEdit != null || attendeeNameAfterEdit != '' ))
       {
       if(attendeeImageEdit.size()!= null)
       {
         system.debug('BBBBBBBBBBBBBBBBBBBBB'+ attendeeImageEdit.size() );
       
       mydoc=new document();
       mydoc.folderid = UserInfo.getUserId();
       mydoc.ispublic=true;
       mydoc.body= attendeeImageEdit ;
       mydoc.name= attendeeNameAfterEdit ;    
       insert mydoc;
       Event.As_ImageUrl__c=mydoc.id;
       update Event ;
       
    }
    }
     
   }
    catch(Exception e){ApexPages.addMessages(e);}
    EventEditpopup=false;
    
    eventselected=eventselected;
    getevents();    
    }
    public PageReference Cancel()
     {
    duplicateAttendeeBool=false;
    fbool=false;
    pdfbool=false;
    EventEditpopup=false;
    addattendee1=false;
    addattendee=false;
     Dymo=false;
    DataImportBool = false;
    statuschange=false;
    emailstatuschange=false;
    //pagereference pf=new pagereference('/apex/Qrcode_Eventadmin_Attendees');
    getevents();
        return null;
    }
    //------------------------------------------------------------------------------------------
     public List<selectoption> getselect()
    {
        List<selectoption> Option = new List<selectoption>();
        Option.add(new selectoption('Male','Male'));
        Option.add(new selectoption('Female','Female'));
        return option;
    }
    //----------------------------------------------------------------------
    public PageReference backaction() {
    addattendee1 = FALSE;
    pagereference pg = new pagereference('/apex/Qrcode_Eventadmin_Attendees');
        pg.setRedirect(true);
        return pg; 
    }

    //----------------------------------------------------------------------FOR 5392 LABEL----------------------------------------
         
    public void PrintBadge()
     {
      EventReqStringBool =false;
      attid=new List<id>();
      if(TotalAttendees.size()>0)
      {
      if(eventname1 != '')
      {
      attendeeslist=new List<Event_Attendee_Mapping__c>();
      if(Allrecords == true)
      {
      attendeeslist = [select AS_id__c,AS_id__r.id, AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,IsPrifileUpdate__c,
                              EA_isBadgePrinted__c,AS_id__r.AS_Title__c,EV_id__r.EV_Title__c,AS_id__r.Registration_type__c     
                              from Event_Attendee_Mapping__c where EV_id__c =: eventselected];
                 
      for( Event_Attendee_Mapping__c  aa: attendeeslist)
     {
     attid.add(aa.id);
     }            
     }
     else
     {
     List<string> listeventname=eventname1.split(',');
     for(string  aa: listeventname)
     {
     attid.add((id)aa);
     }
     attendeeslist=[select AS_id__c,AS_id__r.id, AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,IsPrifileUpdate__c,
                              EA_isBadgePrinted__c,AS_id__r.AS_Title__c,EV_id__r.EV_Title__c,AS_id__r.Registration_type__c     
                              from Event_Attendee_Mapping__c where  id in:attid];
     }
    try
    {
     attach=[select EV_EventLogo__c from Event__c where id =:eventSelected];
     logo=true;
    }catch(exception e)
    {
    logo=false;
    }
    if(selectedvalues != 'Dymo Label(30856)')
     {
        newstr=new List<InnerForBadge >();
        newstr1=new List<InnerForBadge >();        
        integer i=0;
        LIST<ID> badgeAttid = new LIST<ID>();
         
        for(Event_Attendee_Mapping__c evj: attendeeslist)
        {
            badgeAttid .add(evj.AS_id__c);
        }
     MAP<ID, Sobject> printbad = new MAP<id, SObject>([select id, name,AS_LastName__c,AS_FirstName__c,AS_Company__c, AS_Title__c FROM AttendeeSummary__c WHERE ID IN: badgeAttid ]);  
     for(Event_Attendee_Mapping__c eww: attendeeslist)
    {
    if(math.mod(i,2)==0)
    {
     InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get(selfieldvalue) ,(String)printbad.get(eww.AS_id__c).get(selLvalue) ,(String)printbad.get(eww.AS_id__c).get(selTvalue), eww.EA_AttendeeBarcode__c);
     newstr.add(ifb);
    }
      else
      {
        InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get(selfieldvalue) ,(String)printbad.get(eww.AS_id__c).get(selLvalue) ,(String)printbad.get(eww.AS_id__c).get(selTvalue),eww.EA_AttendeeBarcode__c);
        newstr1.add(ifb);
      }
       i++;
    }
     LIST<InnerForBadge > FLRec = new LIST<InnerForBadge>();
     LeftValues = new LIST<LIST<InnerForBadge>>();
     integer Lpagecount=0;
     for(InnerForBadge  l: newstr)
     {
        FLRec.add(l);
        Lpagecount++;
        if(Lpagecount==3)
     {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<InnerForBadge >();
     }
    }
      if(FLRec.size() != 0)
      {
       LeftValues.add(FLRec);
      }
      LIST<InnerForBadge > SLRec = new LIST<InnerForBadge >();
      RightValues = new LIST<LIST<InnerForBadge >>();
      integer Rpagecount=0;
      for(InnerForBadge  l: newstr1)
      {
        SLRec.add(l);
        Rpagecount++;
        if(Rpagecount==3)
      {
        RightValues.add(SLRec);
        Rpagecount=0;
        SLRec = new LIST<InnerForBadge >();
      }
      }
      if(SLRec.size() != 0)
        {
        RightValues.add(SLRec);
        }  
        addattendee1 = TRUE;
        event1= new Event_Attendee_Mapping__c();        
        }
        }
        else
        {
        EventReqString = 'Please Select atleast one Attendee';
              EventReqStringBool = TRUE;
        }
        }
        
        else
        if(TotalAttendees.size()<=0)
        {
        EventReqString = 'Please create an Attendee';
              EventReqStringBool = TRUE;
        }
        
        }
//-----------------------------------------------------------END OF FIRSTLABEL------------------------------    
//---------------------------------------------------------------FOR EASY PEAL OFF BADGE----------------    
     public void PrintBadgeforthree()
    {
        fbool=false;
        EventReqStringBool =false;
        if(TotalAttendees.size()>0)
        {
        attid=new List<id>();
        attendeeslist=new List<Event_Attendee_Mapping__c>();
        if(eventname1 != '')
        {
        if(Allrecords == true)
        {
        attendeeslist = [select AS_id__c,AS_id__r.id, AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                              EA_isBadgePrinted__c,IsPrifileUpdate__c       
                              from Event_Attendee_Mapping__c where EV_id__c =: eventselected];
        for( Event_Attendee_Mapping__c  aa: attendeeslist)
        {
        attid.add(aa.id);
        }            
        }
        else{
        EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');        
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        }
        
        attendeeslist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                                EA_isBadgePrinted__c,IsPrifileUpdate__c       
                              from Event_Attendee_Mapping__c where  id in:attid];
        }
        newstr=new List<InnerForBadge >();
        newstr1=new List<InnerForBadge >();
        newstr2=new List<InnerForBadge >();      
       integer i=0;
       LIST<ID> badgeAttid = new LIST<ID>();
         
        for(Event_Attendee_Mapping__c evj: attendeeslist)
        {
        badgeAttid .add(evj.AS_id__c);
        }
       MAP<ID, Sobject> printbad = new MAP<id, SObject>([select id, name,AS_LastName__c,AS_FirstName__c,AS_Company__c, AS_Title__c FROM AttendeeSummary__c WHERE ID IN: badgeAttid]);  
       for(Event_Attendee_Mapping__c eww: attendeeslist)
       {
       if(math.mod(i,3)==0)
      {
        if(selfieldvalue == 'AS_FirstName__c,AS_LastName__c'){
        InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c') ,(String)printbad.get(eww.AS_id__c).get(selLvalue),eww.EA_AttendeeBarcode__c);
        newstr.add(ifb);
        }else{
        InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get(selfieldvalue ) ,(String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c'),eww.EA_AttendeeBarcode__c);
        newstr.add(ifb);
        }
      }
      else if(math.mod(i,3)==1)
      {
        if(selfieldvalue == 'AS_FirstName__c,AS_LastName__c'){
        InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c') ,(String)printbad.get(eww.AS_id__c).get(selLvalue) ,eww.EA_AttendeeBarcode__c);
        newstr1.add(ifb);
        }else{
        InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get(selfieldvalue) ,(String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c') ,eww.EA_AttendeeBarcode__c);
        newstr1.add(ifb);
        }
      }
      else if(math.mod(i,3)==2)
      {
       if(selfieldvalue == 'AS_FirstName__c,AS_LastName__c'){
       InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c') ,(String)printbad.get(eww.AS_id__c).get(selLvalue) ,eww.EA_AttendeeBarcode__c);
       newstr2.add(ifb);
       }else {
       InnerForBadge ifb = new InnerForBadge( (String)printbad.get(eww.AS_id__c).get(selfieldvalue),(String)printbad.get(eww.AS_id__c).get('AS_FirstName__c')+(String)printbad.get(eww.AS_id__c).get('AS_LastName__c') ,eww.EA_AttendeeBarcode__c);
       newstr2.add(ifb);
        }
      }
       i++;
    }
    LIST<InnerForBadge > FLRec = new LIST<InnerForBadge >();
    LeftValues = new LIST<LIST<InnerForBadge >>();
    integer Lpagecount=0;
    for(InnerForBadge  l: newstr)
    {
        FLRec.add(l);
        Lpagecount++;
    if(Lpagecount==4)
    {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<InnerForBadge >();
     }
     }
     if(FLRec.size() != 0)
     {  
     LeftValues.add(FLRec);
     }
     LIST<InnerForBadge > MLRec = new LIST<InnerForBadge >();
     MiddleValues = new LIST<LIST<InnerForBadge >>();
     integer Middlecount=0;
     for(InnerForBadge  l: newstr1)
     {
     MLRec.add(l);
     Middlecount++;
     if(Middlecount==4)
     {
     MiddleValues.add(MLRec);
     Middlecount=0;
     MLRec = new LIST<InnerForBadge >();
     }
    }
    if(MLRec.size() != 0)
    {    
    MiddleValues.add(MLRec);
    }
    LIST<InnerForBadge > SLRec = new LIST<InnerForBadge >();
    RightValues = new LIST<LIST<InnerForBadge >>();
    integer Rpagecount=0;
    for(InnerForBadge  l: newstr2)
    {
     SLRec.add(l);
     Rpagecount++;
    if(Rpagecount==4)
    {
     RightValues.add(SLRec);
     Rpagecount=0;
     SLRec = new LIST<InnerForBadge >();
    }  
    }
    if(SLRec.size() != 0)
    {
     RightValues.add(SLRec);
    }
    try
    { 
    attach=[select EV_EventLogo__c from Event__c where id =:eventSelected];          
    if(attach != null)
    {
     logo=true;
    }
    }catch(exception e){

        logo=false;
        }
        addattendee1 = TRUE;
        event1= new Event_Attendee_Mapping__c();
        }
        else
        {
        EventReqString = 'Please Select atleast one Attendee';
        EventReqStringBool = TRUE;
        }
        }
        
        else
        if(TotalAttendees.size()<=0)
        {
        EventReqString = 'Please create an Attendee';
              EventReqStringBool = TRUE;
        }
        
    }
    //------------------------------------------------------FOR ATTENDEE DELETE--------------------
    public void deleteAdminRecord() {
    emailalert=false;
    deleterec =[select id from Event_Attendee_Mapping__c where id=:eventName1 AND EV_id__r.id =: eventSelected];
    Delete deleterec ;
    eventselected=eventselected;
    getevents();
    
    }
    
    public boolean  EventReqStringbool3{get;set;}
    public PageReference attendeedetail() {
    Event_Attendee_Mapping__c ss=[select AS_id__r.id from Event_Attendee_Mapping__c  where id =:eventname1 limit 1];
    PageReference pg = new pagereference('/apex/qrcode_attendee_details?id='+eventname1 );
    pg.setRedirect(true);
    return pg;  
    }
    //----------------------------------------------------------------------FOR Import------------------------    
    public void ShowPreviousList() {
    emailalert=false;
    DataImportBool = TRUE;
    ImportHistory = new LIST<DataImport_SavePoint__c>();    
    ImportHistory = [Select d.User_id__c,d.createdDate, d.Name, d.DS_TotalRecords__c, d.DS_FileName__c From DataImport_SavePoint__c d WHERE User_id__c =: userInfo.getUserId()];
    }
    //------------------------------------------------------POPUP FOR SELECTING DESIRED LABEL-----------------------------------
    public void popup() {
    emailalert=false;
    custombadge1=false;
    totalselectlist=false;
    print=false;
    selectedvalues ='select';
    EventReqStringBool = false;
    Event1 = new Event_Attendee_Mapping__c();
    if(eventname1 != '' && eventname1 != null)
    {
    EventReqStringBool =false;
    for(Event_Attendee_Mapping__c emEvent1 :eventlist)
    {
    if(eventname1!= null && eventname1!='' && eventname1.equals(emEvent1.Id))
    {
    fbool= TRUE;
    Event1 = emEvent1;
    break;
    }
    }
    getfields();
    }
    else
    {
    EventReqString = 'Please select atleast one attendee to print';
    EventReqStringBool = TRUE;
    }
    } 
   //--------------------------------------------------------------------------------------EMAIL BADGE------------------------
     public PageReference emailBadge() {
     emailalert=false;
     if(eventname1 != '')
        {
        EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        } 
    list<Event_Attendee_Mapping__c> emailids=[select id,EA_AttendeeBarcode__c,AS_id__r.AS_LastName__c,
                                                       AS_id__r.AS_FirstName__c, AS_id__r.AS_Email__c
                                                      From Event_Attendee_Mapping__c where id IN : attid];
    list<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    for(Event_Attendee_Mapping__c eid: emailids)
     { 
     pdf=page.Qrcode_EmailBadgeToAttendees; 
     string fss =eid.EA_AttendeeBarcode__c;
     pdf.getParameters().put('id',fss);
     b = pdf.getContent();
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setSubject('Your Ticket For Registered Event!');
     String [] toAddresses = new String[] {eid.AS_id__r.AS_Email__c};
     email.setToAddresses(toAddresses);
     email.setPlainTextBody(message='Hello'+ eid.AS_id__r.AS_FirstName__c  +' Your Badge for the registered event'+ 
          'has been attached in the mail.'+ +
          ' Thank you,'+  +
          ' Globalnest LLC');                                                                                      
     Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
     efa.setFileName('Mybadge.pdf');                                                        
     efa.setBody(b);                                                                          
     email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
     emails.add(email);                                                                           
    } 
    Messaging.SendEmailResult[]  r = Messaging.sendEmail(emails);
   // Messaging.SendEmailResult[]  r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {emails});
    boolean check=true;
    for(Messaging.SendEmailResult ms: r){
       check=check && ms.isSuccess();
    }
    if(check == true)
    {
    emailalert=true;
    }
    }
    else
    {
      EventReqStringBool = true;
      EventReqString = 'Please Select an attendee to send a mail';
    }
    return null;
    }
    //-------------------------------------------------------------------------------------------------------------------------
    public PageReference ImportAttendee() {
    pagereference pg = new pagereference('/apex/BL_AttendeesImport?id='+eventSelected );
    pg.setredirect(true);
    return pg;
    }
    Public PageReference ProfileSettings()
    {
    Pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');
    Pg.setredirect(true);
    Return pg;
    }    
//-----------------------------------------------------------------------------------GENERATE PDF FOR BADGES--------------
    public PageReference genpdf() {
    checkedbadge= new List<Event_Attendee_Mapping__c>();
    List<Event_Attendee_Mapping__c> changed=new List<Event_Attendee_Mapping__c>{};
    checkedbadge=[select id, EA_isBadgePrinted__c from Event_Attendee_Mapping__c where id in:attid];
    for(Event_Attendee_Mapping__c dd:checkedbadge)
    {
    dd.EA_isBadgePrinted__c=true;
    changed.add(dd);
    }
    update changed;
    if(selectedvalues=='Avery 5392 Name badges')
    {
     pagereference pg =page.Qrcode_printbadge_5392label;
     return pg;   
    }
    else if(selectedvalues=='Avery 22806 easy peal square Badges')
    {
    pagereference pf =page.Qrcode_printbadge_PealoffLabel;
    return pf;    
    }
    if(selectedvalues=='Dymo Label(30856)')
    {
    pagereference pf =page.qrcode_Dymolabel;
    return pf;  
   
    }
    return null;     
    }   
    //-------------------------------------------------INNER CLASS------------------------------
    public class EventWrapper
    {
    public Event_Attendee_Mapping__c atnd {get;set;}
    public string z{get;set;} 
    public string status{get;set;}
    public string Estatus{get;set;}
    public string hover{get;set;}
    public EventWrapper(Event_Attendee_Mapping__c atnd)
    {
    this.atnd=atnd;
   
    if(atnd.EA_isBadgePrinted__c==true)
    {
    this.z='background-color:#e2e2e2;"';
      this.hover='Already Printed';
      this.status='Printed';
      }
      else
      {
      this.status='Not Printed';
      }
    if(atnd.IsPrifileUpdate__c == true)
    {
     this.Estatus='Sent';
    }
    else
    {
    this.Estatus='Send';
    }
    }
    }
    //------------------------------------------------------IINER EMAIL----------------
   public class inneremail
   {
   public Event_Attendee_Mapping__c qq{get;set;}
   public inneremail(Event_Attendee_Mapping__c qq)
   {
   this.qq=qq;
   }
   } 
   //--------------------------------------------------------------INNER FOR BADGE SETTINGS-----------------------
   public class InnerForBadge{
   public String fName{get; set;}
   public String sName{get; set;}
   public String lName{get; set;}
   public String fLName{get; set;}
   public String barCode{get;set;}
   public InnerForBadge(String fn, String ln ,String em, String code ){ 
            fName = fn;
            sName = ln;
            lName =em;
            barCode = code;    
        }
        public InnerForBadge(String fLn,String em, String code ){
            
            fLName = fLn;
            lName =em;
            barCode = code;  
        }
    }
    //----------------------------------------- INNER CLASS BY MALLIK
    public class InnerByMallik{
    
        public String barcode{get; set;}
        public AttendeeSummary__c AttSummary{get; set;}
        public InnerByMallik(String fn, AttendeeSummary__c at ){   
            AttSummary = new AttendeeSummary__c();
            barcode = fn;
            AttSummary = at;
            
            
        }
    
    }
    public list<selectoption> fieldnames{get;set;}
//---------------------------------------------------------for colors----------------
    public List<SelectOption> getcolors()
     {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new selectoption('select','select'));
            options.add(new SelectOption('Green','Green'));
            options.add(new SelectOption('Red','Red'));
            options.add(new SelectOption('Pink','Pink'));
            options.add(new SelectOption('Orange','Orange'));
            options.add(new SelectOption('Blue','Blue'));
            options.add(new SelectOption('Indigo','Indigo'));
            options.add(new SelectOption('Black','Black'));
            return options;
            
    }
    public list<selectoption> font{get;set;}  
    //------------------------------------------Font Face----------------------------
    public  List<SelectOption> getface() {
    List<SelectOption> options = new List<SelectOption>();
    options.add(new selectoption('select','select'));
    options.add(new SelectOption('Agency FB','Agency FB'));
    options.add(new SelectOption('Algerian','Algerian'));
    options.add(new SelectOption('Arial','Arial'));
    options.add(new SelectOption('Arial Black','Arial Black'));
    options.add(new SelectOption('Arial Narrow','Arial Narrow'));
    options.add(new SelectOption('Arial Rounded MT Bold','Arial Rounded MT Bold'));
    options.add(new SelectOption('Arial Unicode MS','Arial Unicode MS'));
    options.add(new SelectOption('Baskerville Old Face','Baskerville Old Face'));
    options.add(new SelectOption('Bauhaus 93','Bauhaus 93'));
    options.add(new SelectOption('Bell MT','Bell MT'));
    options.add(new SelectOption('Berlin Sans FB','Berlin Sans FB'));
    options.add(new SelectOption('Arial','Arial'));            
    options.add(new SelectOption('Agency FB','Agency FB'));
    options.add(new SelectOption('Berlin Sans FB Demi','Berlin Sans FB Demi'));
    options.add(new SelectOption('Bernard MT Condensed','Bernard MT Condensed'));
    options.add(new selectoption('Blackadder ITC','Blackadder ITC'));
    options.add(new selectoption('Bodoni MT','Bodoni MT'));
    options.add(new selectoption('Bodoni MT Black','Bodoni MT Black'));
    options.add(new selectoption('Bodoni MT Condensed','Bodoni MT Condensed'));
    options.add(new selectoption('Bodoni MT Poster Compressed','Bodoni MT Poster Compressed'));
    options.add(new selectoption('Book Antiqua','Book Antiqua'));
    options.add(new selectoption('Bookman Old Style','Bookman Old Style'));
    options.add(new selectoption('Bookshelf Symbol 7','Bookshelf Symbol 7'));
    options.add(new selectoption('Bradley Hand ITC','Bradley Hand ITC'));
    options.add(new selectoption('Britannic Bold','Britannic Bold'));
    options.add(new selectoption('Broadway','Broadway'));
    options.add(new selectoption('Brush Script MT','Brush Script MT'));
    options.add(new selectoption('Calibri','Calibri'));
    options.add(new selectoption('Californian FB','Californian FB'));
    options.add(new selectoption('Calisto MT','Calisto MT'));
    options.add(new selectoption('Cambria','Cambria'));
    options.add(new selectoption('Cambria Math','Cambria Math'));
    options.add(new selectoption('Candara','Candara'));
    options.add(new selectoption('Castellar','Castellar'));
    options.add(new selectoption('Centaur','Centaur'));
    options.add(new selectoption('Century','Century'));
    options.add(new selectoption('Century Gothic','Century Gothic'));
    options.add(new selectoption('Century Schoolbook','Century Schoolbook'));
    options.add(new selectoption('Chiller','Chiller'));
    options.add(new selectoption('Colonna MT','Colonna MT'));
    options.add(new selectoption('Comic Sans MS','Comic Sans MS'));
    options.add(new selectoption('Consolas','Consolas'));
    options.add(new selectoption('Constantia','Constantia'));
    options.add(new selectoption('Cooper Black','Cooper Black'));
    options.add(new selectoption('Copperplate Gothic Bold','Copperplate Gothic Bold'));
    options.add(new selectoption('Copperplate Gothic Light','Copperplate Gothic Light'));
    options.add(new selectoption('Corbel','Corbel'));
    options.add(new selectoption('Courier New','Courier New'));
    options.add(new selectoption('Curlz MT','Curlz MT'));
    options.add(new selectoption('Engravers MT','Engravers MT'));
    options.add(new selectoption('Edwardian Script ITC','Edwardian Script ITC'));
    options.add(new selectoption('Elephant','Elephant'));
    options.add(new selectoption('Eras Demi ITC','Eras Demi ITC'));
    options.add(new selectoption('Estrangelo Edessa','Estrangelo Edessa'));
    options.add(new selectoption('Felix Titling','Felix Titling'));
    options.add(new selectoption('Footlight MT Light','Footlight MT Light'));
    options.add(new selectoption('Forte','Forte'));
    options.add(new selectoption('Franklin Gothic Book','Franklin Gothic Book'));
    options.add(new selectoption('Franklin Gothic Demi','Franklin Gothic Demi'));
    options.add(new selectoption('Franklin Gothic Demi Cond','Franklin Gothic Demi Cond'));
    options.add(new selectoption('Franklin Gothic Heavy','Franklin Gothic Heavy'));
    options.add(new selectoption('Franklin Gothic Medium','Franklin Gothic Medium'));
    options.add(new selectoption('Franklin Gothic Medium Cond','Franklin Gothic Medium Cond'));
    options.add(new selectoption('Franklin Gothic Heavy','Franklin Gothic Heavy'));
    options.add(new selectoption('Freestyle Script','Freestyle Script'));
    options.add(new selectoption('French Script MT','French Script MT'));
    options.add(new selectoption('Garamond','Garamond'));
    options.add(new selectoption('Gautami','Gautami'));
    options.add(new selectoption('Georgia','Georgia'));
    options.add(new selectoption('Gigi','Gigi'));
    options.add(new selectoption('Gill Sans MT','Gill Sans MT'));
    options.add(new selectoption('Gill Sans MT Condensed','Gill Sans MT Condensed'));
    options.add(new selectoption('Gill Sans MT Ext Condensed Bold','Gill Sans MT Ext Condensed Bold'));
    options.add(new selectoption('Gill Sans Ultra Bold','Gill Sans Ultra Bold'));
    options.add(new selectoption('Gill Sans Ultra Bold Condensed','Gill Sans Ultra Bold Condensed'));
    options.add(new selectoption('Gloucester MT Extra Condensed','Gloucester MT Extra Condensed'));
    options.add(new selectoption('Goudy Old Style','Goudy Old Style'));
    options.add(new selectoption('Goudy Stout','Goudy Stout'));
                          options.add(new selectoption('Haettenschweiler','Haettenschweiler'));
                          options.add(new selectoption('Harlow Solid Italic','Harlow Solid Italic'));
                          options.add(new selectoption('Harrington','Harrington'));
                          options.add(new selectoption('High Tower Text','High Tower Text'));
                          options.add(new selectoption('Impact','Impact'));
                          options.add(new selectoption('Imprint MT Shadow','Imprint MT Shadow'));
                          options.add(new selectoption('Informal Roman','Informal Roman'));
                          options.add(new selectoption('Jokerman','Jokerman'));
                          options.add(new selectoption('Juice ITC', 'Juice ITC'));
                          options.add(new selectoption('Kartika', 'Kartika'));
                          options.add(new selectoption('Kristen ITC','Kristen ITC'));
                          options.add(new selectoption('Kunstler Script', 'Kunstler Script'));
                          options.add(new selectoption('Latha', 'Latha'));
                          options.add(new selectoption('Lucida Bright', 'Lucida Bright'));
                          options.add(new selectoption('Lucida Calligraphy', 'Lucida Calligraphy'));
                          options.add(new selectoption('Lucida Console', 'Lucida Console'));
                          options.add(new selectoption('Lucida Fax', 'Lucida Fax'));
                          options.add(new selectoption('Lucida Sans Typewriter', 'Lucida Sans Typewriter'));
                          options.add(new selectoption('Magneto','Magneto'));
                          options.add(new selectoption('Maiandra GD','Maiandra GD'));
                          options.add(new selectoption('Mangal','Mangal'));
                          options.add(new selectoption('Marlett','Marlett'));
                          options.add(new selectoption('Matura MT Script Capitals','Matura MT Script Capitals'));
                          options.add(new selectoption('Microsoft Sans Serif','Microsoft Sans Serif'));
                          options.add(new selectoption('Mistral','Mistral'));
                          options.add(new selectoption('Modern No. 20','Modern No. 20'));
                          options.add(new selectoption('Monotype Corsiva','Monotype Corsiva'));
                          options.add(new selectoption('MS Mincho','MS Mincho'));
                          options.add(new selectoption('MS Outlook','MS Outlook'));
                          options.add(new selectoption('MS Reference Sans Serif','MS Reference Sans Serif'));
                          options.add(new selectoption('MS Reference Specialty','MS Reference Specialty'));
                          options.add(new selectoption('MT Extra','MT Extra'));
                          options.add(new selectoption('MV Boli','MV Boli'));
                          options.add(new selectoption('Niagara Engraved','Niagara Engraved'));
                          options.add(new selectoption('Niagara Solid','Niagara Solid'));
                          options.add(new selectoption('OCR A Extended','OCR A Extended'));
                          options.add(new selectoption('Old English Text MT','Old English Text MT'));
                          options.add(new selectoption('Onyx','Onyx'));
                          options.add(new selectoption('Palace Script MT','Palace Script MT'));
                          options.add(new selectoption('Palatino Linotype','Palatino Linotype'));
                          options.add(new selectoption('Papyrus','Papyrus'));
                          options.add(new selectoption('Parchment','Parchment'));
                          options.add(new selectoption('Perpetua','Perpetua'));
                          options.add(new selectoption('Perpetua Titling MT','Perpetua Titling MT'));
                          options.add(new selectoption('Playbill','Playbill'));
                          options.add(new selectoption('Poor Richard','Poor Richard'));
                          options.add(new selectoption('Pristina','Pristina'));
                          options.add(new selectoption('Raavi','Raavi'));
                          options.add(new selectoption('Rage Italic','Rage Italic'));
                          options.add(new selectoption('Rockwell','Rockwell'));
                          options.add(new selectoption('Script MT Bold','Script MT Bold'));
                           options.add(new selectoption('Shruti','Shruti'));
                          options.add(new selectoption('Stencil','Stencil'));
                          options.add(new selectoption('Symbol','Symbol'));
                          options.add(new selectoption('Tahoma','Tahoma'));
                          options.add(new selectoption('Tempus Sans ITC','Tempus Sans ITC'));
                          options.add(new selectoption('Times New Roman','Times New Roman'));
                          options.add(new selectoption('Trebuchet MS','Trebuchet MS'));
                          options.add(new selectoption('Tunga','Tunga'));
                          options.add(new selectoption('Tw Cen MT','Tw Cen MT'));
                          options.add(new selectoption('Tw Cen MT Condensed','Tw Cen MT Condensed'));
                          options.add(new selectoption('Lucida Sans Unicode', 'Lucida Sans Unicode'));
                          options.add(new selectoption('Verdana', 'Verdana'));
                          options.add(new selectoption('Viner Hand ITC','Viner Hand ITC'));
                          options.add(new selectoption('Vivaldi', 'Vivaldi'));
                          options.add(new selectoption('Vladimir Script', 'Vladimir Script'));
                          options.add(new selectoption('Vrinda', 'Vrinda'));
                          options.add(new selectoption('Webdings','Webdings'));
                          options.add(new selectoption('Wide Latin','Wide Latin'));
                          options.add(new selectoption('Wingdings','Wingdings'));
                          options.add(new selectoption('Wingdings 2','Wingdings 2'));
                          options.add(new selectoption('Wingdings 3','Wingdings 3')); 
                         return options;    
    }
    //----------------------------------------Printing att badge---------------------
    public pagereference attbadge()
    {
    pdfbool=false;
    pagereference pg=page.qrcode_badgeofanattendee;
    return pg;

    }
    //-------------------------for Delete All--------------------------------------------
    public pagereference deleteallattendees()
    {
    EventReqStringBool=false;
    emailalert=false;
    if(eventname1 == '' || eventname1 == null)
    {
      EventReqStringBool = true;
      EventReqString = 'Please Select an attendee to Delete';
    }
    else{
    if(Allrecords == true)
    {
     attforexport=new List<Event_Attendee_Mapping__c>(); 
     attforexport=[select id FROM Event_Attendee_Mapping__c WHERE ev_Id__c =: eventselected];
     delete attforexport;
    }
    else
    {
    if(eventname1 != '')
      {
       EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        system.debug('aaaannnnnnnn'+aa);
        }
      attforexport=[select id FROM Event_Attendee_Mapping__c WHERE id in: attid];
      delete attforexport;
    }  
    }
    getevents();
    }
    return null;
    }
    //-------------------------for Esport All--------------------------------------------
    public string escape(string s){
    if(s != null && s.contains(',')){  
    s=s.replaceAll('"','');
    s='"'+s+'"';
    } 
    return s;
    }
    //--------------------------------------------------------------------------
    public pagereference exportAll()
    {
    EventReqStringBool =false;
    attforexport=new List<Event_Attendee_Mapping__c>();
    if(eventname1 == '' || eventname1  == null){
    EventReqStringBool = TRUE;
    EventReqString = 'Please Select an attendee to export';
    }
    else
    {
    if(Allrecords == true)
    {
    EventReqStringBool =false;
    List<Event_Attendee_Mapping__c> attforexport1=new List<Event_Attendee_Mapping__c>();
    eventlist=[select AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
                                 AS_id__r.AS_BusinessEstablishedDate__c,AS_id__r.AS_BusinessRevenue__c,AS_id__r.AS_BusinessTaxId__c,AS_id__r.AS_CellPhone__c,
                                 AS_id__r.AS_Company__c,AS_id__r.AS_DiversityType__c,AS_id__r.AS_Email__c,AS_id__r.AS_FaxNumber__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_Gender__c,
                                 AS_id__r.AS_HomeAddress1__c,AS_id__r.AS_HomeAddress2__c,AS_id__r.AS_HomeCity__c,AS_id__r.AS_HomeCountry__c,AS_id__r.AS_HomePhone__c,
                                 AS_id__r.AS_HomePoBox__c,AS_id__r.AS_HomeState__c,AS_id__r.AS_HomeZipcode__c,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_LastName__c,AS_id__r.AS_NAICSCode1__c,
                                 AS_id__r.AS_NAICSCode2__c,AS_id__r.AS_NAICSCode3__c,AS_id__r.AS_NAICSCode4__c,AS_id__r.AS_NAICSCode5__c,AS_id__r.AS_NumberOfEmployees__c,AS_id__r.AS_Prefix__c,
                                 AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_SecondaryBusinessCategory1__c,AS_id__r.AS_ShippingAddress1__c,AS_id__r.AS_ShippingAddress2__c,
                                 AS_id__r.AS_ShippingCity__c,AS_id__r.AS_ShippingCountry__c,AS_id__r.AS_ShippingPhone__c,AS_id__r.AS_ShippingPoBox__c,AS_id__r.AS_ShippingState__c,
                                 AS_id__r.AS_ShippingZipcode__c,AS_id__r.AS_Suffix__c,AS_id__r.AS_ThroughEventBrite__c,AS_id__r.AS_Title__c,AS_id__r.AS_WebsiteUrl__c,AS_id__r.AS_WorkAddress1__c,
                                 AS_id__r.AS_WorkAddress2__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_WorkCountry__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_WorkPoBox__c,AS_id__r.AS_WorkState__c,AS_id__r.AS_WorkZipCode__c,
                                 As_id__r.Registration_type__c  FROM Event_Attendee_Mapping__c WHERE ev_Id__c =: eventselected];
    }
    else if(allrecords == false)
    {
    if(eventname1 != '')
      {
         EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        system.debug('aaaannnnnnnn'+aa);
        }
     eventlist=[select AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
                                 AS_id__r.AS_BusinessEstablishedDate__c,AS_id__r.AS_BusinessRevenue__c,AS_id__r.AS_BusinessTaxId__c,AS_id__r.AS_CellPhone__c,
                                 AS_id__r.AS_Company__c,AS_id__r.AS_DiversityType__c,AS_id__r.AS_Email__c,AS_id__r.AS_FaxNumber__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_Gender__c,
                                 AS_id__r.AS_HomeAddress1__c,AS_id__r.AS_HomeAddress2__c,AS_id__r.AS_HomeCity__c,AS_id__r.AS_HomeCountry__c,AS_id__r.AS_HomePhone__c,
                                 AS_id__r.AS_HomePoBox__c,AS_id__r.AS_HomeState__c,AS_id__r.AS_HomeZipcode__c,AS_id__r.AS_LastName__c,AS_id__r.AS_NAICSCode1__c,
                                 AS_id__r.AS_NAICSCode2__c,AS_id__r.AS_NAICSCode3__c,AS_id__r.AS_NAICSCode4__c,AS_id__r.AS_NAICSCode5__c,AS_id__r.AS_NumberOfEmployees__c,AS_id__r.AS_Prefix__c,
                                 AS_id__r.AS_PrimaryBusinessCategory1__c,AS_id__r.AS_SecondaryBusinessCategory1__c,AS_id__r.AS_ShippingAddress1__c,AS_id__r.AS_ShippingAddress2__c,
                                 AS_id__r.AS_ShippingCity__c,AS_id__r.AS_ShippingCountry__c,AS_id__r.AS_ShippingPhone__c,AS_id__r.AS_ShippingPoBox__c,AS_id__r.AS_ShippingState__c,
                                 AS_id__r.AS_ShippingZipcode__c,AS_id__r.AS_Suffix__c,AS_id__r.AS_ThroughEventBrite__c,AS_id__r.AS_Title__c,AS_id__r.AS_WebsiteUrl__c,AS_id__r.AS_WorkAddress1__c,
                                 AS_id__r.AS_WorkAddress2__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_WorkCountry__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_WorkPoBox__c,AS_id__r.AS_WorkState__c,AS_id__r.AS_WorkZipCode__c
                                 ,As_id__r.Registration_type__c FROM Event_Attendee_Mapping__c WHERE id in: attid];
    } 
    }
    for(Event_Attendee_Mapping__c s:eventlist){
     s.AS_id__r.AS_BlogUrl__c             = escape(s.AS_id__r.AS_BlogUrl__c);
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
     s.As_id__r.Registration_type__c = escape(s.As_id__r.Registration_type__c);
     attforexport.add(s);
     }
    pagereference pg=new pagereference('/apex/Qrcode_exportAttendees');
       pg.setredirect(false);
       return pg;   
    }
    return null;
}
//-------------------------- Diversity Type -----------------
    Public List<String> Selvalue {get;set;}
    Public Boolean Select0{get;set;}
    Public Boolean Select1{get;set;}
    Public Boolean Select2{get;set;}
    Public Boolean Select3{get;set;}
    Public Boolean Select4{get;set;}
    Public Boolean Select5{get;set;}
    Public Boolean Select6{get;set;}
    Public Boolean Select7{get;set;}
    Public Boolean Select8{get;set;}
    Public Boolean Select9{get;set;}
    Public Boolean Select10{get;set;} 
    Public Boolean Select11{get;set;}
    Public Boolean Select12{get;set;}
    Public Boolean Select13{get;set;}
    Public Boolean Select14{get;set;}   
    Public string selectedvaluesfordiversity{get;set;}
    Public void Saved(){
    Selvalue =new LIST<String> ();
    if(Select0 == TRUE)
    selValue.add('Minority Owned Business Enterprise');
    if(Select1== TRUE)
    selValue.add('Disadvantaged Business Enterprise');
    if(Select2== TRUE)
    selValue.add('Service Disabled Veteran Business Enterprise');
    if(Select3== TRUE)
    selValue.add('Small Business Enterprise');
    if(Select4== TRUE)
    selValue.add('Ability One');
    if(Select5== TRUE)
    selValue.add('Woman Owned Business Enterprise');
    if(Select6== TRUE)
    selValue.add('SBA 8(A) Program');
    if(Select7== TRUE)
    selValue.add('Veteran Owned Business Enterprise');
    if(Select8== TRUE)
    selValue.add('Lesbian Gay Bisexual Transgender Business');
    if(Select9== TRUE)
    selValue.add('Alaskan Native Corporation Owned Firm');
    if(Select10== TRUE)
    selValue.add('Small Disadvantaged Business');
    if(Select11== TRUE)
    selValue.add('Historically Underutilized Business Zone');
    if(Select12== TRUE)
    selValue.add('Disabled Business Enterprise');
    if(Select13== TRUE)
    selValue.add('Historically Black Colleges And Universities');
    if(Select14== TRUE)
    selValue.add('Self-Certified Small Disadvantaged Business');
    selectedvaluesfordiversity= '';
    for(string s: selValue)
        {
         selectedvaluesfordiversity+=s+';';
         newattendee.AS_DiversityType__c = selectedvaluesfordiversity;
        }
    RegTypeList = new List<String>();    
    if(RegValu0 == True)
    RegTypeList.add('Full Convention');
    if(RegValu1 == True)    
    RegTypeList.add('Reception');
    if(RegValu2 == True)    
    RegTypeList.add('Tuesday Pass');
    RegTypevalues= '';
    for(String R: RegTypeList)
    {
    RegTypevalues+=R+',';
    newattendee.Registration_type__c = RegTypevalues;
    }        
    }
    //-----------------------------------------------------------profileUpdateNotification---------------------------------
    public pagereference profileUpdateNotification()
    {
    emailalert=false;
    if(eventname1 != '')
        {
        EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        }  
    list<Event_Attendee_Mapping__c> emailids=[select id,IsPrifileUpdate__c,AS_id__r.id,AS_id__r.AS_FirstName__c, EV_id__r.id, AS_id__r.AS_Email__c
                                                      from Event_Attendee_Mapping__c where id IN : attid];
    list<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    List<Event_Attendee_Mapping__c> ASUpdate=new List<Event_Attendee_Mapping__c>();
    for(Event_Attendee_Mapping__c eid: emailids)
     {   
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setSubject('Update Your Profile!');
     String [] toAddresses = new String[] {eid.AS_id__r.AS_Email__c};
     email.setToAddresses(toAddresses);
     email.setHTMLBody(message='Dear' +'&nbsp;' + eid.AS_id__r.AS_FirstName__c +'<br/>'+''+'<br/>'+ 
             +'Welcome to BoothLeads!'+''+'<br/><br/>'+
          'Please update your profile by clicking on the link at the end of this email.'+'<br/>'+
          'Your updated profile will provide your up to date contact details as well as your business information to the potential customers using boothleads at trade shows.'+'<br/>'+''+'<br/>'+
          'If you have any questions please contact your Event Administrator.'+'<br/>'+''+'<br/>'+
          'Thank you!'+'<br/>'+
          'BoothLeads customer support'+'<br/>'+
         +'<a>'+ 'support@boothleads.com' +'</a>'+''+'<br/>'+''+'<br/>'+''+'<br/>'+
         'Please update your profile by clicking the below link'+'<br/>'+
          'https://boothleads.bleadtest.cs5.force.com/AttendeeSelfRegistration?id='+eid.AS_id__r.id+'&'+'eid='+eid.EV_id__r.id+'<br/>'
          +'Thank you,');                                                                                                                                                      
    emails.add(email); 
    eid.IsPrifileUpdate__c=true;                                                                          
    ASUpdate.add(eid);
    }
    Messaging.SendEmailResult[]  r = Messaging.sendEmail(emails);
   // Messaging.SendEmailResult[]  r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {emails});
    system.debug('-----------------------------------------------------------'+r);
    boolean check=true;
    for(Messaging.SendEmailResult ms: r){
       check=check && ms.isSuccess();
        
        system.debug('1111111111111111'+ check );
        
    }
    if(check == true)
    {
    emailalert=true;
    update(ASUpdate);
    }
    eventselected=eventselected;
    getevents();
    
    }
    else
    {
     EventReqString = 'Please select atleast one attendee to send update notification';
              EventReqStringBool = TRUE;
    }
    return null;
    }   
    //------------------------------------------------------------------desiredTemplate----------------------
    public pagereference desiredTemplate()
    {
       if(selectedvalues == 'Avery 5392 Name badges')
       {
         selfieldvalue='AS_FirstName__c';
        selectedcolor='Black';
        selectedsize='32pt';
        selectedfaceFir='Times New Roman';
        selLvalue='AS_LastName__c';
        selectedcolorS='Black';
        selectedsizeS='24pt';
        selectedfaceSec='Times New Roman';
        selTvalue='AS_Company__c';
        selectedcolorT='Black';
        selectedsizeT='18pt';
        selectedfaceThr='Times New Roman';  
        font=new LIST<selectoption>();
        font.add(new selectoption('select','select'));        
        font.add(new selectoption('32pt','32pt'));
        font.add(new selectoption('30pt','30pt'));
        font.add(new selectoption('24pt','24pt'));
        font.add(new selectoption('18pt','18pt'));
        fieldnames=new LIST<selectoption>();
        fieldnames.add(new selectoption('select','select'));        
        fieldnames.add(new selectoption('AS_LastName__c','LastName'));
        fieldnames.add(new selectoption('AS_FirstName__c','FirstName'));
        fieldnames.add(new selectoption('AS_Title__c','Designation'));
        fieldnames.add(new selectoption('AS_Company__c','Company'));
        totalselectlist=true;
        custombadge1=true;        
        print=false;
       }
       else if(selectedvalues == 'Avery 22806 easy peal square Badges')
       {
         print=false;
       totalselectlist=true;
       custombadge1=false;
        selfieldvalue='AS_FirstName__c,AS_LastName__c';
        selectedcolor='Black';
        selectedsize='20pt';
        selectedfaceFir='Times New Roman';
        selLvalue='AS_Company__c';
        selectedcolorS='Black';
        selectedsizeS='15pt';
        selectedfaceSec='Times New Roman';
       font=new LIST<selectoption>();
        font.add(new selectoption('select','select'));        
        font.add(new selectoption('20pt','20pt'));
        font.add(new selectoption('18pt','18pt'));
        font.add(new selectoption('15pt','15pt'));
        font.add(new selectoption('10pt','10pt'));
        fieldnames=new LIST<selectoption>();  
        fieldnames.add(new selectoption('select','select'));       
        fieldnames.add(new selectoption('AS_FirstName__c,AS_LastName__c','FirstName LastName'));        
        fieldnames.add(new selectoption('AS_Title__c','Designation'));
        fieldnames.add(new selectoption('AS_Company__c','Company'));
       }
       else if(selectedvalues == 'Dymo Label(30856)')
       {
       totalselectlist=false;
       custombadge1=false;
       print=true;
       }
       else if(selectedvalues == 'select')
       {
       totalselectlist=false;
       custombadge1=false;
       print=false;
       }
      return null; 
    }
    //-------------------------------------------------Search----------------------------
    public pagereference search(){
    emailalert=false;
    EventReqStringBool=false;
    TotalAttendees = new LIST<LIST<EventWrapper>>();
    integer recCount=0;
    eventlist = new LIst<Event_Attendee_Mapping__c>();
    string ff = serarchstringvalue+'%';
    eventlist= [select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_ImageUrl__c,
                      AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                      EA_isBadgePrinted__c,AS_id__r.AS_Email__c,IsPrifileUpdate__c
                      from Event_Attendee_Mapping__c where EV_id__r.id =: eventSelected and (AS_id__r.AS_FirstName__c like :ff+'%' OR AS_id__r.AS_LastName__c like :ff+'%' OR  AS_id__r.AS_Company__c like :ff+'%' OR AS_id__r.AS_Email__c like :ff+'%' OR AS_id__r.AS_CellPhone__c   like :'%'+ff+'%') order by AS_id__r.AS_LastName__c];                                                                        
     ew=new List<eventwrapper>();
    for(Event_Attendee_Mapping__c s:eventlist)
  {
      s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
      s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
      s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
      s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
      s.AS_id__r.AS_Company__c = escapeSpecialCharacters(s.AS_id__r.AS_Company__c);
       recCount++;
       ew.add(new eventwrapper(s));
       if(recCount==1000){
       TotalAttendees.add(ew);
       ew = new LIST<EventWrapper>();
       recCount=0;
       }
      
    }
    if(recCount !=0)
    TotalAttendees.add(ew);
    return null;
    } 
    
    
    
  
  
  public pagereference status()
  {  
   system.debug('parameter'+eventname1);   
    string[] ss1=eventname1.split(',');
    
    system.debug('============='+ss1[1] +'  '+ss1[0]);
    string state1=ss1[1];
    checkedbadge1= new List<Event_Attendee_Mapping__c>();
    List<Event_Attendee_Mapping__c> changed1=new List<Event_Attendee_Mapping__c>{};
    checkedbadge1=[select id, EA_isBadgePrinted__c from Event_Attendee_Mapping__c where id =:ss1[0]];
    for(Event_Attendee_Mapping__c dd1:checkedbadge1)
    {
    if(state1 == 'Not Printed'){
    dd1.EA_isBadgePrinted__c=false;
    }else{
    dd1.EA_isBadgePrinted__c=true;
    }
    changed1.add(dd1);
    }
    update changed1;
    getEvents();
   return null;
  }
  
  public pagereference prostatus()
  {  
   system.debug('parameter1'+eventname1);   
    string[] ss=eventname1.split(',');
    
    system.debug('============='+ss[1] +'  '+ss[0]);
    string state=ss[1];
    checkedbadge2= new List<Event_Attendee_Mapping__c>();
    List<Event_Attendee_Mapping__c> changed2=new List<Event_Attendee_Mapping__c>{};
    checkedbadge2=[select id,IsPrifileUpdate__c from Event_Attendee_Mapping__c where id =:ss[0]];
    for(Event_Attendee_Mapping__c dd2:checkedbadge2)
    {
    if(state == 'Send'){
    dd2.IsPrifileUpdate__c=false;
    }else{
    dd2.IsPrifileUpdate__c=true;
    }
    changed2.add(dd2);
    }
    update changed2;
    getEvents();
   return null;
  }
    
 }