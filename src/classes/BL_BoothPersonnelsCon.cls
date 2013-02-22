public without sharing class BL_BoothPersonnelsCon {

public Boolean AdminUserBool{get;set;} 
public  List<User_Profile_Event__c> listOfEvents{get;set;} 
public String errormsg{ get; set; }
public String country { get; set; }
public boolean displayPopUpForAddcheck{get;set;}
public String email { get; set; }
public boolean errorMessage { get; set; }
public string message{ get; set; }
public List<Event__c> EvntsForPicklist{get;set;}
public string defaultEvent{get;set;}
public User editOfBoothPersonnel{get;set;}
public boolean displayPopUpForAdd{get;set;}
public List<User_Profile_Event__c> detailsOfBoothPersonnel{get;set;}
public string statusValue {get;set;}
public string  eventName{get;set;}
public String eventSelected { get; set; }
public boolean displayPopUp {get;set;}
public List<User_Profile_Event__c> Boothpersonnels{get;set;}
public List<innerForDisplayStatus> boothPersonnelWithStatus{get;set;}
public Boolean  displayPopUpForAddBooth{get;set;}
public User CreateUser{get;set;}

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


    public PageReference closePopupSelect() {
   
    getBoothPersonnels(); 
    displayPopUpForAddcheck =false;
        return null;
    }


public boolean booleanforDisplayBoothadminTab{get;set;}
    public PageReference saveLicenceValues() {
    message  ='';
    errormsg ='';
   if(PreviousStingValue !=countrySelect || countrySelect !=null ||  countrySelect !=''){
 
    booth__c booth =[select id,BT_BoothUserCount__c from booth__c where id=:upeFordisplayStatus.BT_id__c];
     if(countrySelect !='InActive'){
     
       if(upeFordisplayStatus.UEP_isActive__c ==true){
        upeFordisplayStatus.status__c = countrySelect;
       update upeFordisplayStatus;
      displayPopUpForAddcheck =false;
      }else{
        if(booth.BT_BoothUserCount__c>0){
   
      upeFordisplayStatus.status__c = countrySelect;
       upeFordisplayStatus.UEP_isActive__c =true;
      update upeFordisplayStatus;
      
      
      system.debug('countrySelect 4444444444444444444444444 ' +upeFordisplayStatus.status__c);
      booth.BT_BoothUserCount__c =booth.BT_BoothUserCount__c-1;
      update booth; 
      displayPopUpForAddcheck =false;    
     system.debug('countrySelect 5555555555555555555555555' +booth.BT_BoothUserCount__c);
     }  else{
      system.debug('countrySelect 8888888888888888888 ' );
       errormsg ='You dont have licences';
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'You dont have licences'));
     }
   
  } 
    
    
    
    }else{
    
     upeFordisplayStatus.status__c = countrySelect;
     upeFordisplayStatus.UEP_isActive__c =false;
     update upeFordisplayStatus;
      system.debug('countrySelect 66666666666666666666666' +upeFordisplayStatus.UEP_isActive__c);
      booth.BT_BoothUserCount__c =booth.BT_BoothUserCount__c+1;
      update booth;  
      displayPopUpForAddcheck =false;
     system.debug('countrySelect 77777777777777777777777' +booth.BT_BoothUserCount__c);
    }
    }
    
    getBoothPersonnels();
    
        return null;
    }


    public String countrySelect { get; set; }

    public List<SelectOption> getSeletOptions() { 
    
    List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Mobile only access','Mobile only access')); 
        options.add(new SelectOption('Mobile and Portal Access','Mobile and Portal Access')); 
        return options;
  }



public PageReference closePopup2() {
country ='';
firstnaerror ='';
   Emailerror='';
   accessTypeerror=''; 
    displayPopUpForAddBooth =false;
    
        return null;
    }


public BL_BoothPersonnelsCon(){
String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); 
if(browserType != null && browserType.contains('MSIE')){
Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
}
country='';
List<user> hghg =[select FirstName,LastName From User ];
system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii '+hghg);
 List<user> uuuee =new List<user>();
 
 

 listOfEvents = new List<User_Profile_Event__c>();
listOfEvents =[select u.EV_id__r.Status__c,u.EV_id__r.StartTime__c, u.EV_id__r.SecondaryCategory__c,
u.EV_id__r.Primary__c, u.EV_id__r.Name, u.EV_id__r.Id, u.EV_id__r.EV_Title__c, u.EV_id__r.EV_StartDate__c, u.EV_id__r.EV_HostingZipcode__c, 
u.EV_id__r.EV_HostingTimeZone__c, u.EV_id__r.EV_HostingState__c,u.EV_id__r.EV_HostingPostalCode__c,
u.EV_id__r.EV_HostingPhone__c, u.EV_id__r.EV_HostingLocation__c, u.EV_id__r.EV_HostingCountry__c,
u.EV_id__r.EV_HostedByEventBrite__c, u.EV_id__r.EV_HistingAddr1__c, u.EV_id__r.EV_EventLogo__c, 
u.EV_id__r.EV_EndTime__c,u.EV_id__r.EV_EndDate__c, u.EV_id__r.EV_Description__c, u.Profile_id__r.PR_Name__c,
u.EV_id__r.CreatedDate, u.EV_id__r.Attendee_Tags__c,u.EV_id__r.EV_HostingOrgName__c, u.EV_id__r.AS_HostingCity__c,u.EV_id__r.AS_HostingAddr2__c from User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() limit 999 ];
  
  
  
  set<Id> setOfEvents = new set<Id>();
   
 booleanforDisplayBoothadminTab =false; 
 system.debug('rrrrrrrrrrrrrrrrrrrrrr  '+listOfEvents);
