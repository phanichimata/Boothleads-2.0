public with sharing class SampleExtjsTreeView {

Public Boolean RegValu0{get;set;}
Public Boolean RegValu1{get;set;}    
Public Boolean RegValu2{get;set;}
Public List<String> RegTypeList{get;set;}
Public String RegTypeValues{get;set;}

   
Public Boolean DiversityTypePopup{get;set;}
//Public Boolean DiversityTypePopup{get;set;}
Public void OpenPopUp(){
DiversityTypePopup = true;
}
    
Public Void EditOpenPoUp(){

}
Public Id LoginUserId{get;set;}

/**Public SampleExtjsTreeView(){
UpdateAddtendee();
LoginUserId = Userinfo.getUserId();
LoginUserId = '005O0000000ZJas';
getEventsBoothsAdms();
}*/

    class InnerTree
    {   
    public  User_Profile_Event__c  UPEC{get;set;}
    Public id UPE{get;set;}  
     
    Public InnerTree(id UserProfileEvent)
    {
    UPE =  UserProfileEvent;    
   }    
    Public InnerTree(User_Profile_Event__c BoothView){
    UPEC = BoothView;
    }
 }
    
    Public List<InnerTree> ForTreeView{get;set;}
    Public List<InnerTree> ForBooths{get;set;}
    Public List<User_Profile_Event__c> AllRecords{get;set;}
    
    Public void getEventsBoothsAdms(){
    
    ForTreeView = new List<InnerTree>();
    
    ForBooths = new List<InnerTree>();
   //List<InnerTree> innertotal=new  List<InnerTree>();
     AllRecords = [select id,Ev_Id__c,BT_Id__c,BoothAdmin_Id__c from User_Profile_Event__c
                                               where User_Id__c =: LoginUserId   ];
                                            
     system.debug('========== @@@@@@@@ Getting all record from Junction Object @@@@@@@@@ =========='+AllRecords ); 
     for(User_Profile_Event__c UserProfile: AllRecords)
     {
     ForTreeView.add(new innerTree(UserProfile.Ev_Id__c));
    // innertotal.add(new innerTree(UserProfile)); 
        
    }
     //for(User_Profile_Event__c UserProfile: AllRecords){
     
      //   for(innerTree Ev: ForTreeView){
         
      //   system.debug('================== ::::::::::::::::'+Ev);
         
     //   if(UserProfile.Ev_Id__c == Ev){
         
     //   ForBooths.add(new innerTree(UserProfile.BT_Id__c)); 
         
     //  }
    
         
     // }
  //  }                                         
    
   }
    
    Public  AttendeeSummary__c AddAttendeeBeta{get;set;}
    
    Public void Saved(){
    
    Selvalue =new LIST<String> ();
    if(Select0 == TRUE)
    selValue.add('Minority Owned Business Enterprise');
    if(Select1== TRUE)
    selValue.add('DBE');
    if(Select2== TRUE)
    selValue.add('SDVBE');
    if(Select3== TRUE)
    selValue.add('SBE');
    if(Select4== TRUE)
    selValue.add('AO');
    if(Select5== TRUE)
    selValue.add('WOBE');
    if(Select6== TRUE)
    selValue.add('SBA 8(A) Program');
    if(Select7== TRUE)
    selValue.add('VOBE');
    if(Select8== TRUE)
    selValue.add('LGBTB');
    if(Select9== TRUE)
    selValue.add('ANCOF');
    if(Select10== TRUE)
    selValue.add('SDB');
    if(Select11== TRUE)
    selValue.add('HUBZ');
    if(Select12== TRUE)
    selValue.add('Disabled Business Enterprise');
    if(Select13== TRUE)
    selValue.add('HBCAU');
    if(Select14== TRUE)
    selValue.add('SCSDB');
    
    
    selectedvalues = '';
    for(string s: selValue)
        {
            selectedvalues+=s+';';
    newattendee.AS_DiversityType__c = selectedvalues;
    
        }
        
    RegTypeList = new List<String>();    
    if(RegValu0 == True)
    RegTypeList.add('Full Convention');
    if(RegValu1 == True)    
    RegTypeList.add('Tuesday Pass');
    if(RegValu2 == True)    
    RegTypeList.add('Reception');
    
     RegTypevalues= '';
    for(String R: RegTypeList)
    {
    RegTypevalues+=R+',';
    newattendee.Registration_type__c = RegTypevalues;
    }   
    
    system.debug('=============== Inserting Record================'+AddAttendee);  
  }
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
Public string selectedvalues{get;set;}

     Public void UpdateAddtendee(){
     
      AttendeeSummary__c  AttendeeList = [select id,AS_DiversityType__c,Registration_type__c  from AttendeeSummary__c where AS_Email__c = 'shruthi.raghula@gmail.com'];
      system.debug('==================== Get list of Attendees ============'+AttendeeList );
      
if(AttendeeList.AS_DiversityType__c.contains('MOBE'))
Select0 = True;
if(AttendeeList.AS_DiversityType__c.contains('DBE'))
Select1 = True;
if(AttendeeList.AS_DiversityType__c.contains('SDVBE'))
Select2 = True;
if(AttendeeList.AS_DiversityType__c.contains('SBE'))
Select3 = True;
if(AttendeeList.AS_DiversityType__c.contains('AO'))
Select4 = True;
if(AttendeeList.AS_DiversityType__c.contains('WOBE'))
Select5 = True;
if(AttendeeList.AS_DiversityType__c.contains('SBA 8(A) Program'))
Select6 = True;
if(AttendeeList.AS_DiversityType__c.contains('VOBE'))
Select7 = True;
if(AttendeeList.AS_DiversityType__c.contains('LGBTB'))
Select8 = True;
if(AttendeeList.AS_DiversityType__c.contains('ANCOF'))
Select9 = True;
if(AttendeeList.AS_DiversityType__c.contains('SDB'))
Select10 = True;
if(AttendeeList.AS_DiversityType__c.contains('HUBZ'))
Select11 = True;
if(AttendeeList.AS_DiversityType__c.contains('Disabled Business Enterprise'))
Select12 = True;
if(AttendeeList.AS_DiversityType__c.contains('HBCAU'))
Select13 = True;
if(AttendeeList.AS_DiversityType__c.contains('SCSDB'))
Select14 = True;

if(AttendeeList.Registration_type__c.contains('Full Convention'))
RegValu0 = True;
     } 
     public list<InnerForBadge> innerBadgeeven{get;set;}
    public list<InnerForBadge> innerBadgeodd{get;set;}
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
   // public string selvalue{get;set;}
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
    public string  serarchstringvalue{get;set;}
    public string EventReqString1{get;set;}
   // public String selectedvalues{get; set;}
    public Boolean EventReqStringbool{get; set;}
    public String EventReqString{get; set;}
    public Boolean foundHistoryBool{get; set;}
    public List<Event_Attendee_Mapping__c> cus12 {get;set;}
    public list<list<EventWrapper>> TotalAttendees { get; set; }
    public list<Event_Attendee_Mapping__c> newstr{get;set;}
    public list<Event_Attendee_Mapping__c> attendees1234{get;set;}
    public list<AttendeeSummary__c> event1234{get;set;}
    public AttendeeSummary__c Event{get;set;}
    public list<eventwrapper> ew {get;set;}
    public id userid{get;set;}
    public Boolean updateAttendeeSettingBool{get; set;}
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
    public attachment attach{get;set;}
    public string attendeeName{get;set;}
    public Blob attendeeImage { get; set; }  
    public LIST<selectoption> states{get; set;}
    public String eventSelected { get; set; }
    public List<id> attid{get;set;} 
    public list<Event__c> eventattendeelist{get;set;}
    public list<Event_Attendee_Mapping__c> eventlist{get;set;}
    public list<Event_Attendee_Mapping__c> attendeeslist{get;set;}
    public LIST<LIST<Event_Attendee_Mapping__c>> LeftValues{get; set;}
    public LIST<LIST<Event_Attendee_Mapping__c>> RightValues{get; set;} 
    public LIST<LIST<Event_Attendee_Mapping__c>> MiddleValues{get; set;}
    public List<Event_Attendee_Mapping__c> str{get;set;}
    public List<Event_Attendee_Mapping__c> newstr1{get;set;}
    public List<Event_Attendee_Mapping__c> newstr2{get;set;}
    public Event_Attendee_Mapping__c event1{get;set;}
    public List<Event_Attendee_Mapping__c> checkedbadge{get;set;} 
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
    
    //=========
    public LIST<selectoption> Allevents{get; set;}
//--------------------------------------------------------VARIABLE DECLARATION------------------------------------
//-------------------------------------------------------CONSTRUCTOR---------------------------------
    public SampleExtjsTreeView()
    {    
         
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
    //system.debug('cccccccccccccccccccccccccccccccccc'+attendeesetting.age);
    ReqFields=true;
    getvalues();
    getevents();
     
     // By Mallik For Data Import History Display 
     
        Integer countOfImport = [SELECT count() FROM DataImport_SavePoint__c WHERE User_id__c =: UserInfo.getUserId()]; 
        if(countOfImport > 0)
            foundHistoryBool = TRUE;
      
      // ------------------ BY Mallik -------------------------
       
       
      
      
            
    }
//--------------------------------------------------------END OF CONSTRUCTOR----------------------------
//---------------------------------------------------------Getting events into picklist-----------------
   public document mydoc{get;set;}
   Public Document getmyimage()
    {
        mydoc= new Document();
        return mydoc;
    }

   public void getvalues()
   {
   
       LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
       string ss = userInfo.getUserName();
       system.debug('ssssssssssssssssssssssssssssssssssssssssssss'+ss);
       Items = new LIST<selectoption>();
       //String ss = 'mallikarjunan@globalnest.com';
       
       events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c  FROM User_Profile_Event__c WHERE User_id__r.UserName =: ss ORDER BY CreatedDate ASC];
     
       if(!events.isEmpty())
       {
          
          Allevents = new LIST<selectoption>();
       
           Items.add(new SelectOption('select','select'));
           for(User_Profile_Event__c Even: events)
           {
               Allevents.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
               Items.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
               eventSelected =Even.id;
           }
       }
            
   }
    
