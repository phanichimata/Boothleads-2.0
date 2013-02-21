public class AttachmentUpdateUser{


  

  public AttachmentUpdateUser(){
  
     }

 
 @future
 
  public  static void AttachmentUpdateUserSave(Map<id,id> mapSobject){
   
    List<BoothVisitSummary__c> updateThrClass = new List<BoothVisitSummary__c>();
    System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+mapSobject);
    
     List<BoothVisitSummary__c> iterateBsvList = [Select id,AttachmentId__c from BoothVisitSummary__c where id IN:mapSobject.keyset()];
    for(BoothVisitSummary__c iterateBsv:iterateBsvList ){
  
  System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+iterateBsv);
  
    iterateBsv.AttachmentId__c = mapSobject.get(iterateBsv.id);
    
     updateThrClass.add(iterateBsv);
    
      System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+iterateBsv);
  
  }
    
     upsert updateThrClass;
   
   }

}