public with sharing class BL_boothDummyCon {

 public transient Blob broacher { get; set; }
 public String eventName { get; set; }
 public List<User_Profile_Event__c> ListOfBooths {get;set;}
 public Boolean displayPopUpForGridDetail { get; set; }
 public string attendeeNameAfterEdit {get;set;}
 public Document mydoc {get;set;}
 public boolean displayPopUpForGrid { get; set; }
 public Booth__c booth{get;set;}
 public string  vvv{get;set;}
 
 
    public PageReference closePopup1() {
    displayPopUpForGrid =false;
        return null;
    }



    public Void savePopupValues() {
    
    system.debug('aaaaaaaaaaaaaaaaaaa '+booth.BT_ContactName__c);
    system.debug('bbbbbbbbbbbbbbbbbbb '+booth.BT_ContactEmail__c);
    system.debug('cccccccccccccccccc '+booth.BT_ContactPhone__c);
    system.debug('dddddddddddddddddd'+booth.BT_RegistrationLink__c);
    
   
    if(booth !=null){
   if(broacher != null  ){
     mydoc=new document();
     mydoc.folderid = '00590000000jrNr';
     mydoc.ispublic=true;
     mydoc.body= broacher;
     mydoc.name= attendeeNameAfterEdit;    
    insert mydoc;
    
    booth.BT_PDFLocation__c = 'https://c.cs5.content.force.com/servlet/servlet.FileDownload?file='+mydoc.Id;
    system.debug('eeeeeeeeeeeeeeeeeeeee '+booth.BT_PDFLocation__c);
    system.debug('ggggggggggggggggggggg '+attendeeNameAfterEdit);
     }
     
    booth.BT_ContactName__c=booth.BT_ContactName__c;
        system.debug('Booth BT_ContactName__c'+booth.BT_ContactName__c);
    booth.BT_ContactEmail__c=booth.BT_ContactEmail__c;
    booth.BT_ContactPhone__c =booth.BT_ContactPhone__c;
    booth.BT_RegistrationLink__c =booth.BT_RegistrationLink__c;
    booth.IsUpdated__c=true;
    update booth;
      system.debug('Booth Updated  '+booth);
    //displayPopUpForGrid =false;
    ListOfBooths = new List<User_Profile_Event__c>();
    Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
    setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__r.EMail=:UserInfo.getUserName()]);
    ListOfBooths.addAll(setOfBooths); 
   broacher = null;
   }
   
  system.debug('Booth will nor fire ');
   
    }


    
    
    public void editAttendees() {
   
    booth= new Booth__c();
      
    if(eventName !=null || eventName !=''){
   booth =[Select b.IsUpdated__c, b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:eventName];
 
  }
    displayPopUpForGrid  =true;
  system.debug('Value Of Booth '+booth);
  }





 public BL_boothDummyCon(){
 ListOfBooths = new List<User_Profile_Event__c>();
 Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
 
 setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__r.EMail=:UserInfo.getUserName()]);
 ListOfBooths.addAll(setOfBooths); 
 system.debug(ListOfBooths);
 
 

 }





  
}