for(User_Profile_Event__c upe:listOfEvents){
 if(upe.Profile_id__r.PR_Name__c !='Attendee' && upe.Profile_id__r.PR_Name__c !='BoothPersonnel' ){
 booleanforDisplayBoothadminTab = true;
 break;
}
  setofEvents.add(upe.EV_id__c); 
}

 
 

errorMessage =false;
 List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
 EvntsForPicklist = new List<Event__c>();
 upeForEvents = [Select u.User_id__c, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName()];
 set<Id> setOfEventIds = new set<Id>();
 
 for(User_Profile_Event__c rotatinnFor:upeForEvents){
 setOfEventIds.add(rotatinnFor.EV_id__c);
 }
 
 EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
 if(EvntsForPicklist.size()>0){
 defaultEvent =EvntsForPicklist[0].id;
 system.debug('4444444444444444444444444444444444444444444  '+defaultEvent );
 
 }
 
 
 
 List<User_Profile_Event__c> 
  rr= [Select Id,User_id__r.Name,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,BoothAdmin_id__r.LastName,
                          BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName from User_Profile_Event__c 
                          where BoothAdmin_id__c=:UserInfo.GetUserId() AND EV_id__c =:defaultEvent AND Profile_id__r.PR_Name__c ='BoothPersonnel' ];
  
  

