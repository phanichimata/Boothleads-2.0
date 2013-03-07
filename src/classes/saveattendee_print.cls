public with sharing class saveattendee_print {
    public string showerror {get;set;}
    public boolean DisplayError {get;set;}    
     public pagereference SaveAndPrint() {
   eam= new Event_Attendee_Mapping__c();
   eam1= new Event_Attendee_Mapping__c();
   Savepoint sp = Database.setSavepoint();
     
      attendee.AS_Email__c=email;  
     AttendeeSummary__c myatt = new AttendeeSummary__c();
     myatt = attendee.clone(true);
     
     system.debug('------------------------------'+attendee);
     system.debug('------------------------------'+myatt );
     
     Database.UpsertResult myAttendeeSaveResult = Database.upsert(myatt,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField(), false);
      system.debug('------------------------------'+myAttendeeSaveResult);
     if(myAttendeeSaveResult.isSuccess() )
     {
     if(myAttendeeSaveResult.iscreated())
     {
      system.debug('------------------------------'+myAttendeeSaveResult.getId());
      
      eam.AS_id__c = myAttendeeSaveResult.getId(); 
      eam.Ev_id__c = event;     
      Database.SaveResult myAttendeeJunction = Database.Insert(eam,false);     
      eam.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ event;
      eam.EA_AttendeeBarcode__c = myAttendeeJunction.getId()+'-'+event;
      update eam;
      system.debug('--------------junction ----------------'+myAttendeeJunction.getId());
     

     
      }else{
      system.debug('============================');
      integer ev_att_Jun=[select count() from  Event_Attendee_Mapping__c 
                                             where  AS_id__r.id =: myAttendeeSaveResult.getId() and
                                             Ev_id__c   =: event];
     system.debug('============================'+ev_att_Jun);
    
      eam = new Event_Attendee_Mapping__c();
      eam.AS_id__c = myAttendeeSaveResult.getId(); 
      eam.Ev_id__c = event;
      eam.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ event;
     
     
    
      Database.SaveResult myAttendeeJunction = Database.Insert(eam,false);
      
      eam.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ event;
      eam.EA_AttendeeBarcode__c = myAttendeeJunction .getId()+'-'+event;
      update eam;
     
     }  
                
     }
     eam1=[select AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,EA_isBadgePrinted__c,TicketTypes__c, EA_AttendeeBarcode__c from Event_Attendee_Mapping__c
                                  where id =: eam.id];
      eam1.EA_isBadgePrinted__c = true;
      update eam1;                            
      pagereference pf=page.badgefromquickregistration;
      return pf;
     }
      /**}
    
    
    
    
    
    
    
    
    eam= new Event_Attendee_Mapping__c();
    attendee.AS_Email__c=email;  
    insert attendee;
    eam.AS_id__c=attendee.id;
    eam.EV_id__c=event;
    eam.Attendee_Event_IDs__c=attendee.id+event;
    insert eam;
    eam.EA_AttendeeBarcode__c=eam.id+'-'+event;
    update eam;
    eam=[select AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,TicketTypes__c, EA_AttendeeBarcode__c from Event_Attendee_Mapping__c
                                  where AS_id__r.id =: attendee.id AND EV_id__r.id =: event];
    pagereference pf=page.badgefromquickregistration;
    return pf;
    
   
    }*/


    
public Event__c eventdetails {get;set;}
public Event_Attendee_Mapping__c eam{get;set;}
public Event_Attendee_Mapping__c eam1{get;set;}
public string[] emaiiandid{get;set;}
public string email{get;set;}
public string eventid{get;set;}
public string event{get;set;}
public AttendeeSummary__c Attendee {get; set;}
public  saveattendee_print()
{
Attendee =new AttendeeSummary__c();
email='';
eventid='';
system.debug('================ emailid================'+email);
eventid = Apexpages.currentPage().getParameters().get('id');
system.debug('================ emailid================'+eventid);
emaiiandid =eventid.split(';');
integer i=0;
for(string s:emaiiandid )
{
if (i==0){
event=s;
}else
{

email=s;
}
i++;
}
eventdetails =[select EV_EventLogo__c ,EV_Title__c from Event__c where id =: event];
}
}