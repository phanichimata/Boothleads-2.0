public with sharing class Bl_reportsCon {

    public String NameoftheSelectedReport { get; set; }

public boolean boolinclude { get; set; }

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


    public boolean displayPopUpForGridadd { get; set; }

    public String strNamesmult { get; set; }

    public PageReference ForwardLeads() {
        return null;
    }


    public PageReference seltoexport() {
     system.debug('--------------------------------------------------------------'+Eventname);
     
    string selectedEventsForExport = apexpages.currentpage().getParameters().get('one');
    if(Eventname == 'Report By Geography' || Eventname == 'Report By Industry' || Eventname ==''){
     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Select at least one attendee'));
    return null;
    }else if ((null != Eventname && ''!=Eventname) ){
    BVSList = new List<BoothVisitSummary__c>(); 
    BVSList = checkBVSList(Eventname);  
    system.debug('Ramaaaaaaaaaaaaaaaaaaaa '+BVSList);  displayPopUpForGridadd =false;
    pagereference pg =page.BL_ExportToCsvReport;
    return pg;
 }else{
  
 return null;
 }
 
    }
    


    public boolean booleanforDisplayBoothadminTab { get; set; }

    public PageReference valuesOfeventswithselectedvalue1() {
   List<User_Event_BVS__c> boothVisitedsbefore= new  List<User_Event_BVS__c>();
     List<User_Event_BVS__c> boothVisitedsbefore1= new  List<User_Event_BVS__c>();
     
     integer recCount =0;
    boothVisiteds = new List<List<User_Event_BVS__c>>();
    string g=  ApexPages.currentpage().getparameters().get('t');
    system.debug('hiiiiii phani '+ApexPages.currentpage().getparameters().get('t'));
    system.debug('hiiiiii eeeeeeee'+eventSelected);
    
    set<User_Event_BVS__c> setboothVisiteds = new  set<User_Event_BVS__c>();
    
    if(g!='All')
    {
    setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c, u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c, u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c, u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c From User_Event_BVS__c u where  (BVS_id__r.EA_AttendeeBarcode__c!=null) and ((u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected and u.BVS_id__r.BVS_State__c like :g+'%') Or (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected and u.BVS_id__r.BVS_State__c like :g+'%'))  order by u.BVS_id__r.BVS_State__c]);  
    boothVisitedsbefore.addAll(setboothVisiteds);
    }
    else
    {
    setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c, u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c, u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c, u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c From User_Event_BVS__c u where ((u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected )  Or (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected )) and  (BVS_id__r.EA_AttendeeBarcode__c!=null)   order by u.BVS_id__r.BVS_State__c ]) ; 
    boothVisitedsbefore.addAll(setboothVisiteds);
    }
    
     for(User_Event_BVS__c gselect: boothVisitedsbefore){
   if(gselect.BVS_id__r.BVS_FirstName__c != null && gselect.BVS_id__r.BVS_FirstName__c !=''){
     gselect.BVS_id__r.BVS_FirstName__c= escapeSpecialCharacters(gselect.BVS_id__r.BVS_FirstName__c);
     }if(gselect.BVS_id__r.BVS_LastName__c !=null && gselect.BVS_id__r.BVS_LastName__c!=''){
      gselect.BVS_id__r.BVS_LastName__c= escapeSpecialCharacters(gselect.BVS_id__r.BVS_LastName__c);
     }if(gselect.BVS_id__r.BVS_Company__c!=null && gselect.BVS_id__r.BVS_Company__c!=''){
     gselect.BVS_id__r.BVS_Company__c =escapeSpecialCharacters(gselect.BVS_id__r.BVS_Company__c);
    }
    
    recCount++;
    boothVisitedsbefore1.add(gselect);
    
    if(recCount==1000)
      {
            boothVisiteds.add(boothVisitedsbefore1);
            boothVisitedsbefore1= new LIST<User_Event_BVS__c>();
            recCount=0;
      }
    
    }
    if(recCount !=0)
   boothVisiteds.add(boothVisitedsbefore1);
    return null;
    }


    public PageReference valuesOfeventswithselectedvalue() {
    boothVisiteds = new List<List<User_Event_BVS__c>>();
      List<User_Event_BVS__c> boothVisitedsbefore= new  List<User_Event_BVS__c>();
     List<User_Event_BVS__c> boothVisitedsbefore1= new  List<User_Event_BVS__c>();
     
     integer recCount =0;
    string g=  ApexPages.currentpage().getparameters().get('t');
    set<User_Event_BVS__c> setboothVisiteds = new  set<User_Event_BVS__c>();
     
     if(g!='All'){
    setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c, u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c, u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c, u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c From User_Event_BVS__c u where ((u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected and BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c like :g+'%') Or (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected and BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c like :g+'%')) and  (BVS_id__r.EA_AttendeeBarcode__c!=null)  order by BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c]);  
    boothVisitedsbefore.addAll(setboothVisiteds);
    }else{
     setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c,
     u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, 
     u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c,
     u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c,
     u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, 
     u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, 
     u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c,
     u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, 
     u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, 
     u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c
     From User_Event_BVS__c u where
     (u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected and BVS_id__c!=null ) 
     Or (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected ) order by BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c]);  
    boothVisitedsbefore.addAll(setboothVisiteds);
    
    }
    
    
    
    
    for(User_Event_BVS__c gselect: boothVisitedsbefore){
   if(gselect.BVS_id__r.BVS_FirstName__c != null && gselect.BVS_id__r.BVS_FirstName__c !=''){
     gselect.BVS_id__r.BVS_FirstName__c= escapeSpecialCharacters(gselect.BVS_id__r.BVS_FirstName__c);
     }if(gselect.BVS_id__r.BVS_LastName__c !=null && gselect.BVS_id__r.BVS_LastName__c!=''){
      gselect.BVS_id__r.BVS_LastName__c= escapeSpecialCharacters(gselect.BVS_id__r.BVS_LastName__c);
     }if(gselect.BVS_id__r.BVS_Company__c!=null && gselect.BVS_id__r.BVS_Company__c!=''){
     gselect.BVS_id__r.BVS_Company__c =escapeSpecialCharacters(gselect.BVS_id__r.BVS_Company__c);
    }
    
    recCount++;
    boothVisitedsbefore1.add(gselect);
    
    if(recCount==1000)
      {
            boothVisiteds.add(boothVisitedsbefore1);
            boothVisitedsbefore1= new LIST<User_Event_BVS__c>();
            recCount=0;
      }
    
    }
    if(recCount !=0)
   boothVisiteds.add(boothVisitedsbefore1);
    
    
    
        return null;
    }

