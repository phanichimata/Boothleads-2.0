@RestResource(urlMapping='/VERIFYLEAD1/*')

global class  testSynch{
    
    
    global static List<BoothVisitSummary__c> bothVisit;
    
    global static List<BoothVisitSummary> boothVisit1;
    
    
    @HttpGet
    
    
    global static List<BoothVisitSummary> doGet(){
        
    
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    
    System.debug('@@@@@req'+req);
        
        
        boothVisit1 = new List<BoothVisitSummary>();
        
        bothVisit = [Select EA_AttendeeBarcode__c,User_id__c,BVS_FirstName__c,BVS_LastName__c,BVS_Email__c from BoothVisitSummary__c where id!=null];
        
        
        
        For(BoothVisitSummary__c bth:bothVisit){
            
            
            BoothVisitSummary BVS = new BoothVisitSummary(bth.EA_AttendeeBarcode__c,bth.User_id__c,bth.BVS_FirstName__c,bth.BVS_LastName__c,bth.BVS_Email__c,'');
            
            boothVisit1.add(BVS);
            
            
        
        }
        
        
        return boothVisit1;
        
        
        
        
    }




global class BoothVisitSummary{


  String UserId;
  
  String EventId;
  
  String  Barcode;
  
  String FirstName;
  
  String LastName;
  
  String Email;
  
  String City;
  
  String State;
  
  String Country;
  
  


   global BoothVisitSummary(String UserId1,String EventId1,String Barcode1,String FirstName1,String LastName1,String Email1){
    
    
    UserId = UserId1;
    
    EventId = EventId1;
    
    Barcode = Barcode1;
    
    FirstName = FirstName1;
    
    LastName = LastName1;
    
    Email = Email1;
    
   }

}

}