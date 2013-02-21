@RestResource(urlMapping='/UPDATEDATA/*')

/*
 * AUTHOR: Venkatesh 
 * Email : venkatesh@globalnest.com
 * Phone : 9989522656 
 * AIM   : UPDATEDATA is for updating Information from Offline 
 */
   
   global with sharing class UPDATEDATA{
    
   global static String EventId;
   
   global static String UserId;
   
   global static DataReadyRes Datares1;
   
   global static List<Booth> Booth1 = new List<Booth>();  
    
   global static List<EventSchedule2> EventSchedule3;
   
   global static List<Event_Attendee_Mapping__c> EM;
      
   global static List<Booth__c> Booth6;
        
   global static List<EventSchedule__c> EventSchedule1;
    
   global static List<Event_Attendee_Mapping__c>  EAmapping;
    
   global static List<AttendeeDetails1> AD1 = new List<AttendeeDetails1>(); 
    
    
    
    
   @HttpGet
    
    global static DataReadyRes  doGet(){
    
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    System.debug('@@@@@req'+req);
    

    EventId = req.params.get('EventId');

    UserId= req.params.get('UserId');
     
  
     Datares1= new DataReadyRes();
     
     
      EventSchedule1 = [Select id,ES_Description__c,ES_EndDate__c,ES_EndTime__c,ES_Location__c,ES_Presenter__c,ES_ProgramName__c,ES_StartDate__c,ES_StartTime__c
    
                       From EventSchedule__c where EV_id__r.id =:EventId order by id];
    
    
    System.debug('@@@@@EventSchedule1'+EventSchedule1);
    
        if(EventSchedule1.size() == 0){
            
          EventSchedule2 ES2 = new EventSchedule2('The Schdule is in Progress!');
            
    System.debug('@@@@@ES2'+ES2);
       // EventSchedule3.add(ES2);
       
      Datares1.Esc.add(ES2);
       
            
        }
    
        
    For(EventSchedule__c ES:EventSchedule1){
        
        EventSchedule2 ES2 = new EventSchedule2(ES.ES_ProgramName__c,ES.ES_Description__c,ES.ES_Location__c,ES.ES_Presenter__c,ES.ES_StartDate__c,ES.ES_EndDate__c,ES.ES_StartTime__c,ES.ES_EndTime__c);
        
        System.debug('@@@@@ES2'+ES2);
        
       //EventSchedule3.add(ES2);
        
        Datares1.Esc.add(ES2);
        
    }
     
     
     
    List<Booth__c> booth2 =[Select id,BT_Name__c,BT_Description__c,BT_ContactName__c,BT_ContactEmail__c,BT_ContactPhone__c,BT_WebsiteURL__c from Booth__c where EV_id__r.id=:EventId AND IsUpdated__c = true];
     
    System.debug('@@@@@booth2'+booth2);
    
    For(Booth__c Bo :booth2){
    
    Booth b2 = new Booth(BO.id,Bo.BT_Name__c,Bo.BT_Description__c,Bo.BT_ContactName__c,Bo.BT_ContactPhone__c,Bo.BT_ContactEmail__c,BO.BT_WebsiteURL__c);
    
    System.debug('@@@@@b1'+b2);
  
    //Booth1.add(b2); 
    
        Datares1.booth5.add(b2);        
           
    }
     
    
    EAmapping = [Select AS_id__r.id,AS_id__r.AS_ImageUrl__c,AS_id__r.AS_FirstName__c,AS_id__r.AS_LastName__c,AS_id__r.AS_Company__c,AS_id__r.AS_Email__c,AS_id__r.AS_WorkPhone__c,AS_id__r.AS_WorkCity__c,AS_id__r.AS_WorkState__c from Event_Attendee_Mapping__c where EV_id__r.id=:EventId AND AS_id__r.isUpdated__c=true];
   
   
   //
    System.debug('@@@@@EAmapping'+EAmapping.size());
   
   
   For(Event_Attendee_Mapping__c EAM :EAmapping  ){
   
   
   AttendeeDetails1 at1 = new AttendeeDetails1(EAM.AS_id__r.id,EAM.AS_id__r.AS_ImageUrl__c,EAM.AS_id__r.AS_FirstName__c,EAM.AS_id__r.AS_LastName__c,EAM.AS_id__r.AS_Company__c,EAM.AS_id__r.AS_Email__c,EAM.AS_id__r.AS_WorkPhone__c,EAM.AS_id__r.AS_WorkCity__c,EAM.AS_id__r.AS_WorkState__c);
   
      System.debug('@@@@@at1 '+at1);
   
   // AD1.add(at1); 
   
   Datares1.Atd1.add(at1); 
           
           
   
   }
    
    return Datares1; 
    
    
    
    }
    
    
   
   
   global class  DataReadyRes{
   
   List<EventSchedule2>  Esc;
   
   List<AttendeeDetails1> Atd1;
   
   List<Booth> booth5;
   
   
   
   global DataReadyRes(){
   
   Esc = new List<EventSchedule2>();
   
   Atd1 = new List<AttendeeDetails1>();
   
   booth5 = new List<Booth>();
  
   }
  
   
   } 
   
   global class AttendeeDetails1{
    
   ID Attendee_QR_ID;
   
   String Image_URL;
   
   String FirstName;
   
   String LastName;
   
   String Company;
  
   String Email;
   
   String PhoneNo;

   String City;

   String State;

   String message;
   
   
   
   global AttendeeDetails1( ID Attendee_QR_ID1,String Image_URL1, String  FirstName1, String  LastName1,String Company1,String Email1, String PhoneNo1,String City1,String State1){
   
   Attendee_QR_ID = Attendee_QR_ID1;
   
   Image_URL = Image_URL1;
   
   FirstName = FirstName1;
   
   LastName = LastName1;
   
   Company = Company1;
   
   Email = Email1;
   
   PhoneNo = PhoneNo1;
   
   City = City1;
   
   State = State1;
   
   }
   
   
   global AttendeeDetails1(String message1){
   
   message = message1;
   
   }
   
   
    }
    
    
    global class Booth{
    
    Id Booth_ID;
    //Id Booth_Product_ID;
    String Booth_Name;
    String Booth_Description;
    String Booth_ContactName;
    String Booth_ContactPhoneNo;
    String Booth_ContactEmail;
    String Booth_Website;
    String Message;
    
    
    global Booth(String Message1){
    
      Message = Message1;
    }
    
    
    global Booth(Id Booth_ID1, String Booth_Name1, String Booth_Description1, String Booth_ContactName1,String Booth_ContactPhoneNo1,String Booth_ContactEmail1,String Booth_Website1){
    
    
    Booth_ID = Booth_ID1;
    
    //Booth_Product_ID = Booth_Product_ID1;
    
    Booth_Name = Booth_Name1;
    
    Booth_Description = Booth_Description1;
    
    Booth_ContactName = Booth_ContactName1;
    
    Booth_ContactPhoneNo = Booth_ContactPhoneNo1;
    
    Booth_ContactEmail = Booth_ContactEmail1;
    
    Booth_Website = Booth_Website1;
    
    }
      
    }
 
 
  global class EventSchedule2{
        
        
        global string Message;
        global String ProgramName;
        
        global String Description;
        
        global  String Location;
        
        global String Presenter;
        
        global Date StartDate;
        
        global Date EndDate;
    
       global String StartTime;
       
       global String EndTime;
       
        
        global EventSchedule2(String Message1){
            Message= Message1;
        }
        
        
        global EventSchedule2(String ProgramName1,String Description1,String Location1,String Presenter1,Date StartDate1,Date EndDate1,String StartTime1,String EndTime1){
            
            ProgramName = ProgramName1;
            
            Description = Description1;
            
            Location  = Location1;
            
            Presenter = Presenter1; 
            
            StartDate = StartDate1;
            
            EndDate  =   EndDate1;
            
            StartTime =  StartTime1;
            
            EndTime   =  EndTime1;
                    
        }
      
    }
 
   
   }