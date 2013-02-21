public with sharing class testCon {
   
   public PageReference cancel() {
    displayPopUp =false;
        return null;
    }

public PageReference PopupDisplaypdf() {
    emailOfuserpdf =emailOfuser;  
    displayPopUppdf  =true;
   
        return null;
    }

 public  string email {get;set;}
 public string companyName{get;set;}
    public String emailOfuserpdf { get; set; }
   public boolean displayPopUppdf { get; set; }




    public PageReference Redirect() {
    
       PageReference pageRef = new PageReference('http://www.google.com');
       pageRef.setRedirect(true);
       return pageRef ;
    }


    public String attId { get; set; }
public booth__c booth{get;set;}
public attachment att{get;set;}
public string password {get;set;}
public string Loginname {get;set;}

Public Pagereference login(){ 

 string boothvId =ApexPages.currentPage().getParameters().get('VId');
 
 /**if(boothvId =='1'){
 string boothId =ApexPages.currentPage().getParameters().get('Id');
           password = 'global281';
           Loginname = 'mallikarzuna@gmail.com';
           string sss ='/apex/test?id='+boothId+'&VId=2';
           system.debug('hiiiiiiiiiiiiiiii 11111111 '+userInfo.getuserId());
           system.debug('hiiiiiiiiiiiiiiii 22222222222    '+boothId);
           return Site.login(loginname, password, sss);
          }  **/
                
         //else{ 
         QueryContactInformation();
              return null;
     //}

       
      
}
public List<attachment> ase {get;set;}
public string rty {get;set;}
public void QueryContactInformation(){
string boothId =ApexPages.currentPage().getParameters().get('Id');
  booth = [select id,BT_ContactName__c,BT_ContactEmail__c,BT_ContactPhone__c,BT_Name__c,BT_RegistrationLink__c from booth__c where id=:boothId];
att = [select id from attachment where parentId=:booth.Id limit 1];
 
 ase  = [select id from attachment where parentId=:booth.Id];
  system.debug('yyyyyyyyyyyyyyyyyyyyyyyyyyy '+ase);
  rty =ase[0].id;
  attId =att.id;
  companyName =booth.BT_Name__c;
 }



 public testCon(){
/**
string boothId =ApexPages.currentPage().getParameters().get('Id');
system.debug('phaniiiiiiiiiiiiiiiiiiii  '+boothId);
 if(boothId != null && boothId != ''){
  booth = [select BT_ContactName__c,BT_ContactEmail__c,BT_ContactPhone__c,BT_Name__c,BT_RegistrationLink__c from booth__c where id=:boothId];
 att = [select id,body,contentType from attachment where parentId=:boothId limit 1];
 attId =att.id;
 companyName =booth.BT_Name__c;
 }
 **/
}

    public PageReference PopupDisplay() {
    displayPopUp =true;
  
        return null;
    }


    public boolean displayPopUp { get; set; }
    public string emailOfuser{get;set;}

public string rere{get;set;}




    public PageReference emailCFV() {
    rere='';
   emailOfuser = Apexpages.currentPage().getParameters().get('one');
     
    String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');
     Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    
    system.debug('pppppppppppppppp '+emailOfuser );
    
    
    if (userAgent.contains('iPhone')){
    system.debug('11111111111111111 ');
        rere = 'iPhone-Safari';
    }else if (userAgent.contains('Android')){
     system.debug('22222222222222');
       rere= 'Android';
    }else if (userAgent.contains('BlackBerry')){
     system.debug('33333333333333333');
         rere='BlackBerry';
    }else if (userAgent.contains('Safari')){
          system.debug('44444444444444444444');
         rere='Safari';
         }else if (userAgent.contains('Chrome')){
          system.debug('5555555555555555555555');
         rere='Chrome';
         }else if (userAgent.contains('mozila')){
          system.debug('6666666666666666666666666');
         rere='Firefox';
         }
    
    
   system.debug('tyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy '+rere);
  if (rere =='iPhone-Safari' || rere =='Safari'){
    
     string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+ booth.BT_ContactName__c+';;;\n'+'FN:'+ booth.BT_ContactName__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.BT_ContactEmail__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.BT_ContactPhone__c +'\n'+'ORG:'+booth.BT_Name__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
     string paramvalue = EncodingUtil.base64Encode(beforeblob);
     
     string s= 'BEGIN:VCALENDAR\n'+
     'VERSION:2.0\n'+
     'BEGIN:VEVENT\n'+
     'DTSTART;TZID=Europe/London:20120708T220000\n'+
     'DTEND;TZID=Europe/London:20120708T230000\n'+
     'SUMMARY:Click to download contact to your address book\n'+
     'DTSTAMP:20120708T203910Z\n'+
     'ATTACH;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/directory;\n'+
     ' X-APPLE-FILENAME=iphonecontact.vcf:\n'+' '+paramvalue+'\n'+
     'END:VEVENT\n'+
     'END:VCALENDAR';
      blob b = blob.valueOf(s);
      attach.setFileName('iPhonecontact.ics');
      attach.setInline(false);
      attach.Body = b; 
       
    }else{
    
   
    string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+booth.BT_ContactName__c+';;;\n'+'FN:'+booth.BT_ContactName__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.BT_ContactEmail__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.BT_ContactPhone__c +'\n'+'ORG:'+booth.BT_Name__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
    
      attach.setFileName('Android.Vcf');
      attach.setInline(false);
      attach.Body = beforeblob ;
    }
 
  
    
 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { emailOfuser });
    mail.setSubject('Document Email Demo');
    mail.setHtmlBody('Here is the email you requested: ');
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   
     
     
 
   
  displayPopUp=false;  
        return null;
    }
   
   
   
   
    
}