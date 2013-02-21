/***********************************************************************************************
*   Controller Name : QRCode_EventScheduleCon
*   Date            : 24/07/2012 
*   Author          : Naga Mallikarjuna Rao B
*   Purpose         : This class is for Schedule the Event
*   Change History  : 
*
*       Date                 Programmer                     Reason
*   --------------      -------------------           -----------------------
*    25/07/2012                BMR                         Not Completed
*    26/07/2012                BMR                         Not Completed
*    27/07/2012                BMR                         Not Completed
*    30/07/2012                BMR                         Not Completed
*    31/07/2012                BMR                         Requirement changed to Multiple Programmes 
*                                                          can able to add Based on Time
*    01/08/2012                BMR                         NOT COMPLETED 
*    02/08/2012                BMR                         New Disign 
**************************************************************************************************/

public class QRCode_EventScheduleNewCon {


       public LIST<EventSchedule__c> eventscheduleDB{get; set;}
      
       public ID eventid{get; set;}
       
       public Boolean addScheduleBool{get; set;}   
       public Boolean editScheduleBool{get; set;}
       public Boolean detailScheduleBool{get; set;}
       public Boolean addScheduleBool1{get;set;}
       
       public String eventname{get; set;}
       public String ScheduleHeading{get; set;}
       
       public EventSchedule__c addSch {get;set;}
       public EventSchedule__c editsch{get; set;}
       
       public LIST<SelectOption> StartTimings{get; set;}
       public LIST<SelectOption> EndTimings{get; set;}
       Public LIST<SelectOption> EventDate{get; set;}
       public Boolean editDisabled{get; set;}
      
       public String ProgramName{get; set;}
       public String Location{get; set;}
       public String Presenter{get; set;}
       public String Notes{get; set;}
       public String EventStartDate{get; set;}
       public String EventEndDate{get; set;}
       
       
       
       public QRCode_EventScheduleNewCon(){
       
       
       
       
       addSch = new EventSchedule__c(); 
       
         eventscheduleDB = new LIST<EventSchedule__c>();
         StartTimings = new LIST<SelectOption>();
         EndTimings = new LIST<SelectOption>();
         EventDate = new LIST<SelectOption>();
         
         eventid = ApexPages.currentpage().getparameters().get('event');  
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
            
        
        }else{
            Date d = event.EV_StartDate__c;
            EventDate.add(new SelectOption(String.valueOf(d),String.valueOf(d)));
        
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
      
      
      public void cancelSchedule(){
      
          addScheduleBool = FALSE;
          detailScheduleBool = FALSE;
      }
       
      
      public void deleteSchedule(){
      
          
           system.debug('1111111111111   '+ eventname );
           EventSchedule__c delsch =[SELECT ID FROM EventSchedule__c WHERE ID =:eventname];
           DataBase.delete(delsch);
             getScheduleforEvent();
      }
      
      public void getEventDetails(){
      
         
          
          editsch = [SELECT ES_StartDate__c,ES_EndDate__c,name,ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE ID =: eventname ];
          detailScheduleBool = TRUE;
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
      
      
        
        
        
       public PageReference DashBoard() {
        Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Dashboard');
        Pg.setredirect(true);
        return pg;
      
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
       
       
       

   static testMethod void myUnitTest() {
   
       Event__c event = new Event__c(EV_Title__c = 'Test Event', StartTime__c = '09:00 AM', EV_EndTime__c='09:00 PM',EV_StartDate__c = Date.newInstance(2012,05,01),EV_EndDate__c = Date.newInstance(2012,05,01) );
       
       EventSchedule__c eventsch = new EventSchedule__c(ES_ProgramName__c = 'Test Schedule', ES_Presenter__c='TEST Presenter',ES_StartDate__c=Date.newInstance(2012,05,01),ES_EndDate__c = Date.newInstance(2012,05,01),ES_StartTime__c='09:00 AM', ES_EndTime__c='09:30 AM' );
       
       insert event;
       insert eventsch;     
       System.currentPageReference().getParameters().put('event', event.id);
       
      QRCode_EventScheduleNewCon unit = new QRCode_EventScheduleNewCon();
       
       
       unit.AddSchedule();
       unit.eventname= eventsch.id;
       
     // System.currentPageReference().getParameters().put('eventname', event.id);
     system.debug('testttttttttttttt'+ unit.eventname );
     system.debug('ssssssssssssssssss'+ event.id );
       unit.editSchedule();
       unit.SaveSchedule();
       unit.cancelSchedule();
       unit.getEventDetails();
       unit.ProfileSettings();
       unit.CustomerAdminAct();
       unit.reportact();
       unit.Attendees();
       unit.Events();
       unit.deleteSchedule();
       
       
   }

}