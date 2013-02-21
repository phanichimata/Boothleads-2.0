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
**************************************************************************************************/

public class QRCode_EventScheduleCon {

    

        
       public LIST<EventSchedule__c> eventscheduleDB{get; set;}
       public LIST<ScheduleInner> sc{get; set;} 
       public LIST<Time> oralTime{get; set;}
       public LIST<ScheduleInner> eventSchedule{get; set;}
       public Boolean addScheduleBool{get; set;}   
       public Boolean editScheduleBool{get; set;}
      
       public EventSchedule__c addSch{get; set;}
       public EventSchedule__c editsch{get; set;}
       public LIST<selectOption>remainingTime{get; set;}
       public Boolean bb{get; set;}
       public LIST<LIST<String>> editTimings{get; set;}
       public LIST<SelectOption> editvalues{get; set;}
       
       public LIST<SelectOption> editStartTime{get; set;}
       public LIST<SelectOption> editEndTime{get; set;}
       
       public Boolean editDisabled{get; set;}
       
       public QRCode_EventScheduleCon(){
       
         
         eventscheduleDB  = new LIST<EventSchedule__c>();
         addSch = new EventSchedule__c();
         remainingTime = new LIST<selectOption>();
         oralTime = new LIST<Time>();
         editTimings = new LIST<LIST<String>>();
         bb = TRUE;
         editDisabled = TRUE;
        getScheduleforEvent();
        
       
       }        
        
       public void getScheduleforEvent() {
             
         id eventid = ApexPages.currentpage().getparameters().get('event');
         eventscheduleDB =[SELECT ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE EV_id__c =: eventid ORDER BY ES_StartTime__c ];
          
         List<Schema.PicklistEntry> F = EventSchedule__c.ES_StartTime__c.getDescribe().getPicklistValues();
          
        Event__c ev = [SELECT ID,EV_EndDate__c,EV_EndTime__c,EV_StartDate__c,StartTime__c FROM Event__c WHERE ID =:ApexPages.currentpage().getparameters().get('event')  ];
       
         
        integer check = 0;
        LIST<String> timeval = new LIST<String>();
        eventSchedule = new LIST<ScheduleInner>();
        EventSchedule__c newsch = new EventSchedule__c();
        Boolean bb = FALSE;
        
        LIST<String> mytime = new LIST<String>();
        LIST<String> innerVal = new LIST<String>();
       // editTimings 
        for(Schema.PicklistEntry pi: F){
        
             
            
            system.debug('BBBBBBBBBBBBBBBBBBBBBB'+ eventscheduleDB);
            
           system.debug('6666666666666  '+ pi.getLabel());
           system.debug('7777777777777  '+ eventscheduleDB[check].ES_StartTime__c);
           system.debug('5555555555555  '+ eventscheduleDB[check].ES_EndTime__c +'     '+  !bb );
           system.debug('4444444444444  '+ pi.getLabel() +'  '+ eventscheduleDB[check].ES_StartTime__c );
         if(!eventscheduleDB.isEmpty()){
         
           if( (pi.getLabel() == eventscheduleDB[check].ES_StartTime__c) && !bb )    
            {
               system.debug('$$$$$$$$$$$$$$$$$'+ timeval.size());
             // if(!timeval.isEmpty()){
                   timeval.add(pi.getLabel());
                   mytime.addAll(timeVal);
                   
                   if(timeval.size() != 1 )
                   eventSchedule.add(new ScheduleInner(timeval,false,newsch )); 

                   editTimings.add(timeval);
                   innerVal = new LIST<String>();
                   
                   timeval = new LIST<String>();
                   timeval.add(pi.getLabel());
                   
                   bb = TRUE;
                   
               // }
                
                
            }
            else{
                timeval.add(pi.getLabel());
                innerVal.add(pi.getLabel());
            }
            
            
            // To put Recorded Values
            if((pi.getLabel() == eventscheduleDB[check].ES_EndTime__c) && bb )
            {
               // timeval.add(pi.getLabel());
               if(timeval.size() != 1 )
                eventSchedule.add(new ScheduleInner(timeval,TRUE,eventscheduleDB[check] ));
                
                  // editTimings.add(timeval);
                  // innerVal = new LIST<String>();
                 
                 
                   system.debug('999999999999999999999999'+eventSchedule.size());
                   timeval = new LIST<String>();
                   timeval.add(pi.getLabel());
                   if(eventscheduleDB.size() > check+1)
                   {
                       if(eventscheduleDB[check+1].ES_StartTime__c == pi.getLabel() )
                       {
                           bb = TRUE;
                           check++;
                       }else {
                           bb = FALSE;
                           check++;
                       }
                   }
            }
            
            
            
        }else{
            timeval.add(pi.getLabel());
            innerVal.add(pi.getLabel());
        }
       } 
        if(!timeval.isEmpty() && timeval.size() != 1 ){
        
            eventSchedule.add(new ScheduleInner(timeval,false,newsch )); 
            mytime.addAll(timeval);
            
            editTimings.add(timeval);
            innerVal = new LIST<String>();
            
        }
        
        
         for(String st: mytime)
         {
             remainingTime.add(new selectOption(st,st));
         }
     system.debug('AAAAAAAAAAAAAAAAAAAAAA'+ eventSchedule);
        }
       
       
       public void AddSchedule(){
           
           system.debug('999999999999999999999999 check');
           addSch = new EventSchedule__c();
           addScheduleBool = TRUE;
       }
       
