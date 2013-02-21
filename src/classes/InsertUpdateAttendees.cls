public with sharing class InsertUpdateAttendees {

    Public InsertUpdateAttendees(){
        AddAttendee = new  AttendeeSummary__c();
        JunctionAtt = new  Event_Attendee_Mapping__c ();  
    }
    Public String SelectEvent{get;set;}
    Public AttendeeSummary__c AddAttendee{get;set;}
    Public string Error {get;set;}
    Public Boolean DisplayError{get;set;}
    Public Event_Attendee_Mapping__c JunctionAtt {get;set;} 
    
    
    Public List<selectOption> getEvents(){
    List<selectOption> Event = new List<selectOption>();
   
    //string ss = userInfo.getUserName();
    
    LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
    events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c  FROM  User_Profile_Event__c 
                                                           WHERE  EventAdmin_Id__c != '' And
                                                           User_id__c =: '005O0000000bZwA' And
                                                           EventAdmin_Id__c =: '005O0000000bZwA' ORDER BY CreatedDate ASC];
         system.debug('++++++++++++++++'+events );
     
      if(!events.isEmpty())
       {
           
           for(User_Profile_Event__c Even: events)
           {
            system.debug('+++++++Events+++++++++'+even );
               if(Even.EV_id__c != null){
               Event.add(new SelectOption(Even.EV_id__c, Even.EV_id__r.EV_Title__c));
               SelectEvent = Even.EV_id__c;
               system.debug('++++++++++++++++'+Event );
               }
           }
       }     
    return Event;
    
    }
    Public string Email{get;set;}
    
    Public void Saveattendee(){
        
        List<AttendeeSummary__c> A = [select id from AttendeeSummary__c where AS_Email__c =: AddAttendee.AS_Email__c];
        system.debug('------------------@@@@@@@@@@@@@@@'+A);
        
        Email = AddAttendee.AS_Email__c;
       system.debug('-------*********************-------'+Email );
        
        if(A.size() > 0){
        
        List<Event_Attendee_Mapping__c> Event_A = [select id from Event_Attendee_Mapping__c 
                                                   where AS_id__r.AS_Email__c =: Email AND EV_id__c =: SelectEvent ];   
        system.debug('------------------@@%%%%%%%%%%%%%@@@@@@@@'+Event_A );
        if(Event_A.size () > 0){
            DisplayError = True;
            Error = 'Already Exist';
        } else{
        
               JunctionAtt.AS_id__c = A[0].Id; 
               JunctionAtt.Ev_id__c = SelectEvent ;
               
               Database.SaveResult myAttendeeJunction = Database.Insert(JunctionAtt,false);   
               system.debug('---!!!!!!!!!!!!!!!!!!!!---'+myAttendeeJunction );        
        
        }                                                                
        }
        else{
        AttendeeSummary__c InsertAttendee = new AttendeeSummary__c ();
        InsertAttendee  = AddAttendee.clone(true);
        Database.UpsertResult myAttendeeSaveResult = Database.upsert(InsertAttendee,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField(), false);
        system.debug('--------------------------------'+myAttendeeSaveResult );
        if(myAttendeeSaveResult.isSuccess() ){
        
            if(myAttendeeSaveResult.iscreated()){
            
            JunctionAtt.AS_id__c = myAttendeeSaveResult.getId(); 
            JunctionAtt.Ev_id__c = SelectEvent ;
            
            Database.SaveResult myAttendeeJunction = Database.Insert(JunctionAtt,false);
    
            
            
            }
        
        }
        }
    
    }
}