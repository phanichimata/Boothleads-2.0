public with sharing class BL_MobileScreenCon {

public string boothId{get;set;}
public string boothEId {get;set;}
public Booth__c bg{get;set;}

Public Pagereference login1(){ 
 boothId =ApexPages.currentPage().getParameters().get('Id');
 boothEId =ApexPages.currentPage().getParameters().get('EId');
  bg =[select BT_Name__c from Booth__c where id=:boothId]; 
  QueryContactInformation();
 return null;    
}

public List<Booth_Qrcode__c> totalRecords{get;set;}
public List<Booth_Qrcode__c> forUrlType{get;set;}
public List<string> forContactType{get;set;}
public List<Booth_Qrcode__c> forPdfType{get;set;}



public pageReference QueryContactInformation(){
 String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');
 
 
system.debug('22222222222222222 '+boothEId);
system.debug('444444444444444 '+boothId);

totalRecords = new List<Booth_Qrcode__c>();
forUrlType= new List<Booth_Qrcode__c>();
forPdfType= new List<Booth_Qrcode__c>();
 inn = new List<innercls>();

//Booth_Qrcode__c testmallik = [SELECT ID, NAME FROM Booth_Qrcode__c WHERE  ]

totalRecords = [select id,Address__c,Address_2__c,Booth__c,City__c,Company__c,Country__c,Email_Address__c,Data_Types__c,Link_LabelName__c,Name__c,Phone_number__c,Pin_code__c,POBox__c,Registration_Link__c,State__c,Title__c,Website_URL__c, (select id,name from Booth_Qrcode__c.attachments) from Booth_Qrcode__c where Booth__c=:boothId   and Event__c=:boothEId];
string iphone;
string android;
for(Booth_Qrcode__c b:totalRecords ){

if(b.Data_Types__c=='Contact Information'){
 for(attachment d:b.attachments){
    if(d.name=='iphonecontact.ics'){
      iphone =string.valueOf(d.id);
      system.debug('999999999999999999999999  '+iphone);
    }else if(d.name=='Android.vcf'){
     android =string.valueOf(d.id);
      system.debug('8888888888888888888 '+android );
    }
  }

 if(userAgent.contains('iPhone')){
 system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii '+iphone);
  inn.add(new innercls(iphone,b));
 }else{
  system.debug('555555555555555555555555 '+android);
 inn.add(new innercls(android,b));
 }

}
if(b.Data_Types__c=='Registration Link'){
forUrlType.add(b);
}
if(b.Data_Types__c=='Company Broacher'){
forPdfType.add(b);
}
}
return null;
}

public List<innercls> inn{get;set;}
public class innercls{
public string str{get;set;}
public Booth_Qrcode__c strobj{get;set;}
public innercls(string s,Booth_Qrcode__c v){
this.str=s;
this.strobj=v;
}

}

static testMethod void MobileScreenTest(){

 contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           insert m;
       Profile w = [select id from profile where name='Standard User'];
       
   User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
                  Id eventAdminId=u.id;    
 
   Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileBooth;
   
   Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert eve;
      Id EventId=eve.Id;
      
     
     Booth__c booth1 = new Booth__c(BT_Name__c='TestBooth1',BT_BoothUserCount__c=100);
      insert booth1;

   Booth_Qrcode__c bothQr = new Booth_Qrcode__c(Address__c='Add1',Address_2__c='add2',Booth__c=booth1.Id,City__c='city',Company__c='company',Country__c='India',Email_Address__c='phani@globalnest.com',Event__c=EventId,
   isSelected__c=true,Link_LabelName__c='phani Link',Name__c='phani label',Phone_number__c='9999999999',Pin_code__c='98768',Registration_Link__c='www.globalnest.com',
   Site_Name__c='www.boothleads.com',State__c='Ap',Title__c='Developer',Website_URL__c='www.globalnest.com',Data_Types__c='Contact Information');
   insert bothQr ;
    attachment a = new attachment();
     blob b=blob.valueOf('phani');
     a.parentId=bothQr.Id;
     a.Name ='Android.Vcf';  
     a.body =b;   
    insert a;
    

     pageReference pageRef = page.BL_MobileScreen;
     Test.setCurrentpage(pageRef);
     
     ApexPages.currentpage().getParameters().put('VId','1');
     ApexPages.currentpage().getParameters().put('Id',booth1.Id);
     ApexPages.currentpage().getParameters().put('EId',eventId);
     BL_MobileScreenCon MBS = new BL_MobileScreenCon();
    
     ApexPages.currentPage().getHeaders().put('User-Agent','Android');
      MBS.login1();
    // MBS.QueryContactInformation();
   // ApexPages.currentpage().getParameters().put('VId','2');
   //  MBS.login();
}









}