public Boolean displayPopUp{get;set;}
    public PageReference closePopup() {
     displayPopup = false; 
        displayPopUpForGridadd = FALSE;   
        return null;
    }

 public Boolean repWorkBool{get; set;}
 public Boolean repPbcBool{get; set;}
 public   List<List<User_Event_BVS__c>> boothVisiteds{get;set;}
 public String RepName{get; set;}
 
 public string[] displayAlfabets{get;set;}
 
 public Bl_reportsCon(){
 
List<User_Profile_Event__c> BoolforDisplayBoothadminTab = new List<User_Profile_Event__c>();
 List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
BoolforDisplayBoothadminTab = [select Profile_id__c,Profile_id__r.PR_Name__c from User_Profile_Event__c where User_id__r.Email=:UserInfo.getUserNAme() and status__c!='Inactive' and status__c!='Mobile only access'];
system.debug('nnnnnnnnnnnnnnnnnnnnn '+BoolforDisplayBoothadminTab );
for(User_Profile_Event__c ty:BoolforDisplayBoothadminTab ){
if(ty.Profile_id__r.PR_Name__c =='BoothAdmin'){
booleanforDisplayBoothadminTab =true;

}

}

 EvntsForPicklist = new List<Event__c>();
       upeForEvents = [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName()];
       set<Id> setOfEventIds = new set<Id>();
       for(User_Profile_Event__c rotatinnFor:upeForEvents){
       setOfEventIds.add(rotatinnFor.EV_id__c);
       }
       EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
       if(EvntsForPicklist.size()>0){
       eventSelected =EvntsForPicklist[0].id;
       }
 
 getevents();
 displayAlfabets =new string[]{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
 
}

public   List<BoothVisitSummary__c> modbvsList{get;set;}

    public PageReference getEventDetails() {
     system.debug('111111111111111111111' + eventname );
     repPbcBool= FALSE;
     repWorkBool= FALSE;
      integer recCount =0;
      
     set<User_Event_BVS__c> setboothVisiteds= new  set<User_Event_BVS__c>();
     boothVisiteds = new List<List<User_Event_BVS__c>>();
     
     List<User_Event_BVS__c> boothVisitedsbefore= new  List<User_Event_BVS__c>();
     List<User_Event_BVS__c> boothVisitedsbefore1= new  List<User_Event_BVS__c>();
     
    ModbvsList =new List<BoothVisitSummary__c>();
     if(eventname =='Report By Industry'){
     RepName = 'Industry';
    repWorkBool =true;
     setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c, u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c, u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c, u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c From User_Event_BVS__c u where ((u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected) OR (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c=true and u.EV_id__c=:eventSelected and BVS_id__c!=null)) and  (BVS_id__r.EA_AttendeeBarcode__c!=null)  order by u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c]);  
      boothVisitedsbefore.addAll(setboothVisiteds); 
         
    }else if(eventname =='Report By Geography'){
     RepName = 'Geography';
       repPbcBool= TRUE;
      
     setboothVisiteds.addAll([Select id,u.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, u.BVS_id__r.BVS_FollowUps__c, u.BVS_id__r.User_id__c, u.BVS_id__r.EA_AttendeeBarcode__c, u.BVS_id__r.BVS_SurveyAnswer4__c, u.BVS_id__r.BVS_SurveyAnswer3__c, u.BVS_id__r.BVS_SurveyAnswer2__c, u.BVS_id__r.BVS_SurveyAnswer1__c, u.BVS_id__r.BVS_SurveyQuestion4__c, u.BVS_id__r.BVS_SurveyQuestion3__c, u.BVS_id__r.BVS_SurveyQuestion2__c, u.BVS_id__r.BVS_SurveyQuestion1__c, u.BVS_id__r.BVS_Tags__c, u.BVS_id__r.BVS_LeadType__c, u.BVS_id__r.BVS_LeadRating__c, u.BVS_id__r.BVS_Budget__c, u.BVS_id__r.BVS_Notes__c, u.BVS_id__r.BVS_City__c, u.BVS_id__r.BVS_State__c, u.BVS_id__r.BVS_Title__c, u.BVS_id__r.BVS_Email__c, u.BVS_id__r.BVS_PhoneNumber__c, u.BVS_id__r.BVS_LeadCategory__c, u.BVS_id__r.BVS_Company__c, u.BVS_id__r.BVS_LastName__c, u.BVS_id__r.BVS_FirstName__c, u.BVS_id__r.LastActivityDate, u.BVS_id__r.SystemModstamp, u.BVS_id__r.LastModifiedById, u.BVS_id__r.LastModifiedDate, u.BVS_id__r.CreatedById, u.BVS_id__r.CreatedDate, u.BVS_id__r.Name, u.BVS_id__r.IsDeleted, u.BVS_id__r.OwnerId, u.BVS_id__r.Id, u.BVS_id__c From User_Event_BVS__c u where ((u.UPE_id__r.BoothAdmin_id__r.Email=:userInfo.getUserName() and u.UPE_id__r.UEP_isActive__c =true and BVS_id__c!=null and u.EV_id__c=:eventSelected) OR (u.UPE_id__r.User_id__c=:UserInfo.getUserId() and u.UPE_id__r.UEP_isActive__c=true and u.EV_id__c=:eventSelected and BVS_id__c!=null)) and  (BVS_id__r.EA_AttendeeBarcode__c!=null)  order by u.BVS_id__r.BVS_State__c]);  
     boothVisitedsbefore.addAll(setboothVisiteds); 
       system.debug('hello master '+boothVisiteds);   
    }
   
   
   
   
   
   for(User_Event_BVS__c g: boothVisitedsbefore){
   if(g.BVS_id__r.BVS_FirstName__c != null && g.BVS_id__r.BVS_FirstName__c !=''){
     g.BVS_id__r.BVS_FirstName__c= escapeSpecialCharacters(g.BVS_id__r.BVS_FirstName__c);
     }if(g.BVS_id__r.BVS_LastName__c !=null && g.BVS_id__r.BVS_LastName__c!=''){
      g.BVS_id__r.BVS_LastName__c= escapeSpecialCharacters(g.BVS_id__r.BVS_LastName__c);
     }if(g.BVS_id__r.BVS_Company__c!=null && g.BVS_id__r.BVS_Company__c!=''){
     g.BVS_id__r.BVS_Company__c =escapeSpecialCharacters(g.BVS_id__r.BVS_Company__c);
    }
    
    recCount++;
    boothVisitedsbefore1.add(g);
    
    if(recCount==1000)
      {
            boothVisiteds.add(boothVisitedsbefore1);
            boothVisitedsbefore1= new LIST<User_Event_BVS__c>();
            recCount=0;
      }
    
    }
    if(recCount !=0)
   boothVisiteds.add(boothVisitedsbefore1);
   
     displayPopUpForGridadd =true;
    return null;
    }


    public PageReference closePopup1() {
    displayPopUpForGrid  =false;
        return null;
    }


    public PageReference savePopupValues() {
    
    
    system.debug('hi ttttttttttttttttttt');
  
    update objAttendees;
      displayPopUpForGrid  =false;
        getEvents();
        return null;
    }


    public boolean displayPopUpForGrid { get; set; }

    public PageReference editAttendees() {
    
    system.debug('hi phani '+eventname );
   if(eventName !=null){ 
   objAttendees = new Reports__c();
   if(eventname !=null && eventname!=''){
   objAttendees= [select r.RE_Name__c, r.RE_Description__c from  Reports__c r where id=:eventName];
   displayPopUpForGrid  =true;
   } 
   }
   return null;
  }
    
