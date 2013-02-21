public with sharing class boothCon {
    
public List<Booth__C> boothwithAttachments{get;set;}
    public boolean displayPopUpForQRCODE{get;set;}
    public transient Blob broacher { get; set; }
    public String eventSelected { get; set; }
    public List<Event__c> EvntsForPicklist{get;set;}
    public string defaultEvent{get;set;}
    public boolean displayPopUpForGridadd {get;set;}
    public Booth__c boothdetail{get;set;}
    public string attendeeNameAfterEdit {get;set;}
    public Document mydoc {get;set;}
    public Boolean displayPopUpForGridDetail { get; set; }
    public boolean displayPopUpForGrid { get; set; }
    public Booth__c booth{get;set;}
    public string code{get;set;} 
       
    public PageReference deleteAdminRecord() {
     if(eventName !=null && eventName !=''){
   booth =[Select b.IsUpdated__c, b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:eventName];
  }
   
   List<attachment> a = new List<attachment>();
    a =[select Id, Name from attachment where parentId=:booth.id];
    system.debug('jjjjjjjjjjjj '+a);
    if(a.size()>0){
    
    delete a;
    }
    if(booth != null){
    booth.BT_PDFLocation__c =null;
    booth.BT_RegistrationLink__c=null;
    booth.BT_ContactEmail__c=null;
    booth.BT_ContactPhone__c =null;
    booth.BT_ContactName__c =null;
    update booth;
    }
    
   ListOfBooths = new List<User_Profile_Event__c>();
    Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
    setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__r.EMail=:UserInfo.getUserName() and u.EV_id__c=:eventSelected]);
          displayPopUpForGridadd =false;
    ListOfBooths.clear();   
  
    getEvents();
   
     return null;   
    }

    
    public PageReference dashBoardAction() {
       Pagereference pg = new pagereference('/apex/BL_BoothAdmin_Dashboard');
    pg.setredirect(true);
        return pg;
    }
    public PageReference addBoothInformation() {
    displayPopUpForGrid =true;
    
  
  return null;
 }


    public PageReference getEvents() {
    boothwithAttachments =new List<booth__c>(); 
   
     ListOfBooths = new List<User_Profile_Event__c>();
    displayPopUpForGridadd =true;
    system.debug('eventSelected  Value   '+eventSelected );
    
  lIST<User_Profile_Event__c>  listOfProfile = new lIST<User_Profile_Event__c> ();
  listOfProfile  = [select u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__c=:UserInfo.getUserId() and u.EV_id__c=:eventSelected limit 1 ];
  
   system.debug('listOfProfile Value   '+listOfProfile);
   for(User_Profile_Event__c uu :listOfProfile){
   booth= new Booth__c();
   booth =[Select b.IsUpdated__c, b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:uu.BT_id__c limit 1];
  }
   
 
  if(booth.BT_WebsiteURL__c ==null && booth.BT_RegistrationLink__c==null && booth.BT_PDFLocation__c==null && booth.BT_ContactPhone__c==null && booth.BT_ContactName__c==null && booth.BT_ContactEmail__c==null){
   system.debug(' ********************** ');
  displayPopUpForGridadd =false;
  }else{
    
    
  Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
   setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__c=:UserInfo.getUserId() and u.EV_id__c=:eventSelected]);
   ListOfBooths.addAll(setOfBooths); 
   Set<id> setOfBoothsattachments= new Set<id>();
   for(User_Profile_Event__c tr:ListOfBooths){
   setOfBoothsattachments.add(tr.BT_id__c);
   }
  boothwithAttachments =[select BT_Name__c,id,u.EV_id__r.EV_Title__c,u.BT_RegistrationLink__c,u.BT_Description__c,u.EV_id__c,u.BT_PDFLocation__c, u.BT_WebsiteURL__c, u.BT_ContactEmail__c, u.BT_ContactPhone__c, u.BT_ContactName__c, u.BT_BoothUserCount__c, u.BT_Phone__c, u.BT_Location__c,(select Id, Title, IsNote from NotesAndAttachments) from Booth__c u where id in :setOfBoothsattachments]; 
    
   }
 
   return null;
  }

    
    
    
    
     public List<selectOption> getselectEvents() {
       List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
       EvntsForPicklist = new List<Event__c>();
       upeForEvents = [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.Profile_id__r.PR_Name__c ='BoothAdmin' and  u.User_id__r.Email=:UserInfo.getUserName()];
       set<Id> setOfEventIds = new set<Id>();
           for(User_Profile_Event__c rotatinnFor:upeForEvents){
           setOfEventIds.add(rotatinnFor.EV_id__c);
           }
 
       EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
           if(EvntsForPicklist.size()>0){
          
           } 
           defaultEvent =EvntsForPicklist[0].id;
      List<SelectOption> options = new List<SelectOption>();
           for(Event__c Event:EvntsForPicklist ){
           options.add(new SelectOption(Event.id,Event.EV_Title__c));
           }
           return options;
     }
    
    
    
    
    
    
    
    
    
    
    public PageReference closePopupdetail() {
    displayPopUpForGridDetail =false;
    displayPopUpForQRCODE=false;
        return null;
    }


 


    public PageReference getEventDetails() {
     boothdetail= new Booth__c();
     
    displayPopUpForGridDetail =true;
    
    if(eventName !=null && eventName !=''){
    string [] dt = new string[]{};
    dt=eventName.split(',');
    system.debug('hi iiiiiiiiiiiiiiiii  '+dt[1]);    
    boothdetail=[Select b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:dt[1] limit 1];
    
       
    } return null;
}

   

    public PageReference closePopup1() {
    displayPopUpForGrid =false;
        return null;
    }

