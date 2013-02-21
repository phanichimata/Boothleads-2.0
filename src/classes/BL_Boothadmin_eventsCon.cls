public with sharing class BL_Boothadmin_eventsCon {

 
  public PageReference login() {
   if(userInfo.getUserType()=='guest'){
    Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
    pg.setredirect(true);
        return pg;
   } 
   
      List<User_Profile_Event__c> ty =new  List<User_Profile_Event__c>();
      ty=[select Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:userInfo.getUserName() and Profile_id__r.PR_Name__c='eventadmin'];
       if(ty.size()>0){
       Pagereference pg = new pagereference('/apex/BL_EventAdmin_Dashboard');
       pg.setredirect(true);
        return pg;
       
       }else{
       return null;
       }
      
  }

    

public List<Event__c>  events{get;set;}
 public PageReference searchEvent() {
    
 listOfEvents = new List<User_Profile_Event__c>();
 
listOfEvents =[select u.EV_id__r.Status__c,u.EV_id__r.StartTime__c, u.EV_id__r.SecondaryCategory__c,
u.EV_id__r.Primary__c, u.EV_id__r.Name, u.EV_id__r.Id, u.EV_id__r.EV_Title__c, u.EV_id__r.EV_StartDate__c, u.EV_id__r.EV_HostingZipcode__c, 
u.EV_id__r.EV_HostingTimeZone__c, u.EV_id__r.EV_HostingState__c,u.EV_id__r.EV_HostingPostalCode__c,
u.EV_id__r.EV_HostingPhone__c, u.EV_id__r.EV_HostingLocation__c, u.EV_id__r.EV_HostingCountry__c,
u.EV_id__r.EV_HostedByEventBrite__c, u.EV_id__r.EV_HistingAddr1__c, u.EV_id__r.EV_EventLogo__c, 
u.EV_id__r.EV_EndTime__c,u.EV_id__r.EV_EndDate__c, u.EV_id__r.EV_Description__c, u.Profile_id__r.PR_Name__c,
u.EV_id__r.CreatedDate, u.EV_id__r.Attendee_Tags__c,u.EV_id__r.EV_HostingOrgName__c, u.EV_id__r.AS_HostingCity__c,u.EV_id__r.AS_HostingAddr2__c,u.EV_id__r.Event_ZipCode__c from User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and (Status__c!='Mobile only access' And Status__c!='InActive') limit 999 ];

 set<Id> setOfEvents = new set<Id>();
   
 
 
for(User_Profile_Event__c upe:listOfEvents){
 
  setofEvents.add(upe.EV_id__c); 
}

 events  =[Select e.Event_PostalCode__c,e.Event_ZipCode__c,e.EV_HostingStateNew__c,e.EV_HostingCountryNew__c,e.SystemModstamp, e.Status__c, e.StartTime__c, e.SecondaryCategory__c, e.Primary__c, e.OwnerId, e.Name, e.LastModifiedDate, e.LastModifiedById, e.LastActivityDate, e.IsDeleted, e.Id, e.EV_WebsiteURL__c, e.EV_Title__c, e.EV_StartDate__c, e.EV_HostingZipcode__c, e.EV_HostingTimeZone__c, e.EV_HostingState__c, e.EV_HostingPostalCode__c, e.EV_HostingPhone__c, e.EV_HostingOrgName__c, e.EV_HostingLocation__c, e.EV_HostingFax__c, e.EV_HostingCountry__c, e.EV_HostedByEventBrite__c, e.EV_HistingAddr1__c, e.EV_EventLogo__c, e.EV_EndTime__c, e.EV_EndDate__c, e.EV_Description__c, e.CreatedDate, e.CreatedById, e.Attendee_Tags__c, e.AS_HostingCity__c, e.AS_HostingAddr2__c From Event__c e where id in :setofEvents and EV_Title__c like :searcgText+'%'];
 
    for(Event__c gf:events ){
    gf.EV_Title__c =escapeSpecialCharacters(gf.EV_Title__c);
     //upe.EV_id__r.EV_StartDate__c =escapeSpecialCharacters(upe.EV_id__r.EV_StartDate__c);
   gf.EV_HostingLocation__c =escapeSpecialCharacters(gf.EV_HostingLocation__c);
    gf.EV_HostingOrgName__c =escapeSpecialCharacters(gf.EV_HostingOrgName__c);
   gf.Status__c =escapeSpecialCharacters(gf.Status__c);
}
  
    
    return null;

}


    public String searcgText {get; set; }


public String eventSelected { get; set; }
public  List<User_Profile_Event__c> listOfEvents{get;set;} 
public String eventName { get; set; }
public Boolean displayPopUp{get;set;}

public BL_Boothadmin_eventsCon(){
searcgText='';
  //  booleanforDisplayBoothadminTab =false;
ListOfEventsValues();
}


public boolean booleanforDisplayBoothadminTab{get;set;}


public pagereference ListOfEventsValues(){
listOfEvents = new List<User_Profile_Event__c>();

listOfEvents =[select u.EV_id__r.Status__c,u.EV_id__r.StartTime__c, u.EV_id__r.SecondaryCategory__c,
u.EV_id__r.Primary__c, u.EV_id__r.Name, u.EV_id__r.Id, u.EV_id__r.EV_Title__c, u.EV_id__r.EV_StartDate__c, u.EV_id__r.EV_HostingZipcode__c, 
u.EV_id__r.EV_HostingTimeZone__c, u.EV_id__r.EV_HostingState__c,u.EV_id__r.EV_HostingPostalCode__c,
u.EV_id__r.EV_HostingPhone__c, u.EV_id__r.EV_HostingLocation__c, u.EV_id__r.EV_HostingCountry__c,
u.EV_id__r.EV_HostedByEventBrite__c, u.EV_id__r.EV_HistingAddr1__c, u.EV_id__r.EV_EventLogo__c, 
u.EV_id__r.EV_EndTime__c,u.EV_id__r.EV_EndDate__c, u.EV_id__r.EV_Description__c, u.Profile_id__r.PR_Name__c,
u.EV_id__r.CreatedDate, u.EV_id__r.Attendee_Tags__c,u.EV_id__r.EV_HostingOrgName__c, u.EV_id__r.AS_HostingCity__c,u.EV_id__r.AS_HostingAddr2__c from User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and (Status__c!='Mobile only access' And Status__c!='InActive') limit 999 ];
 
  system.debug('BBBBBBBBBBBBBBBBBBBBBBB '+listOfEvents);
  
  set<Id> setOfEvents = new set<Id>();
   
 booleanforDisplayBoothadminTab =false; 
 
for(User_Profile_Event__c upe:listOfEvents){
 if(upe.Profile_id__r.PR_Name__c !='Attendee' && upe.Profile_id__r.PR_Name__c !='BoothPersonnel' ){
      system.debug('88888888888888888888  '+upe.Profile_id__r.PR_Name__c);
      booleanforDisplayBoothadminTab = true;
    }
  setofEvents.add(upe.EV_id__c); 
}

 events  =[Select e.SystemModstamp, e.Status__c, e.StartTime__c, e.SecondaryCategory__c, e.Primary__c, e.OwnerId, e.Name, e.LastModifiedDate, e.LastModifiedById, e.LastActivityDate, e.IsDeleted, e.Id, e.EV_WebsiteURL__c, e.EV_Title__c, e.EV_StartDate__c, e.EV_HostingZipcode__c, e.EV_HostingTimeZone__c, e.EV_HostingState__c, e.EV_HostingPostalCode__c, e.EV_HostingPhone__c, e.EV_HostingOrgName__c, e.EV_HostingLocation__c, e.EV_HostingFax__c, e.EV_HostingCountry__c, e.EV_HostedByEventBrite__c, e.EV_HistingAddr1__c, e.EV_EventLogo__c, e.EV_EndTime__c, e.EV_EndDate__c, e.EV_Description__c, e.CreatedDate, e.CreatedById, e.Attendee_Tags__c, e.AS_HostingCity__c, e.AS_HostingAddr2__c From Event__c e where id in :setofEvents];
 
    for(Event__c gf:events ){
    gf.EV_Title__c =escapeSpecialCharacters(gf.EV_Title__c);
     //upe.EV_id__r.EV_StartDate__c =escapeSpecialCharacters(upe.EV_id__r.EV_StartDate__c);
   gf.EV_HostingLocation__c =escapeSpecialCharacters(gf.EV_HostingLocation__c);
    gf.EV_HostingOrgName__c =escapeSpecialCharacters(gf.EV_HostingOrgName__c);
   gf.Status__c =escapeSpecialCharacters(gf.Status__c);
}
 
return null;

}



public String escapeSpecialCharacters(String input){
        system.debug('vachindhaaaaaaaaaaaaaaaaaaaaaaaaa  before '+input);
      
      
       if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','');
         }
        if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
        
        }
        system.debug('vachindhaaaaaaaaaaaaaaaaaaaaaaaaa  ttttttttttt'+input);
         if(input!= null && input != '' && (input.contains('\\') )){
           system.debug('vachindhaaaaaaaaaaaaaaaaaaaaaaaaa after '+input);
          input = input.replace('\\','');
        }
      
      
     /* 
        if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','\\\"');
         }
        if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
        
        }
        system.debug('vachindhaaaaaaaaaaaaaaaaaaaaaaaaa  ttttttttttt'+input);
         if(input!= null && input != '' && (input.contains('\\') )){
           system.debug('vachindhaaaaaaaaaaaaaaaaaaaaaaaaa after '+input);
          input = input.replace('\\','\\\\');
        }
     */
   return input;
  }






  


public List<Event__c> returnList {get;set;}

public pageReference getEventDetails()
    {
    
       Pagereference pg = new pagereference('/apex/eventDetail?id='+eventName);
       pg.setredirect(true);
        return pg;
        
       
    }
     public PageReference closePopup() {
     displayPopUp= false;
     return null;
    }




}