public Reports__c objAttendees{get;set;}    
public string eventname{get;set;}
public List<Event__c> EvntsForPicklist{get;set;}
public string defaultEvent{get;set;}
public   List<BoothVisitSummary__c> bvsList{get;set;}
 public String eventSelected { get; set; }
 public List<Reports__c> boothPerReports{get;set;}
 

     public List<selectOption> getselectEvents() {
       List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
       EvntsForPicklist = new List<Event__c>();
       upeForEvents = [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and (Status__c!='Mobile only access' And Status__c!='InActive') ];
     
     
     
       set<Id> setOfEventIds = new set<Id>();
           for(User_Profile_Event__c rotatinnFor:upeForEvents){
           setOfEventIds.add(rotatinnFor.EV_id__c);
           }
 
       EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
           if(EvntsForPicklist.size()>0){
           defaultEvent =EvntsForPicklist[0].id;
           }
      List<SelectOption> options = new List<SelectOption>();
           for(Event__c Event:EvntsForPicklist ){
           options.add(new SelectOption(Event.id,Event.EV_Title__c));
           }
           return options;
     }
     
     
     
     public  BL_SecuritySettingsCon gg{get;set;}
     public PageReference getEvents() {
     system.debug('hi chinna  '+eventSelected);
     
     boothPerReports = new List<Reports__c> ();
    if(eventSelected !=null && eventSelected !=''){
     boothPerReports =[Select id,r.RE_Name__c, r.RE_Description__c From Reports__c r where r.UPE_id__r.User_id__r.Email=:UserInfo.getUserName() and UPE_id__r.EV_id__c=:eventSelected];
     for(Reports__c tt:boothPerReports){
      tt.RE_Name__c =escapeSpecialCharacters(tt.RE_Name__c);
      tt.RE_Description__c=escape(escapeSpecialCharacters(tt.RE_Description__c));
     }
    
    
    }
     return null;
    }
    
   
    

