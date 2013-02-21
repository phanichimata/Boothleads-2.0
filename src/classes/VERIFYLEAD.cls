@RestResource(urlMapping='/VERIFYLEAD/*')

   /*
 * AUTHOR: Venkatesh 
 * Email : venkatesh@globalnest.com
 * Phone : 9989522656 
 * AIM   : VERIFYLEAD is used to online Lead verification from the server 
 */  

   
   global with sharing class VERIFYLEAD{
    
   global static String EventId;
   global static String UserId;
   global static String QRcode;
   global static Event_Attendee_Mapping__c AtSummary; 
   global static Leads VerifiedLead;
  
  @HttpPost
  
  global static Leads doPost(){
  RestRequest req = RestContext.request;
  RestResponse res = RestContext.response;
  System.debug('@@@@@req'+req);
    EventId = req.params.get('EventId');
    System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@EventId'+EventId);
    UserId  = req.params.get('UserId');
    System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@UserId'+UserId );
    QRcode = req.params.get('QRcode');
    System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@QRcode'+QRcode);
  try{
  
  List<User_Profile_Event__c> listOfUpe = new  List<User_Profile_Event__c>();
  listOfUpe =[select id from User_Profile_Event__c where EV_id__c=:EventId and User_id__c=:UserId  and Profile_id__r.PR_Name__c='BoothAdmin'];
  if(listOfUpe.size()>0){
  AtSummary = [Select  AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Email__c,AS_id__r.AS_Company__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_Title__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_Work_States__c,id,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_Work_Country__c,EV_id__r.EV_Title__c from  Event_Attendee_Mapping__c where  id=:QRcode];
  System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@AtSummary'+AtSummary);
  VerifiedLead = new Leads(AtSummary.AS_id__r.AS_FirstName__c,AtSummary.AS_id__r.AS_LastName__c,AtSummary.AS_id__r.AS_Email__c,AtSummary.AS_id__r.AS_Company__c,AtSummary.AS_id__r.AS_WorkCity__c,AtSummary.AS_id__r.AS_Work_States__c,AtSummary.AS_id__r.AS_WorkPhone__c,AtSummary.AS_id__r.AS_Title__c,AtSummary.id,AtSummary.AS_id__r.AS_ImageUrl__c,AtSummary.AS_id__r.AS_Work_Country__c,AtSummary.EV_id__r.EV_Title__c);
  return VerifiedLead;
  }else{  
    VerifiedLead = new Leads('You are not Registered to this Event');
        return  VerifiedLead; 
 } 
  }
    
 catch(exception ex){
        VerifiedLead = new Leads('Attendee information not found in DB');
        return  VerifiedLead;   
      }
    
   System.debug('Attend Summary'+AtSummary);
   return null;
  }
  
  
  global class Leads{
  
  
  global String Firstname;
  global String LastName;
  global String Email;
  global String  Company;
  global String  City;
  global String State;
  global String PhoneNo;
  global String Title;
  global String  error;
  global String BarcodeId;
  global String ImageUrl;
  global string country;
  global string eventName;
  global Leads(String error1){
  if(error1==''){
   error ='null';
   }else{
  error = error1;

  }
  
  }
  
  
  global Leads(String Firstname1,String LastName1,String Email1,String Company1,String City1, String State1,String PhoneNo1,String Title1,String BarcodeId1,String ImageUrl1,String Country1,string eventn){
  Firstname = Firstname1;
  LastName = LastName1;
  Email = Email1;
  Company = Company1;
  City = City1;
  State = State1;
  PhoneNo = PhoneNo1;
  Title = Title1;
  eventName =eventn;
  string urlbase =URL.getSalesforceBaseUrl().getHost();
  string orgId = UserInfo.getOrganizationId();
  
  BarcodeId = BarcodeId1;
  ImageUrl = 'https://'+urlbase+'/servlet/servlet.ImageServer?oid='+orgId+'&id='+ImageUrl1;
  country = country1;
  }
  
  }
  static testMethod void resttest(){
   Profile w = [select id from profile where name='Standard User'];
   user bu2 =  new User(alias = 'busers', email='buser2@badmin.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='buser2@badmin.com',CompanyName='Nest',Title='dev');
                  insert bu2;
                  
  Event__c evebu1 = new Event__c(EV_Title__c='Global evebu1 ',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert evebu1 ;
      AttendeeSummary__c attSummarybp = new AttendeeSummary__c(As_prefixNew__c='Mr',AS_FirstName__c='te\"st',AS_LastName__c='boothadmin',AS_Email__c='buser@badmin.com');
     insert attSummarybp;
     Event_Attendee_Mapping__c eam =new Event_Attendee_Mapping__c(AS_id__c=attSummarybp.id,EV_id__c=evebu1.id);
      insert eam;
       System.RestContext.request = new RestRequest();
       RestContext.request.requestURI = '/GlobalnestEM/VERIFYLEAD';
       RestContext.request.addParameter('QRcode',eam.id);
       RestContext.request.addParameter('EventId',evebu1.id);
       RestContext.request.addParameter('UserId', bu2.Id);
       VERIFYLEAD.doPost();
  }
 
 }