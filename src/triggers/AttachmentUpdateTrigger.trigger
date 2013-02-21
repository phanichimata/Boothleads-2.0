trigger AttachmentUpdateTrigger on BoothVisitSummary__c (before Insert, before update) {

 List<BoothVisitSummary__c> BSVtoUpdateList = new List<BoothVisitSummary__c>();
 
 //Map<id,BoothVisitSummary__c> BSVtoUpdateMap = new  Map<id,BoothVisitSummary__c>();
 
// Map<BoothVisitSummary__c,id> BSVtoUpdateMap = new  Map<BoothVisitSummary__c,id>();
 Map<id,id> BSVtoUpdateMap = new  Map<id,id>();

 Set<id>   BSVtoUpdateId =  new set<id>();

for(BoothVisitSummary__c BSVtoUpdate : Trigger.New){

 BSVtoUpdateId.add(BSVtoUpdate.id);

}

  system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+BSVtoUpdateId);
  
  For(Attachment AttachmentToupdate :[Select id,parentId from  attachment where parentId IN:BSVtoUpdateId]){
  
    //BSVtoUpdateList.add(Trigger.newMap.get(AttachmentToupdate.parentId));
     
    BSVtoUpdateMap.put(AttachmentToupdate.parentId,AttachmentToupdate.id);
  
  }
  
  
 // AttachmentUpdateUser testone = new AttachmentUpdateUser();
  
  AttachmentUpdateUser.AttachmentUpdateUserSave(BSVtoUpdateMap);
  
  /**
  for(BoothVisitSummary__c iterateBsv:BSVtoUpdateMap.keyset()){
  
  System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+iterateBsv);
  
    iterateBsv.AttachmentId__c = BSVtoUpdateMap.get(iterateBsv);
    
      System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+iterateBsv);
  
  }
  
 **/ 
 


}