//---------------------------------------------------------------END OF EVENTS--------------------------   
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
   else
   {
   fbool=TRUE;
   EventReqString1 = 'Please Select a Template';
              EventReqStringBool = TRUE;
            
   }
        return null;
    }

    public List<selectoption> getfields()
      { 
          fbool=true;
          List<selectoption> Option = new List<selectoption>();
          Option.add(new selectoption('Select','Select'));
          Option.add(new selectoption('Avery 5392 Name badges','Avery 5392 Name badges'));
        
          Option.add(new selectoption('Avery 22806 easy peal square Badges','Avery 22806 easy peal square Badges'));
          return option;
       } 
//---------------------------------------------------------------------------------------------SELECT  TYPE OF BADGE-----
//--------------------------------------------------------------------------------------------------
    public List<Event_Attendee_Mapping__c> getevents()
    {
     EventReqStringBool=false;    
    TotalAttendees=new list<list<eventwrapper>>();
    system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'+eventselected);
    eventlist=new list<Event_Attendee_Mapping__c>();
    if(eventSelected != null || eventSelected != '')
    {
    integer recCount=0;

    eventlist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                              EA_isBadgePrinted__c,AS_id__r.AS_Email__c
                         from Event_Attendee_Mapping__c where EV_id__r.id =: eventSelected];
                              

     ew=new List<eventwrapper>();
     for(Event_Attendee_Mapping__c s:eventlist)
     {      
  
         s.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.AS_id__r.AS_FirstName__c);
         s.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.AS_id__r.AS_LastName__c);
         s.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.AS_id__r.AS_CellPhone__c);
         s.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.AS_id__r.AS_Email__c);
         s.AS_id__r.AS_Company__c = escapeSpecialCharacters(s.AS_id__r.AS_Company__c);
         recCount++;
         ew.add(new eventwrapper(s));
         system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'+ew);
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
//---------------------------------------------------------------------------------------------END OF GET EVENTS METHOD----------------       
//-------------------------------------------------------------------------------------------ADD ATTENDEE METHOD---------       
    public void CreateAttendee() {
                 
       system.debug('cccccccccccccccccccccccccccccccccc'+eventSelected );
        EventReqStringBool=false;
        if(eventSelected == 'select')
        {
          system.debug('cccccccccccccccccccccccccccccccccc1111111111'+eventSelected );
              EventReqString = 'Please Creat an Event';
              EventReqStringBool = TRUE;
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
    Database.UpsertResult myAttendeeSaveResult = Database.upsert(newAttendee ,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField(), false);
        system.debug('6666666666666666666666666666666'+myAttendeeSaveResult );
        
        if(myAttendeeSaveResult.isSuccess() )
        {
                if(myAttendeeSaveResult.iscreated())
                {
                 attmap = new Event_Attendee_Mapping__c();
                 attmap.AS_id__c = myAttendeeSaveResult.getId();
                 attmap.Ev_id__c = eventSelected;
                 Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);
                 addattendee=false;
                 attendeeevent=myAttendeeJunction.id;
                 
                  if(checked==true)
                  {
                   eventatt=[select id,As_id__r.AS_FirstName__c,As_id__r.AS_LastName__c,As_id__r.AS_Company__c,EV_ID__C,
                                                   EA_AttendeeBarcode__c from Event_Attendee_Mapping__c where id =:attendeeevent];
                 
                     addattendee=false;
                     pdfbool=true; 
                }
                 }
                 else
                 {
                
                  integer ev_att_Jun=[select count() from Event_Attendee_Mapping__c where AS_id__c =: myAttendeeSaveResult.getId() and
                                                                                            Ev_id__c   =: eventSelected];
                  if(ev_att_Jun > 0)
                  {
                  //code for display duplicate
                  EventReqStringBool2=true;
                  EventReqString='Attendee is Already exist';
                  
                  system.debug('1111111111111111111111111111');
                  }else{
                  
                    attmap = new Event_Attendee_Mapping__c();
                    attmap.As_id__c = myAttendeeSaveResult.getId();
                    attmap.Ev_id__c = eventSelected;

                  system.debug('22222222222222222222222222222222222222');
                                
                    Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);
                   attendeeevent=myAttendeeJunction.id;
                   addattendee=false;
                  if(checked==true)
                  {
                 eventatt=[select id,As_id__r.AS_FirstName__c,As_id__r.AS_LastName__c,As_id__r.AS_Company__c,
                                                   EA_AttendeeBarcode__c from Event_Attendee_Mapping__c where id =:attendeeevent];
                 
                     
                pdfbool=true; 
                  }
                }
                 
                 
                }
                
        
        
        //insert newAttendee;
                  
    }
     if(attendeeImage != null){
          document mydoc = new document();
           mydoc.folderid = UserInfo.getUserId();
           mydoc.ispublic=true;
            insert mydoc;
    }  
          
    getevents();
    }
    