public String escapeSpecialCharacters(String input){
    if(input!= null && input != '' && (input.contains('\\') )){
       input = input.replace('\\','\\\\');
       }
       if(input!= null && input != '' && (input.contains('"') )){
       input = input.replace('"','\\\"');
       }
       if(input!= null && input != '' && (input.contains('<') )){
       input = input.replace('<','');
       }
      return input;
    }
    
    
     public List<BoothVisitSummary__c> checkBVSList(String listOfBVS){
  integer ph;
  List<BoothVisitSummary__c>  localBVSListSelected = new List<BoothVisitSummary__c> ();
  List<ID> selectedBVSList = new List<ID>();
  
  system.debug('chiumataaaaaaaaaaaaa  '+listOfBVS);
  selectedBVSList = listOfBVS.split(',');
    if(selectedBVSList.size()>0){
       localBVSListSelected =  [Select  b.User_id__r.Name,b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c,b.EA_AttendeeBarcode__r.AS_id__r.Id, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkZipCode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WebsiteUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ThroughEventBrite__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingZipcode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NumberOfEmployees__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode5__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode4__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode3__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeZipcode__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_DiversityType__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessTaxId__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessRevenue__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessEstablishedDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDunsNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BlogUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BirthDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Age__c From BoothVisitSummary__c b where id in :selectedBVSList and  EA_AttendeeBarcode__c!=null ];
          if(localBVSListSelected.size()>0){
              for(BoothVisitSummary__c rt : localBVSListSelected ){
              
                  rt.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c);
                 
       if(rt.BVS_FirstName__c != null && rt.BVS_FirstName__c!=''){
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c =escape(rt.BVS_FirstName__c); 
         }
       
                  
         
       
        if(rt.BVS_lastName__c != null && rt.BVS_LastName__c!=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c =escape(rt.BVS_LastName__c); 
       }       
          
           if(rt.BVS_Title__c != null && rt.BVS_Title__c!=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c =escape(rt.BVS_Title__c); 
       } 
                  
           if(rt.BVS_Company__c != null && rt.BVS_Company__c !=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c =escape(rt.BVS_Company__c); 
       } 
     
     
      if(rt.BVS_PhoneNumber__c != null && rt.BVS_PhoneNumber__c !=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c =escape(rt.BVS_PhoneNumber__c); 
       }  
                 
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c);
         
         
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory1__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory1__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c);
         
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c);
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c);
          rt.BVS_FollowUps__c =escape(rt.BVS_FollowUps__c);
          rt.BVS_Notes__c =escape(rt.BVS_Notes__c);
         }
       } 
   }    
       return localBVSListSelected;
  }
  
  public string escape(string s){
   if(s != null && s.contains(',')){
     s=s.replaceAll('"','');
     s='"'+s+'"';
   } 
    return s;
 }
 
 
 
 
 
 
  static testMethod void myUnitTest() {
 
  contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           insert m;
       Profile w = [select id from profile where name='Standard User'];
   // ------------------ Eventadmin Insert ---------------------
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
                  Id eventAdminId=u.id;       
                  
         
     // ------------------ Boothtadmin Insert ---------------------
         
user bAdmin =  new User(alias = 'testboot', email='testboothadmin@noemail.com',
emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
localesidkey='en_US',country='United States',
timezonesidkey='America/Los_Angeles', username='testboothadmin@noemail.com');
insert bAdmin ;
Id boothAdminId=bAdmin.id;
                  
Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
insert  customProfile;
       
Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
insert  customProfileBooth;
       
Id  profileId=customProfile.Id;
Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
EV_EndDate__c =  Date.Parse('01/18/2014'),
EV_StartDate__c = Date.Parse('01/18/2014'),
EV_EndTime__c='09:00 AM',
StartTime__c='11:00 AM');
insert eve;
Id EventId=eve.Id;
     
