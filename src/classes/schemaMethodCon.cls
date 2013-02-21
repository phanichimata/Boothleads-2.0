public with sharing class schemaMethodCon {
public  Map<String, Schema.SObjectField>  M{get;set;}

public List<phani> hh{get;set;}
public schemaMethodCon(){
  hh = new List<phani>();
  Schema.DescribeSObjectResult R = AttendeeSummary__c.SObjectType.getDescribe();
   Schema.DescribeFieldResult F = Schema.SObjectType.Account.fields.Name;
   
   M = Schema.SObjectType.AttendeeSummary__c.fields.getMap();
    
   set<string> listOfstrings = M.keySet();
      
   for(string s:listOfstrings){
   if(s.contains('__c')){
   hh.add(new phani(s,m.get(s)));
   }
   }   
      
 
}



public class phani{
public string str1{get;set;}
public Schema.SObjectField str2{get;set;}
public phani(string s,Schema.SObjectField y){


if(s.contains('__c')){
s =s.Replace('__c', '');
}
if(s.contains('as_')){
s =s.Replace('as_', '');
}


this.str1=s;


this.str2=y;

}


}




}