getBoothPersonnels();
}

  public string firstnaerror {get;set;}
  public string Emailerror {get;set;}
  public string accessTypeerror {get;set;}
  public boolean emailbool{get;set;}
 
   public Void savePopUpValues(){
    
    
     String EmailBody = 'Congratulations!!'+'\n'+'Your login for your Booth Admin Portal for Event '+'"'+eventnameforGried +'"'+' was successfully created.'
                               +'\n\n'+'Please visit http://www.boothleads.com to login to your Booth Admin Portal.'+'\n\n'+'If you have any questions, please contact your Event Administrator.'
                               +'\n\n'+'Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.'+'\n'+'Please remember to export all your leads.'
                               +'\n'+'If you need access beyond this, please contact support.'
                               +'\n\n\n'+'Thank you!'+'\n'+'BoothLeads Customer Support'+'\n'+'support@boothleads.com';  
               
      
      String EmailSubject = 'Welcome to '+'"'+eventnameforGried +'"'+' Event - Your registration was successful';

  try{  
    
    
 system.debug('4242424242424  ');
   firstnaerror ='';
   Emailerror='';
   accessTypeerror=''; 
  
   
   if(country =='' || country == null){
   accessTypeerror ='Please select Access type';
 }else if(CreateUser.FirstName == null || CreateUser.FirstName == ''){ 
  system.debug('4242424242424  '+CreateUser.firstName);
 firstnaerror ='Please Enter FirstName';
 
 
 }else if(CreateUser.lastName == null || CreateUser.lastName == ''){
 system.debug('56565656565656  '+CreateUser.lastName);
 
 //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter FirstName'));
 
 
 }else{
  system.debug('777777777777777777777777777  '+country );
List<user> Allusers =[select Name,id,Email,profileId from user where email=:email limit 1];
    
   
    if(Allusers.size()>0){
       
        List<User_Profile_Event__c> duplicateFind=[select User_id__r.Email from User_Profile_Event__c where User_Profile_Event__c.User_id__r.Email=:email and EV_id__c=:eventSelected];
        string df =Allusers[0].profileId;
        profile pro=[select name,id from profile where id=:df];
        
        if(pro.name == 'Event Admin'){
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'You should not add event admin as a booth user'));
        }else if(duplicateFind.size()>0){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Email already Exist'));
                
        }else{
            
         User_Profile_Event__c checkLicenses = [Select status__c,u.BT_id__c,u.User_id__c,u.User_id__r.companyName From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and u.EV_id__c=:eventSelected  and u.Profile_id__r.PR_Name__c='BoothAdmin' and u.UEP_isActive__c=true];   
         User_Profile_Event__c uu = new  User_Profile_Event__c();
             
          Profile__c p = [Select  p.PR_Version__c, p.PR_Name__c, p.Name,   p.Id From Profile__c p where p.PR_Name__c='BoothPersonnel']; 
             
              user updateuser = new user();
              updateuser = Allusers[0];
              updateuser.FirstName =Createuser.FirstName;
              updateuser.lastname=Createuser.lastname;
              
               updateuser.Title=CreateUser.Title;  
                
                update updateuser ;
                             
                 uu.User_id__c =updateuser.id;
                 uu.EV_id__c =eventSelected;
                 uu.BoothAdmin_id__c =userInfo.getUserId();
                 uu.Profile_id__c=p.id;
                 uu.UEP_isActive__c =true;
                 uu.BT_id__c=checkLicenses.BT_id__c;
                 uu.status__c =country;
                 insert uu;
             
              
              Booth__c boothforupdate = [select BT_BoothUserCount__c,id from Booth__c where id=:checkLicenses.BT_id__c];
              if(uu!=null){            
                            
               boothforupdate.BT_BoothUserCount__c=  boothforupdate.BT_BoothUserCount__c-1;
               update boothforupdate;          
             }     
           
           
          if(uu!=null){
            
            
            Reports__c repportBoothpersonnel = new Reports__c();
            repportBoothpersonnel.RE_Name__c ='Report By Geography';
            repportBoothpersonnel.UPE_id__c=uu.id;
            insert repportBoothpersonnel;
            
             repportBoothpersonnel = new Reports__c();
            repportBoothpersonnel.RE_Name__c ='Report By Industry';
            repportBoothpersonnel.UPE_id__c=uu.id;
            insert repportBoothpersonnel;
          }           
             displayPopUpForAddBooth =false;
             
        List<AttendeeSummary__c> attvalues=new List< AttendeeSummary__c>();
        attvalues=[Select a.Name, a.Id, a.AS_WorkZipCode__c, a.AS_WorkState__c, a.AS_WorkPoBox__c, a.AS_WorkPhone__c, a.AS_WorkCountry__c, a.AS_WorkCity__c, a.AS_WorkAddress2__c, a.AS_WorkAddress1__c, a.AS_WebsiteUrl__c, a.AS_Title__c, a.AS_ThroughEventBrite__c, a.AS_Suffix__c, a.AS_ShippingZipcode__c, a.AS_ShippingState__c, a.AS_ShippingPoBox__c, a.AS_ShippingPhone__c, a.AS_ShippingCountry__c, a.AS_ShippingCity__c, a.AS_ShippingAddress2__c, a.AS_ShippingAddress1__c, a.AS_SecondaryBusinessCategory__c, a.AS_PrimaryBusinessCategory__c, a.AS_Prefix__c, a.AS_NumberOfEmployees__c, a.AS_NAICSCode5__c, a.AS_NAICSCode4__c, a.AS_NAICSCode3__c, a.AS_NAICSCode2__c, a.AS_NAICSCode1__c, a.AS_LastName__c, a.AS_ImageUrl__c, a.AS_HomeZipcode__c, a.AS_HomeState__c, a.AS_HomePoBox__c, a.AS_HomePhone__c, a.AS_HomeCountry__c, a.AS_HomeCity__c, a.AS_HomeAddress2__c, a.AS_HomeAddress1__c, a.AS_Gender__c, a.AS_FirstName__c, a.AS_FaxNumber__c, a.AS_Email__c, a.AS_DiversityType__c, a.AS_Company__c, a.AS_CellPhone__c, a.AS_BusinessTaxId__c, a.AS_BusinessRevenue__c, a.AS_BusinessEstablishedDate__c, a.AS_BusinessDunsNumber__c, a.AS_BusinessDescription__c, a.AS_BlogUrl__c, a.AS_BirthDate__c, a.AS_Age__c From AttendeeSummary__c a where a.AS_Email__c=:email limit 1];
        
        if(attvalues.size()>0){
        
        List<Event_Attendee_Mapping__c>  eventAttMapping=new List<Event_Attendee_Mapping__c>();
        
       eventAttMapping =[Select e.Name, e.Id, e.EV_id__c, e.EA_isBadgePrinted__c, e.EA_AttendeeBarcode__c, e.Attendee_Event_IDs__c, e.AS_id__c From Event_Attendee_Mapping__c e where e.EV_id__c=:eventSelected and e.AS_id__c=:attvalues[0].id limit 1];
       
        if(eventAttMapping.size()<=0){
               
         attvalues[0].AS_Email__c =email;
         attvalues[0].AS_LastName__c=Createuser.LastName;
         attvalues[0].AS_Title__c=Createuser.title;
          attvalues[0].AS_FirstName__c=Createuser.FirstName;
         upsert  attvalues;
        
         Event_Attendee_Mapping__c ttr = new Event_Attendee_Mapping__c();
         ttr.EV_id__c =eventSelected;
         ttr.AS_id__c =attvalues[0].id;
         insert  ttr;
         
         ttr.EA_AttendeeBarcode__c =ttr.id+'-'+eventSelected;
         update ttr;
         
         
         
        }
        
        }else{
        
        AttendeeSummary__c attnew = new  AttendeeSummary__c();
        attnew.AS_Email__c =email;
        attnew.AS_LastName__c=Createuser.LastName;
        attnew.AS_Title__c=Createuser.title;
        attnew.AS_FirstName__c=Createuser.FirstName;
        attnew.AS_uniqueField__c = (Createuser.FirstName+Createuser.LastName+email).tolowercase();
        insert attnew;
        
        Event_Attendee_Mapping__c tr= new Event_Attendee_Mapping__c();
         tr.EV_id__c =eventSelected;
         tr.AS_id__c =attnew.id;
         
        insert  tr;
        tr.EA_AttendeeBarcode__c =tr.id+'-'+eventSelected;
         update tr;
        
        }
        
        
        getBoothPersonnels(); 
            
            
        }
        
        
    
    }else {
    
    if(Email ==null || email ==''){
   Emailerror ='Please Enter Email';
   system.debug('gggggggggggggg '+Emailerror );
   emailbool = true;
    // ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter Email'));
   
   }else{
    
   User_Profile_Event__c checkLicenses = [Select u.BT_id__c,u.User_id__c,u.User_id__r.companyName From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and u.EV_id__c=:eventSelected  and u.Profile_id__r.PR_Name__c='BoothAdmin' and u.UEP_isActive__c=true];
    Profile profile = [select Id from Profile where Name='Booth Admin'];
                       //  001O0000007AN41
                        contact contact = new Contact(AccountId ='001F000000rVD6z',
                        LastName = Createuser.LastName,
                        Email_Notes__c = EmailBody,
                        Email_Subject__c = EmailSubject,
                        FirstName = Createuser.FirstName);
                        insert contact;
                         string df = string.valueOf(Email);
                        integer i = df.indexOf('@');
                        if(i>3){
                        string ght = df.substring(0,3);
                        }else{
                        string ght = df.substring(0,1);
                        
                        }
                        System.debug('UserName'+Email);
                        User user = new User(
                        Username = email,
                        Email =email,
                        contactId =contact.id,
                        firstname = Createuser.FirstName,
                        LastName = Createuser.LastName,
                        Alias ='BAdmin',
                        ProfileID =profile.Id,
                        LocaleSidKey ='en_US',
                        LanguageLocaleKey ='en_US',
                        TimeZoneSidKey ='America/Los_Angeles',
                        EmailEncodingKey='UTF-8',
                        Title=Createuser.title,
                        companyName=checkLicenses.User_id__r.companyName);
                     
                         /** Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.EmailHeader.triggerUserEmail = true;
                        user.setOptions(dmo);**/
                        insert user;
                        
           System.ResetPasswordResult rt= system.ResetPassword(user.id,true);
             system.debug('45454545454545454545454   '+rt);
             user.password__c =rt.getPassword();
             update user;
           
          Database.DMLOptions dmo = new Database.DMLOptions();
          dmo.EmailHeader.triggerUserEmail = true;
           user.setOptions(dmo);
                      
                        
                         User_Profile_Event__c uu = new  User_Profile_Event__c();
             
          Profile__c p = [Select  p.PR_Version__c, p.PR_Name__c, p.Name,   p.Id From Profile__c p where p.PR_Name__c='BoothPersonnel']; 
             
             system.debug('NNNNNNNNNNNNNNNNNNNN '+user);
              if(user != Null ){
                
                 uu.User_id__c =user.id;
                 uu.EV_id__c =eventSelected;
                 uu.BoothAdmin_id__c =checkLicenses.User_id__c;
                 uu.Profile_id__c=p.Id;
                 uu.UEP_isActive__c =true;
                 uu.BT_id__c=checkLicenses.BT_id__c;
                  uu.status__c =country;
                 
                 insert uu;
              }          
             Booth__c boothforupdate = [select BT_BoothUserCount__c,id from Booth__c where id=:checkLicenses.BT_id__c];
              if(uu!=null){            
                    
                    
                    if(country =='Mobile only access'){
                  uu.UEP_isActive__c =false;
        
                 }else if(country =='Mobile and Portal Access'){
                  boothforupdate.BT_BoothUserCount__c=  boothforupdate.BT_BoothUserCount__c-1;
                 } 
                    
                    
                            
              
               update boothforupdate;          
             }     
           
           
          if(uu!=null){
            
            
            Reports__c repportBoothpersonnel = new Reports__c();
            repportBoothpersonnel.RE_Name__c ='Report By Geography';
            repportBoothpersonnel.UPE_id__c=uu.id;
            insert repportBoothpersonnel;
            
             repportBoothpersonnel = new Reports__c();
            repportBoothpersonnel.RE_Name__c ='Report By Industry';
            repportBoothpersonnel.UPE_id__c=uu.id;
            insert repportBoothpersonnel;
          } 
          displayPopUpForAddBooth =false;
          
          
          
          List<AttendeeSummary__c> attvalues=new List< AttendeeSummary__c>();
         attvalues=[Select a.Name, a.Id, a.AS_WorkZipCode__c, a.AS_WorkState__c, a.AS_WorkPoBox__c, a.AS_WorkPhone__c, a.AS_WorkCountry__c, a.AS_WorkCity__c, a.AS_WorkAddress2__c, a.AS_WorkAddress1__c, a.AS_WebsiteUrl__c, a.AS_Title__c, a.AS_ThroughEventBrite__c, a.AS_Suffix__c, a.AS_ShippingZipcode__c, a.AS_ShippingState__c, a.AS_ShippingPoBox__c, a.AS_ShippingPhone__c, a.AS_ShippingCountry__c, a.AS_ShippingCity__c, a.AS_ShippingAddress2__c, a.AS_ShippingAddress1__c, a.AS_SecondaryBusinessCategory__c, a.AS_PrimaryBusinessCategory__c, a.AS_Prefix__c, a.AS_NumberOfEmployees__c, a.AS_NAICSCode5__c, a.AS_NAICSCode4__c, a.AS_NAICSCode3__c, a.AS_NAICSCode2__c, a.AS_NAICSCode1__c, a.AS_LastName__c, a.AS_ImageUrl__c, a.AS_HomeZipcode__c, a.AS_HomeState__c, a.AS_HomePoBox__c, a.AS_HomePhone__c, a.AS_HomeCountry__c, a.AS_HomeCity__c, a.AS_HomeAddress2__c, a.AS_HomeAddress1__c, a.AS_Gender__c, a.AS_FirstName__c, a.AS_FaxNumber__c, a.AS_Email__c, a.AS_DiversityType__c, a.AS_Company__c, a.AS_CellPhone__c, a.AS_BusinessTaxId__c, a.AS_BusinessRevenue__c, a.AS_BusinessEstablishedDate__c, a.AS_BusinessDunsNumber__c, a.AS_BusinessDescription__c, a.AS_BlogUrl__c, a.AS_BirthDate__c, a.AS_Age__c From AttendeeSummary__c a where a.AS_Email__c=:email limit 1];
        system.debug('Phaniiiiiiiiiiiiiiiii 111111111111 '+attvalues);
        if(attvalues.size()>0){
        AttendeeSummary__c attnew = new  AttendeeSummary__c();
         attnew.AS_Email__c =email;
         attnew.AS_LastName__c=Createuser.LastName;
         attnew.AS_Title__c=Createuser.title;
         attnew.AS_FirstName__c=Createuser.FirstName;
           attnew.AS_uniqueField__c = (Createuser.FirstName+Createuser.LastName+email).tolowercase();
        upsert attnew;
          system.debug('Phaniiiiiiiiiiiiiiiii 222222222222'+attnew  +' 33333333333333333 '+email);
        List<Event_Attendee_Mapping__c>  eventAttMapping=new List<Event_Attendee_Mapping__c>();
        
        eventAttMapping =[Select e.Name, e.Id, e.EV_id__c, e.EA_isBadgePrinted__c, e.EA_AttendeeBarcode__c, e.Attendee_Event_IDs__c, e.AS_id__c From Event_Attendee_Mapping__c e where e.EV_id__c=:eventSelected and e.AS_id__c=:attvalues[0].id limit 1];
       
        if(eventAttMapping.size()<=0){
       
         Event_Attendee_Mapping__c ttr = new Event_Attendee_Mapping__c();
         ttr.EV_id__c =eventSelected;
         ttr.AS_id__c =attvalues[0].id;
        insert  ttr;
        ttr.EA_AttendeeBarcode__c =ttr.id+'-'+eventSelected;
        update ttr;
        }
        
        }else{
        
        AttendeeSummary__c attnew = new  AttendeeSummary__c();
        attnew.AS_Email__c =email;
        attnew.AS_LastName__c=Createuser.LastName;
        attnew.AS_Title__c=Createuser.title;
        attnew.AS_FirstName__c=Createuser.FirstName;
       attnew.AS_uniqueField__c = (Createuser.FirstName+Createuser.LastName+email).tolowercase();
        upsert attnew;
           system.debug('Phaniiiiiiiiiiiiiiiii 444'+attnew  +' 5555555'+email);
        Event_Attendee_Mapping__c tr= new Event_Attendee_Mapping__c();
         tr.EV_id__c =eventSelected;
         tr.AS_id__c =attnew.id;
        insert  tr;
        tr.EA_AttendeeBarcode__c =tr.id+'-'+eventSelected;
       update tr;
        
        }
           getBoothPersonnels();   
       
       }    
      } 
  
 
 }  
 }catch (exception e){
 
 } 
  // return null;
}

   



    public PageReference addPersonnels() {
              
                 
      if(eventSelected ==null && eventSelected ==''){
      if(defaultEvent != '' && defaultEvent !=null){
       eventSelected =defaultEvent;
       }
    } 
          system.debug('999999999999999999999999  '+eventSelected);
        
        message ='';
    List<User_Profile_Event__c> checkLicenses = new  List<User_Profile_Event__c>();
  checkLicenses = [Select u.BT_id__r.BT_RegistrationLink__c, u.BT_id__r.BT_Description__c, u.BT_id__r.blp_id__c, u.BT_id__r.EV_id__c, u.BT_id__r.BT_PDFLocation__c, u.BT_id__r.BT_WebsiteURL__c, u.BT_id__r.BT_ContactEmail__c, u.BT_id__r.BT_ContactPhone__c, u.BT_id__r.BT_ContactName__c, u.BT_id__r.BT_BoothUserCount__c, u.BT_id__r.BT_isBoothActive__c, u.BT_id__r.BT_Phone__c, u.BT_id__r.BT_Location__c, u.BT_id__r.BT_Name__c, u.BT_id__r.LastActivityDate, u.BT_id__r.SystemModstamp, u.BT_id__r.LastModifiedById, u.BT_id__r.LastModifiedDate, u.BT_id__r.CreatedById, u.BT_id__r.CreatedDate, u.BT_id__r.Name, u.BT_id__r.IsDeleted, u.BT_id__r.OwnerId, u.BT_id__r.Id, u.BT_id__c From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and u.EV_id__c=:eventSelected  and u.Profile_id__r.PR_Name__c='BoothAdmin' ];
    system.debug('Bosssssssssssssssssssssssssssssss     '+checkLicenses);
    
    if(checkLicenses.size()>0){
    
   for(User_Profile_Event__c rrr : checkLicenses){
       
           if(rrr.BT_id__r.BT_isBoothActive__c){
                if(rrr.BT_id__r.BT_BoothUserCount__c > 0){
                        CreateUser = new User();
                        email ='';
                        displayPopUpForAddBooth =true;
                }
             else{
            message ='You dont have licences';
            
          //  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'You dont have licenses'));

       errorMessage =true;
        system.debug('helooooooooooooooooooo Phani111111111111111    '+message);
                                
        } 
        
        }else{
            message ='Your Booth is in Inactive For this event';
           // ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'your Booth is in Inactive For this event'));

              errorMessage =true;
              system.debug('helooooooooooooooooooo Phani2222222222222222222222    '+message );
        }
        
        
   }     
      }  
        
        return null;
    }

    public PageReference deleteAdminRecord() {
    message ='';
    system.debug('rrrrrrrrrrrrrrrrrrrrrrrrrrr'+eventName);  
    List<User_Profile_Event__c> tt=new List<User_Profile_Event__c>();
    tt=[select UEP_isActive__c,BT_id__r.id from User_Profile_Event__c where id=:eventName];
    booth__c booth =[select id,BT_BoothUserCount__c from booth__c where id=:tt[0].BT_id__r.id];
   
   
    for(User_Profile_Event__c y:tt){
       y.UEP_isActive__c =false;
      update y;
       booth.BT_BoothUserCount__c =booth.BT_BoothUserCount__c+1;
       update booth;
    }
    
  
      /** pagereference pg = new pagereference('/apex/BL_BoothPersonnels');
        pg.setRedirect(true);
        return pg; **/
         getBoothPersonnels();
       return null; 
    }

 
    public PageReference closePopup1() {
    displayPopUpForAdd =false;
        return null;
    }


    public PageReference EditPopUpValues() {
     system.debug('gtgtgtgtgttttttttttttttttttt '+editOfBoothPersonnel.FirstName );
     
    if((editOfBoothPersonnel.FirstName != null && editOfBoothPersonnel.FirstName !='') && (editOfBoothPersonnel.LastName != null && editOfBoothPersonnel.LastName!='') ){
    editOfBoothPersonnel.FirstName = editOfBoothPersonnel.FirstName;
    editOfBoothPersonnel.LastName = editOfBoothPersonnel.LastName ;
    editOfBoothPersonnel.Title =editOfBoothPersonnel.Title;
    update editOfBoothPersonnel;
    
    List<AttendeeSummary__c> attsumedit = new List<AttendeeSummary__c>();

 List<AttendeeSummary__c> attsumedit1 = new List<AttendeeSummary__c>();    
    attsumedit =[select id,AS_FirstName__c,AS_LastName__c,AS_Title__c from AttendeeSummary__c where AS_Email__c=:editOfBoothPersonnel.Email];
     
     for(AttendeeSummary__c a:attsumedit){
     a.AS_FirstName__c =editOfBoothPersonnel.FirstName;
     a.AS_LastName__c =editOfBoothPersonnel.LastName ;
     a.AS_Title__c =editOfBoothPersonnel.Title;
     attsumedit1.add(a);
            
     }
    update attsumedit1;
    
     displayPopUpForAdd =false;
    
   /**  pageREference pg = new pageReference('/apex/BL_BoothPersonnels');
     pg.setRedirect(true);
     return pg;**/
      getBoothPersonnels();
  }else{
  
  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Name');
   ApexPages.addMessage(myMsg);
  
  
  }
       return null; 
    }



 
    public PageReference editAttendees() {
       message ='';
    if(eventName!=null && eventName!=''){
    
   List<User_Profile_Event__c> yyy = new List<User_Profile_Event__c>();
   
    yyy = [select id,User_id__c,User_id__r.FirstName,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title from User_Profile_Event__c where id=:eventName limit 1]; 
   
   if(yyy.size()>0){
   
   editOfBoothPersonnel =[select FirstName,LastName,companyName,Title,Email from user where id=:yyy[0].User_id__c];
   
   }
    }
    displayPopUpForAdd=true;
      return null;
    }


    public PageReference closePopup() {
       displayPopUp =false;
        return null;
    }


    public PageReference getEventDetails() {
       
      detailsOfBoothPersonnel = [select id,User_id__r.Name,User_id__r.FirstName,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title from User_Profile_Event__c where id=:eventName limit 1]; 
     
      displayPopUp =true;
      return null;
    }
    
    
    
    
    
    
    
    
   
    public string eventnameforGried{get;set;} 
    public PageReference getBoothPersonnels() {
      message ='';
      
    
     
       
    boothPersonnelWithStatus = new List<innerForDisplayStatus>();
    if(eventSelected ==null || eventSelected ==''){
      if(defaultEvent != '' && defaultEvent !=null){
       eventSelected =defaultEvent;
       }
    }    
    
      List<event__c> evegrid =new List<event__c>();
     evegrid =[select id,EV_Title__c from Event__c where id=:eventselected limit 1];
     if(evegrid.size()>0){
     eventnameforGried =evegrid[0].EV_Title__c;
     }
  
     Boothpersonnels = new List<User_Profile_Event__c>();
    // Boothpersonnels =[select Status__c,BoothAdmin_id__c,id,User_id__r.Name,User_id__r.FaceBookId__c,User_id__c,User_id__r.FirstName,UEP_isActive__c ,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title from User_Profile_Event__c where (EV_id__c=:eventSelected and Profile_id__r.PR_Name__c='BoothPersonnel' and BoothAdmin_id__c=:UserInfo.getUserId())  OR  (EV_id__c=:eventSelected and IsBoothPersonnel__c =true and BoothAdmin_id__c=:UserInfo.getUserId()) ]; 
   Boothpersonnels =[select Status__c,BoothAdmin_id__c,id,User_id__r.Name,User_id__r.FaceBookId__c,User_id__c,User_id__r.FirstName,UEP_isActive__c ,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title from User_Profile_Event__c where (EV_id__c=:eventSelected and BoothAdmin_id__c=:UserInfo.getUserId()) ]; 
    system.debug('Booth personnels count '+Boothpersonnels);
     
     if(Boothpersonnels.size()>0){
     
    for(User_Profile_Event__c upe:Boothpersonnels){
    
   
    if(upe.User_id__r.CompanyName != null){
     
    upe.User_id__r.CompanyName =escapeSpecialCharacters(upe.User_id__r.CompanyName);
    }
     if(upe.User_id__r.Title !=NULL )
    upe.User_id__r.Title =escapeSpecialCharacters(upe.User_id__r.Title);
    
    if(upe.UEP_isActive__c ==true){
    statusValue = 'Active';
    
    } else{
    
     statusValue ='InActive';
    }
             
     boothPersonnelWithStatus.add(new innerForDisplayStatus(upe,statusValue));
   } 
    }
       
        return null;
    }



 public class innerForDisplayStatus
 {    
  public User_Profile_Event__c upevalue{get;set;}
  public string strForDisplayStatus{get;set;}   
  public  innerForDisplayStatus(User_Profile_Event__c valueOfupe,string strForDisplay)
  {
   this.upevalue =valueOfupe;
   this.strForDisplayStatus =strForDisplay;
  }
 }






