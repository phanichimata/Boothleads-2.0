public with sharing class poptest {

    public PageReference editAttendees() {
     displayPopUpForGrid =true;
        return null;
    }

public List<User_Profile_Event__c> ListOfBooths {get;set;}
public String eventName { get; set; }

public boolean displayPopUpForGridDetail{get;set;}

public poptest(){


 ListOfBooths = new List<User_Profile_Event__c>();
 Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
 
 setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__r.EMail=:UserInfo.getUserName()]);
 ListOfBooths.addAll(setOfBooths); 
 system.debug(ListOfBooths);


}
    public PageReference save() {
    system.debug('jhihhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh  ');
        return null;
    }


    public boolean displayPopUpForGrid { get; set; }

   
    
    
    
    
    
    public PageReference BoothAction() {
        return null;
    }


    public PageReference Reportsaction() {
        return null;
    }


    public PageReference AttendeesAction() {
        return null;
    }


    public PageReference Customeraction() {
        return null;
    }


    public PageReference EventAction() {
        return null;
    }


    public PageReference profileaction() {
        return null;
    }
    
    
    
     public Booth__c boothdetail{get;set;}

    public PageReference getEventDetails() {
     boothdetail= new Booth__c();
     
    displayPopUpForGridDetail =true;
    
    if(eventName !=null || eventName !=''){
    string [] dt = new string[]{};
    dt=eventName.split(',');
    system.debug('hi iiiiiiiiiiiiiiiii  '+dt[1]);    
    boothdetail=[Select b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:dt[1] limit 1];
    
       
    } return null;
}

    
    

}