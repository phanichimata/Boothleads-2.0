public with sharing class BL_Mailpagecon {
   
  /** 
public List<inn> listinn{get;set;}
public List<SelectOption> optionsevediversity {get;set;}
List<SelectOption> optionsevediversity2 {get;set;}
public List<string> optionsAttdiversity {get;set;}
public List<Event_Attendee_Mapping__c> eventslist{get;set;}
public List<string> optionsattdiversity2 {get;set;}

public BL_Mailpagecon(){
eventslist = new List<Event_Attendee_Mapping__c>();
eventslist  =[select EV_id__c,EV_id__r.EV_Title__c,EV_id__r.EventDiversityValues__c,DiversityType__c from Event_Attendee_Mapping__c where AS_id__c='a06O000000Hmjyd'];
listinn = new List<inn>();
mapIdandObject = new MAP<Id,Event_Attendee_Mapping__c>();


for(Event_Attendee_Mapping__c at :eventslist){
mapIdandObject.put(at.Id,at);
optionsAttdiversity = new List<string>();
optionsevediversity = new List<SelectOption>();
optionsevediversity2 = new List<SelectOption>();
integer i=0;
 for(string s:at.EV_id__r.EventDiversityValues__c.split(';')){
    if(math.mod(i,2)==0){
    optionsevediversity.add(new SelectOption(s,s));
    }else{
    optionsevediversity2.add(new SelectOption(s,s));
    }
    i++;
  }
  
  optionsAttdiversity=at.DiversityType__c.split(';');
  optionsattdiversity2 =at.DiversityType__c.split(';');
  listinn.add(new inn(at.EV_id__r.EV_Title__c,optionsAttdiversity ,optionsevediversity2,optionsevediversity,at.id,optionsattdiversity2 ));
  }
 }

public MAP<Id,Event_Attendee_Mapping__c> mapIdandObject{get;set;}


public PageReference save(){
   List<Event_Attendee_Mapping__c> updateList= new List<Event_Attendee_Mapping__c>();
   map<id,string> mapAejandDiversity = new map<id,string>();   
   for(inn h:listinn){
   string strAfterformation='';
   string[] total = new string[]{};
   total=h.optionsAttdiversityInn; 
   total.addAll(h.optionsAttdiversityInn2);
   for(string tre:total){
   if(strAfterformation ==''){
   strAfterformation=tre+';';
   }else{
   strAfterformation = strAfterformation+tre+';';
   }
   }
   system.debug('yyyyyyyyyyyy '+strAfterformation);
   Event_Attendee_Mapping__c obj =mapIdandObject.get(h.iInn);
   obj.DiversityType__c = strAfterformation;
   updateList.add(obj);
   } 
   update updateList;
    return null;
 }




 public class inn{
 public List<SelectOption> optionsevediversityInn {get;set;}
 public List<string> optionsAttdiversityInn {get;set;}
 public List<SelectOption> optionsevediversityInn2 {get;set;}
 public List<string> optionsAttdiversityInn2 {get;set;}
 public Id iInn{get;set;}
 public string eventName{get;set;}
 public inn(string s,List<string> l1,List<selectOption> l2,List<selectOption> l3,id i,List<string> l4){
 this.eventName =s;
 this.optionsAttdiversityInn =l1;
 this.optionsAttdiversityInn2 =l4;
 this.optionsevediversityInn =l2;
 this.optionsevediversityInn2 =l3;
 this.iInn =i;
 }
}

**/

}