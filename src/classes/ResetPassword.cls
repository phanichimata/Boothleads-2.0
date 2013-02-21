@RestResource(urlMapping='/RESETPASSWORD/*')


global with sharing class ResetPassword {
    
    
    global static String username;
    
    global static String oldPassword;
    
    global static String newPassword;
    
   global static User userDetails;
    
    
    
@HttpGet

global static PasswordReset doGet(){
    


RestRequest req = RestContext.request;
RestResponse res = RestContext.response;


    System.debug('@@@@@req'+req);
    
    username = req.params.get('Username');
    
    oldPassword = req.params.get('OldPassword');
    
    newPassword = req.params.get('newPassword');
    
    
    
    
    
    try{
    userDetails = [Select id,Username,Password__c from User Us where Username=:username AND IsActive=True];
    system.debug(';;;;;;;;;;;;;;;'+userdetails);
    
    if(!((userDetails.Password__c).Equals(oldPassword))){
        
        
        PasswordReset passwo = new PasswordReset('The old passwords are not maching, Please check once!');
        
        return passwo;
        
        System.debug('@@@@@passwo'+passwo);
        
    }
    
    userDetails.Password__c = newPassword;
    
    try{
    System.setPassword(userDetails.id, newPassword);
    Update userDetails;
    
    PasswordReset passwo = new PasswordReset('The password is updated!');
        
        return passwo;
        
        System.debug('@@@@@passwo'+passwo);
    
    }
    
    catch(Exception ex){
        
        System.debug('Exception Message'+ex.getMessage());
        
        PasswordReset passwo = new PasswordReset('Please check the new password and The last three passwords are remembered and cannot be reused!');
        
        return passwo;
        
        System.debug('@@@@@passwo'+passwo);
    }
    
    
    
    }
    
    Catch(System.QueryException ex){
        
        PasswordReset passwo = new PasswordReset('Please check the crdentials or Contact Booth Admin once for the Account Activation Information');
        
        return passwo;
        
        System.debug('@@@@@passwo'+passwo);
        
    }
    
    
    return null;
}


global Class PasswordReset{
    
String Message;


public PasswordReset(String message1){
    
    Message = message1;
        
}  
}
 static testMethod void  testrest(){
   
    Profile w = [select id from profile where name='Standard User'];
  User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',IsActive=True,
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
             System.ResetPasswordResult rt= system.ResetPassword(u.id,true);
             u.password__c =rt.getPassword();
             string pwd=rt.getPassword();
             update u;
            
      user abc = [select userName from user where id=:u.id]; 
       
     System.RestContext.request = new RestRequest();  
   RestContext.request.requestURI = '/GlobalnestEM/ResetPassword';
   
       RestContext.request.addParameter('Username','test123@noemail.com');
       RestContext.request.addParameter('OldPassword',pwd);
       RestContext.request.addParameter('newPassword', 'durga281');
       ResetPassword.doGet();
       
             u.password__c ='durga281';
            
         update u;
         ResetPassword.doGet();
          
         RestContext.request.addParameter('Username','test123@noemail.com');
       RestContext.request.addParameter('OldPassword',pwd);
      
       ResetPassword.doGet();
 }
}