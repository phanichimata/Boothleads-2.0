public class EventDetailCon {

  

    public EventDetailCon(ApexPages.StandardController controller) {
    }
        
    public Event__c event{get; set;}

    public Boolean recordPermissions{get; set;}
   
    public BL_SecuritySettingsCon attendeesetting{get; set;}
    public Boolean updateAttendeeSettingBool{get; set;}
    public LIST<SelectOption> StartTimings{get; set;}
    public LIST<SelectOption> EndTimings{get; set;}
    public LIST<SelectOption> EventDate{get; set;}
    public Boolean detailScheduleBool{get; set;}
    public Boolean addScheduleBool{get;set;}
    public Boolean eventScheduleBool{get; set;}
    public String eventname{get; set;}
    public String ScheduleHeading{get; set;}
    public String EventStartDate{get; set;}
    public String EventEndDate{get; set;}
    public Integer RegNumber{get; set;}
    public String DivercityStringError{get; set;}
    public Boolean DivercityStringErrorBool{get; set;}
    
    public List<Selectoption> Diversity{get; set;}
    public List<Selectoption> SelectedDiversity{get; set;}
    public String extraDiv{get; set;}
    public MAP<String, String> DiversityMap{get; set;}
    public MAP<String, String> DiversityCustomMap{get; set;}
        
    public ID eventid{get; set;}
    public USER uu{get; set;}
    public LIST<EventSchedule__c> eventscheduleDB{get; set;}
    public EventSchedule__c addSch {get;set;} 
    public EventSchedule__c editsch{get; set;}
    
    
    // TICKET TYPES CODE
     public LIST<TicketTypes__c> ticketTypes{get; set;}
     public LIST<innerForTicketTypes> innerTickets{get; set;}
     public Boolean noTicketTypeBool{get; set;}
     public Map<ID, TicketTypes__c> ticketTypeMap{get; set;}
     public LIST<String> TicketTypeDelete{get; set;}
     
    public Pagereference abc(){
        
       if(userInfo.getUserType()=='guest'){
            Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
            pg.setredirect(true);
            return pg;
       } else{
            
      
        Commanforstates  utillCommanforstates = new Commanforstates();
        
         uu = [SELECT ID, Event_Detail_help__c,EventDetail_DIVs_Help__c FROM USER WHERE id =: UserInfo.getUserId()];
    
    
      system.debug('555555555555555555555555555555555'+ uu.Event_Detail_help__c);
        
        event = new Event__c();
         
         event = [SELECT id,EV_Description__c,EV_EndDate__c,EV_EndTime__c,EV_HistingAddr1__c,OwnerId,
                        EV_HostedByEventBrite__c,AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountry__c,EV_HostingFax__c,
                        EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingState__c,
                        EV_HostingTimeZone__c,EV_HostingZipcode__c,Primary__c,SecondaryCategory__c,EV_StartDate__c,StartTime__c,Status__c,EV_Publish__c,
                        EV_Title__c,EV_WebsiteURL__c,EV_EventLogo__c,EV_HostingCountryNew__c,EV_HostingStateNew__c,Event_ZipCode__c,EventDiversityValues__c
                            FROM Event__c WHERE ID=: ApexPages.currentpage().getparameters().get('id') ];
       
        event.EV_HostingStateNew__c = utillCommanforstates.mapstate(event.EV_HostingStateNew__c);
        event.EV_HostingCountryNew__c =utillCommanforstates.mapstate(event.EV_HostingCountryNew__c );
        
        
        if(event.OwnerId == UserInfo.getUserId()){
         
         recordPermissions = TRUE;
        }
        
        
        updateAttendeeSettingBool = FALSE;
        eventScheduleBool = FALSE;
       // updateAttendeeSettingBool = TRUE;
        DivercityStringErrorBool = FALSE;
        
        Diversity = new List<Selectoption>();
        DiversityMap = new MAP<String, String>();
        DiversityCustomMap = new MAP<String, String>();
        
        LIST<String> diversityValues = new LIST<String>();
        if(event.EventDiversityValues__c!=''&& event.EventDiversityValues__c!=NULL){
                diversityValues.addAll((event.EventDiversityValues__c).split(';'));
        
        }
        SelectedDiversity = new List<Selectoption>();
        for(String s: diversityValues){
                system.debug('AAAAAAAAAAA     '+ s);
                SelectedDiversity.add(new Selectoption(s , s ));
                DiversityMap.put(s.toLowercase().replaceAll(' ',''), s);
                
        }

        LIST<DiversityType__c> div = [SELECT Name FROM DiversityType__c WHERE IsValidDiversityType__c =: TRUE ORDER BY CreatedDate];
        
        for(DiversityType__c d: div){
            
           if(!DiversityMap.containsKey(String.valueOf(d.Name).toLowercase().replaceAll(' ','')))
           {
                Diversity.add(new Selectoption(String.valueOf(d.Name), String.valueOf(d.Name) ));
                DiversityMap.put(String.valueOf(d.Name).toLowercase().replaceAll(' ',''), String.valueOf(d.Name));
           }
           
        }
        
       system.debug('6666666666666666666666666666666666'+ SelectedDiversity);
         system.debug('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'+ApexPages.currentpage().getparameters().get('id') );
     
      
      ticketTypeMap = new MAP<ID, TicketTypes__c>([select id,TT_Amount__c,EV_id__c, Avilable_for_Portal__c,TT_Available__c, TT_Limit__c, TT_Name__c FROM TicketTypes__c WHERE EV_id__c =:ApexPages.currentpage().getparameters().get('id') ORDER BY CreatedDate ASC ]);
       innerTickets = new LIST<innerForTicketTypes>();
       TicketTypeDelete = new LIST<String>(); 
           integer num = 0; 
           for(id i: ticketTypeMap.keyset() ) 
           {
               innerTickets.add(new innerForTicketTypes(ticketTypeMap.get(i), num, i));
                
               num++; 
           }
           
           ticketTypes = ticketTypeMap.values();
           
           
                     
            system.debug('1111111111111111   '+ ticketTypes );
            
            
            
            if(ticketTypes.isEmpty())
            {
               noTicketTypeBool = TRUE;
               
              
            }
                 
            
      return null;
     }    
    }
    
    public EventDetailCon(){

       //  attendeeSetting = new BL_SecuritySettingsCon(ApexPages.currentpage().getparameters().get('id'));
       // updateAttendeeSettingBool = TRUE;
    } 
    
    public class innerForTicketTypes
    {
        public TicketTypes__c ticket{get; set;}
        public Integer tno{get; set;}
        public id ticId{get; set;}
        
        public innerForTicketTypes(TicketTypes__c t, Integer i, id idn)
        {
            ticket = t;
            tno = i;
            ticId = idn;
        }
        
        
    }
    public void moreTickets(){
        
        
      
        TicketTypes__c t = new TicketTypes__c();
                t.EV_id__c = ApexPages.currentpage().getparameters().get('id');
       //         ticketTypes.add(t);
       innerTickets.add(new innerForTicketTypes(t, innerTickets.size(), t.id));
                  
         noTicketTypeBool = FALSE;
         
          

    }
    public void delTicketType(){
   
     //  try{ 
         system.debug('1111111111111111111111    '+innerTickets.size()+'  4444    ' + ApexPages.currentPage().getparameters().get('deleteTicketType') ) ;
         
         
         String checkDelTic = ApexPages.currentPage().getparameters().get('deleteTicketTypeid');
         
         if(checkDelTic != NULL && checkDelTic != '')
         {
             TicketTypeDelete.add(checkDelTic);
         }
        innerTickets.remove(Integer.valueOf(ApexPages.currentPage().getparameters().get('deleteTicketType')));
        
        system.debug('2222222222222222222    '+innerTickets.size()) ;
         
        
        if(innerTickets.isEmpty())
        {
               noTicketTypeBool = TRUE;
        }else
        {
            LIST<innerForTicketTypes> listforForloop = new LIST<innerForTicketTypes>();
            listforForloop.addAll(innerTickets);
            
            innerTickets = new LIST<innerForTicketTypes>();
            
            Integer num = 0;
            for(innerForTicketTypes inn: listforForloop)
            {
                innerTickets.add(new innerForTicketTypes(inn.ticket, num, inn.ticId));
              num++;
            }
        
        }
        
        
     //  }catch(Exception e){} 
    
    }
    
    
    public void dontShow(){
    
        uu.Event_Detail_help__c = FALSE;
        
        update uu;
    }
    
    
    
    public void AttendeeSettings(){
    
        attendeeSetting = new BL_SecuritySettingsCon(ApexPages.currentpage().getparameters().get('id'));
        updateAttendeeSettingBool = TRUE;
    
    }
    
    public void UpdateAttendeeSetting(){
            system.debug('11111111111111111111111'+  attendeeSetting.comp  );
          system.debug('2222222222222222222222'+  attendeeSetting.homeinfo );
       

        updateAttendeeSettingBool = FALSE;
   //--------------------------*************   End of REQUIRED Fields  ***************---------------------------------      
          
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
        
        
        
         upsert attendeeSetting.settingsforAtt;
    
       if(!DiversityCustomMap.isEmpty()){
                
                LIST<DiversityType__c> newDiversityType = new LIST<DiversityType__c>();
                for(String s: DiversityCustomMap.values()){
                        DiversityType__c d = new DiversityType__c();
                        d.Name = s;
                        newDiversityType.add(d);
                }
                
                Database.SaveResult[] newDiversityTypeResult = Database.Insert(newDiversityType, false);
       }
       event.EventDiversityValues__c = '';
       system.debug('EEEEEEEEEEEEEEEEEEEE     '+SelectedDiversity );
      for(Selectoption s: SelectedDiversity){
        system.debug('DDDDDDDDDDDDD     '+s );
         event.EventDiversityValues__c += s.getLabel()+';';
      }
      if(event.EventDiversityValues__c.contains(';'))
       event.EventDiversityValues__c = event.EventDiversityValues__c.subString(0,event.EventDiversityValues__c.lastIndexOf(';'));
       
       Database.SaveResult SR = database.update(event);
       
       system.debug('FFFFFFFFFFFFFFFFFF    '+innerTickets );
       
         LIST<TicketTypes__c> tick = new LIST<TicketTypes__c>();
        for(innerForTicketTypes inn: innerTickets)
        {
            tick.add(inn.ticket);
            
            system.debug('TTTTTTTTTTTTTTT     '+inn.ticket.TT_Name__c );
        }
        
       LIST<Database.UpsertResult> ticketTypesResult= Database.upsert(tick, false);
      
        For(Database.UpsertResult tt: ticketTypesResult)
        {
           
           system.debug('UUUUUUUUUUUUUUUUUUUUUUUUU     '+ tt.getErrors() );
           
            if(!tt.isSuccess())
            {
            
            }
        }
        
        
        system.debug('VVVVVVVVVVVVVVVV     '+ TicketTypeDelete);
        
        LIST<TicketTypes__c> tt = [SELECT ID FROM TicketTypes__c WHERE ID IN: TicketTypeDelete ];
        
        DataBase.Delete(tt, false); 
        
        
        
       
        
    }
    
    public LIST<String> ReginputFields{get; set;}
    
    public void generateRegColumns(){
    
       ReginputFields = new LIST<String>();
       
       
       for(integer i=1; i<=RegNumber; i++ )
       {
       
         String nestr;
         
         ReginputFields.add(nestr);
       
       }
    
     system.debug('RRRRRRRRRRRRRRRR');
    
    }
    
    public void viewEventSchedule(){
        
        addSch = new EventSchedule__c(); 
       eventScheduleBool = TRUE;
         eventscheduleDB = new LIST<EventSchedule__c>();
         StartTimings = new LIST<SelectOption>();
         EndTimings = new LIST<SelectOption>();
         EventDate = new LIST<SelectOption>();
         
        eventid = ApexPages.currentpage().getparameters().get('id');  
        detailScheduleBool = FALSE;
        addScheduleBool = FALSE;
        
        Event__c event = [SELECT EV_EndTime__c, StartTime__c, EV_EndDate__c, EV_StartDate__c FROM Event__c WHERE ID =: eventid ];
        
        List<Schema.PicklistEntry> F = Event__c.StartTime__c.getDescribe().getPicklistValues();
         
        Boolean check=FALSE;
        
        Integer st_end_dates = event.EV_StartDate__c.daysBetween(event.EV_EndDate__c);
        
        System.debug('tttttttttttttttttt'+st_end_dates );
        
        if(st_end_dates > 0)
        {
            Date d = event.EV_StartDate__c;
            for(Integer i=0; i<=st_end_dates; i++ )
            {
                EventDate.add(new SelectOption(String.valueOf(d),String.valueOf(d)));
                d+=1;
            }
            
        
        }
        
        for(Schema.PicklistEntry pi: F){
            
            if(pi.getLabel() == event.StartTime__c )
            {
                check = TRUE;
            }
            
            if(check){
                StartTimings.add(new SelectOption(pi.getLabel() , pi.getLabel() ));
                EndTimings.add(new SelectOption(pi.getLabel() , pi.getLabel() ));
            } 
            if(pi.getLabel() == event.EV_EndTime__c )
            {
                check = FALSE;
            }
             
        }
         
        getScheduleforEvent();
        
    
    }
    
    
     
     
     public void getScheduleforEvent(){
             eventscheduleDB =[SELECT ES_EndDate__c,ES_StartDate__c,ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE EV_id__c =: eventid ORDER BY ES_StartTime__c,ES_StartDate__c ];
          
          
              
              for(EventSchedule__c es: eventscheduleDB){
                  
                  if(es.ES_Description__c != NULL)
                      es.ES_Description__c =  escapeSpecialCharacters(es.ES_Description__c);          
                  if(es.ES_Presenter__c!= NULL)
                     es.ES_Description__c = escapeSpecialCharacters(es.ES_Description__c);
                  if(es.ES_Location__c!= NULL)
                      es.ES_Location__c= escapeSpecialCharacters(es.ES_Location__c);
                  if(es.ES_ProgramName__c!= NULL)
                      es.ES_ProgramName__c = escapeSpecialCharacters(es.ES_ProgramName__c);
                  
                  
              }
          
          //detailScheduleBool = TRUE;
    
       }
     public String escapeSpecialCharacters(String s)
      {
      
          
          
        if(s!= null && s!= '' && (s.contains('"') )){
           s = s.replace('"','');
         }
        
        if(s!= null && s!= '' && (s.contains('<') )){
            s= s.replace('<','');
        }
       
        if(s!= null && s!= '' && (s.contains('\\') )){
          
          s= s.replace('\\','');
        }
        
        if(s!= null && s!= '' && (s.contains('\'') )){
          
          s= s.replace('\'','');
        }
      
      
        return s;
      
      
      }  
    
     public void getEventDetails(){
           editsch = [SELECT ES_StartDate__c,ES_EndDate__c,name,ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE ID =: eventname ];
          detailScheduleBool = TRUE;
      }  
    
     public void AddSchedule(){
           
           ScheduleHeading = 'Add Schedule';
           addSch = new EventSchedule__c();
           addScheduleBool = TRUE;

           
       }
     
     public void editSchedule(){
           
           editsch = [SELECT ES_StartDate__c,ES_EndDate__c,name,ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE ID =: eventname ];
          
          system.debug('6666666666666666666666'+  editsch );
           
           ScheduleHeading = 'Edit Schedule';
           addSch =editsch;
           addScheduleBool = TRUE;
           detailScheduleBool = FALSE;
           
       }
    public void deleteSchedule(){
      
          
           system.debug('1111111111111   '+ eventname );
           EventSchedule__c delsch =[SELECT ID FROM EventSchedule__c WHERE ID =:eventname];
           DataBase.delete(delsch);
             getScheduleforEvent();
      }
      
      public void SaveSchedule(){
          
          system.debug('6666666666666666666666    '+addSch);
            
          system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&   '+addSch.ES_ProgramName__c );
          
          addSch.ES_StartDate__c = Date.valueOf(EventStartDate);
          addSch.ES_EndDate__c = Date.valueOf(EventEndDate);
          addSch.EV_id__c = eventid;
          Upsert addsch;
          addScheduleBool = FALSE;
         system.debug('7777777777777777777777    '+ addSch );
          getScheduleforEvent();
          
          
      }  
      
    // This wil fired for all Chaild Pop-up's like add,edit,details
    public void cancel(){        
         updateAttendeeSettingBool = FALSE;
         uu.Event_Detail_help__c = FALSE;
         addScheduleBool = FALSE;
          detailScheduleBool = FALSE;
          
    }
    
    
    // This is Useful for Cancel the Parent POP-UP'S 
    public void CancelSchedule(){
        
        eventScheduleBool = FALSE;
    
    }
    public void disableHelpDivs(){
        
        uu.EventDetail_DIVs_Help__c = FALSE;
        
        update uu;
        
        system.debug('BBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
        
    }
    public void sendValues(){
        System.debug('SSSSSSSSSSSSSSSSS    ');
        
           
       if(!DiversityMap.containsKey(extraDiv.toLowercase().replaceAll(' ',''))){
        SelectedDiversity.add(new Selectoption(extraDiv , extraDiv ));
        DiversityMap.put(extraDiv.toLowercase().replaceAll(' ',''), extraDiv);
        DiversityCustomMap.put(extraDiv, extraDiv);
        extraDiv ='';
        DivercityStringErrorBool = FALSE;
       }else{
         DivercityStringError = 'Diversity Type Is already Exiest';
         DivercityStringErrorBool = TRUE;
       } 
       

    }
    
    public void chooseVisible(){
        string boo = ApexPages.currentPage().getparameters().get('divvisible');
        
        system.debug('FFFFFFFFFFFFFF   '+ boo );
        
    }
    
    
      public PageReference Events () {
        Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Events');
        Pg.setredirect(true);
        return pg;
      
        }
       public PageReference Attendees() {
           Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_Attendees');
                pg.setRedirect(true);
                return pg;
           
        }
        
        public PageReference reportact() {
            
             pagereference pg = new pagereference('/apex/BL_Evntadmreports');
             pg.setredirect(true);
            return pg;
        
            
        }
        
         public PageReference DataImportaction() {
           
         pagereference pg = new pagereference('/apex/QRCode_DataImport?id='+ApexPages.currentpage().getparameters().get('id'));
         pg.setredirect(true);
            return pg;
            
        }
    
        
        public PageReference CustomerAdminAct() 
        {
            pagereference pg = new Pagereference('/apex/BL_Eventadmin_samplebooth');
            pg.setredirect(true);
                return pg;
        }

        Public PageReference ProfileSettings()
        {
            Pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');
            Pg.setredirect(true);
            Return pg;
        }    
        
       public PageReference DashboardAction() {
           pagereference pg = new pagereference('/apex/BL_Eventadmin_Dashboard');
           pg.setredirect(true);
             return pg;
     }
     public PageReference AttendeeRegistration() {
           pagereference pg = new pagereference('/apex/BL_Eventadmin_Register?event='+ApexPages.currentpage().getparameters().get('id'));
           pg.setredirect(true);
             return pg;
     }
    
    
    public PageReference BADashBoard(){
    
    return Null;
    }
    
    public PageReference BAEvents(){
    
    return Null;
    }
    
    
    public PageReference BABoothUsers(){
    
    return Null;
    }
    
    
    public PageReference BALeads(){
    
    return Null;
    }
    
    public PageReference BAReports(){
    
    return Null;
    }
    
   
    
    public PageReference BAQRCodes(){
    
    return Null;
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
}