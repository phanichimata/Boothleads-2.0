public with sharing class testcheckCon {

    public PageReference save() {
    system.debug(' 111111111111111111111111111'+inputfile);
    system.debug(' 2222222222222222222222222'+booth.BT_ContactName__c);
    system.debug(' 333333333333333333333333333333333'+booth.BT_ContactEmail__c);
    system.debug(' 444444444444444444444444444'+booth.BT_ContactPhone__c);
    system.debug(' 555555555555555555555555555555'+booth.BT_RegistrationLink__c);
   
        return null;
    }


    public PageReference click() {
    booth = new Booth__c(); 
    booth  =[Select b.IsUpdated__c, b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where id='a0EO00000016aEd'];
    displayPopUpForGridDetail =true;
        return null;
    }


    public Blob inputfile { get; set; }

    public String filenameValue { get; set; }

    public boolean displayPopUpForGridDetail { get; set; }

    public String rk { get; set; }
    public Booth__c booth{get;set;}

   public testcheckCon(){
   
   
   }


}