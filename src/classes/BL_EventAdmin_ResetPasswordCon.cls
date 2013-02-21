public with sharing class BL_EventAdmin_ResetPasswordCon {
  public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    public pageReference success{get;set;}
    public boolean booleanforDisplayBoothadminTab {get;set;}
    Public user LoginUser {get;set;}


public BL_EventAdmin_ResetPasswordCon()
{
 LoginUser = [select id,Password__c from User where id=:userinfo.getuserid()];
//
/**
List<User_Profile_Event__c> BoolforDisplayBoothadminTab = new List<User_Profile_Event__c>();

BoolforDisplayBoothadminTab = [select Profile_id__c,Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:UserInfo.getUserNAme()];
for(User_Profile_Event__c ty:BoolforDisplayBoothadminTab ){
if(ty.Profile_id__r.PR_Name__c =='BoothAdmin'){
booleanforDisplayBoothadminTab =true;
}
}
*/
}

public PageReference changePassword() {
   system.debug('@@@@@'+newPassword+'  '+verifyNewPassword+'   '+oldpassword);    
 success =Site.changePassword(newPassword, verifyNewPassword, oldpassword);       
system.debug('++++++'+success);       
 if(success != null){         
  Id loggedid = UserInfo.getUserId();
          
  User Us =[select id,password__c from User where id=:loggedid];
  Us.password__c = newPassword;
  Update Us;
     
  Pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');  
  pg.setredirect(true);
  return pg;  
 }       
 return null;
}
 
public PageReference Back() {
 Pagereference pg = new pagereference('/apex/BL_Eventadmin_Profile');
 pg.setredirect(true);
 return pg;
}

    
public PageReference checkUserId() {       
 if(userInfo.getUserType()=='guest'){
  Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
  pg.setredirect(true);
  return pg;
 }
 else{
  return null;
 }           
}

static testMethod void myUnitTest() {

Profile w = [select id from profile where name='Standard User'];
   // ------------------ Eventadmin Insert ---------------------
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com',password__c='global281');
                  insert u;
                  Id eventAdminId=u.id;                       
         
     // ------------------ Boothtadmin Insert ---------------------
         
       user bAdmin =  new User(alias = 'testboot', email='testboothadmin@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='testboothadmin@noemail.com', password__c='global281');
                  insert bAdmin ;
                  Id boothAdminId=bAdmin.id;      
            system.setPassword(u.id,'globalnest@49');


       Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
       insert  customProfile;
       
       Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileBooth;

       Id  profileId=customProfile.Id;   
             
    PageReference pageRef = Page.BL_EventAdmin_ResetPassword;
    Test.setCurrentPage(pageRef);
 
   system.runAs(u){ 
                
    BL_EventAdmin_ResetPasswordCon rpc = new BL_EventAdmin_ResetPasswordCon();
    rpc.checkUserId();
    rpc.Back();
    rpc.oldPassword ='globalnest@49';
    rpc.newPassword='global@271';
    rpc.verifyNewPassword ='global@271';
    rpc.changePassword();
   } 
    
 }     



}