//------------------------------------------------------------------------------------------------------------
    public   Event_Attendee_Mapping__c eventatt{get;set;}
   public void atmprec()
   {
   eventatt=new Event_Attendee_Mapping__c();
   Event_Attendee_Mapping__c eventatt=[select id,As_id__r.AS_FirstName__c,As_id__r.AS_LastName__c,As_id__r.AS_Company__c,
                                                   EA_AttendeeBarcode__c from Event_Attendee_Mapping__c where id=:attmap.id];
   Pagereference pg = new Pagereference('/apex/qrcode_badgeofanattendee');
            pg.setRedirect(false);
   
   system.debug('---------------------------------'+eventatt.As_id__r.AS_FirstName__c);
   }   
       
       
//---------------------------------------------------------------------END OF SAVE ATTENDEE-----------------------------       
        
    public void UpdateAttendeeSetting() {
    
         updateAttendeeSettingBool = FALSE;
          
        String  selectedAttendeeFields = 'AS_FirstName__c,';
        if(attendeeSetting.comp)
        selectedAttendeeFields += 'AS_Company__c,';
        if(attendeeSetting.Prefix)
        selectedAttendeeFields += 'AS_Prefix__c,';
        if(attendeeSetting.sufix)
        selectedAttendeeFields += 'AS_Suffix__c,';
        if(attendeeSetting.Degi)
        selectedAttendeeFields += 'AS_Title__c,';
        if(attendeeSetting.mobile)
        selectedAttendeeFields += 'AS_CellPhone__c,';
        if(attendeeSetting.age)
        selectedAttendeeFields += 'AS_Age__c,';
        if(attendeeSetting.gen)
        selectedAttendeeFields += 'AS_Gender__c,';
        if(attendeeSetting.dob)
        selectedAttendeeFields += 'AS_BirthDate__c,';
        if(attendeeSetting.homeinfo)
        selectedAttendeeFields += 'AS_HomeAddress1__c,';
        if(attendeeSetting.Shippinginfo)
        selectedAttendeeFields += 'AS_ShippingAddress1__c,';
        if(attendeeSetting.workinfo)
        selectedAttendeeFields += 'AS_WorkAddress1__c,';
        if(attendeeSetting.NAICSCode1)
        selectedAttendeeFields += 'AS_NAICSCode1__c,';
        if(attendeeSetting.NAICSCode2)
        selectedAttendeeFields += 'AS_NAICSCode2__c,';
        if(attendeeSetting.NAICSCode3)
        selectedAttendeeFields += 'AS_NAICSCode3__c,';
        if(attendeeSetting.NAICSCode4)
        selectedAttendeeFields += 'AS_NAICSCode4__c,';
        if(attendeeSetting.NAICSCode5)
        selectedAttendeeFields += 'AS_NAICSCode5__c,';
        if(attendeeSetting.PBC)
        selectedAttendeeFields += 'AS_PrimaryBusinessCategory__c,';
        if(attendeeSetting.SBC)
        selectedAttendeeFields += 'AS_SecondaryBusinessCategory__c,';
        if(attendeeSetting.NOEmp)
        selectedAttendeeFields += 'AS_NumberOfEmployees__c,';
        if(attendeeSetting.BEDate)
        selectedAttendeeFields += 'AS_BusinessEstablishedDate__c,';
        if(attendeeSetting.BRev)
        selectedAttendeeFields += 'AS_BusinessRevenue__c,';
        if(attendeeSetting.BTaxID)
        selectedAttendeeFields += 'AS_BusinessTaxId__c,';
        if(attendeeSetting.BDN)
        selectedAttendeeFields += 'AS_BusinessDunsNumber__c,';
        if(attendeeSetting.webUrl)
        selectedAttendeeFields += 'AS_WebsiteUrl__c,';
        if(attendeeSetting.blogURL)
        selectedAttendeeFields += 'AS_BlogUrl__c,';
        if(attendeeSetting.DT)
        selectedAttendeeFields += 'AS_DiversityType__c,';
        if(attendeeSetting.BDesc)
        selectedAttendeeFields += 'AS_BusinessDescription__c,';
        if(attendeeSetting.AttendeePic)
        selectedAttendeeFields += 'AttendeePic,';
        
        attendeeSetting.settingsforAtt.EV_Fields__c = selectedAttendeeFields.substring(0, selectedAttendeeFields.lastIndexOf(','));
        
    //-------------------------*************   Ending of Include Fields **************---------------------------------    
    //-------------------------*************   start of REQUIRED Fields **************---------------------------------    
        String  selectedAttendeeReqFields = 'AS_FirstName__c,';
        if(attendeeSetting.Reqcomp)
        selectedAttendeeReqFields += 'AS_Company__c,';
        if(attendeeSetting.ReqPrefix)
        selectedAttendeeReqFields += 'AS_Prefix__c,';
        if(attendeeSetting.Reqsufix)
        selectedAttendeeReqFields += 'AS_Suffix__c,';
        if(attendeeSetting.ReqDegi)
        selectedAttendeeReqFields += 'AS_Title__c,';
        if(attendeeSetting.Reqmobile)
        selectedAttendeeReqFields += 'AS_CellPhone__c,';
        if(attendeeSetting.Reqage)
        selectedAttendeeReqFields += 'AS_Age__c,';
        if(attendeeSetting.Reqgen)
        selectedAttendeeReqFields += 'AS_Gender__c,';
        if(attendeeSetting.Reqdob)
        selectedAttendeeReqFields += 'AS_BirthDate__c,';
        if(attendeeSetting.Reqhomeinfo)
        selectedAttendeeReqFields += 'AS_HomeAddress1__c,';
        if(attendeeSetting.ReqShippinginfo)
        selectedAttendeeReqFields += 'AS_ShippingAddress1__c,';
        if(attendeeSetting.Reqworkinfo)
        selectedAttendeeReqFields += 'AS_WorkAddress1__c,';
        if(attendeeSetting.ReqNAICSCode1)
        selectedAttendeeReqFields += 'AS_NAICSCode1__c,';
        if(attendeeSetting.ReqNAICSCode2)
        selectedAttendeeReqFields += 'AS_NAICSCode2__c,';
        if(attendeeSetting.ReqNAICSCode3)
        selectedAttendeeReqFields += 'AS_NAICSCode3__c,';
        if(attendeeSetting.ReqNAICSCode4)
        selectedAttendeeReqFields += 'AS_NAICSCode4__c,';
        if(attendeeSetting.ReqNAICSCode5)
        selectedAttendeeReqFields += 'AS_NAICSCode5__c,';
        if(attendeeSetting.ReqPBC)
        selectedAttendeeReqFields += 'AS_PrimaryBusinessCategory__c,';
        if(attendeeSetting.ReqSBC)
        selectedAttendeeReqFields += 'AS_SecondaryBusinessCategory__c,';
        if(attendeeSetting.ReqNOEmp)
        selectedAttendeeReqFields += 'AS_NumberOfEmployees__c,';
        if(attendeeSetting.ReqBEDate)
        selectedAttendeeReqFields += 'AS_BusinessEstablishedDate__c,';
        if(attendeeSetting.ReqBRev)
        selectedAttendeeReqFields += 'AS_BusinessRevenue__c,';
        if(attendeeSetting.ReqBTaxID)
        selectedAttendeeReqFields += 'AS_BusinessTaxId__c,';
        if(attendeeSetting.ReqBDN)
        selectedAttendeeReqFields += 'AS_BusinessDunsNumber__c,';
        if(attendeeSetting.ReqwebUrl)
        selectedAttendeeReqFields += 'AS_WebsiteUrl__c,';
        if(attendeeSetting.ReqblogURL)
        selectedAttendeeReqFields += 'AS_BlogUrl__c,';
        if(attendeeSetting.ReqDT)
        selectedAttendeeReqFields += 'AS_DiversityType__c,';
        if(attendeeSetting.ReqBDesc)
        selectedAttendeeReqFields += 'AS_BusinessDescription__c,';
        if(attendeeSetting.ReqAttendeePic)
        selectedAttendeeReqFields += 'AttendeePic,';
        
        attendeeSetting.settingsforAtt.EV_Req_Fields__c = selectedAttendeeReqFields.substring(0, selectedAttendeeReqFields.lastIndexOf(','));
        
   //--------------------------*************   End of REQUIRED Fields  ***************---------------------------------      
        
         upsert attendeeSetting.settingsforAtt;
        
    }


    public PageReference deleteDataImportHistory() {
        
        
        //system.debug('555555555555555555555555'+ recordImage );
        
        DataImport_SavePoint__c dataImp=[select id, DS_ImportedId__c FROM DataImport_SavePoint__c where id=: ApexPages.currentpage().getparameters().get('deleteDataImport')]; 
       
        LIST<ID> importids = dataImp.DS_ImportedId__c.split(','); 
        
        system.debug('66666666666666666666666' + importids );    
        
        LIST<Event_Attendee_Mapping__c> eamap = [SELECT id FROM Event_Attendee_Mapping__c WHERE id IN: importids ];
        
       LIST<Database.DeleteResult> deljunction = Database.delete(eamap, false);
        
       Database.DeleteResult delmainrec= DataBase.delete(dataImp, false);
        
        system.debug('7777777777777777777777777'+ deljunction );
        
        system.debug('8888888888888888888888888'+ delmainrec);
        DataImportBool = FALSE;
        return null;
    }


    public PageReference UpdateAttendee() {
    
        try{
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
       // editAttend.Attendee_BirthDate__c =datepic(EditDate);
        Event.AS_BirthDate__c = Event.AS_BirthDate__c;
        Event.AS_HomeAddress1__c =Event.AS_HomeAddress1__c ;
        Event.AS_BusinessDescription__c =Event.AS_BusinessDescription__c ;
      // editAttend.Attendee_BusineesEstablished_Date1__c =datepic(BEDate);
        
        
        Event.AS_BusinessEstablishedDate__c =Event.AS_BusinessEstablishedDate__c;
        Event.AS_BusinessDunsNumber__c =Event.AS_BusinessDunsNumber__c;
        Event.AS_NumberOfEmployees__c =Event.AS_NumberOfEmployees__c ;
        Event.AS_BusinessRevenue__c =Event.AS_BusinessRevenue__c ;
        Event.AS_BusinessTaxId__c =Event.AS_BusinessTaxId__c ;
        Event.AS_PrimaryBusinessCategory__c =Event.AS_PrimaryBusinessCategory__c ;
        Event.AS_SecondaryBusinessCategory__c =Event.AS_SecondaryBusinessCategory__c ;
        Event.AS_WebsiteURL__c =Event.AS_WebsiteURL__c ;
        Event.AS_ShippingAddress1__c =Event.AS_ShippingAddress1__c ;
        Event.AS_ShippingPOBox__c =Event.AS_ShippingPOBox__c ;
        Event.AS_BlogURL__c =Event.AS_BlogURL__c ;
        Event.AS_WorkAddress1__c =Event.As_WorkAddress1__c ;
        Event.AS_WorkPhone__c =Event.AS_WorkPhone__c ;
        Event.AS_WorkPOBox__c =Event.AS_WorkPOBox__c ;
        Event.AS_DiversityType__c =Event.AS_DiversityType__c ;
        
        try{
            Event.AS_NAICSCode1__c =Integer.valueOf(NAICS1Mod);
            } catch(Exception e){}
         try{   
        Event.AS_NAICSCode2__c =Integer.valueOf(NAICS2Mod);
         } catch(Exception e){}
        try{
        Event.AS_NAICSCode3__c =Integer.valueOf(NAICS3Mod);
        } catch(Exception e){}
        Event.AS_shippingCity__c =Event.AS_shippingCity__c;
        Event.AS_shippingState__c = Event.AS_shippingState__c; 
        Event.AS_WorkAddress1__c = Event.AS_WorkAddress1__c;
        Event.AS_Workcity__c = Event.AS_Workcity__c;
        Event.AS_WorkState__c = Event.AS_WorkState__c;
        Event.AS_HomeAddress1__c = Event.AS_HomeAddress1__c;
        Event.AS_HomeCity__c =Event.AS_HomeCity__c;
        Event.AS_HomePOBox__c =Event.AS_HomePOBox__c;
        Event.AS_HomeState__c =Event.AS_HomeState__c;
        
        Selvalue =new LIST<String> ();
        if(Select0 == TRUE)
        selValue.add('MOBE');
        if(Select1== TRUE)
        selValue.add('DBE');
        if(Select2== TRUE)
        selValue.add('SDVBE');
        if(Select3== TRUE)
        selValue.add('SBE');
        if(Select4== TRUE)
        selValue.add('AO');
        if(Select5== TRUE)
        selValue.add('WOBE');
        if(Select6== TRUE)
        selValue.add('SBA 8(A) Program');
        if(Select7== TRUE)
        selValue.add('VOBE');
        if(Select8== TRUE)
        selValue.add('LGBTB');
        if(Select9== TRUE)
        selValue.add('ANCOF');
        if(Select10== TRUE)
        selValue.add('SDB');
        if(Select11== TRUE)
        selValue.add('HUBZ');
        if(Select12== TRUE)
        selValue.add('Disabled Business Enterprise');
        if(Select13== TRUE)
        selValue.add('HBCAU');
        if(Select14== TRUE)
        selValue.add('SCSDB');
        selectedvalues = '';
        for(string s: selValue)
        {
            selectedvalues+=s+';';
            Event.AS_DiversityType__c = selectedvalues;
        }
        
        
        
        update Event ;
      system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'+eventIdVar);
       if(eventIdVar != null && attendeeImageEdit != null){
         attachment a = new attachment ();
         a=[select id,parentid from Attachment where Id=:eventIdVar];
       system.debug('valueeeeeeeeeeeeeee of aaaaaaaaaaaaaaaaaaaaaaa'+a);
        delete a;
       }
    system.debug('valueeeeeeeeeeeeeee of attendeeImageEdit '+attendeeImageEdit );
   
    if(attendeeImageEdit != null){
     System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+ attendeeImageEdit );
        attachment b = new attachment();      
        b.Name =attendeeNameAfterEdit;
        b.Body =attendeeImageEdit;
        b.parentId =Event.id;
       
       system.debug('valueeeeeeeeeeeeeee of bbbbbbbbbbbbbbbbbbbbb'+b);
          insert b;
    
    }
     EventEditpopup= FALSE;
     Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_Attendees');
     pg.setRedirect(true);
     return pg;
    }
    catch(Exception e){ApexPages.addMessages(e);}
    return null; 
      
     
    }


    public PageReference Cancel() {
    duplicateAttendeeBool=false;
    fbool=false;
    pdfbool=false;
    EventEditpopup=false;
    addattendee1=false;
     addattendee=false;
     updateAttendeeSettingBool= false; 
     DataImportBool = false;
    pagereference pf=new pagereference('/apex/Qrcode_Eventadmin_Attendees');
        return pf;
    }


    


     public List<selectoption> getselect()
    {
        List<selectoption> Option = new List<selectoption>();
        Option.add(new selectoption('Male','Male'));
        Option.add(new selectoption('Female','Female'));
        return option;
    }

    


    public PageReference backaction() {
    addattendee1 = FALSE;
    pagereference pg = new pagereference('/apex/Qrcode_Eventadmin_Attendees');
        pg.setRedirect(true);
        return pg; 
    }

