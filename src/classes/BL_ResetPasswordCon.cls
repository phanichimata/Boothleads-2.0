public with sharing class BL_ResetPasswordCon {
  public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    public pageReference success{get;set;}
    public boolean booleanforDisplayBoothadminTab {get;set;}
    public user loginuser{get;set;}

public PageReference login() {
   if(userInfo.getUserType()=='guest'){
    Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
    pg.setredirect(true);
        return pg;
   
   }
   
   List<User_Profile_Event__c> ty =new  List<User_Profile_Event__c>();
      ty=[select Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:userInfo.getUserName() and Profile_id__r.PR_Name__c='eventadmin'];
       if(ty.size()>0){
       Pagereference pg = new pagereference('/apex/BL_EventAdmin_Dashboard');
       pg.setredirect(true);
        return pg;
       
       }else{
       return null;
       }   
      
  }

public BL_ResetPasswordCon(){
LoginUser = [select id,Password__c from User where id=:userinfo.getuserid()];
//userinfo.getuserid()
List<User_Profile_Event__c> BoolforDisplayBoothadminTab = new List<User_Profile_Event__c>();

BoolforDisplayBoothadminTab = [select Profile_id__c,Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:UserInfo.getUserNAme()];
for(User_Profile_Event__c ty:BoolforDisplayBoothadminTab ){
if(ty.Profile_id__r.PR_Name__c =='BoothAdmin'){
booleanforDisplayBoothadminTab =true;
}
}
}

 public PageReference changePassword() {
  system.debug('6666666666666 '+newPassword+verifyNewPassword+oldpassword);
        success =Site.changePassword(newPassword, verifyNewPassword, oldpassword);
       
       system.debug('777777777777777777 '+success );
       if(success != null){
       
        user u =[select password__c from user where id=:userInfo.getUserId() limit 1];
        u.password__c =newPassword;
       update u;
        Pagereference pg = new Pagereference('/apex/BL_Profile');  
        pg.setredirect(true);
        return pg;  
        }else{
        
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
            System.ResetPasswordResult rt= system.ResetPassword(bAdmin.id,true);
             string pword =rt.getPassword();
             system.debug('444444444444b '+pword );
       Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
       insert  customProfile;
       
       Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileBooth;

       Id  profileId=customProfile.Id;   
             
    PageReference pageRef = Page.BL_ResetPassword;
    Test.setCurrentPage(pageRef);
 
   system.runAs(bAdmin){ 
                
    BL_ResetPasswordCon rpc = new BL_ResetPasswordCon();
    rpc.login();
    
     system.debug('5555555555555555 '+pword );
    rpc.oldPassword =pword;
      system.debug('888888888888 '+rpc.oldPassword);
    rpc.newPassword='global@271';
    rpc.verifyNewPassword ='global@271';
    rpc.changePassword();
    } 
    
   system.runas(u){
    BL_ResetPasswordCon rpc = new BL_ResetPasswordCon();
    rpc.login();
   }     
}

}