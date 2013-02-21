public with sharing class quickregistrationcon {
 public string ssssssssssssssss {get;set;}
    public PageReference attbadge() {
   
  
    system.debug('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');    
    pagereference pg=page.badge_fromQuickRegistration;
     return pg;
    }
    public Event_Attendee_Mapping__c attmap {get;set;}
   public boolean DisplayError {get;set;}
   public string showerror {get;set;}
   public void savebadge(){
   
   
   {
   
   Savepoint sp = Database.setSavepoint();  
   
     AttendeeSummary__c myatt = new AttendeeSummary__c();
     myatt = attendee.clone(true);
     Database.UpsertResult myAttendeeSaveResult = Database.upsert(myatt,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField(), false);
     if(myAttendeeSaveResult.isSuccess() )
     {
     if(myAttendeeSaveResult.iscreated())
     {
     system.debug('------------------------------'+myAttendeeSaveResult.getId());
      attmap = new Event_Attendee_Mapping__c();
      attmap.AS_id__c = myAttendeeSaveResult.getId(); 
      attmap.Ev_id__c = selectedevent;     
      Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);     
      attmap.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ selectedevent;
      attmap.EA_AttendeeBarcode__c = myAttendeeJunction .getId()+'-'+selectedevent;
      update attmap;
      system.debug('--------------junction ----------------'+myAttendeeJunction.getId());
     selectedevent=selectedevent;

     
      }else{
      system.debug('============================');
      integer ev_att_Jun=[select count() from  Event_Attendee_Mapping__c 
                                             where  AS_id__r.id =: myAttendeeSaveResult.getId() and
                                             Ev_id__c   =: selectedevent];
     system.debug('============================'+ev_att_Jun);
    if(ev_att_Jun > 0)
    {
      showerror = 'Attendee Already Exists!'; 
          DisplayError = True;
     Database.rollback(sp);
    }else{
      attmap = new Event_Attendee_Mapping__c();
      attmap.AS_id__c = myAttendeeSaveResult.getId(); 
      attmap.Ev_id__c = selectedevent;
      attmap.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ selectedevent;
     
     
    
      Database.SaveResult myAttendeeJunction = Database.Insert(attmap ,false);
      
      attmap.Attendee_Event_IDs__c = myAttendeeSaveResult.getId()+ selectedevent;
      attmap.EA_AttendeeBarcode__c = myAttendeeJunction .getId()+'-'+selectedevent;
      update attmap;
     
     }  
                
     }
     }
      
    }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   }
    public PageReference cancel() {
        return null;
    }
    public boolean pdfbool{get;set;}
    public boolean originalform{get;set;}
    public boolean logo{get;set;}
    public AttendeeSummary__c attendee{get;set;}
    public string selectedevent{get;set;}
    public  Event_Attendee_Mapping__c eventatt {get;set;}
    
    public quickregistrationcon(){
     originalform=true;
   

    attendee=new AttendeeSummary__c();
    eventatt= new Event_Attendee_Mapping__c();
    selectedevent='a0EO0000002mTqC';
    }
    
    
    public Void printbadge(){
    system.debug('========================'+attendee.AS_Email__c);
    AttendeeSummary__c attendee1=[select id from AttendeeSummary__c where   AS_Email__c=:attendee.AS_Email__c ];
    system.debug('======================'+attendee1.id);
    eventatt=[select id, AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,As_id__r.AS_Company__c, EA_AttendeeBarcode__c,TicketTypes__c  from  Event_Attendee_Mapping__c where 
                               AS_id__r.id =:attendee1.id and   EV_id__r.id =: selectedevent]; 
    system.debug('======================'+eventatt.id);    
    
       attbadge();                     
    if(eventatt.id != null)
    {
    originalform=true;
    pdfbool=true;
    }
   
    }
    }