       public void editSchedule(){
           
           //remainingTime = new LIST<selectOption>();
           
           editStartTime = new LIST<selectoption>();
           editEndTime = new LIST<selectoption>();
           
           editDisabled = FALSE;
           
           editsch = [select ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE id =: ApexPages.currentpage().getparameters().get('editSch') ];
           editScheduleBool = TRUE;
           
           List<Schema.PicklistEntry> F = EventSchedule__c.ES_StartTime__c.getDescribe().getPicklistValues();
         Boolean editedTimeValStart = FALSE;
         Boolean editedTimeValEnded = TRUE;
         String EndTimeForEdit =editsch.ES_EndTime__c;
         
           for(Schema.PicklistEntry sy: F ){
               
               if(sy.getLabel() == editsch.ES_StartTime__c)
                   editedTimeValStart = TRUE;
                   
                   if(sy.getLabel() == editsch.ES_EndTime__c)
                          editedTimeValEnded = FALSE;
                   if(editedTimeValStart && editedTimeValEnded )    
                          editStartTime.add(new selectOption(sy.getLabel(),sy.getLabel()));         
           }
           
            system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ editStartTime);
           
          
           Boolean Choosebool= FALSE;
           
          // -------------------------------------------------
           
           for(LIST<String> s12: editTimings ){
                   
                   SET<String> setEdit = new SET<String>();
                   
                   setEdit.addAll(s12);
                   system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ setEdit );
                   
