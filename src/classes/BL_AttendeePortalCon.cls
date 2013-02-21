/***********************************************************************************************
*   Controller Name : BL_AttendeePortalCon
*   Date            : 09/10/2012 
*   Author          : Naga Mallikarjuna Rao B
*   Purpose         : This class is for Attendee Portal Home page
*   Change History  : 09/10/2012 
*       Date                 Programmer                     Reason
*   --------------      -------------------           -------------------------
*   09/10/2012          Naga Mallikarjuna Rao B           Begain to Develop
***************************************************************************************************/

public class BL_AttendeePortalCon {

    
    
   public LIST<Event__c> allEventsList{get; set;} 
    
       
    public BL_AttendeePortalCon(){
    
     allEventsList = new LIST<Event__c>();
    
     allEventsList = [SELECT id, name, EV_Title__c, EV_Description__c, EV_EventLogo__c,EV_StartDate__c,EV_EndDate__c,EV_SiteLocation__c FROM Event__c WHERE EV_Publish__c =: TRUE AND EV_EndDate__c >=: DATE.TODAY() Order By EV_EndDate__c ASC LIMIT 3 ];

    system.debug('1111111111111111111111111111111     AND EV_StartDate__c >=: DATE.TODAY() '+ allEventsList);
    }
    
    public Pagereference goToRegister(){
    
        String eventid=  ApexPages.currentpage().getParameters().get('event'); 
    
         
         
            Pagereference pg = new Pagereference('/apex/BL_Attendee_Register?event='+eventid);
            Pg.setredirect(true);
            Return pg;
        
    }
    
    public Pagereference loginAction(){
      Pagereference pg = new Pagereference('/apex/BL_Eventadmin_signup?forceToLogin=siteGuestUser');
            Pg.setredirect(true);
            Return pg;
        
        
    
    }
    
    
    static testMethod void restTest(){
    
     Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM',
                             EV_Publish__c=TRUE );
      insert eve;
      
     PageReference pageRef = Page.bl_attendeeportal;
    Test.setCurrentPage(pageRef);
    ApexPages.currentPage().getParameters().put('event', eve.Id);
    
    BL_AttendeePortalCon BLAtt = new BL_AttendeePortalCon();
    BLAtt.goToRegister();
     BLAtt.loginAction();
    }
    
    
    
    
    

}