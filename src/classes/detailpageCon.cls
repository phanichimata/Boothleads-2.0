public with sharing class detailpageCon {
public String sfdcBaseURL {get;set;}

public List<Account> acc{get;set;}

   public detailpageCon (){
   acc =[SELECT id FROM Account where isdeleted=true ALL ROWS];
}
}