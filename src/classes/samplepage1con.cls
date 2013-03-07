public class samplepage1con {
 // public  BoothVisitSummary__c rt {get;set;}
 public BoothVisitSummary__c rt {get;set;}

 public samplepage1con () {
  rt =[SELECT id,ScanTime__c from BoothVisitSummary__c where  id='a08O0000002pRdr'];
 }
}