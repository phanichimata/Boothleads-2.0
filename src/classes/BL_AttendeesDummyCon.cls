public with sharing class BL_AttendeesDummyCon 
{
 public PageReference search() 
 {   
   set<id> setofboothpersonnelIds = new  set<id>();
   bvsList = new List<BoothVisitSummary__c>(); 
   List<User_Event_BVS__c> bvsvalues = new  List<User_Event_BVS__c>(); 
       
   system.debug('Value of 1111111111111 '+eventSelected);
       if(eventSelected =='All')
       {
        system.debug('Value of 2222222222222222222'+eventSelected);
        bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com') OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com'  and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
        system.debug('Value of 33333333333333333 '+bvsvalues);
       } 
       else
       {
       system.debug('Value of 4444444444444444 '+eventSelected);
       
       bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected) OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
       
       system.debug('Value of 555555555555555555 '+bvsvalues);
       
       }  
          
       for(User_Event_BVS__c h:bvsvalues)
       {
        setofboothpersonnelIds.add(h.BVS_id__c);
       }
       bvsList = [Select b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.User_id__c, b.User_id__r.Name,b.SystemModstamp, b.OwnerId, b.Name, b.LastModifiedDate, b.LastModifiedById, b.LastActivityDate, b.IsDeleted, b.Id, b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c From BoothVisitSummary__c b where id in :setofboothpersonnelIds and (BVS_FirstName__c like :searchString+'%'  or BVS_LastName__c like :searchString+'%' or BVS_Email__c like :searchString+'%' Or BVS_PhoneNumber__c like :searchString+'%') limit 999];
   
       system.debug('Value of 6666666666666 '+bvsList);
   
       for(BoothVisitSummary__c yt:bvsList)
       {
        yt.BVS_FirstName__c =escapeSpecialCharacters(yt.BVS_FirstName__c); 
            
        system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ after '+yt.BVS_FirstName__c);
        yt.BVS_LastName__c =escapeSpecialCharacters( yt.BVS_LastName__c);
        yt.BVS_Company__c =escapeSpecialCharacters(yt.BVS_Company__c);
        yt.BVS_LeadCategory__c=escapeSpecialCharacters(yt.BVS_LeadCategory__c);
        yt.BVS_FollowUps__c=escapeSpecialCharacters(yt.BVS_FollowUps__c);
        system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ '+yt.BVS_Notes__c);
            
        yt.BVS_Notes__c=escapeSpecialCharacters(yt.BVS_Notes__c);    
       }
     return null;   
    }


    public String searchString { get; set; }

  
  
public blob b{get;set;}   
public string transfer{get;set;}   
public String body { get; set; }
public String subject { get; set; }
public String EmailTo { get; set; }
public boolean email{get;set;}
public string[] strAlfhabets{get;set;}
public boolean BVSDetail{get;set;}
public BoothVisitSummary__c attendeeSummary{get;set;}
public string strNamesmult{get;set;}   
public string eventName{get;set;}
public   List<BoothVisitSummary__c> bvsList{get;set;}
public string defaultEvent{get;set;}
public String eventSelected { get; set; }
public List<Event__c> EvntsForPicklist{get;set;}
public List<BoothVisitSummary__c> BVSListsel{get;set;}

