@RestResource(urlMapping='/DeviceUsage/*')

/*
 * AUTHOR: Venkatesh 
 * Email : venkatesh@globalnest.com
 * Phone : 9989522656 
 * AIM   : DeviceUsage is for saving device usage information in the server
 */

 global class DeviceUsage{
    
    global static String EventId;
    global static String UserID;  
    global static String IMEI;
    global static String OSversion;   
    @HttpGet
    global static EventDetails1 doGet(){
    //Request Context
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    System.debug('@@@@@req'+req);
    EventId = req.params.get('EventId');
    System.debug('@@@@@EventId'+EventId);
    UserID  = req.params.get('UserID');
    System.debug('@@@@@UserID'+UserID);
    IMEI = req.params.get('IMEI');
    System.debug('@@@@@UserID'+UserID);
    OSversion = req.params.get('OSversion');
    System.debug('@@@@@UserID'+UserID);
    list<DeviceUsage__c> deviceUsageexist = new list<DeviceUsage__c>();
    try{
         User u = [select Email,username from User where id =:UserID];
         System.debug('@@@@@u'+u);
         Event_Attendee_Mapping__c Emap = [select id from  Event_Attendee_Mapping__c  where AS_id__r.AS_Email__c=:u.Email AND  EV_id__r.id =:EventId limit 1];        
         System.debug('@@@@@Emap'+Emap);
         deviceUsageexist =[select id from DeviceUsage__c where EV_id__c=:EventId  AND  User__c=:UserID AND IMEI__c=:IMEI  AND OsVersion__c=:OSversion];
         if(deviceUsageexist.size() > 0 ){
         
          System.debug('This is already existed');         
         }
         
         else{
         DeviceUsage__c deviceUse = new DeviceUsage__c();
         deviceUse.EV_id__c =EventId;
         deviceUse.User__c =UserID;
         deviceUse.IMEI__c =IMEI;
         deviceUse.OsVersion__c =OSversion;   
         insert deviceUse;    
         }      
     EventDetails1 ES2 = new EventDetails1('Suceesfully updated');
     System.debug('@@@@@ES2'+ES2);
     //EventDetails2 .add(ES2);
     return ES2;
       }
   catch(Exception ex) {
   EventDetails1 ES2 = new EventDetails1('You are not registered to this event');
   System.debug('@@@@@ES2'+ES2);
   //EventDetails2 .add(ES2);
   return ES2;
    }
        
     }
            
            
       global  class EventDetails1{
              String Message;
              global EventDetails1(String Message1){
              Message = Message1;
              }
              }
              
               static testMethod void testrest(){
   Profile w = [select id from profile where name='Standard User'];
  User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
                  Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert eve;
       AttendeeSummary__c attSummarybp = new AttendeeSummary__c(As_prefixNew__c='Mr',AS_FirstName__c='te\"st',AS_LastName__c='boothadmin',AS_Email__c='test123@noemail.com');
     insert attSummarybp;
     Event_Attendee_Mapping__c eam =new Event_Attendee_Mapping__c(AS_id__c=attSummarybp.id,EV_id__c=eve.id);
      insert eam;
      DeviceUsage__c device=new DeviceUsage__c(EV_id__c=eve.id,IMEI__c='12365',OsVersion__c='safari 6',User__c=u.id);
     insert device;
     System.RestContext.request = new RestRequest();
       RestContext.request.requestURI = '/GlobalnestEM/DeviceUsage';
       RestContext.request.addParameter('QRcode',eam.id);
       RestContext.request.addParameter('EventId',eve.id);
       RestContext.request.addParameter('UserID', u.Id);
       RestContext.request.addParameter('OSversion', 'safari 6');
       RestContext.request.addParameter('IMEI', '12365');
       DeviceUsage.doGet();
        device.IMEI__c=null;
        update device;
         DeviceUsage.doGet();
  
  }
            }