public with sharing class BL_Eventadmin_ProfileCon { 

public PageReference Profileupdatepage(){
 PageReference  pg = new PageReference ('/apex/BL_EventAdmin_ResetPassword');
 pg.setredirect(true);  
 return pg;     
}

public PageReference checkUserId(){
 if(userInfo.getUserType()=='guest'){
   Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
   pg.setredirect(true);
   return pg;
 }
 else{
  return null;
 }         
}

public User EventUser{get;set;} 
public String LoginUserId {get;set;}
 
public BL_Eventadmin_ProfileCon(){
 LoginUserId = Userinfo.getUserId();
 EventUser = [select Id,States__c,Country__c,FirstName,LastName,Email,CompanyAddr2__c,CompanyCity__c,companyName,CompanyAddr1__c ,
            CompanyCountry__c,Companyphone__c,CompanyState__c,Company_website__c,Zipcode__c,CompanyFaxNumber__c,
            PoBox__c From User Where id =:LoginUserId];           
}
    
public PageReference ProfileSave(){

 EventUser.FirstName = EventUser.FirstName;
 EventUser.LastName= EventUser.LastName;
 EventUser.Email = EventUser.Email;
 EventUser.CompanyAddr2__c = EventUser.CompanyAddr2__c;
 EventUser.CompanyAddr1__c = EventUser.CompanyAddr1__c ;   
 EventUser.Companyphone__c = EventUser.Companyphone__c;    
 EventUser.Country__c = EventUser.Country__c;
 EventUser.States__c = EventUser.States__c;
 EventUser.Company_website__c = EventUser.Company_website__c;
 EventUser.Zipcode__c = EventUser.Zipcode__c;
 EventUser.CompanyFaxNumber__c = EventUser.CompanyFaxNumber__c;
 EventUser.PoBox__c = EventUser.PoBox__c ;
 EventUser.CompanyName = EventUser.CompanyName  ;

 update EventUser; 

 PageReference pg=new PageReference('/apex/BL_EventAdmin_Dashboard');
 pg.setRedirect(true);
 return pg; 
}    





static testMethod void testrest(){
 Profile w = [select id from profile where name='Standard User'];
   // ------------------ Eventadmin Insert ---------------------
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;

 system.runAs(u){
 BL_Eventadmin_ProfileCon BLEPC = new BL_Eventadmin_ProfileCon();
 BLEPC.Profileupdatepage();
  BLEPC.checkUserId();
  BLEPC.EventUser=u;
  BLEPC.ProfileSave();
 } 
}


}