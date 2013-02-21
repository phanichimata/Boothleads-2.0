public with sharing class BL_Attendeeportal_moreEventscon {

    public PageReference movetoregisterpage() {
    PageReference pg = new pageReference('/apex/BL_Attendee_Register?event='+Apexpages.currentpage().getparameters().get('eventName')); 
    pg.setRedirect(true);
    return pg;
    }


    public PageReference searchEvent() {
      lisiofEvents = new List<Event__c>();
lisiofallEvents = new List<Event__c>();
lisioflistEvents= new List<List<Event__c>>();



lisiofallEvents = [select Attendee_Tags__c,EV_ContactURL__c,EV_CustomReg__c,EV_Description__c,EV_EndDate__c,EV_EndTime__c,Event_ZipCode__c,
EV_EventLogo__c,Event_PostalCode__c,EV_HistingAddr1__c,EV_HostedByEventBrite__c,
AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountry__c,EV_HostingCountryNew__c,EV_HostingFax__c,EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingState__c,EV_HostingStateNew__c,EV_HostingTimeZone__c,EV_HostingZipcode__c,EV_IncludedFields__c,Primary__c,EV_Publish__c,EV_QuickReg__c,EV_RedirectURI__c,Ev_RequiredFields__c,SecondaryCategory__c,EV_SiteLocation__c,EV_StartDate__c,StartTime__c,Status__c,EV_Title__c,EV_WebsiteURL__c from Event__c where EV_Title__c like :serachString+'%' AND EV_Publish__c = TRUE   order by EV_EndDate__c desc];

integer i =0;
integer j=0;

for(Event__c eve:lisiofallEvents ){
 if(j==2){
  lisiofEvents.add(eve);
 lisioflistEvents.add(lisiofEvents);
 lisiofEvents = new List<Event__c>();
 j=0;
 }else{
  lisiofEvents.add(eve);
 j++;
 }
 
}

if(lisiofEvents.size()>0){ 
lisioflistEvents.add(lisiofEvents);
}
return null;
}
 


    public String serachString { get; set; }

   

public List<List<Event__c>> lisioflistEvents{get;set;}
public List<Event__c> lisiofEvents{get;set;}
public List<Event__c> lisiofallEvents{get;set;}

public BL_Attendeeportal_moreEventscon(){
lisiofEvents = new List<Event__c>();
lisiofallEvents = new List<Event__c>();
lisioflistEvents= new List<List<Event__c>>();



lisiofallEvents = [select Attendee_Tags__c,EV_ContactURL__c,EV_CustomReg__c,EV_Description__c,EV_EndDate__c,EV_EndTime__c,Event_ZipCode__c,
EV_EventLogo__c,Event_PostalCode__c,EV_HistingAddr1__c,EV_HostedByEventBrite__c,
AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountry__c,EV_HostingCountryNew__c,EV_HostingFax__c,EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingPostalCode__c,EV_HostingState__c,EV_HostingStateNew__c,EV_HostingTimeZone__c,EV_HostingZipcode__c,EV_IncludedFields__c,Primary__c,EV_Publish__c,EV_QuickReg__c,EV_RedirectURI__c,Ev_RequiredFields__c,SecondaryCategory__c,EV_SiteLocation__c,EV_StartDate__c,StartTime__c,Status__c,EV_Title__c,EV_WebsiteURL__c from Event__c WHERE EV_Publish__c = TRUE order by EV_EndDate__c desc];

integer i =0;
integer j=0;

for(Event__c eve:lisiofallEvents ){
 if(j==2){
  lisiofEvents.add(eve);
 lisioflistEvents.add(lisiofEvents);
 lisiofEvents = new List<Event__c>();
 j=0;
 }else{
  lisiofEvents.add(eve);
 j++;
 }
 
}

if(lisiofEvents.size()>0){ 
lisioflistEvents.add(lisiofEvents);
}
}





}