public String escapeSpecialCharacters(String input){
  if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','');
         }
        if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
        
        }

         if(input!= null && input != '' && (input.contains('\\') )){
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



 
 



public List<SelectOption> getItems() {

 List<User_Profile_Event__c> upeForEvents = new List<User_Profile_Event__c>();
 EvntsForPicklist = new List<Event__c>();
 upeForEvents = [Select u.User_id__c, u.UEP_isActive__c, u.SystemModstamp, u.Profile_id__c, u.OwnerId, u.Name, u.LastModifiedDate, u.LastModifiedById, u.LastActivityDate, u.IsDeleted, u.Id, u.EventAdmin_Id__c, u.EV_id__c, u.CreatedDate, u.CreatedById, u.BoothAdmin_id__c, u.BT_id__c, u.BLP_id__c From User_Profile_Event__c u where u.User_id__r.Email=:UserInfo.getUserName() and (Status__c!='Mobile only access' And Status__c!='InActive')];
 set<Id> setOfEventIds = new set<Id>();
 
 for(User_Profile_Event__c rotatinnFor:upeForEvents){
 setOfEventIds.add(rotatinnFor.EV_id__c);
 }
 
 EvntsForPicklist =[select  id,EV_Title__c from Event__c where id in :setOfEventIds order by EV_StartDate__c];
 if(EvntsForPicklist.size()>0){
 defaultEvent =EvntsForPicklist[0].id;
 system.debug('4444444444444444444444444444444444444444444  '+defaultEvent );
 
 }
 List<SelectOption> options = new List<SelectOption>();
 for(Event__c Event:EvntsForPicklist ){
  options.add(new SelectOption(Event.id,Event.EV_Title__c));
  }
  return options;
 }

public List<SelectOption> SeletSelect{get;set;}
public User_Profile_Event__c upeFordisplayStatus {get;set;}
public String PreviousStingValue{get;set;}

 public PageReference deleteAdminRecord1() 
 {
  errormsg ='';
  displayPopUpForAddcheck  =true;
  upeFordisplayStatus =[select Status__c,BT_id__c,BT_id__r.BT_BoothUserCount__c,UEP_isActive__c from User_Profile_Event__c where id =:eventName];
  
  countrySelect=upeFordisplayStatus.Status__c;    
  PreviousStingValue =countrySelect;
    
  SeletSelect = new List<SelectOption>(); 
   SeletSelect.add(new SelectOption('Mobile only access','Mobile only access')); 
   SeletSelect.add(new SelectOption('Mobile and Portal Access','Mobile and Portal Access')); 
   
   if(countrySelect.trim() != 'InActive'){
    SeletSelect.add(new SelectOption('InActive','InActive')); 
   } 
  return null; 
 }
 
 
public List<User_Profile_Event__c> checkedstatus{get;set;}
public Id boothadminid{get;set;}
public string boothadminiderror{get;set;}

 public void boothuserstatus()
 {  
  try{  
  system.debug('++++++++++++='+eventname);
  string[] ss=eventname.split(',');
  system.debug('status is'+ss);
  string bustatus=ss[1];
  system.debug('status is '+bustatus);
  boothadminid=ss[0];
  
  checkedstatus=new List<User_Profile_Event__c>();
  checkedstatus=[select Status__c,BT_id__c,BT_id__r.BT_BoothUserCount__c,Profile_id__r.Pr_Name__c,UEP_isActive__c from User_Profile_Event__c where id =:ss[0]];
  if(checkedstatus[0].Profile_id__r.Pr_Name__c=='BoothAdmin')
  { 
  system.debug('Booth admin Yes'+checkedstatus[0].Profile_id__r.Pr_Name__c);
   boothadminiderror='You can not change status of Booth Admin';
  }
  else{
  system.debug('Booth admin No'+checkedstatus[0].Profile_id__r.Pr_Name__c);
   SeletSelect = new List<SelectOption>(); 
   SeletSelect.add(new SelectOption('Mobile only access','Mobile only access')); 
   SeletSelect.add(new SelectOption('Mobile and Portal Access','Mobile and Portal Access')); 
 
  List<User_Profile_Event__c> changedstatus=new List<User_Profile_Event__c>();
  for(User_Profile_Event__c dd:checkedstatus)
  {
   if(bustatus== 'Mobile only access'){ 
    dd.Status__c='Mobile only access';
   }
   else{
    dd.Status__c='Mobile and Portal Access';
   }
   changedstatus.add(dd);
  }  
  update changedstatus;  
  }  
  }catch(exception e){}
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
 
   Profile__c customProfileBooth= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileBooth;
   
   Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert eve;
      Id EventId=eve.Id;
      
     
     Booth__c booth1 = new Booth__c(BT_Name__c='TestBooth1',BT_BoothUserCount__c=100);
      insert booth1;
      
      User_Profile_Event__c upebooth = new User_Profile_Event__c(BT_id__c=booth1.Id,EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,Profile_id__c=customProfileBooth.id,Status__c='Active',User_id__c=eventAdminId,UEP_isActive__c=false);         
      insert upebooth; 
      
 //----------------------------- Booth Amin ----------------------------------
  user bAdmin =  new User(alias = 'testboot', email='testboothadmin@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='testboothadmin@noemail.com',CompanyName='Nest',Title='dev');
                  insert bAdmin ;
                  Id boothAdminId=bAdmin.id;
                  
                  
 Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
       insert  customProfile;
  Id  profileId=customProfile.Id;     
      
      Booth__c booth = new Booth__c(BT_Name__c='TestBooth',BT_BoothUserCount__c=100);
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
     
     getEvent_att_map.EA_AttendeeBarcode__c =string.valueOf(event_att_map.Id)+'-'+string.valueOf(EventId);            
     update getEvent_att_map  ;          
     system.debug('----------------------- '+event_att_map);
      
      
      Reports__c  reportIndustry = new Reports__c(RE_Name__c='Report By Industry',UPE_id__c=upe.Id);
      insert reportIndustry ;
      
      Reports__c  reportGeography = new Reports__c(RE_Name__c='Report By Geography ',UPE_id__c=upe.Id);
      insert reportGeography ;
            
     
     
     
     BoothVisitSummary__c boothVisitSummary= new BoothVisitSummary__c(BVS_LeadRating__c=4.4,Follow_Update__c=datetime.valueOf('2012-05-15 00:00:00'),ScanTime__c=datetime.valueOf('2012-05-15 00:00:00'),BVS_FirstName__c='Scan',BVS_LastName__c='Me',BVS_Email__c='testboothadmin@noemail.com',EA_AttendeeBarcode__c=getEvent_att_map.Id,User_id__c=bAdmin.Id);
     insert boothVisitSummary;
     
     
     User_Event_BVS__c  use_Eve_BVS = new User_Event_BVS__c(BVS_id__c=boothVisitSummary.Id,EV_id__c=EventId,UPE_id__c=upe.Id);
     insert use_Eve_BVS;
     
     
    SecurityControls__c secControl = new SecurityControls__c(EV_id__c=EventId,EV_Req_Fields__c='AS_FirstName__c',EV_Fields__c='AS_FirstName__c,AS_Company__c,AS_Title__c,AS_CellPhone__c,AS_Age__c,AS_Gender__c,AS_BirthDate__c,AS_HomeAddress1__c,AS_ShippingAddress1__c,AS_WorkAddress1__c,AS_NAICSCode1__c,AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_PrimaryBusinessCategory__c,AS_SecondaryBusinessCategory__c,AS_NumberOfEmployees__c,AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_BusinessDunsNumber__c,AS_WebsiteUrl__c,AS_BlogUrl__c,AS_BusinessDescription__c,AttendeePic'); 
    insert  secControl ;         
   
   //------------------------------ booth personnel -------------------------------
   
   user bu1 =  new User(alias = 'buser', email='buser@badmin.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='buser@badmin.com',CompanyName='Nest',Title='dev');
                  insert bu1;
                                
                  
 Profile__c customProfilebu1= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
  insert  customProfilebu1;
       
       Profile__c customProfilepersonnel= new Profile__c (PR_Name__c='BoothPersonnel',PR_Version__c='1.5');        
  insert  customProfilepersonnel;
     
    Event__c evebu1 = new Event__c(EV_Title__c='Global evebu1 ',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert evebu1 ;
      
    User_Profile_Event__c upebu1 = new User_Profile_Event__c(EV_id__c=evebu1.Id,Profile_id__c=customProfilebu1.Id,Status__c='Active',User_id__c=bu1.Id,UEP_isActive__c=true);         
      insert upebu1 ; 
   
    AttendeeSummary__c attSummarybp = new AttendeeSummary__c(As_prefixNew__c='Mr',AS_FirstName__c='te\"st',AS_LastName__c='boothadmin',AS_Email__c='buser@badmin.com');
     insert attSummarybp;
   
   
   
   
   // --------------------------------  bp ------------------------
   
   user bu2 =  new User(alias = 'busers', email='buser2@badmin.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='buser2@badmin.com',CompanyName='Nest',Title='dev');
                  insert bu2;
                                
                  
 Profile__c customProfilebu2= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
  insert  customProfilebu2;

     
    Event__c evebu2 = new Event__c(EV_Title__c='Global evebu2 ',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert evebu2 ;
     
    Booth__c booth2 = new Booth__c(BT_Name__c='TestBoothup2',BT_BoothUserCount__c=100);
      insert booth2;            
     
      
    User_Profile_Event__c upebu2 = new User_Profile_Event__c(BT_id__c=booth2.Id,EV_id__c=evebu2.Id,Profile_id__c=customProfilebu2.Id,Status__c='Active',User_id__c=bu2.Id,UEP_isActive__c=true);         
      insert upebu2 ; 
   
  
   
   
   
 // ------------------------------- controller Test -----------------   
   
    system.runAs(bAdmin){ 
    BL_BoothPersonnelsCon blattendee = new BL_BoothPersonnelsCon ();
    blattendee.login();
    blattendee.addPersonnels();
    blattendee.getSeletOptions();
    blattendee.closePopup2();
    blattendee.closePopupSelect();
    blattendee.upeFordisplayStatus =upe;
    blattendee.saveLicenceValues();
   
     blattendee.CreateUser.FirstName ='Booth';
     blattendee.CreateUser.LastName ='User';
     blattendee.email ='boothuser@noemail.com';
     blattendee.country ='Active';
     blattendee.eventSelected =EventId;
     blattendee.savePopUpValues();
      
     blattendee.eventSelected =EventId;
     blattendee.email ='buser@badmin.com';
     blattendee.country ='Active';
     blattendee.savePopUpValues();
      
     blattendee.email ='buser2@badmin.com';
     blattendee.country ='Active';
     blattendee.savePopUpValues();
     blattendee.closePopup1();
     blattendee.eventName =upebu1.Id;
     blattendee.editAttendees();
     blattendee.editOfBoothPersonnel.FirstName= 'Hi';
     blattendee.editOfBoothPersonnel.LastName ='Hello';
     blattendee.EditPopUpValues();
     blattendee.closePopup(); 
     blattendee.getEventDetails();
     blattendee.getItems();
     blattendee.eventName =upebu2.Id;
     blattendee.deleteAdminRecord();
  }
 
 
 
   system.runas(u){
    BL_BoothPersonnelsCon blattendee = new BL_BoothPersonnelsCon ();
    blattendee.login();
    blattendee.upeFordisplayStatus =upebooth;
    blattendee.saveLicenceValues();
     
   }
 
 }

}