public class Attendee_Details_PrintCon1 {

    public PageReference PrintAttendee() {
        return null;
    }

public Attendee_Details_PrintCon1()
{
AttendeeInf= true;

EventId= Apexpages.currentPage().getParameters().get('Id');
system.debug('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'+EventId);


}
public String EventId{get; set;}
public String AttendeeEmail{get; set;}
public Event_Attendee_Mapping__c Attendee {get; set;}
public boolean AttendeeError{get;set;}
public boolean AttendeeInf{get;set;}



}