public BL_AttendeesDummyCon(){
 strAlfhabets = new string[]{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
 booleanforDisplayBoothadminTab = false;
 List<User_Profile_Event__c>  forDisplayBoothdmintab= [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:'phani@globalnest.com'];
    for(User_Profile_Event__c tt:forDisplayBoothdmintab){
      if(tt.Profile_id__r.PR_Name__c !='Attendee' && tt.Profile_id__r.PR_Name__c !='BoothPersonnel' ){
       booleanforDisplayBoothadminTab = true;
      }   
    }
getEvents();
   
}





  public PageReference cancel() {
     email=false;
        return null;
    }


     public PageReference sendEmail() {
     system.debug('Value Of eventNAme     '+eventname);
     
     
    if(eventname != '' && eventname != null){
    BVSListsel = checkBVSList(eventname);
     transfer = 'Prefix::::::::;;;;;;;;First Name::::::::;;;;;;;;Last Name::::::::;;;;;;;;Suffix::::::::;;;;;;;;Email Id::::::::;;;;;;;;Company::::::::;;;;;;;;Designation::::::::;;;;;;;;Mobile Number::::::::;;;;;;;;Age::::::::;;;;;;;;Gender::::::::;;;;;;;;Date Of Birth::::::::;;;;;;;;Home Phone Number::::::::;;;;;;;;Home Address1::::::::;;;;;;;;Home Address2::::::::;;;;;;;;Home City::::::::;;;;;;;;Home State::::::::;;;;;;;;Home Country::::::::;;;;;;;;Home Zip Code::::::::;;;;;;;;Home PoBox::::::::;;;;;;;;Primary Business Category::::::::;;;;;;;;Secondary Business Category::::::::;;;;;;;;No.Of Employees::::::::;;;;;;;;Businees Established Date::::::::;;;;;;;;Business Duns Number::::::::;;;;;;;;Business Revenue::::::::;;;;;;;;Business Tax Id::::::::;;;;;;;;Blog URL::::::::;;;;;;;;Website URL::::::::;;;;;;;;Diversity Type::::::::;;;;;;;;Businees Description::::::::;;;;;;;;Work Phone::::::::;;;;;;;;Fax Number::::::::;;;;;;;;Work Address1::::::::;;;;;;;;Work Address2::::::::;;;;;;;;Work city::::::::;;;;;;;;Work State::::::::;;;;;;;;Work Country::::::::;;;;;;;;Work Zip Code::::::::;;;;;;;;Work PoBox::::::::;;;;;;;;Shipping Phone::::::::;;;;;;;;Shipping Address1::::::::;;;;;;;;Shipping Address2::::::::;;;;;;;;Shipping City::::::::;;;;;;;;Shipping State::::::::;;;;;;;;Shipping country::::::::;;;;;;;;Shipping Zip Code::::::::;;;;;;;;Shipping PoBox::::::::;;;;;;;;NAICS Code1::::::::;;;;;;;;NAICS Code2::::::::;;;;;;;;NAICS Code3::::::::;;;;;;;;NAICS Code4::::::::;;;;;;;;NAICS Code5::::::::;;;;;;;;Through EventBrite::::::::;;;;;;;;Follow-up Date::::::::;;;;;;;;Lead Category::::::::;;;;;;;;Scanned By::::::::;;;;;;;;Notes'+'\r';
    for(BoothVisitSummary__c ss:BVSListsel) {
    if(ss.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c != null){
     transfer += ss.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Age__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BirthDate__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeZipcode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomePoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NumberOfEmployees__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessEstablishedDate__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDunsNumber__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessRevenue__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessTaxId__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BlogUrl__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WebsiteUrl__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_DiversityType__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkZipCode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingZipcode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode3__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode4__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode5__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ThroughEventBrite__c+'::::::::;;;;;;;;'+ss.BVS_FollowUps__c+'::::::::;;;;;;;;'+ss.BVS_LeadCategory__c+'::::::::;;;;;;;;'+ss.User_id__r.Name+'::::::::;;;;;;;;'+ss.BVS_Notes__c+'\r'; 
    }else{
    transfer +=''+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Age__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BirthDate__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomeZipcode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_HomePoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NumberOfEmployees__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessEstablishedDate__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDunsNumber__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessRevenue__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessTaxId__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BlogUrl__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WebsiteUrl__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_DiversityType__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkZipCode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingZipcode__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPoBox__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode1__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode2__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode3__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode4__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode5__c+'::::::::;;;;;;;;'+ss.EA_AttendeeBarcode__r.AS_id__r.AS_ThroughEventBrite__c+'::::::::;;;;;;;;'+ss.BVS_FollowUps__c+'::::::::;;;;;;;;'+ss.BVS_LeadCategory__c+'::::::::;;;;;;;;'+ss.User_id__r.Name+'::::::::;;;;;;;;'+ss.BVS_Notes__c+'\r'; 
    
    }
    
    
    
     }
      
      transfer = transfer.ReplaceAll(',', ' ').ReplaceAll('::::::::;;;;;;;;', ',').ReplaceAll('null','');
    system.debug('hi iiiiiiii ooooooooo    '+transfer); 
     
      b = blob.valueOf(transfer); 
      
    
     List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
    
    
    List<String> emailList = new LIST<String>();
    
    emailList = EmailTo.split(',');
    
    for(String singlemail: emailList)
    {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subject);
            String [] toAddresses = new String[] {singlemail};
            email.setToAddresses(toAddresses);
            String emailBody = body;
            email.setPlainTextBody(emailBody);
            email.setHtmlBody(emailBody);
            email.setInReplyTo('phani@globalnest.com');
                   
                 Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                 efa.setFileName('Attendee Leads.Csv');                                                        
                 efa.setBody(b);                                                                          
                 email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa}); 
                 
            mails.add(email);
    } 
          
     Messaging.SendEmailResult [] msgResult =Messaging.sendEmail(mails);   
     
     EmailTo ='';
     BVSListsel.clear();
     body='';
     subject='';
     email=false;
      
      system.debug('##################'+ email );
   }
     return null;
 }


     public void EmailCsv(){
     subject ='Leads From Booth Leads';
      system.debug('909090909099090909090909   '+eventname); 
      if(eventname != '' && eventname != null){
      email=true;
     }
   }

