public with sharing class Attendee_Details_PrintCon {

public boolean search{get;set;}
public Attendee_Details_PrintCon()
{
AttendeeInf= false;
search=true;
EventId= Apexpages.currentPage().getParameters().get('Id');
system.debug('^^^^^^^^^^^^^^^^^^^^^^^'+EventId);
Attendee =[select id,EV_id__r.EV_Title__c,EV_id__r.EV_EventLogo__c
         from Event_Attendee_Mapping__c where EV_id__c=:EventId limit 1];

}

public String EventId{get; set;}
public String AttendeeEmail{get; set;}
public Event_Attendee_Mapping__c Attendee {get; set;}
public boolean AttendeeError{get;set;}
public boolean AttendeeInf{get;set;}





public pagereference CheckAttendee()
{
try{

Attendee =[select id,EV_id__r.EV_Title__c,EV_id__r.EV_EventLogo__c,AS_id__r.AS_Email__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,
         AS_id__r.AS_HomePhone__c,AS_id__r.AS_CellPhone__c from Event_Attendee_Mapping__c where (AS_id__r.AS_Email__c =:AttendeeEmail) AND (EV_id__c=:EventId)];
AttendeeError= true;
AttendeeInf= false;
pagereference pg=page.quickregistration;


return pg;
}catch(Exception E)
{
AttendeeError= true;
AttendeeInf= false;
}
return null;
}

public pagereference PrintAttendee()
{

pagereference pg= page.Attendee_Print;
//pg.setRedirect(true);
//pg.getParameters().put('id',Attendee.Id); 
return pg;
}

}