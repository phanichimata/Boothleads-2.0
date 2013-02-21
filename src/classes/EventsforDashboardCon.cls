public with sharing class EventsforDashboardCon {
    
    Public String LoginUserId{get;set;}
    public List<selectOption> getEvents (){
    List<selectOption> SelEvent = new List<selectOption>();
    List<User_Profile_Event__c> Events = [select id,Ev_id__r.Ev_Title__c,Ev_Id__c from User_Profile_Event__c
                                          where EventAdmin_Id__c =: LoginUserId AND Profile_id__r.PR_Name__c = 'EventAdmin'];
     system.debug(':::::::::::::'+Events );   
     SelEvent.add(new SelectOption('ALL','ALL'));
     for(User_Profile_Event__c EventFromJun : Events){
     
     SelEvent.add(new SelectOption(EventFromJun.Ev_Id__c,EventFromJun.Ev_id__r.Ev_Title__c));
     
     }                                  
     return SelEvent ;
    }
Public string EventString{get;set;}
Public  EventsforDashboardCon (){
//LoginUserId = Userinfo.getUserId();
LoginUserId = '005O0000000ZGnj';
}
}