User_Profile_Event__c upebooth = new User_Profile_Event__c(EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,Profile_id__c=customProfileBooth.id,Status__c='Active',User_id__c=eventAdminId,UEP_isActive__c=true);         
insert upebooth; 
     
Booth__c booth = new Booth__c(BT_Name__c='TestBooth',BT_BoothUserCount__c=100.0);
insert booth;                  
Id  boothId =booth.id;    
               
User_Profile_Event__c upe = new User_Profile_Event__c(BT_id__c=boothId,BoothAdmin_id__c=boothAdminId,EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,IsBoothPersonnel__c=true,Profile_id__c=profileId,Status__c='Active',User_id__c=boothAdminId,UEP_isActive__c=true);         
insert upe;         
     
     AttendeeSummary__c attSummary = new AttendeeSummary__c(As_prefixNew__c='Mr',AS_FirstName__c='te\"st',AS_LastName__c='boothadmin',AS_Email__c='testboothadmin@noemail.com');
     insert attSummary;
     string attendeeEvent= string.valueOf(attSummary.Id)+string.valueOf(EventId);   
     
     Event_Attendee_Mapping__c event_att_map = new Event_Attendee_Mapping__c(EV_id__c=EventId,AS_id__c=attSummary.Id,Attendee_Event_IDs__c=attendeeEvent);
     insert event_att_map ;           
     
     Event_Attendee_Mapping__c getEvent_att_map = new Event_Attendee_Mapping__c ();
     getEvent_att_map  =[select id,Attendee_Event_IDs__c,EV_id__c,AS_id__c from Event_Attendee_Mapping__c  where Id=:event_att_map.Id];
     
     getEvent_att_map  .EA_AttendeeBarcode__c =string.valueOf(event_att_map.Id)+'-'+string.valueOf(EventId);            
     update getEvent_att_map  ;          
     system.debug('----------------------- '+event_att_map);
      
      
      Reports__c  reportIndustry = new Reports__c(RE_Name__c='Report By Industry',UPE_id__c=upe.Id);
      insert reportIndustry ;
      
      Reports__c  reportGeography = new Reports__c(RE_Name__c='Report By Geography ',UPE_id__c=upe.Id);
      insert reportGeography ;
            
     
     
     
     BoothVisitSummary__c boothVisitSummary= new BoothVisitSummary__c(BVS_Company__c='Nest',BVS_LeadRating__c=4.4,Follow_Update__c=datetime.valueOf('2012-05-15 00:00:00'),ScanTime__c=datetime.valueOf('2012-05-15 00:00:00'),BVS_FirstName__c='Scan',BVS_LastName__c='Me',BVS_Email__c='testboothadmin@noemail.com',EA_AttendeeBarcode__c=getEvent_att_map.Id,User_id__c=bAdmin.Id);
     insert boothVisitSummary;
     
     
     User_Event_BVS__c  use_Eve_BVS = new User_Event_BVS__c(BVS_id__c=boothVisitSummary.Id,EV_id__c=EventId,UPE_id__c=upe.Id);
     insert use_Eve_BVS;
     
     
    SecurityControls__c secControl = new SecurityControls__c(EV_id__c=EventId,EV_Req_Fields__c='AS_FirstName__c',EV_Fields__c='AS_FirstName__c,AS_Company__c,AS_Title__c,AS_CellPhone__c,AS_Age__c,AS_Gender__c,AS_BirthDate__c,AS_HomeAddress1__c,AS_ShippingAddress1__c,AS_WorkAddress1__c,AS_NAICSCode1__c,AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_PrimaryBusinessCategory__c,AS_SecondaryBusinessCategory__c,AS_NumberOfEmployees__c,AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_BusinessDunsNumber__c,AS_WebsiteUrl__c,AS_BlogUrl__c,AS_BusinessDescription__c,AttendeePic'); 
    insert  secControl ;   
 
 PageReference pageRef = Page.Bl_Reports;
Test.setCurrentPage(pageRef);


 
 
 system.runAs(bAdmin){ 
 Bl_reportsCon reports = new Bl_reportsCon();
 reports.login();
 reports.ForwardLeads();
 
 
 reports.eventname ='Report By Industry';
 reports.eventSelected =EventId;
 reports.getEventDetails();
 
 reports.eventname ='Report By Geography';
 reports.getEventDetails();
 reports.closePopup1();
 reports.getselectEvents();
  reports.eventName =reportIndustry.Id;
 reports.editAttendees();
 reports.savePopupValues();
 ApexPages.currentPage().getParameters().put('t', 't');
 reports.valuesOfeventswithselectedvalue1();
 reports.valuesOfeventswithselectedvalue();
 
 ApexPages.currentPage().getParameters().put('t', 'All');
 reports.valuesOfeventswithselectedvalue1();
  reports.valuesOfeventswithselectedvalue();
 
 reports.closePopup();

  reports.Eventname=boothVisitSummary.id;
 reports.seltoexport();
 
 }
 
 
 system.runas(u){
    Bl_reportsCon reports = new Bl_reportsCon();
 reports.login();
 
 
    }
 }

}