public without sharing class Boothadmin_Scan_trackingCon {

public Boothadmin_Scan_trackingCon(){
showBoothadmin();
}

public integer androidUsers{get;set;}
public integer IphoneUsers{get;set;}

public void showBoothadmin(){
inn = new List<inncls>();
MAP<Id,string> mapIos = new  MAP<Id,string>();
List<DeviceUsage__c> iphone = new List<DeviceUsage__c>();
List<DeviceUsage__c> android = new List<DeviceUsage__c>();

for(DeviceUsage__c Du:[select User__c,User__r.id,OsVersion__c from DeviceUsage__c where EV_id__r.id='a00F0000008DXWt']){
 mapIos.put(Du.User__r.id,du.OsVersion__c);	
  if(Du.OsVersion__c=='Android'){
  	iphone.add(du);
  }else if(Du.OsVersion__c=='iOS'){
  	android.add(du);
    }
  
}

androidUsers =android.size();

IphoneUsers =iphone.size();

set<id> setOfBvs = new set<id>();
for(User_Event_BVS__c lusres:[select BVS_id__r.id,BVS_id__c from User_Event_BVS__c where EV_id__r.Id='a00F0000008DXWt']){
	setOfBvs.add(lusres.BVS_id__r.id);
	
}
 integer i=0;

  for(sObject listOfobj:[select count(id) re,User_id__r.FirstName f,User_id__r.LastName l,User_id__r.id c,User_id__c from BoothVisitSummary__c where EA_AttendeeBarcode__c!=null and ID IN :setOfBvs  group BY User_id__c,User_id__r.FirstName,User_id__r.LastName,User_id__r.id order by count(id) DESC]){ 
  string lName =(string)listOfobj.get('l');
  string fName =(string)listOfobj.get('f');
  integer coun=(integer)listOfobj.get('re');
  Id df =(Id)listOfobj.get('c');
  string iosver = mapIos.get(df);
  inn.add(new inncls(lName,fName,coun, ++i,iosVer));
  
 }

}



public List<inncls> inn{get;set;}
public class inncls{
public string lastName{get;set;}
public string firstName{get;set;}
public integer numberOfscans{get;set;}
public integer sNo{get;set;}
public string OSVersion{get;set;}
public inncls(string s,string w,integer co,integer bhy,string ver){
lastName=s;
sNo =bhy;
OSVersion = ver;
firstName=w;
numberOfscans=co;
}


}



}