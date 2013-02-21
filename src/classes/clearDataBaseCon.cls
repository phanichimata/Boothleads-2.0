public with sharing class clearDataBaseCon {

    public String selected { get; set; }

 public string replace { get; set; }
 public string  q{get;set;}
    
    
    
 public clearDataBaseCon() {
 q ='BL_Pricing__c,Event__c,EventSchedule__c,Event_Attendee_Mapping__c,BL_Pricing__c,SecurityControls__c,User_CheckinHistory__c,User_Profile_Event__c,Reports__c,Event_Invitee__c,TicketTypes__c,AttendeePaidHistory__c,Booth_Qrcode__c,DeviceUsage__c,DataImport_SavePoint__c,AttendeeSummary__c,Booth__c,BoothVisitSummary__c,User_Event_BVS__c';
 }


public Pagereference clear(){
for(string spl :q.split(',')){
string makestr ='select id from '+spl;
List<sObject> listofvalues = new List<sObject>();
listofvalues = dataBase.query(makestr); 
delete listofvalues;
}
if(replace!=''){
Mymethod(replace );
}
return null;
}

@future
public static void Mymethod(string df){
List<user> uList1 = new List<user> ();
List<user> uList =[Select Id,username,email,isactive From  user where isactive=true and Id!=:userInfo.getuserId() and  alias !='Guest'];
for(user u :uList){
   string emailis = (u.userName).split('@')[0]+df;
   string tr= (u.userName).split('@')[1];
    system.debug('111111111'+emailis+'@'+tr);
    u.userName = emailis+'@'+tr;
    u.email =emailis+'@'+tr;
    u.isactive =false;
    uList1.add(u); 
  }

update uList1;
}



 static testMethod void myUnitTest(){
 string str ='BL_Pricing__c,Event__c,EventSchedule__c,Event_Attendee_Mapping__c,BL_Pricing__c,SecurityControls__c,User_CheckinHistory__c,User_Profile_Event__c,Reports__c,Event_Invitee__c,TicketTypes__c,AttendeePaidHistory__c,Booth_Qrcode__c,DeviceUsage__c,DataImport_SavePoint__c,AttendeeSummary__c,Booth__c,BoothVisitSummary__c,User_Event_BVS__c';
 clearDataBaseCon gt = new clearDataBaseCon ();
 gt.clear();
 
 }


}