public boolean booleanforDisplayBoothadminTab{get;set;}
    public PageReference valuesOfeventswithselectedvalue() {
    string xx = ApexPages.currentPage().getParameters().get('valu');
  
   set<Id>  setofboothpersonnelIds = new set<Id>();
       bvsList = new List<BoothVisitSummary__c>(); 
       List<User_Event_BVS__c> bvsvalues = new  List<User_Event_BVS__c>(); 
       
       if(eventSelected =='All'){
       bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com') OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com'  and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
       }
       else{
       bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected) OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
      }
           for(User_Event_BVS__c h:bvsvalues){
                 setofboothpersonnelIds.add(h.BVS_id__c);
           }
           system.debug('valueeeeeeeeeeeeeeeeeeeeeee OF XXXXXXXXXXXXXXXXXXXXXXXXX'+xx);
            system.debug('valueeeeeeeeeeeeeeeeeeeeeee OF yyyyyyyyyyyyyyyyyyyyyyyy'+eventSelected );
           
       bvsList = [Select b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.User_id__c, b.User_id__r.Name,b.SystemModstamp, b.OwnerId, b.Name, b.LastModifiedDate, b.LastModifiedById, b.LastActivityDate, b.IsDeleted, b.Id, b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c From BoothVisitSummary__c b where id in :setofboothpersonnelIds and  b.BVS_LastName__c like :xx+'%' limit 999];
          
          system.debug('valueeeeeeeeeeeeeeeeeeeeeee OF zzzzzzzzzzzzzzzzzzzzz'+bvsList);
            for(BoothVisitSummary__c yt:bvsList){
            yt.BVS_FirstName__c =escapeSpecialCharacters(yt.BVS_FirstName__c);
            yt.BVS_LastName__c =escapeSpecialCharacters( yt.BVS_LastName__c);
            yt.BVS_Company__c =escapeSpecialCharacters(yt.BVS_Company__c);
            yt.BVS_LeadCategory__c=escapeSpecialCharacters(yt.BVS_LeadCategory__c);
            yt.BVS_FollowUps__c=escapeSpecialCharacters(yt.BVS_FollowUps__c);
            yt.BVS_Notes__c=escapeSpecialCharacters(yt.BVS_Notes__c);
            }
            return null;
   
 }



 public List<BoothVisitSummary__c> checkBVSList(String listOfBVS){
  integer ph;
  List<BoothVisitSummary__c>  localBVSListSelected = new List<BoothVisitSummary__c> ();
  List<ID> selectedBVSList = new List<ID>();
  selectedBVSList = listOfBVS.split(',');
    if(selectedBVSList.size()>0){
       localBVSListSelected =  [Select  b.User_id__r.Name,b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c,b.EA_AttendeeBarcode__r.AS_id__r.Id, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkZipCode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WebsiteUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ThroughEventBrite__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingZipcode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NumberOfEmployees__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode5__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode4__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode3__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeZipcode__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_DiversityType__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessTaxId__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessRevenue__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessEstablishedDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDunsNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BlogUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BirthDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Age__c From BoothVisitSummary__c b where id in :selectedBVSList];
          if(localBVSListSelected.size()>0){
              for(BoothVisitSummary__c rt : localBVSListSelected ){
              
                  rt.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c);
                 
       if(rt.BVS_FirstName__c != null || rt.BVS_FirstName__c!=''){
          rt.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c =rt.BVS_FirstName__c; 
         }
       
                  
         
       
        if(rt.BVS_lastName__c != null || rt.BVS_LastName__c!=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c =rt.BVS_LastName__c; 
       }       
          
           if(rt.BVS_Title__c != null || rt.BVS_Title__c!=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c =rt.BVS_Title__c; 
       } 
                  
           if(rt.BVS_Company__c != null || rt.BVS_Company__c !=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c =rt.BVS_Company__c; 
       } 
     
     
      if(rt.BVS_PhoneNumber__c != null || rt.BVS_PhoneNumber__c !=''){
        rt.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c =rt.BVS_PhoneNumber__c; 
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
                  rt.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c);
                  rt.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c=escape(rt.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c);
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
      
      

    public PageReference seltoexport() {
    BVSList = new List<BoothVisitSummary__c>(); 
    BVSList = checkBVSList(Eventname);   
    PageReference pageRef= new PageReference('/apex/BL_ExportToCsv');
    pageRef.setredirect(false);
    return pageRef;
   }


    public PageReference closePopup() {
        BVSDetail =false;
        return null;
    }


    public void  getEventDetails() {
    attendeeSummary = new BoothVisitSummary__c();
      if(eventName!=null || eventName!=''){
       attendeeSummary = [Select b.BVS_PhoneNumber__c,b.BVS_Company__c,b.BVS_Title__c,b.BVS_LastName__c,b.BVS_FirstName__c,b.User_id__r.Name,b.BVS_FollowUps__c,b.BVS_Notes__c , b.EA_AttendeeBarcode__r.AS_id__r.Id, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkZipCode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WorkAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_WebsiteUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ThroughEventBrite__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Suffix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingZipcode__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingCity__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ShippingAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_SecondaryBusinessCategory__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Prefix__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NumberOfEmployees__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode5__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode4__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode3__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_NAICSCode1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeZipcode__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeState__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePoBox__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomePhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCountry__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeCity__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress2__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_HomeAddress1__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Gender__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_FaxNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_DiversityType__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c,b.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessTaxId__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessRevenue__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessEstablishedDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDunsNumber__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BusinessDescription__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BlogUrl__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_BirthDate__c, b.EA_AttendeeBarcode__r.AS_id__r.AS_Age__c From BoothVisitSummary__c b where id=:eventName ];
      

       if(attendeeSummary.BVS_FirstName__c != null || attendeeSummary.BVS_FirstName__c!=''){
           system.debug('hi        this is Before'+attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
            attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c =attendeeSummary.BVS_FirstName__c; 
           system.debug('hi        this is after '+attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
       }
       
        if(attendeeSummary.BVS_lastName__c != null || attendeeSummary.BVS_LastName__c!=''){
        attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c =attendeeSummary.BVS_LastName__c; 
       }       
             
     
      if(attendeeSummary.BVS_Title__c != null || attendeeSummary.BVS_Title__c!=''){
        attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_Title__c =attendeeSummary.BVS_Title__c; 
       } 
     
     
     if(attendeeSummary.BVS_Company__c != null || attendeeSummary.BVS_Company__c !=''){
        attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c =attendeeSummary.BVS_Company__c; 
       } 
     
     
      if(attendeeSummary.BVS_PhoneNumber__c != null || attendeeSummary.BVS_PhoneNumber__c !=''){
        attendeeSummary.EA_AttendeeBarcode__r.AS_id__r.AS_WorkPhone__c =attendeeSummary.BVS_PhoneNumber__c; 
       } 
     
     
     
     
     
     
     
       BVSDetail =true;
      }
    }
   
  
  public  BL_SecuritySettingsCon gg{get;set;}
  
    public PageReference getEvents() {
    system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'+eventSelected );
    
     if(eventSelected == NULL || eventSelected =='' || eventSelected == 'All'){
      
        eventSelected ='All';
       set<id> setofboothpersonnelIds = new  set<id>();
       bvsList = new List<BoothVisitSummary__c>(); 
       List<User_Event_BVS__c> bvsvalues = new  List<User_Event_BVS__c>(); 
       bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com' ) OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com' and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
           for(User_Event_BVS__c h:bvsvalues){
               setofboothpersonnelIds.add(h.BVS_id__c);
           }
       bvsList = [Select b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.User_id__c, b.User_id__r.Name,b.SystemModstamp, b.OwnerId, b.Name, b.LastModifiedDate, b.LastModifiedById, b.LastActivityDate, b.IsDeleted, b.Id, b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c From BoothVisitSummary__c b where id in :setofboothpersonnelIds];
   
            for(BoothVisitSummary__c yt:bvsList){
            yt.BVS_FirstName__c =escapeSpecialCharacters(yt.BVS_FirstName__c);
            yt.BVS_LastName__c =escapeSpecialCharacters( yt.BVS_LastName__c);
            yt.BVS_Company__c =escapeSpecialCharacters(yt.BVS_Company__c);
            yt.BVS_LeadCategory__c=escapeSpecialCharacters(yt.BVS_LeadCategory__c);
            yt.BVS_FollowUps__c=escapeSpecialCharacters(yt.BVS_FollowUps__c);
            system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ '+yt.BVS_Notes__c);
            
            yt.BVS_Notes__c=escapeSpecialCharacters(yt.BVS_Notes__c);
               system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ after '+yt.BVS_Notes__c);
           
           
           
      
            }
            
        }  else{
        
        
         set<Id>  setofboothpersonnelIds = new set<Id>();
       bvsList = new List<BoothVisitSummary__c>(); 
       List<User_Event_BVS__c> bvsvalues = new  List<User_Event_BVS__c>(); 
       
        gg = new BL_SecuritySettingsCon(eventSelected);
        bvsvalues =[select BVS_id__c from User_Event_BVS__c u where (u.UPE_id__r.BoothAdmin_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected) OR (u.UPE_id__r.User_id__r.Email=:'phani@globalnest.com' and u.EV_id__c=:eventSelected and u.UPE_id__r.Profile_id__r.PR_Name__c='BoothAdmin')];  
       
       
       
       
        for(User_Event_BVS__c h:bvsvalues){
               setofboothpersonnelIds.add(h.BVS_id__c);
           }
       bvsList = [Select b.EA_AttendeeBarcode__r.AS_id__r.AS_ImageUrl__c, b.User_id__c, b.User_id__r.Name,b.SystemModstamp, b.OwnerId, b.Name, b.LastModifiedDate, b.LastModifiedById, b.LastActivityDate, b.IsDeleted, b.Id, b.EA_AttendeeBarcode__c, b.CreatedDate, b.CreatedById, b.BVS_Title__c, b.BVS_Tags__c, b.BVS_SurveyQuestion4__c, b.BVS_SurveyQuestion3__c, b.BVS_SurveyQuestion2__c, b.BVS_SurveyQuestion1__c, b.BVS_SurveyAnswer4__c, b.BVS_SurveyAnswer3__c, b.BVS_SurveyAnswer2__c, b.BVS_SurveyAnswer1__c, b.BVS_State__c, b.BVS_PhoneNumber__c, b.BVS_Notes__c, b.BVS_LeadType__c, b.BVS_LeadRating__c, b.BVS_LeadCategory__c, b.BVS_LastName__c, b.BVS_FollowUps__c, b.BVS_FirstName__c, b.BVS_Email__c, b.BVS_Company__c, b.BVS_City__c, b.BVS_Budget__c From BoothVisitSummary__c b where id in :setofboothpersonnelIds limit 999];
   
            for(BoothVisitSummary__c yt:bvsList){
            yt.BVS_FirstName__c =escapeSpecialCharacters(yt.BVS_FirstName__c);
            yt.BVS_LastName__c =escapeSpecialCharacters( yt.BVS_LastName__c);
            yt.BVS_Company__c =escapeSpecialCharacters(yt.BVS_Company__c);
            yt.BVS_LeadCategory__c=escapeSpecialCharacters(yt.BVS_LeadCategory__c);
            yt.BVS_FollowUps__c=escapeSpecialCharacters(yt.BVS_FollowUps__c);
            system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ '+yt.BVS_Notes__c);
            
            yt.BVS_Notes__c=escapeSpecialCharacters(yt.BVS_Notes__c);
               system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ after '+yt.BVS_Notes__c);
           
           
        
        
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



    public List<selectOption> getselectEvents() {
       List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
       EvntsForPicklist = new List<Event__c>();
       upeForEvents = [Select u.User_id__c,u.Profile_id__r.PR_Name__c,u.User_id__r.Name, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:'phani@globalnest.com'];
       set<Id> setOfEventIds = new set<Id>();
           for(User_Profile_Event__c rotatinnFor:upeForEvents){
           setOfEventIds.add(rotatinnFor.EV_id__c);
           }
 
       EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
           if(EvntsForPicklist.size()>0){
           defaultEvent =EvntsForPicklist[0].id;
           }
      List<SelectOption> options = new List<SelectOption>();
           options.add(new SelectOption('All','All'));
           for(Event__c Event:EvntsForPicklist ){
           options.add(new SelectOption(Event.id,Event.EV_Title__c));
           }
           return options;
     }

   
public PageReference profileaction() {
   Pagereference pg = new pagereference('/apex/BL_Profile');
    pg.setredirect(true);
        return pg;
    
    }
 public PageReference EventAction() {
    Pagereference pg = new pagereference('/apex/BL_Events');
    pg.setredirect(true);
        return pg;
        
    }
public PageReference Customeraction() {
   Pagereference pg = new pagereference('/apex/BL_BoothPersonnels');
    pg.setredirect(true);
        return pg;
       
    }
    public PageReference AttendeesAction() {
    Pagereference pg = new pagereference('/apex/BL_attendees');
    pg.setredirect(true);
        return pg;
       
    }

public PageReference Reportsaction() {
   Pagereference pg = new pagereference('/apex/BL_reports');
    pg.setredirect(true);
        return pg;
       
    }


}