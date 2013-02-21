public with sharing class Attendee_Details_PrintCon {


public Attendee_Details_PrintCon()
{
AttendeeInf= false;

EventId= Apexpages.currentPage().getParameters().get('Id');
system.debug('^^^^^^^^^^^^^^^^^^^^^^^'+EventId);
}

public String EventId{get; set;}
public String AttendeeEmail{get; set;}
public Event_Attendee_Mapping__c Attendee {get; set;}
public boolean AttendeeError{get;set;}
public boolean AttendeeInf{get;set;}





public void CheckAttendee()
{
try{

Attendee =[select id,AS_id__r.AS_Email__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,
         AS_id__r.AS_HomePhone__c from Event_Attendee_Mapping__c where (AS_id__r.AS_Email__c =:AttendeeEmail) AND (EV_id__c=:EventId)];
AttendeeInf= true;
AttendeeError= false;

}catch(Exception E)
{
AttendeeError= true;
AttendeeInf= false;


}

}

public pagereference PrintAttendee()
{

pagereference pg= page.Attendee_Print;
//pg.setRedirect(true);
//pg.getParameters().put('id',Attendee.Id); 
return pg;
}

}