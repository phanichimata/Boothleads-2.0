public class EventsCon {
    
    
       public String  eventName1{get;set;}
         public String  strNamesmult{get;set;}
        Public Boolean AddEventBtn{get;set;}
        Public String gettingId{get;set;}
      
        
        Public Event__c Event{get;set;}
        Public String Selectedstate{get;set;}
        Public String SelectedEventbrite{get;set;}
        Public String selectedCountry{get;set;}
        Public Boolean DisableStates{get;set;}
        Public User EventAdminUser{get;set;}
        Public User_Profile_Event__c EventAdmin_Event{get;set;}
        Public String LoginUser{get;set;}
        Public Profile__c EventAdminProfile{get;set;}
        Public BL_Pricing__c EventAdminPricing{get;set;}
        Public List<User_Profile_Event__c> EventList{get;set;}
        Public string EventId{get;set;}
        Public string LoginUserId{get;set;}
        Public List<Event__c> EditEventDetails{get;set;}
        Public Boolean EventEditPopUp{get;set;}
        Public Boolean DisplayEventInfoPopup{get;set;}
        Public List<Event__c> returnList {get;set;}
        Public Document mydoc;//Document 
        Public Document Mydocupdate;
        Public string DocID{get;set;}//Document
        Public List<User_Profile_Event__c> EventListFilter{get;set;}
        Public Blob EventLogo{get;set;}
        Public Blob Logo{get;set;}
        Public string LogoName{get;set;}
        Public Document Documentimage{get;set;}
        Public String GettingDocId{get;set;}
        Public string EditLogoName{get;set;}
        Public Blob EditEventLogo{get;set;}
        Public Document EditDocumentimage{get;set;}
        
    
    
        // Var for Attendee Settings 
         public Boolean updateAttendeeSettingBool{get; set;}
         public LIST<selectoption> Allevents{get; set;}
         public String eventSelected{get; set;}
         public BL_SecuritySettingsCon attendeesetting{get; set;}
         public Boolean attendeeSettingBool{get; set;}
         public String rerendString{get; set;}
         public Boolean userkeyValid{get; set;}
         public Boolean eventValidation{get;set;}
     
      // For Registration Settings
        public Boolean RegistrationSettingBool{get; set;}
          
     
        public PageReference insertCall() {
            return null;
        }
      
        public pagereference insertCall(String test){
        
        
        String test1 = test;
        
        
        System.debug('@@@@@test1'+test1);
        
        
        
        return null;
        
        }
     
     
    
    
    
       Public EventsCon(){//Constructor
        
        ajaxtest = false; 
        
        getSelectEventId();
        
        
      eventBritePop1 = false;
      
      
    eventBritePop7= false;
    
    eventbritepop8 = false;
    
        DisableStates = true;
        //LoginUser = UserInfo.getUsername();
         LoginUserId = UserInfo.getUserId();
      // LoginUserId = '005O0000000abOX'; 
       // try{    
        getEvents();
       // }catch(Exception e){}
        //Document Doc = [select id,IsPublic,AuthorId,Body,Description,FolderId from Document where (folderid='005O0000000ZGnjIAG'User_id__r.Username=: LoginUser AND AuthorId=: loginUserId) limit 1 ];                      
        //system.debug('===========:::::::::::: what will be the UserId :::::::::::============='+Doc );
        //DocID = Doc.id;
        rerendString = 'preinc,prereq,sufreq,sufinc,comreq,cominc,degreq,deginc,mobreq,mobinc,ageinc,agereq,genreq,geninc,dobreq,dobinc,picreq,picinc,homereq,homeinclude,shiinc,shireq,worinc,worreq,pbcreq,pbcinc,sbcreq,sbcinc,noereq,noeinc,bedinc,bedreq,breinc,brereq,btainc,btareq,bdninc,bdnreq,webinc,webreq,bloinc,bloreq,divinc,divreq,bdeinc,bdereq,na1inc,na1req,na2inc,na2req,na3inc,na3req,na4inc,na4req,na5inc,na5req';
        updateAttendeeSettingBool = FALSE;
        userkeyValid = FALSE;
        eventValidation = FALSE;
        
       
        }
        
        
        Public void getEvents(){//Getting List of Events to display in Visual force Grid
        
        EventListFilter = new  List<User_Profile_Event__c>();
        Allevents = new LIST<selectoption>();    // *********By MAllik**********
        EventList = [select Id,EV_id__c,EV_id__r.EV_Title__c,EV_id__r.Status__c,EV_id__r.EV_HostingState__c,EV_id__r.AS_HostingCity__c, 
                    EV_id__r.EV_HostingLocation__c,EV_id__r.EV_HostingOrgName__c from User_Profile_Event__c where User_id__c=: LoginUserId AND EventAdmin_Id__c =:LoginUserId
                    AND Profile_Id__r.PR_Name__c = 'EventAdmin' ORDER BY CreatedDate DESC  ];
        system.debug('-----------List Of Events from User_Profile_Event__c------------------'+EventList );    
            for(User_Profile_Event__c s:Eventlist)
              {     
              if(s.EV_id__c != Null){          
              s.EV_id__r.EV_Title__c = escapeSpecialCharacters(s.EV_id__r.EV_Title__c);
              s.EV_id__r.Status__c = escapeSpecialCharacters(s.EV_id__r.Status__c);
              s.EV_id__r.EV_HostingLocation__c = escapeSpecialCharacters(s.EV_id__r.EV_HostingLocation__c);
              s.EV_id__r.EV_HostingOrgName__c = escapeSpecialCharacters(s.EV_id__r.EV_HostingOrgName__c);           
              EventListfilter.add(s);               
              attendeeSettingBool = TRUE;
              RegistrationSettingBool = TRUE;          
              Allevents.add(new SelectOption(s.EV_id__c, s.EV_id__r.EV_Title__c));
              eventSelected = Eventlist[0].EV_id__c;
              
            }
            
            
        }
         
      }   
         public String escapeSpecialCharacters(String input){//Escape Special Characters
          
        if(input!= null && input != '' && (input.contains('"')  || input.contains('<'))){
    
            if(input!= null && input != '' && (input.contains('"') )){
               input = input.replace('"','\\\"');
           
            }if(input!= null && input != '' && (input.contains('<') )){
            input = input.replace('<','');
             system.debug('llllllllllllllllllllll'+input);
            }
           if(input!= null && input != '' && (input.contains('\\') )){
            input = input.replace('\\','\\\\');
     
          } 
          } 
        return input;    
       } 
        Public List<selectOption> getCountries(){
        List<selectoption> Options = new List<selectoption>();
        Options.add(new selectoption('--None--','--None--'));
        Options.add(new selectoption('United States Of America','United States Of America'));
        Options.add(new selectoption('India','India'));
        return Options;    
        }
        
        Public List<selectoption> getStates(){
        List<selectoption> Options = new List<selectoption>();
        Options.add(new SelectOption('NONE','--None--'));
        if(selectedCountry == 'United States Of America'){ 
        DisableStates = false;   
        Options.add(new SelectOption('AL','Alabama'));
        Options.add(new SelectOption('AZ','Arizona'));
        Options.add(new SelectOption('AR','Arkansas'));
        Options.add(new SelectOption('CA','California'));
        Options.add(new SelectOption('CO','Colorado'));
        Options.add(new SelectOption('CT','Connecticut'));
        Options.add(new SelectOption('DE','Delaware'));
        Options.add(new SelectOption('DC','District of Columbia'));
        Options.add(new SelectOption('FL','Florida'));
        Options.add(new SelectOption('GA','Georgia'));
        Options.add(new SelectOption('HI','Hawaii'));
        Options.add(new SelectOption('ID','Idaho'));
        Options.add(new SelectOption('IL','Illinois'));
        Options.add(new SelectOption('IN','Indiana'));
        Options.add(new SelectOption('IA','Iowa'));
        Options.add(new SelectOption('KS','Kansas'));
        Options.add(new SelectOption('KY','Kentucky'));
        Options.add(new SelectOption('LA','Louisiana'));
        Options.add(new SelectOption('ME','Maine'));
        Options.add(new SelectOption('MD','Maryland'));
        Options.add(new SelectOption('MA','Massachusetts'));
        Options.add(new SelectOption('MI','Michigan'));
        Options.add(new SelectOption('MN','Minnesota'));
        Options.add(new SelectOption('MS','Mississippi'));
        Options.add(new SelectOption('MO','Missouri'));
        Options.add(new SelectOption('MT','Montana'));
        Options.add(new SelectOption('NE','Nebraska'));
        Options.add(new SelectOption('NV','Nevada'));
        Options.add(new SelectOption('NH','New Hampshire'));
        Options.add(new SelectOption('NJ','New Jersey'));
        Options.add(new SelectOption('NM','New Mexico'));
        Options.add(new SelectOption('NY','New York'));
        Options.add(new SelectOption('NC','North Carolina'));
        Options.add(new SelectOption('ND','North Dakota'));
        Options.add(new SelectOption('OH','Ohio'));
        Options.add(new SelectOption('OK','Oklahoma'));
        Options.add(new SelectOption('OR','Oregon'));
        Options.add(new SelectOption('PA','Pennsylvania'));
        Options.add(new SelectOption('RI','Rhode Island'));
        Options.add(new SelectOption('SC','South Carolina'));
        Options.add(new SelectOption('SD','South Dakota'));
        Options.add(new SelectOption('TN','Tennessee'));
        Options.add(new SelectOption('TX','Texas'));
        Options.add(new SelectOption('UT','Utah'));
        Options.add(new SelectOption('VT','Vermont'));
        Options.add(new SelectOption('VA','Virginia'));
        Options.add(new SelectOption('WA','Washington'));
        Options.add(new SelectOption('WV','West Virginia'));
        Options.add(new SelectOption('WI','Wisconsin'));
        Options.add(new SelectOption('WY','Wyoming'));
        }else if(selectedCountry == 'India')
        { 
        DisableStates = false;    
        Options.add(new selectoption('AP','Andhra Pradesh'));
        Options.add(new selectoption('AR','Arunachal Pradesh'));
        Options.add(new SelectOption('AS','Assam'));
        Options.add(new SelectOption('BR','Bihar'));
        Options.add(new SelectOption('CT','Chhattisgarh'));
        Options.add(new SelectOption('GA','Goa'));
        Options.add(new SelectOption('GJ','Gujarat'));
        Options.add(new SelectOption('HR','Haryana'));
        Options.add(new SelectOption('HP','Himachal Pradesh'));
        Options.add(new SelectOption('JK','Jammu and Kashmir'));
        Options.add(new SelectOption('JH','Jharkhand'));
        Options.add(new SelectOption('KA','Karnataka'));
        Options.add(new SelectOption('KL','Kerala'));
        Options.add(new SelectOption('MP','Madhya Pradesh'));
        Options.add(new SelectOption('MH','Maharashtra'));
        Options.add(new selectoption('MN','Manipur'));
        Options.add(new selectoption('ML','Meghalaya'));
        Options.add(new selectoption('MZ','Mizoram'));
        Options.add(new SelectOption('NL','Nagaland'));
        Options.add(new SelectOption('OR','Orissa'));
        Options.add(new SelectOption('PJ','Punjab'));
        Options.add(new SelectOption('RJ','Rajasthan'));
        Options.add(new SelectOption('SK','Sikkim'));
        Options.add(new SelectOption('TN','Tamil Nadu'));
        Options.add(new SelectOption('TR','Tripura'));
        Options.add(new SelectOption('UP','Uttar Pradesh'));
        Options.add(new SelectOption('UT','Uttarakhand'));
        Options.add(new SelectOption('WB','West Bengal'));
        Options.add(new SelectOption('AN','Andaman and Nicobar Islands'));
        Options.add(new SelectOption('DD','Daman and Diu'));
        Options.add(new SelectOption('LD','Lakshadweep  '));
        Options.add(new SelectOption('DL','National Capital Territory of Delhi'));
        
        }
        else{
         DisableStates = true; 
        }
        return Options;
        }
        
        Public List<selectOption> getEventbrite(){
        List<selectoption> Options = new List<selectoption>();
        
        Options.add(new selectoption('Hosted By Eventbrite','By Eventbrite'));
        Options.add(new selectoption('Publish In Registration','By Global Nest'));
        Options.add(new selectoption('No Registration','By Other'));
        return Options;    
        }
        
        Public Void AddEvent(){
        AddEventBtn = true;
        
        Event = new Event__c();
        DocumentImage = new Document();
        
        }
        
        
        public Boolean EventReqStringBool{get;set;}
         public string EventReqString{get;set;}
        Public void CreateEvent(){//Method for Creating Event
        
        
        if(Logo != null && ( LogoName != '' || LogoName != NULL )){
        if(Logo.size()!= null){
         
         system.debug('111111111111111111111   '+ Logo.size() );
         
        if(Logo.size() < 102400 ){
        mydoc =new document();
        mydoc.body = Logo;
        mydoc.folderid = UserInfo.getUserId();
        
        mydoc.IsPublic = true;
        mydoc.Name = LogoName;
        insert mydoc;
         system.debug('--------Inserting Image------'+mydoc.id);
        Event.EV_EventLogo__c = mydoc.id;
        
        system.debug('--------Inserting Image in to object------'+Event.EV_EventLogo__c);
       } else{
       ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please make sure the  file is not more than 100 kb'));       
            
       
       }}
      }   
            
        Event.EV_Title__c = Event.EV_Title__c;
        Event.EV_HostingTimeZone__c = Event.EV_HostingTimeZone__c;
        //-------------------------------------------------------------Mythily 02/11/2012---------------------
       
        Event.EV_StartDate__c = Event.EV_StartDate__c;
        Event.StartTime__c = Event.StartTime__c;     
       
        //--------------------------------------------------------------------------
        
        Event.EV_EndDate__c = Event.EV_EndDate__c;
        Event.EV_EndTime__c = Event.EV_EndTime__c;
        Event.EV_HostingPhone__c = Event.EV_HostingPhone__c;
        Event.EV_HostingFax__c = Event.EV_HostingFax__c;
        Event.EV_WebsiteURL__c = Event.EV_WebsiteURL__c;
        Event.Primary__c = Event.Primary__c;
        Event.SecondaryCategory__c = Event.SecondaryCategory__c;
        Event.Status__c = Event.Status__c;
        Event.EV_HostingOrgName__c = Event.EV_HostingOrgName__c;
        Event.EV_HostingLocation__c = Event.EV_HostingLocation__c;
        Event.EV_HistingAddr1__c = Event.EV_HistingAddr1__c;
        Event.AS_HostingAddr2__c = Event.AS_HostingAddr2__c;
        Event.AS_HostingCity__c = Event.AS_HostingCity__c;
       // if(SelectedCountry != '--None--')
       // Event.EV_HostingCountry__c = SelectedCountry;
       // Event.EV_HostingState__c = Selectedstate;
        Event.EV_HostingZipcode__c = Event.EV_HostingZipcode__c;
        Event.EV_HostingPostalCode__c = Event.EV_HostingPostalCode__c;
        Event.EV_Description__c = Event.EV_Description__c;
       
        if(SelectedEventbrite == 'Hosted By Eventbrite')
        {
        Event.EV_HostedByEventBrite__c = True;
        }else if(SelectedEventbrite == 'Publish In Registration')
        {
        Event.EV_Publish__c = TRUE;
        }else {
            Event.EV_HostedByEventBrite__c = FALSE;
            Event.EV_Publish__c = FALSE;
        }
        
        insert Event; 
       
          system.debug('------------Inserting Event-------------'+Event);
          
         // ----------------------- CODE FOR Attendee Settings ------------------------------------
         
         
         
         String named='';
                String ObjectName = 'AttendeeSummary__c'; // Object Name Goes Here
                Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get(ObjectName).getDescribe().fields.getMap();
                
               // system.debug('1111111111111111111111111'  );
                for (Schema.SObjectField SObjectF : ObjectFieldMap.values())
                {
                              system.debug('1111111111111111111111111'+SObjectF );
                   Schema.DescribeFieldResult field = SObjectF.getDescribe();
                   named +=field.getLocalname()+',';
                }
                 named += 'AttendeePic,' ;
                 system.debug('22222222222222222222222222222222'+named);
                 
                  SecurityControls__c  attset = new  SecurityControls__c ();
                
                attset.EV_Fields__c = named;
                attset.EV_id__c = Event.id;  
                 
                insert attset;
                
                
          //----------------------- ENDing By Mallik -----------------------------     
          
       
        
        List<User_Profile_Event__c> GettingFirstRecord = [Select id,BLP_id__c,Ev_Id__c From User_Profile_Event__c Where EventAdmin_Id__c =:LoginUserId  AND Ev_Id__c = Null Limit 1];
        
        system.debug('============######### Getting eventadmin record from Jun to update #####=========='+GettingFirstRecord );
        
        EventAdminProfile = [select Id from Profile__c where PR_Name__c = 'EventAdmin'];
        
        if(GettingFirstRecord.size()> 0){
        GettingFirstRecord[0].EV_id__c = Event.id;  
        Update GettingFirstRecord; 
        
       LIST<Reports__c> rpList = new LIST<Reports__c>(); 
       
        Reports__c rp = new Reports__c();
         
         rp.RE_Name__c = 'Report By Industry';
         rp.UPE_id__c = GettingFirstRecord[0].id;
         
         rpList.add(rp);
         
         Reports__c rp1 = new Reports__c();
         
         rp1.RE_Name__c = 'Report By Geography';
         rp1.UPE_id__c = GettingFirstRecord[0].id;
        
        rpList.add(rp1);
        
        DataBase.insert(rpList);
        
        
        system.debug('========= Inserting EventId,EventAdminID==========='+EventAdmin_Event);
       } 
        else
        {
         
         List<User_Profile_Event__c> insertingNewrecord = [Select id,BLP_id__c From User_Profile_Event__c Where EventAdmin_Id__c =:LoginUserId AND User_id__c = :LoginUserId Limit 1];
         
          system.debug('========= Inserting EventId,EventAdminID==========='+insertingNewrecord );    
         
          EventAdmin_Event = new User_Profile_Event__c();
          //EventAdmin_Event.BLP_id__c = insertingNewrecord[0].BLP_id__c ;
          EventAdmin_Event.EV_id__c = Event.id;
          EventAdmin_Event.EventAdmin_Id__c = LoginUserId;
          EventAdmin_Event.UEP_isActive__c = true;
          EventAdmin_Event.Profile_id__c = EventAdminProfile.id ;
          EventAdmin_Event.User_id__c = LoginUserId;
          
          insert EventAdmin_Event;
          
           LIST<Reports__c> rpList = new LIST<Reports__c>(); 
       
        Reports__c rp = new Reports__c();
         
         rp.RE_Name__c = 'Report By Industry';
         rp.UPE_id__c = EventAdmin_Event.id;
         
         rpList.add(rp);
         
         Reports__c rp1 = new Reports__c();
         
         rp1.RE_Name__c = 'Report By Geography';
         rp1.UPE_id__c = EventAdmin_Event.id;
        
        rpList.add(rp1);
        
        DataBase.insert(rpList);
        
          
       }
      system.debug((userInfo.getFirstName()+userInfo.getLastName()+userInfo.getUserName()).tolowercase());
         LIST<AttendeeSummary__c> ASrec=[select id from AttendeeSummary__c where AS_uniqueField__c =:(userInfo.getFirstName()+userInfo.getLastName()+userInfo.getUserName()).tolowercase()];
           system.debug(';;;;;;;;;;;;;;;;;;;;;;;'+ASrec[0]);                                                                       
        if(ASrec.size() != 0 )
        {
         system.debug(';;;;;;;;;;;;;;;;;;;;;;;'+event.id); 
          Event_Attendee_Mapping__c EAM=new Event_Attendee_Mapping__c();
          EAM.EV_id__c=Event.id;
          EAM.AS_id__c=ASrec[0].id;
          insert EAM;
           system.debug(';;;;;;;;;;;;;;;;;;;;;;;'+EAM.id); 
           EAM.EA_AttendeeBarcode__c=EAM.id +'-'+ Event.id;
           EAM.Attendee_Event_IDs__c= String.ValueOf(ASrec[0].id) + Event.id;
          update EAM;
          
        system.debug(';;;;;;;;;;;;;;;;;;;;;;;'+EAM.id);
        }
         
         
         
         
          getEvents();
         AddEventBtn = False;  
        
         
        }
        
        Public Void Cancel(){
        AddEventBtn = False;  
         updateAttendeeSettingBool = FALSE;
        }
        
        
        
        Public void EditEvent(){
        
        system.debug('----EventId---'+EventId);
      
        
        User_Profile_Event__c ParticularJuncID=[select EV_ID__c from User_Profile_Event__c where id =: EventId];
        
        system.debug('=======::::::::::: Mapping Junction EventID :::::::::::========='+ParticularJuncID);
        
     
        EditEventDetails = [select id,EV_Description__c,EV_EndDate__c,EV_EndTime__c,EV_HistingAddr1__c,
                            EV_HostedByEventBrite__c,AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountryNew__c,EV_HostingFax__c,
                            EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingStateNew__c,
                            EV_HostingTimeZone__c,EV_HostingZipcode__c,Primary__c,SecondaryCategory__c,EV_StartDate__c,StartTime__c,Status__c,
                            EV_Title__c,EV_WebsiteURL__c,EV_EventLogo__c,EV_Publish__c,EV_ContactURL__c from Event__c where id =:ParticularJuncID.EV_id__c ];
                  
            system.debug('------:::::::::: For Editing Particular Event Record :::::::::::-------'+EditEventDetails); 
             
            
                            
             for(Event__c PEvent :EditEventDetails){
             
              if(EventId!= null && EventId!='')
              {
              system.debug(':::::::: -------- Getting Event Id From above Query ---::::::::'+PEvent.Id);
              EventEditPopUp= TRUE;
              Event = PEvent ;              
              } 
              if(Event.EV_HostedByEventBrite__c == True){
                  SelectedEventbrite = 'Hosted By Eventbrite';
              }else if(Event.EV_Publish__c == TRUE){
                  SelectedEventbrite = 'Publish In Registration';
              }else {
                  SelectedEventbrite = 'No Registration';
              }
              if(Event.EV_EventLogo__c != Null){
              GettingDocId=Event.EV_EventLogo__c;
              }
               system.debug(':::::::: -------- Getting Event url ---::::::::'+Event);
         }
         
          
       //  SelectedCountry = Event.EV_HostingCountry__c;
       //  Selectedstate = Event.EV_HostingState__c; 
                     
      }
      
      
      
      Public void EventUpdate(){
      
      system.debug(':::::: ====== Whether the Method id Firing or not =======:::::: ');
      
        Event.EV_Title__c = Event.EV_Title__c;
        Event.EV_HostingTimeZone__c = Event.EV_HostingTimeZone__c;
        Event.EV_StartDate__c = Event.EV_StartDate__c;
        Event.StartTime__c = Event.StartTime__c;
        Event.EV_EndDate__c = Event.EV_EndDate__c;
        Event.EV_EndTime__c = Event.EV_EndTime__c;
        Event.EV_HostingPhone__c = Event.EV_HostingPhone__c;
        Event.EV_HostingFax__c = Event.EV_HostingFax__c;
        Event.EV_WebsiteURL__c = Event.EV_WebsiteURL__c;
        Event.Primary__c = Event.Primary__c;
        Event.SecondaryCategory__c = Event.SecondaryCategory__c;
        //Event.EV_EventLogo__c = 'https://c.ap1.content.force.com/servlet/servlet.ImageServer?id='+Mydocupdate.id+'&oid=00DO000000075G4' ;
        Event.Status__c = Event.Status__c;
        Event.EV_HostingOrgName__c = Event.EV_HostingOrgName__c;
        Event.EV_HostingLocation__c = Event.EV_HostingLocation__c;
        Event.EV_HistingAddr1__c = Event.EV_HistingAddr1__c;
        Event.AS_HostingAddr2__c = Event.AS_HostingAddr2__c;
        Event.AS_HostingCity__c = Event.AS_HostingCity__c;
      //  Event.EV_HostingCountry__c = SelectedCountry;
      //  Event.EV_HostingState__c = Selectedstate;
        Event.EV_HostingZipcode__c = Event.EV_HostingZipcode__c;
        Event.EV_HostingPostalCode__c = Event.EV_HostingPostalCode__c;
        Event.EV_Description__c = Event.EV_Description__c;
        
            if(SelectedEventbrite == 'Hosted By Eventbrite')
            {
            Event.EV_HostedByEventBrite__c = True;
            }else if(SelectedEventbrite == 'Publish In Registration')
            {
            Event.EV_Publish__c = TRUE;
            }else {
                Event.EV_HostedByEventBrite__c = FALSE;
                Event.EV_Publish__c = FALSE;
            }
            
        update Event;
        system.debug(':::::::::::::: Record Updated :::::::::::::::'+GettingDocId );
         system.debug(':::::::::::::: Record Updated :::::::::::::::'+EditEventLogo);
          system.debug(':::::::::::::: Record Updated :::::::::::::::'+EditLogoName);
        if(GettingDocId != null && EditEventLogo != null && (EditLogoName!= null || EditLogoName!= '' ))
           {
            document doc=[select id from document where id =: GettingDocId ];
            
            delete doc;
          }
         if(EditEventLogo != null && (EditLogoName!= null || EditLogoName!= '' ))
        {
        if(EditEventLogo.size()!= null)
        {
           system.debug('------------------edit image----------------------'+EditEventLogo.size());
        if(EditEventLogo.size() < 102400){    
        system.debug('------------------edit image----------------------'+EditEventLogo.size());
         mydoc=new document();
         mydoc.folderid = UserInfo.getUserId();
         mydoc.ispublic=true;
         mydoc.body= EditEventLogo ;
         mydoc.name= EditLogoName;    
        insert mydoc;
        system.debug('------------------edit image----------------------'+mydoc);
        Event.EV_EventLogo__c = mydoc.id;
         update Event ;
        }else{
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please make sure the  file is not more than 100 kb'));       
            
        }}
       }
        getEvents();
        EventEditPopUp = False;
      
      }
      
      Public void CancelUpdate(){
      system.debug('++++++++++');
      EventEditPopUp = False;
      updateAttendeeSettingBool = FALSE;
      }
      
      
      
      public void getEventdetails()
        {
            system.debug('EventId ===============::::'+EventId);
            
            returnList = new List<Event__c>();
            
            User_Profile_Event__c ParticularJuncID=[select EV_ID__c from User_Profile_Event__c where id =: EventId];
            
             system.debug('==******************=====::::'+ParticularJuncID);
            
            EditEventDetails = [select id,EV_Description__c,EV_EndDate__c,EV_EndTime__c,EV_EventLogo__c,EV_HistingAddr1__c,
                            EV_HostedByEventBrite__c,AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountryNew__c,EV_HostingFax__c,
                            EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingStateNew__c,
                            EV_HostingTimeZone__c,EV_HostingZipcode__c,Primary__c,SecondaryCategory__c,EV_StartDate__c,StartTime__c,Status__c,
                            EV_Title__c,EV_WebsiteURL__c,EV_Publish__c,EV_ContactURL__c from Event__c where id =:ParticularJuncID.EV_id__c];
                            
                             system.debug('==&&&&&&&&&&&&&&&&&&=====::::'+EditEventDetails);
            
            
            for(Event__c emEvent :EditEventDetails)
            {
                if(EventId!= null && EventId!='')
                {
                    displayeventinfoPopUp= true;
                    returnList.add(emEvent);
                    break;
                }
                
            }
            
            //return null;
        }
        
        
        public PageReference getEventDetailsNew() {
        
            User_Profile_Event__c ParticularJuncID=[select EV_ID__c from User_Profile_Event__c where id =: EventId];
            
             system.debug('==******************=====::::'+ParticularJuncID);
           
            Event__c ev = [select id,EV_Description__c,EV_EndDate__c,EV_EndTime__c,EV_EventLogo__c,EV_HistingAddr1__c,
                            EV_HostedByEventBrite__c,AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountryNew__c,EV_HostingFax__c,
                            EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingStateNew__c,
                            EV_HostingTimeZone__c,EV_HostingZipcode__c,Primary__c,SecondaryCategory__c,EV_StartDate__c,StartTime__c,Status__c,
                            EV_Title__c,EV_WebsiteURL__c from Event__c where id =: ParticularJuncID.EV_id__c ];
        
              
           pagereference pg = new pagereference('/apex/eventDetail?id='+ ev.id);
                 pg.setRedirect(true);
                return pg;
                
               
        }
        
        Public void CancelPreview(){
          DisplayEventInfoPopup = false;
          }
      //Page Navigation methods  
        
        public PageReference Reportsaction() {
            pagereference pg = new pagereference('/apex/BL_Evntadmreports');
                 pg.setredirect(true);
                return pg;
        }
    
    
        public PageReference AttendeesAction() {
        pagereference pg = new Pagereference('/apex/QRcode_Eventadmin_Attendees');
        pg.setredirect(true);    
            return pg;
        }
    
    
        public PageReference BoothAction() {
        pagereference pg = new Pagereference('/apex/BL_Eventadmin_samplebooth');
        pg.setredirect(true);    
            return pg;
        }
    
    
        public PageReference EventAction() {
         pagereference pg = new Pagereference('/apex/BL_Eventadmin_Events');
         pg.setredirect(true);    
            return pg;
            
        }
    
    
        public PageReference ProfileSettings() {
         pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');
         pg.setredirect(true);    
            return pg;
            
        }
        public PageReference DashboardAction() {
           pagereference pg = new pagereference('/apex/BL_Eventadmin_Dashboard');
           pg.setredirect(true);
             return pg;
         }
        
        public PageReference EventSchedule() {  
            
            if(EventId != NULL || EventId != '')
            {
              
              User_Profile_Event__c upe = [SELECT Id,EV_id__c FROM User_Profile_Event__c WHERE id =: EventId ];
              
              if(upe.EV_id__c != NULL )
              {
                   pagereference pg = new pagereference('/apex/QRCode_EventSchedulenew?event='+ upe.EV_id__c);
                   pg.setredirect(true);
                     return pg;
              }
                 
            }
            return null;     
         }
        
        // Methods For Attendee Settings By Mallik
        public void EditAttendeeSetting(){
            
            updateAttendeeSettingBool = TRUE;
            attendeeSetting = new BL_SecuritySettingsCon(eventselected);
    
           system.debug('11111111111111111111111111'+ eventselected );
        } 
       
       
       // Action Support Methods For Event Admin Changes Event.
        public void changeSetting(){
        
            attendeeSetting = new BL_SecuritySettingsCon(eventselected);
        }
        
        
        public void UpdateAttendeeSetting(){
            
             system.debug('11111111111111111111111'+  attendeeSetting.comp  );
              system.debug('2222222222222222222222'+  attendeeSetting.homeinfo );
             
              
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
            
            
            updateAttendeeSettingBool = FALSE;
       //--------------------------*************   End of REQUIRED Fields  ***************---------------------------------      
            
             upsert attendeeSetting.settingsforAtt;
        
        }
        
        
        
        
        //  Event Brite Integration Stuff
        
        
        //Global Variables
        
     public list<attendee1> EventbriteAtt{get;set;}
     public String User_key { get; set; }
     public String EventBriteId1 { get; set; }
     public String EventBriteId { get; set; } 
     public List<Event> EventbriteEv{get;set;}
     public boolean displayPopup {get; set;}
     public Boolean eventBritePop1{get;set;}
     public Boolean eventBritePop2{get;set;}
     public Boolean eventBritePop3{get;set;}
     public Boolean eventBritePop10{get;set;} 
     public boolean eventbritepop11{get;set;} 
     public String SelectEventId1 { get; set; }
     public String SelectEventId2 { get; set; }
     public boolean ajaxtest{get;set;}
     public boolean eventBrite4{get;set;}
     public boolean eventbrite5{get;set;}
     public boolean eventBritePop7{get;set;}
     public boolean eventbritepop8{get;set;}
     public boolean eventbritepop9{get;set;}
     public String UserId{get;set;}
     public String BLEventID{get;set;}
     public String EventadminId{get;set;}
     public Event__c EBEvent= new Event__c();
     User_Profile_Event__c UPE = new User_Profile_Event__c();   
     // Accessing EventBrite Event Details
     
     
         public PageReference getEventDetails1() {
        
        //System.debug('@@@@@EventBrite Id'+EventBriteId1);
        
        if(String.isEmpty(EventBriteId1)&& String.isEmpty(User_key)){
          userkeyValid = TRUE;
          eventValidation = TRUE;
          return NULL;
        }
        
        if(String.isEmpty(User_key)){
          userkeyValid= TRUE;
          return NULL;
      }
      
        if(String.isEmpty(EventBriteId1)){
         eventValidation = TRUE;
         return NULL;
        }
        
        
         String URL ='https://www.eventbrite.com/json/event_get?app_key=CNXSCEVA32E6U6REQF&user_key='+User_key+'&id='+EventBriteId1;
          Http h = new Http();
    
    // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint 
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL);
        req.setMethod('GET');
    
    // Send the request, and return a response 
        
        HttpResponse res = h.send(req);
        System.debug('Original Event Body'+res.getBody());
       
        String json1= res.getBody();
      
       
        System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Responsejson1'+json1);
        String json2 = json1.replace('currency','money');
        JSONParser parser = JSON.createParser(json2);
        EventbriteEv= new List<Event>();
          Event EventbriteEvent = new Event();
           while (parser.nextToken() != null) {
                   if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                  (parser.getText() == 'error')) {
                   ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Invalid Input.');
                   ApexPages.addMessage(myMsg);
                  return NULL;
                }
                
                
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'logo')) {
                     parser.nextToken();
                     EventbriteEvent.logo = parser.getText();
                    }
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'description')) {
                     parser.nextToken();
                     EventbriteEvent.description= parser.getText();
                    }
               if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'long_description')) {
                    parser.nextToken();
                   EventbriteEvent.long_description= parser.getText();
                     
                }
                
             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'name')) {
                     parser.nextToken();
                   EventbriteEvent.name= parser.getText();
                 }
       
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'id')) {
                     parser.nextToken();
                    EventbriteEvent.eventBriteId= parser.getText();
                             
                }
                
                
              
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'category')) {
                     parser.nextToken();
                    EventbriteEvent.category= parser.getText();
                     }
             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'category')) {
                    parser.nextToken();
                    EventbriteEvent.category= parser.getText();
                                         
                }
                
                
                 if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'capacity')) {
                     parser.nextToken();
                     EventbriteEvent.capacity= parser.getText();
                }
                
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'capacity')) {
                     parser.nextToken();
                     EventbriteEvent.capacity= parser.getText();

                }
                                    
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'num_attendee_rows')) {
                     parser.nextToken();
                     EventbriteEvent.num_attendee_rows= parser.getText();
                     
                     System.debug('@@@@heloo23'+EventbriteEvent.num_attendee_rows);
                }
                
                
                    
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'title')) {
                   
                    parser.nextToken();
                   
                     EventbriteEvent.title= parser.getText();
                               
                }
                
                
                    
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'start_date')) {
                     parser.nextToken();
                     EventbriteEvent.start_date= parser.getText();
                     
                    }
                
                  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'status')) {
                     parser.nextToken();
                     EventbriteEvent.status= parser.getText();
                   
                }
                
                
                    
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'end_date')) {
                     parser.nextToken();
                     EventbriteEvent.end_date= parser.getText();
                      }
        
              if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'tags')) {
                     parser.nextToken();
                     EventbriteEvent.tags= parser.getText();
                     }
                
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'url')) {
                     parser.nextToken();
                     EventbriteEvent.url= parser.getText();
                     
                }
    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'privacy')) {
                     parser.nextToken();
                     EventbriteEvent.privacy= parser.getText();

                }
               
               
                 if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'privacy')) {
                    parser.nextToken();
                    EventbriteEvent.privacy= parser.getText();
     
                }
                
                  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'modified')) {
                     parser.nextToken();
                     EventbriteEvent.modified= parser.getText();

                }
                
                  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'logo_ssl')) {
                    parser.nextToken();
                    EventbriteEvent.logo_ssl= parser.getText();
    
                }
                
                  if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'repeats')) {
                     parser.nextToken();
                     EventbriteEvent.repeats= parser.getText();     
                }
               
    }
               EventbriteEv.add(EventbriteEvent);
               eventBritePop1=false;
               eventBritePop2=true; 
               eventBrite4=false; 
               showPopup();
               return null;
        }
    
        
        // Attendee Details
        
        
     public PageReference getAttendees() {
     if(SelectEventId1 == null){
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please Select Event'));
     return null;
     }
     String URL ='https://www.eventbrite.com/json/event_list_attendees?app_key=CNXSCEVA32E6U6REQF&user_key='+User_key+'&id='+EventBriteId;

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL);
        req.setMethod('GET');
         HttpResponse res = h.send(req);
         String json1= res.getBody();
         String json2 = json1.replace('currency','money');
     //String jsonStr= '{"attendee":[{"website": "www.globlanest", "first_name": "balaji", "last_name": "j", "home_city": "Secbad", "suffix": "Singh", "event_id": 3135031965, "company": "GlobalnestLLC", "prefix": "Mr.", "blog": "", "work_city": "Secbad", "ticket_id": 13279069, "quantity": 1, "id": 95625983, "job_title": "WebDesigner"}]}';
      // JSONParser parser = JSON.createParser(res.getBody());
            JSONParser parser = JSON.createParser(json2);
            EventbriteAtt = new  list<attendee1>();
       while (parser.nextToken() != NULL) {
            
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
            
                while (parser.nextToken() != NULL) {
    
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                       
             parser.nextToken();parser.nextToken();

          attendee1 inv = (attendee1)parser.readValueAs(attendee1.class);
              EventbriteAtt.add(inv);
                        }
                       
                        parser.skipChildren();
                 
                    }
     
            }
            
     
            }

      
      eventBritePop1= false; 
      
      eventBritePop3=false;
        
       eventBrite4=false;   
        
        eventbrite5=false;
        
        eventBritePop7=true;
        
       eventbritepop8 = true;
       
       eventbritepop9 = false;
        
         
     eventBritePop10 = false;
        
      eventBritePop11 = true;
         
        
        return NULL;
        
        }
    
       //  Saving Event to BoothLeads
    
     //public QR_Event__c EBEvent= new QR_Event__c();
     
     
       
          public PageReference statustest() {
        
        ajaxTest = true;
        
        
        SelectEventId2  =SelectEventId1;
        
            return NULL;
        }
    
    
         
    // EventBrite show Popup
    
    public void EBEpop(){
    
    
      eventBritePop1 = true;
    
       
    }
    
    // EventBriet Attendees Show pop up
    
    public void EBApop(){
    
    
      eventBritePop10= true;
    
       
    }
      
     // pop up details
     
       public void closePopup() {
            displayPopup = false;
        }
     
        public void showPopup() {
            displayPopup = true;
        }
    
     
     public PageReference BoothLeadsSave() {
     
     eventBritePop10 = false;
        
      eventBritePop11 = true;
           
            return NULL;
        
            
        }
    
    
      // EventBriteEvent to BoothLeads Event
    
        
        public PageReference EventToBoothLeads() {
     
        String start;
        String startTime;
        String Enddate;
        String EndTime;
      
            For(Event BLevent:EventbriteEv){
    
            EBEvent.Status__c =  BLevent.status;
            //EBEvent.Eventadmin_Id__c = EventadminId;
            EBEvent.EV_Title__c = BLevent.title;
            EBEvent.EV_Description__c=BLevent.description;
            EBEvent.EV_HostingTimeZone__c= BLevent.timezone;
            EBEvent.EV_HostedByEventBrite__c  = true;
            if(BLevent.start_date !=NULL){
            start = BLevent.start_date;
            String[] startcal=start.split(' ', 2);
           System.debug('@@@@Stringarray'+startcal);
           String startDate5 =startcal[0];
           EBEvent.EV_StartDate__c =date.valueOf(startcal[0]);
           EBEvent.StartTime__c =startcal[1];
          }
    
      if(BLevent.end_date != NULL){
      String end1 = BLevent.end_date;
      String[] end2=end1.split(' ', 2);
      EBEvent.EV_EndDate__c =date.valueOf(end2[0]);
      EBEvent.EV_EndTime__c=end2[1];
     
    }
      System.debug('Adams Marketing'+EBEvent);
       eventBritePop1 = false;
    }
    
         insert EBEvent;
         UPE.EV_id__c = EBEvent.id;
         UPE.User_id__c = UserInfo.getUserId();
         UPE.Profile_id__c ='a0FO0000000yGxt';
         UPE.Status__c =EBEvent.Status__c;
         UPE.UEP_isActive__c=true;
         UPE.EventAdmin_Id__c = UserInfo.getUserId();
         insert UPE;
         System.debug('@@@@@inserted'+EBEvent);
    
        closepopup();
    
        return NULL;
    
        }
    
        
        public List<User_Profile_Event__c> EventBriteEvents{get;set;}
    
        public List<SelectOption> getSelectEventId(){
    
        EventBriteEvents = [Select EV_id__r.id,EV_id__r.EV_Title__c from User_Profile_Event__c where User_id__r.id=:UserInfo.getUserId()];
      
        if(EventBriteEvents.size()==1 && EventBriteEvents[0].EV_id__r.id == NULL ){
        
        Options.add(new SelectOption('None','None'));
    
        } 
        
      
        else{
        for(User_Profile_Event__c EV:EventBriteEvents){
        
         Options.add(new SelectOption(EV.EV_id__r.id,EV.EV_id__r.EV_Title__c));
       
        }
        
      
      
        } 
    
      return Options;
    
    }
    
    
    public pagereference EventClose1(){
    
    eventBritePop10= false;
    
    return NULL;
    
    }
    
    
    public pagereference cancelEvent(){
    
    
      eventBritePop1 = false;
    
    return NULL;
    }
    
    
     List<SelectOption> options = new List<SelectOption>();
    
    
     public Set<String> ComarisonSet = new Set<String>(); 
    
    
     public List<attendee1> selectedAttendees = new List<attendee1>();
     
     
     public List<AttendeeSummary__c>  savedAttendees = new List<AttendeeSummary__c>();
     
     
     public  transient    Database.UpsertResult[] AttendeeUpsert;
    
     public List<Event_Attendee_Mapping__c> selectedEA = new List<Event_Attendee_Mapping__c>();
    
    
      public pagereference EventClose(){
      
      eventBritePop2 = false;
       return NULL;
        
      }
    
    public pagereference EventClose2(){
    
    eventbritepop11 = false;
    
    return NULL;
    }
    
    
    
       public pagereference attendeedetail(){
       
       
      
       
       System.debug('@@@@@strNamesmult'+strNamesmult);
       String[] Splitstr = strNamesmult.split(',');
       
       
       System.debug('@@@@@Splitstr'+Splitstr.size());
       
      
       
       for(String str :Splitstr ){
       
       
       SYstem.debug('@@@Splitstrforllop'+str);
     
       ComarisonSet.add(str);
       
        }
       
       for(attendee1  EvAtt:EventbriteAtt ){
       
       if(ComarisonSet.contains(EvAtt.id)){
       
       
       AttendeeSummary__c NewAtt = new AttendeeSummary__c();
       
       NewAtt.AS_FirstName__c = EvAtt.first_name;
       
       NewAtt.AS_LastName__c = EvAtt.last_name;
       
       NewAtt.AS_Email__c  = EvAtt.email;
       
       NewAtt.AS_Gender__c = EvAtt.gender;
       
        NewAtt.AS_Company__c = EvAtt.company;
        
        
        
       // if(EvAtt.age!=NULL){
        //system.debug('@@@@@EvAtt.age'+EvAtt.age);
        
       // NewAtt.AS_Age__c = Integer.valueOf(EvAtt.age);
       // }
        
        // if(EvAtt.birth_date!= NULL){
       // NewAtt.AS_BirthDate__c =Date.ValueOf(EvAtt.birth_date); 
        //}
        NewAtt.AS_Suffix__c = EvAtt.suffix;
        
        NewAtt.AS_Prefix__c = EvAtt.prefix;
        
        NewAtt.AS_Title__c = EvAtt.job_title;
        
        NewAtt.AS_CellPhone__c = EvAtt.cell_phone; 
        
          NewAtt.AS_CellPhone__c = EvAtt.cell_phone; 
          
            NewAtt.AS_CellPhone__c = EvAtt.cell_phone; 
            
                NewAtt.AS_WorkAddress1__c = EvAtt.work_address; 
                NewAtt.AS_WorkAddress2__c = EvAtt.work_address_2; 
                NewAtt.AS_WorkState__c = EvAtt.work_region; 
                NewAtt.AS_WorkPhone__c = EvAtt.work_phone; 
                //if(EvAtt.work_postal_code != NULL){
                //NewAtt.AS_WorkZipCode__c = Integer.valueOf(EvAtt.work_postal_code); 
                
               // }
                NewAtt.AS_WorkCity__c = EvAtt.work_city; 
                NewAtt.AS_WorkCountry__c = EvAtt.work_country; 
              
              
                NewAtt.AS_ShippingAddress1__c = EvAtt.ship_address; 
                NewAtt.AS_ShippingAddress2__c = EvAtt.ship_address_2; 
                NewAtt.AS_ShippingCity__c = EvAtt.ship_city; 
                NewAtt.AS_ShippingState__c = EvAtt.ship_region; 
                NewAtt.AS_ShippingCountry__c = EvAtt.ship_country; 
                NewAtt.AS_ShippingPhone__c = EvAtt.ship_phone; 
              //  if(EvAtt.ship_postal_code != NULL){
                //NewAtt.AS_ShippingZipcode__c = Integer.ValueOf(EvAtt.ship_postal_code); 
              //}
              
                NewAtt.AS_HomeAddress1__c = EvAtt.home_address; 
                NewAtt.AS_HomeAddress2__c = EvAtt.home_address_2; 
                NewAtt.AS_HomeCity__c= EvAtt.home_city; 
                NewAtt.AS_HomeState__c = EvAtt.home_region; 
                NewAtt.AS_HomeCountry__c = EvAtt.home_country; 
                NewAtt.AS_HomePhone__c= EvAtt.home_phone; 
                
               // if(EvAtt.home_postal_code != NULL){
               // NewAtt.AS_HomeZipcode__c = Integer.valueOf(EvAtt.home_postal_code); 
              //}
              
              
              
                NewAtt.AS_BlogUrl__c = EvAtt.blog; 
                NewAtt.AS_WebsiteUrl__c = EvAtt.website; 
                
                NewAtt.EventBriteCount__c =math.random();
               
              savedAttendees.add(NewAtt); 
       
       //selectedAttendees.add(EvAtt); 
     
       }
      
       }
      
       System.debug('@@@@@savedAttendees'+savedAttendees.size());
       
       
       
        Schema.SObjectField f =AttendeeSummary__c.Fields.AS_Email__c;
        
        
        AttendeeUpsert = Database.upsert(savedAttendees,f,false );
    
       
         System.debug('@@@@@AttendeeUpsert'+AttendeeUpsert.size());
     
      
      
       
       
       for(Database.UpsertResult  ur: AttendeeUpsert ){
       
       
       //if(ur.getId() != NULL){
       
        String AttId = ur.getId();
       
       System.debug('@@@@@urid'+AttId);
       
       
       Event_Attendee_Mapping__c EAM = new Event_Attendee_Mapping__c();
       
       EAM.AS_id__c = AttId;
       
       EAM.EV_id__c =SelectEventId1; 
       
       EAM.Attendee_Event_IDs__c = AttId+SelectEventId1;
       
       EAM.EventBriteCount__c = Math.random();
       
       
       System.debug('@@@@EAM.Attendee_Event_IDs__c'+EAM.Attendee_Event_IDs__c);
       
       selectedEA.add(EAM);
      
     //  }
     
       }
       
         Schema.SObjectField f1 =Event_Attendee_Mapping__c.Fields.Attendee_Event_IDs__c;
       
      
       
       
       Database.upsertResult[]  EAMResult = Database.upsert(selectedEA,f1,false);
       
       
       
       eventbritepop11 = false;
       
       System.debug('@@@@@EAMResult'+EAMResult.size());
      
       return NULL;
     
       
       }
    
      // Event Gathering 
      
        
      public class Event{
      public String name{get;set;}
      public String Event{get;set;}
      public String box_header_text_color{get;set;}
      public String link_color{get;set;}
      public String box_background_color{get;set;}
      public String timezone{get;set;}
      public String box_border_color{get;set;}
      public String logo{get;set;}
      public String long_description{get;set;}
      public String background_color{get;set;}  
      public String id{get;set;}
      public String eventBriteId{get;set;}
      public String category{get;set;}
      public String box_header_background_color{get;set;}
      public String capacity{get;set;}
      public String num_attendee_rows{get;set;}
      public String title{get;set;}
      public String start_date{get;set;}
      public String status{get;set;}
      public String description{get;set;}
      public String end_date{get;set;}
      public String tags{get;set;}
      public String text_color{get;set;}
      public String title_text_color{get;set;}
      public String created{get;set;}
      public String url{get;set;}
      public String box_text_color{get;set;}
      public String privacy{get;set;}
      public String modified{get;set;}
      public String logo_ssl{get;set;}
      public String repeats{get;set;}
      
      //List<Organizer> organizer;
      
      //List<ticket> Ticket;
      
      public Event(){
     
      }
      
      }
    
     
     // Attendee Gathering   
     public class attendee1{
     
     public boolean selected{get;set;}
     public String work_country_code {get;set;}
     public String notes {get;set;}
     public String cell_phone {get;set;}
     public String ship_phone {get;set;}
     public String ship_postal_code {get;set;}
     public String home_region {get;set;}
     public String home_phone {get;set;}
     public String work_address {get;set;}
     public String age {get;set;}
     public String work_address_2 {get;set;}
     public String work_region {get;set;}
     public String ship_address_2 {get;set;}
     public String home_country {get;set;}
     public String home_address_2{get;set;} 
     public String ship_city {get;set;}
     public String work_phone {get;set;}
     public String gender{get;set;}
     public String ship_region {get;set;}
     public String home_address{get;set;}
     public String work_postal_code {get;set;}
     public String discount {get;set;}
     public String event_date{get;set;}
     public String affiliate{get;set;}
     public String barcode{get;set;}
     public String money{get;set;}
     public boolean isSelected{get;set;}
     public string website {get;set;}
     public String first_name{get;set;}
     public String home_city {get;set;}
     public String last_name{get;set;}
     public string suffix {get;set;}    
     public string company{get;set;}
     public String  event_id{get;set;}
     public String created{get;set;}
     public String prefix{get;set;} 
     public String  blog {get;set;}
     public String order_id {get;set;}
     public String work_city{get;set;}
     public String home_country_code {get;set;}
     public String  email{get;set;}
     public String ship_country {get;set;}
     public String modified{get;set;}
     public String amount_paid {get;set;}
     public String order_type{get;set;}
     public String ticket_id{get;set;} 
     public Integer quantity{get;set;} 
     public String home_postal_code{get;set;}
     public String id{get;set;} 
     public String ship_address {get;set;}
     public String job_title{get;set;} 
     public String ship_country_code {get;set;}
     public String birth_date {get;set;}
     public String work_country{get;set;}
     public boolean eventBrite4{get;set;}
     
     public attendee1(String web,String first,String last,String home,String suff,String comp,String eid,String pref,String blog,String work,String ticket,Integer qua,String id,String jid,String order,String gender1,String age1){
    
     selected=false;
     website =web;
     
     first_name=first;
     
     
     last_name= last;
     
     order_type=order;
     
    
     
     suffix = suff; 
     
     
     company = comp;
      
     
      event_id= eid;
      
      prefix=pref;
      
      
      blog=blog;
     
      work_city = work;
      
      ticket_id= ticket;
    
      quantity =qua;
      
      id=id;
      
      job_title=jid;
      
       gender = gender1;
       
       
       age = age1;
      
      
     }
     
      
     
     }
      
      public PageReference checkUserId() {
           
           if(userInfo.getUserType()=='guest'){
                Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
                pg.setredirect(true);
                return pg;
           } else{
                return NULL;
           }     
          
      }
       
        
        
    
    }