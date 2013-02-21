public with sharing class SampleBoothPageCon {

public SampleBoothPageCon ()
{
EventsList();
}


List<User_Profile_Event__c> listOfEvents= new List<User_Profile_Event__c>();


public void EventsList(){
 
 
    system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+UserInfo.getUserId());   
    
        listOfEvents= [select Id,EV_id__c,EV_id__r.EV_Title__c from User_Profile_Event__c where EV_id__c != NULL AND User_id__c=: UserInfo.getUserId() 
                            ORDER BY CreatedDate DESC  ];  
                            
                            
       system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+listOfEvents );  
                            }           
           
}