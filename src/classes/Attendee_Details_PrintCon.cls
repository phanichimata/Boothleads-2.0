public with sharing class Attendee_Details_PrintCon {
public boolean logo{get;set;}
public boolean search{get;set;}
public pagereference refresh()
{
system.debug('jjjjjjjjjjjjjjjjjjjjjjjjjjj');
pagereference pg=new pagereference('/apex/Attendee_Details_Print?id='+EventId);
pg.setredirect(true);
return pg;
}

public Attendee_Details_PrintCon()
{
try{
AttendeeInf= true;
search=true;
EventId= Apexpages.currentPage().getParameters().get('Id');
//'a0EO0000002p2V2';
// 
Attendee =[select id,EV_id__r.EV_Title__c,EV_id__r.EV_EventLogo__c
         from Event_Attendee_Mapping__c where EV_id__c=: EventId limit 1];
 }catch(exception e){}        
}

public String EventId{get; set;}
public String AttendeeEmail{get; set;}
public Event_Attendee_Mapping__c Attendee {get; set;}
public boolean AttendeeError{get;set;}
public boolean AttendeeInf{get;set;}

public pagereference  printquickbadge(){

return null;
}


public boolean show{get;set;}
public pagereference CheckAttendee()
{
try{

Attendee =[select id,EV_id__r.EV_Title__c,EV_id__r.EV_EventLogo__c,AS_id__r.AS_Email__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,
         AS_id__r.AS_HomePhone__c,AS_id__r.AS_CellPhone__c,EA_AttendeeBarcode__c,TicketTypes__c,EA_isBadgePrinted__c,AS_id__r.AS_Title__c  from Event_Attendee_Mapping__c where (AS_id__r.AS_Email__c =:AttendeeEmail) AND (EV_id__c=:EventId)];

AttendeeError= false;
AttendeeInf= false;
system.debug('sssssssssssssssssssssss'+attendee.id);
//show =true;
if(Attendee.EA_isBadgePrinted__c == false){
pagereference pg=page.quickregistration;
//pg.setredirect(true);
return pg;
}else{
show=true;
}

}catch(Exception E)
{
pagereference pg=new pagereference('/apex/quicksave_and_print?id='+EventId+';'+AttendeeEmail);
return pg;
}
return null;
}

public pagereference PrintAttendee()
{
Attendee.EA_isBadgePrinted__c = true;
update attendee;
//Apexpages.currentPage().getHeaders().put('content-disposition', 'attachment; filename=AttendeeBadges.pdf');
system.debug('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
pagereference pg= page.Attendee_Print;
return pg;
}

}