public attachment attach{get;set;}
    public Void savePopupValues() {
    system.debug('22222222222222222222222  '+eventName);
    
    if(booth !=null){
    
    if(broacher != null  ){
     attach = new attachment();
    /* mydoc=new document();
     mydoc.folderid = '00DO000000097JW';
     mydoc.ispublic=true;
     mydoc.body= broacher;

     mydoc.name= attendeeNameAfterEdit;    
    insert mydoc; 
    */
  List<attachment> a = new List<attachment>();
  
  a=[select id from attachment where parentId=:booth.id];
  
  if(a.size()>0){
  delete a;
  }
  
 
  attach.Name =attendeeNameAfterEdit;
  attach.ParentId=booth.id;
  attach.body =broacher;
  insert attach;
  booth.BT_PDFLocation__c='https://c.cs5.content.force.com/servlet/servlet.FileDownload?file='+attach.id;
   
     }
   booth.BT_ContactName__c=booth.BT_ContactName__c;
    booth.BT_ContactEmail__c=booth.BT_ContactEmail__c;
    booth.BT_ContactPhone__c =booth.BT_ContactPhone__c;
    booth.BT_RegistrationLink__c =booth.BT_RegistrationLink__c;
    booth.IsUpdated__c=true;
    
    update booth;
    broacher = null;
      
   displayPopUpForGrid =false;
   displayPopUpForGridadd =true;
    ListOfBooths = new List<User_Profile_Event__c>();
    Set<User_Profile_Event__c> setOfBooths= new Set<User_Profile_Event__c>();
    setOfBooths.addAll([select u.BT_id__r.EV_id__r.EV_Title__c,u.BT_id__r.BLP_id__c, u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.Name, u.BT_id__c From User_Profile_Event__c u where Profile_id__r.PR_Name__c='BoothAdmin' and User_id__r.EMail=:UserInfo.getUserName() and u.EV_id__c=:eventSelected]);
    ListOfBooths.addAll(setOfBooths); 
   
   }
   
  getEvents();
    }


    
    
    public void editAttendees() {
   
    booth= new Booth__c();
    if(eventName !=null || eventName !=''){
   booth =[Select b.IsUpdated__c, b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:eventName];
  }
    displayPopUpForGrid  =true;
  system.debug('Value Of Booth '+booth);
  }


    public String eventName { get; set; }

public List<User_Profile_Event__c> ListOfBooths {get;set;}


 public boothCon(){
 broacher = null;
 displayPopUpForGridadd =true;
 List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
      
       upeForEvents = [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.Profile_id__r.PR_Name__c ='BoothAdmin' and  u.User_id__r.Email=:UserInfo.getUserName()];
     if(upeForEvents.size()>0){
     eventSelected =upeForEvents[0].EV_id__c;
     }
 getEvents();
 }





    public PageReference BoothAction() {
        return null;
    }


    public PageReference Reportsaction() {
      Pagereference pg = new pagereference('/apex/BL_Reports');
    pg.setredirect(true);
        return pg;
    }


    public PageReference AttendeesAction() {
       Pagereference pg = new pagereference('/apex/BL_Attendees');
    pg.setredirect(true);
        return pg;
    }


    public PageReference Customeraction() {
      Pagereference pg = new pagereference('/apex/BL_BoothPersonnels');
    pg.setredirect(true);
        return pg;
    }


    public PageReference EventAction() {
         Pagereference pg = new pagereference('/apex/BL_Events');
    pg.setredirect(true);
        return pg;
    }


    public PageReference profileaction() {
        Pagereference pg = new pagereference('/apex/BL_Profile');
    pg.setredirect(true);
        return pg;
    }
//----------------------------------------------------------------------For Printing QRCODE----------------------
    public void printqrcode()
     {
     displayPopUpForGridDetail =false; 
     string url='<?xml version="1.0" encoding="UTF-8"?><script type="text/javascript">function submitform(){alert("';

    if(boothdetail.BT_ContactName__c !=null || boothdetail.BT_ContactEmail__c !=null || boothdetail.BT_ContactPhone__c != null){
    url+='Name:'+boothdetail.BT_ContactName__c+'\\n' +'Phone:'+ boothdetail.BT_ContactPhone__c +'\\n'+' Email:'+boothdetail.BT_ContactEmail__c+'")}</script><a href="#" onclick="submitform()">Contact Information</a><br /><br />';
    }
    if(boothdetail.BT_PDFLocation__c != null){
     url += '<a href="http://'+boothdetail.BT_PDFLocation__c+'">Download Pdf</a><br /><br />';
    }
    if(boothdetail.BT_RegistrationLink__c != null){
    url +='<a href="'+boothdetail.BT_RegistrationLink__c+'">Resgister Link</a>';
    }
    
    system.debug('-----------------------print------------ '+url);
    
    String encoded = EncodingUtil.urlEncode(url, 'UTF-8');   
    code=encoded;
     displayPopUpForQRCODE=true;
     
    }
    public pagereference Printaspdf()
    {
     pagereference pf=page.BL_booth_Qrcode;
     return pf;
    }
//---------------------------------------------------------------------------------------------------
    public void SaveandPrint(){
    savePopupValues();
    boothdetail= new Booth__c();
    boothdetail= [Select b.EV_id__c,b.EV_id__r.EV_Title__c, b.BT_isBoothActive__c, b.BT_WebsiteURL__c, b.BT_RegistrationLink__c, b.BT_Phone__c, b.BT_PDFLocation__c, b.BT_Name__c, b.BT_Location__c, b.BT_Description__c, b.BT_ContactPhone__c, b.BT_ContactName__c, b.BT_ContactEmail__c, b.BT_BoothUserCount__c, b.BLP_id__c From Booth__c b where b.id=:booth.id];
    printqrcode();
    
    
    
    }
}