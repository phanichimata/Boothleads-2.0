public with sharing class sampleapgeUrl {

    public PageReference send() {
    for(user sendEmail:[select id,firstname,Name,LastName,email,userName from user where id ='005O0000000rvTc' ]){
   string email ='phani.chimata@gmail.com';
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { email });
    mail.setSubject('You are registeras as boooth admin Successfully');
    mail.setHtmlBody('Dear '+sendEmail.Name+','+'<br /><br />Congratulations!!<br />Your login for your Booth Admin Portal for Event "'
    +forEventName  +'" was successfully created.<br /><br />Please visit http://www.boothleads.com to login to your Booth Admin Portal.<br /><br />If you have any questions, please contact your Event Administrator.<br /><br />Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.<br />Please remember to export all your leads.<br />If you need access beyond this, please contact support.<br /><br />'
    +'Thank you!<br />BoothLeads Customer Support<br />support@boothleads.com');
   
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 
  
  }
        return null;
    }

public string forEventName  {get;set;}
public sampleapgeUrl (){
forEventName  ='phani Event';
  
}


}