//----------------------------------------------------------------------FOR 5392 LABEL----------------------------------------
    public void PrintBadge() {
    
        EventReqStringBool =false;
        if(TotalAttendees.size()>0)
        {
        system.debug('***printBadge***'+eventname1);
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
        attendeeslist=new List<Event_Attendee_Mapping__c>();
         attendeeslist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                                EA_isBadgePrinted__c       
                              from Event_Attendee_Mapping__c where  id in:attid];
       
        
        newstr=new List<Event_Attendee_Mapping__c>();
        newstr1=new List<Event_Attendee_Mapping__c>();
               
      integer i=0;
     for(Event_Attendee_Mapping__c eww: attendeeslist)
    {
      if(math.mod(i,2)==0)
      {
         newstr.add(eww);
      }
      else
      {
        newstr1.add(eww);
      }
       i++;
    }
    
    
     LIST<Event_Attendee_Mapping__c> FLRec = new LIST<Event_Attendee_Mapping__c>();
     LeftValues = new LIST<LIST<Event_Attendee_Mapping__c>>();
     integer Lpagecount=0;
    for(Event_Attendee_Mapping__c l: newstr)
    {
    
        FLRec.add(l);
        Lpagecount++;
     if(Lpagecount==3)
     {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<Event_Attendee_Mapping__c>();
     }
    }
      if(FLRec.size() != 0)
      {
        
       LeftValues.add(FLRec);
      }
    system.debug('leftttttttttttttttttt'+LeftValues);
      LIST<Event_Attendee_Mapping__c> SLRec = new LIST<Event_Attendee_Mapping__c>();
      RightValues = new LIST<LIST<Event_Attendee_Mapping__c>>();
      integer Rpagecount=0;
     for(Event_Attendee_Mapping__c l: newstr1)
      {
    
        SLRec.add(l);
        Rpagecount++;
        if(Rpagecount==3)
      {
        RightValues.add(SLRec);
        Rpagecount=0;
        SLRec = new LIST<Event_Attendee_Mapping__c>();
      }
    
      }
     if(SLRec.size() != 0)
        {
            RightValues.add(SLRec);
        }
     system.debug('leftttttttttttttttttt'+RightValues);

     
      try
       {
          attach=[select parentid,name from attachment where parentid =:eventSelected];
         logo=true;

      }catch(exception e)
      {
        logo=false;

      }
        addattendee1 = TRUE;
        event1= new Event_Attendee_Mapping__c();
        printbadge1();
        }
        else
        {
        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please select atleast one checkbox'));
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
        system.debug('***printBadge***'+eventname1);
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
        attendeeslist=new List<Event_Attendee_Mapping__c>();
        attendeeslist=[select AS_id__r.AS_LastName__c,AS_id__r.AS_FirstName__c,
                              AS_id__r.AS_Company__c,EA_AttendeeBarcode__c,AS_id__r.AS_CellPhone__c,
                                EA_isBadgePrinted__c       
                              from Event_Attendee_Mapping__c where  id in:attid];
        
        
        newstr=new List<Event_Attendee_Mapping__c>();
        newstr1=new List<Event_Attendee_Mapping__c>();
        newstr2=new List<Event_Attendee_Mapping__c>();      
      integer i=0;
     for(Event_Attendee_Mapping__c eww: attendeeslist)
    {
      if(math.mod(i,3)==0)
      {
         newstr.add(eww);
      }
      else
      if(math.mod(i,3)==1)
      {
        newstr1.add(eww);
      }
      else
      if(math.mod(i,3)==2)
      {
        newstr2.add(eww);
      }
       i++;
    }
    
    
    LIST<Event_Attendee_Mapping__c> FLRec = new LIST<Event_Attendee_Mapping__c>();
    LeftValues = new LIST<LIST<Event_Attendee_Mapping__c>>();
    integer Lpagecount=0;
    for(Event_Attendee_Mapping__c l: newstr)
    {
    
        FLRec.add(l);
        Lpagecount++;
     if(Lpagecount==4)
     {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<Event_Attendee_Mapping__c>();
     }
    }
      if(FLRec.size() != 0)
      {
        
       LeftValues.add(FLRec);
      }

      LIST<Event_Attendee_Mapping__c> MLRec = new LIST<Event_Attendee_Mapping__c>();
      MiddleValues = new LIST<LIST<Event_Attendee_Mapping__c>>();
      integer Middlecount=0;
    for(Event_Attendee_Mapping__c l: newstr1)
    {
    
        MLRec.add(l);
        Middlecount++;
     if(Middlecount==4)
     {
        MiddleValues.add(MLRec);
        Middlecount=0;
        MLRec = new LIST<Event_Attendee_Mapping__c>();
     }
    }
      if(MLRec.size() != 0)
      {
        
       MiddleValues.add(MLRec);
      }

      LIST<Event_Attendee_Mapping__c> SLRec = new LIST<Event_Attendee_Mapping__c>();
      RightValues = new LIST<LIST<Event_Attendee_Mapping__c>>();
      integer Rpagecount=0;
     for(Event_Attendee_Mapping__c l: newstr2)
    {
    
        SLRec.add(l);
        Rpagecount++;
        if(Rpagecount==4)
      {
        RightValues.add(SLRec);
        Rpagecount=0;
        SLRec = new LIST<Event_Attendee_Mapping__c>();
      }
    
    }
     if(SLRec.size() != 0)
        {
            RightValues.add(SLRec);
        }
   system.debug('leftttttttttttttttttt'+RightValues);
   try
    { 
     
    
    
          attach=[select parentid,name from attachment where parentid =:eventSelected];
         logo=true;

    }catch(exception e)
    {
        logo=false;

    }
        addattendee1 = TRUE;
        event1= new Event_Attendee_Mapping__c();
        printbadge1();
        }
        else
        {
        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please select atleast one checkbox'));
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
//-------------------------------------------------------------------------------END OF EASY PEAL OFF BADGE----------------
//---------------------------------------------------------------------------
    public PageReference PrintBadge1() {
        return null;
    }

//------------------------------------------------------FOR ATTENDEE DELETE--------------------
    public PageReference deleteAdminRecord() {
    deleterec =[select id from Event_Attendee_Mapping__c where id=:eventName1 AND EV_id__r.id =: eventSelected];
    Delete deleterec ;
    getevents();
    pagereference pg=new pagereference('/apex/SampleExtjsTreeView');
     pg.setRedirect(true);
        return  pg;
    }


    public PageReference editAttendee() {
    attendeesetting=new BL_SecuritySettingsCon(eventSelected);
     
    try{
    
     Attachment  att = new Attachment ();
     att =[select id, parentId from Attachment where parentId=:eventName1 limit 1];
     eventIdVar =att.Id; 
     }catch(exception e){}
       system.debug('eventName::::'+eventName1);
       Event_Attendee_Mapping__c attendeeid=[select AS_id__c from Event_Attendee_Mapping__c where id=:eventName1];
      
        Event = new AttendeeSummary__c ();
        event1234=new list<AttendeeSummary__c>();
 
        event1234= [select id,name,AS_Age__c,AS_BirthDate__c,AS_BlogUrl__c,AS_BusinessDescription__c,AS_BusinessDunsNumber__c,
                                 AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_CellPhone__c,
                                 AS_Company__c,AS_DiversityType__c,AS_Email__c,AS_FaxNumber__c,AS_FirstName__c,AS_Gender__c,
                                 AS_HomeAddress1__c,AS_HomeAddress2__c,AS_HomeCity__c,AS_HomeCountry__c,AS_HomePhone__c,
                                 AS_HomePoBox__c,AS_HomeState__c,AS_HomeZipcode__c,AS_ImageUrl__c,AS_LastName__c,AS_NAICSCode1__c,
                                 AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_NumberOfEmployees__c,AS_Prefix__c,
                                 AS_PrimaryBusinessCategory__c,AS_SecondaryBusinessCategory__c,AS_ShippingAddress1__c,AS_ShippingAddress2__c,
                                 AS_ShippingCity__c,AS_ShippingCountry__c,AS_ShippingPhone__c,AS_ShippingPoBox__c,AS_ShippingState__c,
                                 AS_ShippingZipcode__c,AS_Suffix__c,AS_ThroughEventBrite__c,AS_Title__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,
                                 AS_WorkAddress2__c,AS_WorkCity__c,AS_WorkCountry__c,AS_WorkPhone__c,AS_WorkPoBox__c,AS_WorkState__c,AS_WorkZipCode__c
                                 FROM AttendeeSummary__c WHERE id=:attendeeid.AS_id__c];
      system.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+event1234);                        
    for(AttendeeSummary__c emEvent1 :event1234)
        {
            if(eventName1!= null && eventName1 !='')
            {
            system.debug('cccccccccccccccccccccccccccccccccccccccccccc');
                EventReqStringBool=false;
                EventEditpopup= TRUE;
                
                Event = emEvent1;
                break;
                
            }
            
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
       if(Event.AS_DiversityType__c != Null){         
        if(Event.AS_DiversityType__c.contains('MOBE'))
        Select0 = True;
        if(Event.AS_DiversityType__c.contains('DBE'))
        Select1 = True;
        if(Event.AS_DiversityType__c.contains('SDVBE'))
        Select2 = True;
        if(Event.AS_DiversityType__c.contains('SBE'))
        Select3 = True;
        if(Event.AS_DiversityType__c.contains('AO'))
        Select4 = True;
        if(Event.AS_DiversityType__c.contains('WOBE'))
        Select5 = True;
        if(Event.AS_DiversityType__c.contains('SBA 8(A) Program'))
        Select6 = True;
        if(Event.AS_DiversityType__c.contains('VOBE'))
        Select7 = True;
        if(Event.AS_DiversityType__c.contains('LGBTB'))
        Select8 = True;
        if(Event.AS_DiversityType__c.contains('ANCOF'))
        Select9 = True;
        if(Event.AS_DiversityType__c.contains('SDB'))
        Select10 = True;
        if(Event.AS_DiversityType__c.contains('HUBZ'))
        Select11 = True;
        if(Event.AS_DiversityType__c.contains('Disabled Business Enterprise'))
        Select12 = True;
        if(Event.AS_DiversityType__c.contains('HBCAU'))
        Select13 = True;
        if(Event.AS_DiversityType__c.contains('SCSDB'))
        Select14 = True;
    } 
        EditDate =String.valueOf(Event.AS_BirthDate__c); 
        BEDate=String.valueOf(Event.AS_BusinessEstablishedDate__c);
        
        
        
        return null;
    }

//----------------------------------------------------------------------------------------END OF EDIT---------------------
    public boolean  EventReqStringbool3{get;set;}
    public PageReference attendeedetail() {
    
        return null;
    }

  public void selectOneCheckBox(){
  if(eventName1 != null)
    {
    system.debug('gggggggggggggggggggg');
    List<string> listeventname1=eventname1.split(',');
    system.debug('sssssssssssssssssssss'+listeventname1.size());
    if(listeventname1.size()==10)
    {
    system.debug('mmmmmmmmmmmmmmmm');
    EventReqStringbool3=true;
     EventReqString='Select All Records from the Grid';
    }
    
    }
  
  
  }

    public void changeSetting(){
    updateAttendeeSettingBool = FALSE;
    system.debug('88888888888888888888888'+attendeeSetting );
        attendeeSetting = new BL_SecuritySettingsCon(eventselected);
    system.debug('99999999999999999999999'+attendeeSetting );
    
         updateAttendeeSettingBool = TRUE;
    }


    public void EditAttendeeSetting() {
        
        eventselected = 'a07O0000002omln';
        updateAttendeeSettingBool = TRUE;
        system.debug('11111111111111111111111'+ eventselected);
        attendeeSetting = new BL_SecuritySettingsCon(eventselected);
        
        //return null;
    }


    public void ShowPreviousList() {
    
    DataImportBool = TRUE;
    
    ImportHistory = new LIST<DataImport_SavePoint__c>();    
    ImportHistory = [Select d.User_id__c,d.createdDate, d.Name, d.DS_TotalRecords__c, d.DS_FileName__c From DataImport_SavePoint__c d WHERE User_id__c =: userInfo.getUserId()];
    
    system.debug('777777777777777777777777777777' + ImportHistory );
    }

//------------------------------------------------------POPUP FOR SELECTING DESIRED LABEL-----------------------------------
    public void popup() {
    Event1 = new Event_Attendee_Mapping__c();
        
        if(eventname1 != '' && eventname1 != null)
        {
        EventReqStringBool =false;
             for(Event_Attendee_Mapping__c emEvent1 :eventlist)
        {
              if(eventname1!= null && eventname1!='' && eventname1.equals(emEvent1.Id))
              system.debug('###printbadge1###'+eventname1);
              
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
     
//-------------------------------------------------------------------------------------END OF POPUE-----------------------
//--------------------------------------------------------------------------------------EMAIL BADGE------------------------
     public PageReference emailBadge() {
     
       
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
                                                       
                                                         from Event_Attendee_Mapping__c where id IN : attid];
  
    list<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
  
  
    for(Event_Attendee_Mapping__c eid: emailids)
     { 
 
     pdf=page.Qrcode_EmailBadgeToAttendees; 
     string fss =eid.EA_AttendeeBarcode__c;
     pdf.getParameters().put('id',fss);
     b = pdf.getContent();
     system.debug('bbbbbbbbbbbbbbbbbbbbbbbbb'+b);
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setSubject('Your Ticket For Registered Event!');
     String [] toAddresses = new String[] {eid.AS_id__r.AS_Email__c};
     email.setToAddresses(toAddresses);
     email.setPlainTextBody(message='Hello'+ eid.AS_id__r.AS_FirstName__c  +' Your Badge for the registered event'+ 
          'has been attached in the mail.'+ +
          ' Thank you,'+  +
          ' Globalnest LLC');
                                                                                            
     Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
    efa.setFileName('MyPDF.pdf');                                                        
     efa.setBody(b);                                                                          
     email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
     emails.add(email);                                                                            
    // Messaging.SendEmailResult [] r =
           //  Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    } 
    Messaging.sendEmail(emails);
    }
    return null;
    }

//-------------------------------------------------------------------------------------------------------------------------
    public PageReference ImportAttendee() {
      pagereference pg = new pagereference('/apex/QRCode_DataImport?id='+eventSelected );
         pg.setredirect(true);
            return pg;
    
    }

    public PageReference Dashboardaction() {
        return null;
    }


    public PageReference reportact() {
        return null;
    }


    public PageReference Attendees() {
        return null;
    }


    public PageReference CustomerAdminAct() {
        return null;
    }


    public PageReference Events() {
        return null;
    }


    public PageReference ProfileSettings() {
        return null;
    }
//-----------------------------------------------------------------------------------GENERATE PDF FOR BADGES--------------
 public PageReference genpdf() {
      checkedbadge= new List<Event_Attendee_Mapping__c>();
     checkedbadge=[select id, EA_isBadgePrinted__c from Event_Attendee_Mapping__c where id in:attid];
     for(Event_Attendee_Mapping__c dd:checkedbadge)
    {

         dd.EA_isBadgePrinted__c=true;
         List<Event_Attendee_Mapping__c> changed=new List<Event_Attendee_Mapping__c>{};
         changed.add(dd);
         
         update changed;

    }
    

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
   return null;     
 }   
//-------------------------------------------------INNER CLASS------------------------------
    public class EventWrapper
    {
    public Event_Attendee_Mapping__c atnd {get;set;}
    public string z{get;set;} 
    public string status{get;set;}
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
    
    
    }
    }
     public list<inneremail> ss {get;set;}
   public class inneremail
   {
   public Event_Attendee_Mapping__c qq{get;set;}
   public inneremail(Event_Attendee_Mapping__c qq)
   {
   this.qq=qq;
   }
   
   } 
   //-----------------------------------
   
   public class InnerForBadge{
    
        public String fName{get; set;}
        public String lName{get; set;}
        public String Email{get; set;}
        public String Phone{get; set;}
    
        public InnerForBadge( String fn, String ln ,String em ){
            
            fName = fn;
            lName = ln;
            Email =em;
            
            
        }
    
    }

   
//-----------------------------------------------------------------------------------------------------    
//---------------------------------------------EXPORTING-------------------------------------------------
    public List<Event_Attendee_Mapping__c> attforexport{get;set;}
    public pagereference ExportToCsv()
    {
    attforexport=new List<Event_Attendee_Mapping__c>();
    
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
     // attforexport=event1234(eventname1);
      attforexport=[select AS_id__r.AS_Age__c,AS_id__r.AS_BirthDate__c,AS_id__r.AS_BlogUrl__c,AS_id__r.AS_BusinessDescription__c,AS_id__r.AS_BusinessDunsNumber__c,
                                 AS_id__r.AS_BusinessEstablishedDate__c,AS_id__r.AS_BusinessRevenue__c,AS_id__r.AS_BusinessTaxId__c,AS_id__r.AS_CellPhone__c,
                                 AS_id__r.AS_Company__c,AS_id__r.AS_DiversityType__c,AS_id__r.AS_Email__c,AS_id__r.AS_FaxNumber__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_Gender__c,
                                 AS_id__r.AS_HomeAddress1__c,AS_id__r.AS_HomeAddress2__c,AS_id__r.AS_HomeCity__c,AS_id__r.AS_HomeCountry__c,AS_id__r.AS_HomePhone__c,
                                 AS_id__r.AS_HomePoBox__c,AS_id__r.AS_HomeState__c,AS_id__r.AS_HomeZipcode__c,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_LastName__c,AS_id__r.AS_NAICSCode1__c,
                                 AS_id__r.AS_NAICSCode2__c,AS_id__r.AS_NAICSCode3__c,AS_id__r.AS_NAICSCode4__c,AS_id__r.AS_NAICSCode5__c,AS_id__r.AS_NumberOfEmployees__c,AS_id__r.AS_Prefix__c,
                                 AS_id__r.AS_PrimaryBusinessCategory__c,AS_id__r.AS_SecondaryBusinessCategory__c,AS_id__r.AS_ShippingAddress1__c,AS_id__r.AS_ShippingAddress2__c,
                                 AS_id__r.AS_ShippingCity__c,AS_id__r.AS_ShippingCountry__c,AS_id__r.AS_ShippingPhone__c,AS_id__r.AS_ShippingPoBox__c,AS_id__r.AS_ShippingState__c,
                                 AS_id__r.AS_ShippingZipcode__c,AS_id__r.AS_Suffix__c,AS_id__r.AS_ThroughEventBrite__c,AS_id__r.AS_Title__c,AS_id__r.AS_WebsiteUrl__c,AS_id__r.AS_WorkAddress1__c,
                                 AS_id__r.AS_WorkAddress2__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_WorkCountry__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_WorkPoBox__c,AS_id__r.AS_WorkState__c,AS_id__r.AS_WorkZipCode__c
                                 FROM Event_Attendee_Mapping__c WHERE id in: attid];
   system.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+attforexport);
   
       pagereference pg=new pagereference('/apex/Qrcode_exportAttendees');
       pg.setredirect(false);
       return pg;
  }
  else
  {
  EventReqStringBool=true;
  EventReqString='select attendee to Export';
  }
     return null;
        }