                   if(setEdit.contains(EndTimeForEdit))
                    {
                        system.debug('#################################'+ setEdit.contains(addSch.ES_StartTime__c) );
                        
                        for(String sss: s12)
                        {
                            
                               if(sss == EndTimeForEdit)
                               {
                                   Choosebool = TRUE;
                                   
                                   system.debug('3333333333333333333333333'+ remainingTime );
                               }
                               if(Choosebool)
                               {
                                   
                                   editStartTime.add(new SelectOption(sss,sss ));
                               }
                            
                        }
                    
                    }
                   
               }
           // --------------------------------------------------
           
           
           editEndTime = editStartTime;
           
           
           
           
           // getScheduleforEvent();
           
           system.debug('hellooooooooooooo'+ ApexPages.currentpage().getparameters().get('editSch') );
           
           
       
       }
       
      public void SaveSchedule(){
          
          addSch.EV_id__c = ApexPages.currentpage().getparameters().get('event');
          DataBase.Upsert(addSch);
          getScheduleforEvent();  
          addScheduleBool =FALSE;
          addSch = new EventSchedule__c();
      }  
      
      
      public void cancelSchedule(){
      
          addScheduleBool = FALSE;
          editScheduleBool = FALSE;
      
      }
       
      
      public void deleteSchedule(){
      
          system.debug('hellooooooooooooo   '+ApexPages.currentpage().getparameters().get('deleteSch') );
          
          EventSchedule__c delSch = [select ES_StartTime__c,id, ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE id =: ApexPages.currentpage().getparameters().get('deleteSch') ];
           
          Database.Delete(delSch);
         // Delete delSch;
          getScheduleforEvent();
          
          
      }
      
        
        public class ScheduleInner{
        
            public LIST<String> stime{get; set;}
            public EventSchedule__c  schedule{get; set;}
            public String color{get; set;}
            public String stylecls{get; set;}
            public id eventschid{get; set;}
            //public String height{get; set;}
            public Boolean noVal{get; set;}
            
            public LIST<selectoption> remTime{get; set;} 
            // public Integer eTime{get; set;}
             
            public ScheduleInner(List<String> stime, Boolean noVal, EventSchedule__c sch){
                
                              
                
                this.stime = stime;            
                schedule=sch;
                this.noVal = noval;
                this.eventschid = sch.id;
                if(!noVal){
                    this.color = '#FFFFFF;Font-weight:BOLD; background-color:#C0C0C0; border:0px; width:50px; -webkit-border-radius:3px;  -moz-border-radius:3px;';
                }else{
                    this.color = '#FFFFFF;Font-weight:BOLD; background-color:#87CEEB; border:0px; width:50px; -webkit-border-radius:3px;  -moz-border-radius:3px;';
                    stylecls = 'roundedcorner';
                    
                }
                //height = 'height:'+ stime.size() +';';
                
            }
            
        }
        
        
       
       public void actionStatusForTime(){
       
           Boolean Choosebool = FALSE;
           bb = FALSE;
           LIST<String> justforinner = new LIST<String>();
           editvalues = new LIST<SelectOption>();
           
       /**    for(SelectOption st: remainingTime){
               
               String mystr = String.valueOf(st.getlabel());
               system.debug('1111111111111111111111111111'+ mystr );
               system.debug('2222222222222222222222222222'+ editTimings );
               if(mystr == addSch.ES_StartTime__c)
               {
                   Choosebool = TRUE;
                   
                   system.debug('3333333333333333333333333'+ remainingTime );
               }
               if(Choosebool)
               {
                   justforinner.add(mystr);
                   
               }
               
               system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+ editTimings );
               
           }*/
           
           Choosebool =FALSE;
           for(LIST<String> s12: editTimings ){
                   
                   SET<String> setEdit = new SET<String>();
                   
                   setEdit.addAll(s12);
                   system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ setEdit );
                   
                   if(setEdit.contains(addSch.ES_StartTime__c))
                    {
                        system.debug('#################################'+ setEdit.contains(addSch.ES_StartTime__c) );
                        
                        for(String sss: s12)
                        {
                            
                               if(sss == addSch.ES_StartTime__c)
                               {
                                   Choosebool = TRUE;
                                   
                                   system.debug('3333333333333333333333333'+ remainingTime );
                               }
                               if(Choosebool)
                               {
                                   
                                   editvalues.add(new SelectOption(sss,sss ));
                               }
                            
                        }
                    
                    }
                   
               }
               
           system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'+ editvalues );
           
       }
       
        
       public void EditActionSupport(){
          
          Boolean editendtimeBool = FALSE;
          editEndTime = new LIST<SelectOption>();
          editDisabled = FALSE;
          for(SelectOption op:editStartTime)
          {
               if(op.getLabel() == editsch.ES_StartTime__c){
                editEndTimeBool = TRUE;
               }
               if(editEndTimeBool){
                    editEndTime.add(op);
               }
          
          }
       
       
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
            pagereference pg = new Pagereference('/apex/BL_EventAdmin_Booths');
            pg.setredirect(true);
                return pg;
        }

        Public PageReference ProfileSettings()
        {
            Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
            Pg.setredirect(true);
            Return pg;
        }   
   
        
}