//--------------------------------------------------------------------------------------
public list<selectoption> getfieldnames(){
//String ObjectName = 'contact';
//Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();

    //system.debug('111111111111111111111'+ ObjectFieldMap );

List<SelectOption> options = new List<SelectOption>();

options.add(new selectoption('None','None'));

options.add(new selectoption('LastName','LastName'));
options.add(new selectoption('FirstName','FirstName'));
options.add(new selectoption('Phone','Phone'));
options.add(new selectoption('Company','Company'));

/**
for (Schema.SObjectField SObjectF : ObjectFieldMap.values())
{
Schema.DescribeFieldResult field = SObjectF.getDescribe();

options.add(new selectoption(field.getLocalname(),field.getLocalname()));
}
*/

return options;
}
//---------------------------------------------------------for colors----------------
public List<SelectOption> getcolors() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new selectoption('select','select'));
            options.add(new SelectOption('green','green'));
            options.add(new SelectOption('red','red'));
            options.add(new SelectOption('pink','pink'));
            options.add(new SelectOption('orange','orange'));
            options.add(new SelectOption('blue','blue'));
            options.add(new SelectOption('indigo','indigo'));
           return options;
            
}
//---------------------------------------------------------------------------------
public  List<SelectOption> getfont() {

     List<SelectOption> options = new List<SelectOption>();
     options.add(new selectoption('select','select'));
            options.add(new SelectOption('32pt','32pt'));
            options.add(new SelectOption('24pt','24pt'));
            options.add(new SelectOption('18pt','18pt')); 
    
    system.debug('22222222222222222222222222222222222222222222  NON Email '+ options );
      
           
       return options;    
}
//----------------------------------------Printing att badge---------------------
public pagereference attbadge()
{
pdfbool=false;
pagereference pg=page.qrcode_badgeofanattendee;
return pg;

}



  
}