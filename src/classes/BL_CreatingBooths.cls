public with sharing class BL_CreatingBooths {

Public String selectEvent{get;set;}
public List<selectoption> ListOfSelectedEvents {get;set;}
Public String LoginUserID{get;set;}
public List<Booth__c> B{get;set;}
public List<User_Profile_Event__c> BoothsList {get;set;}
public String SelectBooth{get;set;}
Public List<BoothAdminInnerDisplay> InnerAdminClass{get;set;}
public List<User_Profile_Event__c> User_Profile_Event{get;set;}
Public Boolean CreatBoothAdminPopUp{get;set;} 
Public Booth__c Booth{get;set;}
public User BoothAdminUser{get;set;}
public String Email{get;set;}
public boolean displayBoothExport{get;set;}
public boolean Button{get;set;}
public Boolean showButton{get;set;}
public Boolean ImportButton{get;set;}
public Contact Con{get;set;}
public Boolean error{get;set;}
public String ErrorMessage{get;set;}
public Boolean AddingAdmintoBooth {get;set;}


public BL_CreatingBooths(){
LoginUserID = Userinfo.getUserId();

//LoginUserId = '005O0000000rJHP';
ListOfEvents();// To Display out of Site

}

Public void ListOfEvents(){
    
   // DisplayNoEventMessage=false;
    
     ListOfSelectedEvents = new List<selectoption>();
    try{
    List<User_Profile_Event__c> EventsList = [select Id,EV_id__c,EV_id__r.EV_Title__c from User_Profile_Event__c 
                                where EventAdmin_Id__c =: LoginUserId AND Profile_id__r.PR_Name__c ='EventAdmin' 
                                  ]; 
    ListOfSelectedEvents.add(new Selectoption('--Choose Event--','--Choose Event--'));
   
    for(User_Profile_Event__c UserPEvent: EventsList){
    ListOfSelectedEvents.add(new Selectoption(UserPEvent.EV_id__c,UserPEvent.EV_id__r.EV_Title__c)); 
    
    }    
  }catch (Exception e){ } 
  
  
  }
  
  Public void ListOfbooths(){
  displayBoothExport = True;
  Button = true;
  ImportButton = true;
  ShowButton = False;
    system.debug('----------------- @@@@@@@@@@@@@@@@'+SelectEvent );
    //DisplayNoEventMessage=false;
    
    if(selectEvent == '-- Choose Event--'){
      ShowButton = False;
      displayBoothExport = True;
      Button = true;
      ImportButton = true;
    }
    
   BoothsList  = new List<User_Profile_Event__c> ();
   try{
   BoothsList  = [select BT_id__c,BT_id__r.BT_Name__c from User_Profile_Event__c 
                  where EventAdmin_Id__r.id=: LoginUserId AND EV_id__c =:SelectEvent 
                  AND Profile_id__r.PR_Name__c ='BoothAdmin' AND BT_id__r.BT_isBoothActive__c = True   ];  
                  
   set<ID> UniqueBoothIds = new  set<ID> ();
   
   for(User_Profile_Event__c BoothsIds :BoothsList ){
   UniqueBoothIds.add(BoothsIds.BT_id__c);
   system.debug('------------------- &&&&&&&&&&&&&&&&&&&&&&& '+UniqueBoothIds);
   }      
   
   B = new List<Booth__c> ();        
   B = [select Id,BT_Name__c from Booth__c where Id IN:UniqueBoothIds];  
    
    system.debug('------------ @@@@@@@@@@@@@@@@@@@@@@ -------------'+B);
      
  }catch (Exception e){} 
  ListOfBoothAdmins();
}
    
    Public void  ListOfBoothAdmins(){
    String SelectBoothId = ApexPages.currentpage().getparameters().get('BoothName');
    SelectBooth = SelectBoothId ;
    
    InnerAdminClass = new List<BoothAdminInnerDisplay>();
    system.debug(' ----------------- *************'+SelectBooth+ ' ---------------- ########'+selectEvent );
    
    if(selectbooth == null && selectEvent != null || selectbooth == null && selectEvent != '--Choose Event--'){
        User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
       for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
          EventBoothAdm.BoothAdmin_id__r.FirstName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.FirstName);
          EventBoothAdm.BoothAdmin_id__r.LastName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.LastName);
          EventBoothAdm.BoothAdmin_id__r.CompanyName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.CompanyName);
          EventBoothAdm.BT_id__r.BT_Name__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Name__c);
          EventBoothAdm.BT_id__r.BT_Location__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Location__c);
          
          system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
          
        if(EventBoothAdm.UEP_isActive__c == True){
       // BStatus = 'Active';
        }else
        {
      //  BStatus = 'InActive';
        }
        InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm));               
  }
    }
    if(selectbooth != null && selectEvent != null){
    ShowButton = true;
    Button = False;
    ImportButton = False;
    system.debug(' ----------------- *************'+SelectBooth+ ' ---------------- ########'+selectEvent );
    User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c  
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent AND BT_ID__c =: SelectBooth 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
       for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
          EventBoothAdm.BoothAdmin_id__r.FirstName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.FirstName);
          EventBoothAdm.BoothAdmin_id__r.LastName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.LastName);
          EventBoothAdm.BoothAdmin_id__r.CompanyName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.CompanyName);
          EventBoothAdm.BT_id__r.BT_Name__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Name__c);
          EventBoothAdm.BT_id__r.BT_Location__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Location__c);
          
          system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
          
        if(EventBoothAdm.UEP_isActive__c == True){
     //   BStatus = 'Active';
        }else
        {
     //   BStatus = 'InActive';
        }
        
         InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm));
  }
  
  }  
  }
   
    class BoothAdminInnerDisplay{
    Public String Status{get;set;}
    Public User_Profile_Event__c BoothStatus{get;set;}
    Public BoothAdminInnerDisplay(User_Profile_Event__c BoothStatus1){
    this.BoothStatus = BoothStatus1;
   // this.Status = BoothSta; 
     system.debug('================ Checking how it works ========='+this.BoothStatus);       
    }              
   }
   
   
    //--------------------------------------For avoiding Double quotes -------------------------------------     
     public String escapeSpecialCharacters(String input)
    {
      
       if(input!= null && input != '' && (input.contains('"')  || input.contains('<')))
       {
        if(input!= null && input != '' && (input.contains('"') ))
        {
         input = input.replace('"','\\\"');
       
        }if(input!= null && input != '' && (input.contains('<') ))
        {
         input = input.replace('<','');
         
        }
        if(input!= null && input != '' && (input.contains(',') ))
        {
         input = input.replace(',','');
         
        }
        if(input!= null && input != '' && (input.contains('.') ))
        {
         input = input.replace('.','');
         
        }
      }  
    return input;
    
    }
  public string escape(string s){
   
  if(s != null && s.contains(',')){
     s=s.replaceAll('"','');
     s='"'+s+'"';
   } 
    return s;
 }
 
 public void exportBoothAdmins(){
 
 }
 public pageReference importBooths(){
    pageReference pg = new pageReference ('/apex/BL_boothadmin_import?id='+selectEvent);
    pg.setRedirect(true);
    return pg;
   }
 
 public void AddBooth(){
 CreatBoothAdminPopUp = True;
 Con = New Contact();
 Booth = new Booth__c();
 BoothAdminUser = new User();
 }
 
 
 public void forattendee(){
    system.debug('++++++++++++++++++++++++++++++'+BoothAdminUser.Firstname);
    string unique =  Email.tolowercase();
            system.debug('++++++++++++++++++++++++++++++'+unique );     
    List<AttendeeSummary__c> AttendeeDetails = [select  id  from AttendeeSummary__c Where AS_Email__c =: unique ];
                
                system.debug(' ===== Alredy Existed Attendee Email Id ===='+AttendeeDetails);
                
                if(AttendeeDetails.size() > 0){
                
                List<Event_Attendee_Mapping__c> EventAttendeeJun = [select id,EV_id__c from Event_Attendee_Mapping__c where AS_id__r.AS_Email__c =: Email AND EV_id__c =: SelectEvent];
                system.debug('========================= Attendee is inserted in Junction Object Or not ==========='+EventAttendeeJun );
                
                if(EventAttendeeJun.size()>0){}
                else{
                
                    Event_Attendee_Mapping__c InsertinginJun = new Event_Attendee_Mapping__c();
                    InsertinginJun.AS_id__c = AttendeeDetails[0].id;
                    InsertinginJun.EV_id__c = selectEvent;
                   
                   // InsertinginJun.Attendee_Event_IDs__c  = AttendeeDetails[0].Name + EventAttendeeJun[0].EV_id__r.Name;
                    insert InsertinginJun; 
                     InsertinginJun.EA_AttendeeBarcode__c=InsertinginJun.id+'-'+SelectEvent;
                     InsertinginJun.Attendee_Event_IDs__c=AttendeeDetails[0].id+SelectEvent;
                       update InsertinginJun;
                   }
                 
            }else {
                       AttendeeSummary__c AttendeeSummary = new AttendeeSummary__c();
                       AttendeeSummary.AS_Email__c = Email;
                       AttendeeSummary.AS_FirstName__c = BoothAdminUser.FirstName;
                       AttendeeSummary.AS_LastName__c = BoothAdminUser.LastName;
                       AttendeeSummary.AS_uniqueField__c=(BoothAdminUser.FirstName+BoothAdminUser.LastName+Email).tolowercase();
                       insert AttendeeSummary ;
                   
                       Event_Attendee_Mapping__c InsertinginJun = new Event_Attendee_Mapping__c();
                       InsertinginJun.AS_id__c = AttendeeSummary.id;
                       InsertinginJun.EV_id__c = SelectEvent;
                       InsertinginJun.Attendee_Event_IDs__c  = AttendeeSummary.Name;
                       
                       insert InsertinginJun;  
                        InsertinginJun.EA_AttendeeBarcode__c=InsertinginJun.id+'-'+SelectEvent;
                        InsertinginJun.Attendee_Event_IDs__c=AttendeeSummary.id+SelectEvent;
                        update InsertinginJun;       
                        AddingAdmintoBooth = false;
            
            }
    } 
 
 public void SaveBooth(){
 Savepoint sp = Database.setSavepoint();
  try{ 
         //Booth = new Booth__c 
    Booth.BT_Location__c         =  Booth.BT_Location__c;
    Booth.BT_Name__c             =  Booth.BT_Name__c;
    Booth.EV_id__c               =  SelectEvent;
    Booth.BT_ContactName__c      =  BoothAdminUser.Firstname + BoothAdminUser.LastName;
    Booth.BT_ContactPhone__c     =  BoothAdminUser.Companyphone__c;
    Booth.BT_WebsiteURL__c       =  BoothAdminUser.Company_website__c;
    Booth.BT_ContactEmail__c     =  Email;    
    insert Booth;  
     system.debug('::::::::: Inserting Booth ::::::::::::'+Email);
     system.debug('444444444444444444444444 n'+[select id from user All rows ]);          
               List<User> ComparingUserEmails = [Select Id,Email,Username From User Where UserName =:Email];
             
                System.debug('========rrrrrrrrrrrrrrrrrrrrr @ ========='+Email );
               System.debug('========@@@@@@ Comparing Email with Existing Email From User Object @@@@@ ========='+ComparingUserEmails);
                 
             // ------------------------------------------------- outer If Start ------------------------------    
                 
                   
               if(ComparingUserEmails.size()>0){
               List<User_Profile_Event__c> FindingDuplicates = [select User_id__r.Email,User_id__r.UserName From User_Profile_Event__c where User_Profile_Event__c.User_id__r.UserName=:Email AND  EV_id__c=:selectEvent];
               System.debug('========@@@@@@ Comparing Email with Existing Email From User_Profile_Event Object @@@@@ ========='+FindingDuplicates);
               
               if(FindingDuplicates.size()>0){
                   DataBase.rollBack(sp);
               system.debug('======== ERROR 1111111111111 ==========='  );
                 // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'He is Already Registerd as BoothAdmin for this Event'));
                 error=true;
                 errormessage='He is Already Registerd as BoothAdmin for this Event';
               }
               else{
               
               
                Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User_Profile_Event__c GettingPRID = [Select Id,BLP_id__c from User_Profile_Event__c Where Ev_Id__c=: SelectEvent AND User_Id__c =: LoginUserID AND EventAdmin_Id__c =: LoginUserID ];   
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();                
                UserBoothAdminProfile.BLP_id__c = GettingPRID.BLP_id__c;
                UserBoothAdminProfile.BoothAdmin_id__c =ComparingUserEmails[0].id;
                UserBoothAdminProfile.BT_id__c  = Booth.id;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Status__c='Active';
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = ComparingUserEmails[0].id;
                UserBoothAdminProfile.isFirstBoothAdmin__c=true;
                system.debug(';;;;;;;;;;;;;;;;;;;;;;;;;;'+UserBoothAdminProfile.isFirstBoothAdmin__c);
                insert UserBoothAdminProfile;
                system.debug(';;;;;;;;;;;;;;;;;;;;;;;;;;'+UserBoothAdminProfile.isFirstBoothAdmin__c);
                if(UserBoothAdminProfile != NULL){
                Reports__c BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Geography';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports;         
                BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Industry';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports;  
                forattendee();   
                }
                User_Profile_Event__c EmailAdminCredentials = [Select Id,Name,BoothAdmin_id__r.FirstName,BoothAdmin_id__r.LastName,BoothAdmin_id__r.IsActive,
                                                                BoothAdmin_id__r.UserName,BT_id__r.BT_Name__c,EV_id__r.EV_Title__c from User_Profile_Event__c 
                                                                where id =:UserBoothAdminProfile.id];               
                string Firstnametomail = EmailAdminCredentials.BoothAdmin_id__r.FirstName;
                string Lastnametomail = EmailAdminCredentials.BoothAdmin_id__r.LastName;
                string EmailIdtimail = EmailAdminCredentials.BoothAdmin_id__r.UserName;
                string MobileIdtomail = EmailAdminCredentials.Name;
                String EmailEventName = EmailAdminCredentials.EV_id__r.EV_Title__c;                
                string  tosendid = MobileIdtomail;
                //string totrimtheid = tosendid.substring(6,10);
                string totrimtheid = tosendid.substring(6);
                system.debug('---------to Find what will be the output$$$$$$$$$$$ -------'+totrimtheid);
                //string fromtrimtheid = tosendid.substring(10,17); 
                //system.debug('---------to Find what will be the output####### -------'+fromtrimtheid);
                string Personnelidtosend = totrimtheid;
                // system.debug('---------to Find what will be the output####### -------'+Personnelidtosend );
                Event__c ee=[select EV_Title__c from Event__c where id =: SelectEvent];
                String emailMessage =  'Dear '+Firstnametomail+' '+Lastnametomail+','+'<br/><br/>'+
               'Congratulations!!'+'<br />'+'Your Boothleads id is now added to the event '+ ee.EV_Title__c +'<br/>'+' Please continue to use your existing username '+' '+ EmailIdtimail +' '+' and password '+'<br />'+
                'combination to access this new event.'+'<br />'+'<br /><br />'+'Please visit http://www.boothleads.com to login to your Portal.'+'<br /><br />'+
                'If you have any questions, please contact your Event Administrator.'
                +'<br/><br/>'+'Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.'
                +'<br/>'+'Please remember to export all your leads.'+'<br/>'+'If you need access beyond this, please contact support.'
                +'<br /><br/><br/>'+'BoothLeads Customer Support'+'<br/>'+'Support@boothleads.com'; 
                 Messaging.singleEmailMessage Mail = new Messaging.singleEmailMessage();
                 string [] toAddresses= new string[]
                 {
                     EmailIdtimail
                 };
                     mail.setToAddresses(toAddresses);
                     mail.setSubject('Booth Admin ID for Mobile App has been created successfully!');
                     mail.setPlainTextBody(emailMessage);
                     mail.setHtmlBody(emailMessage);
                     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });               
                     forattendee();
                     CreatBoothAdminPopUp = False;
                     email='';
               }
                
            }  
            
         // ------------------------------------------------- outer If End------------------------------    
                      
               else{
               
               Profile UserAsBA = [Select Id,Name from Profile where Name = 'Booth Admin'];
               
               system.debug('======:::::::: Retriving Profile Id from Standard Profile Object ========::::::'+UserAsBA);              
              Event__c ee=[select EV_Title__c from Event__c where id =: SelectEvent];
               String EmailContent = 'Congratulations!!'+'\n'+'Your login for your Booth Admin Portal for Event' +'\t\t'+'"'+ee.EV_Title__c+'"'+'\t\t'+ '"was successfully created.'
                               +'\n\n'+'Please visit http://www.boothleads.com to login to your Booth Admin Portal.'+'\n\n'+'If you have any questions, please contact your Event Administrator.'
                               +'\n\n'+'Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.'+'\n'+'Please remember to export all your leads.'
                               +'\n'+'If you need access beyond this, please contact support.'
                               +'\n\n\n'+'Thank you!'+'\n'+'BoothLeads Customer Support'+'\n'+'support@boothleads.com';  
         
               Con.LastName = BoothAdminUser.LastName;
               Con.FirstName = BoothAdminUser.FirstName;
              //   Con.AccountId = '001F000000qdOJp';  // Developement Account Id
                 Con.AccountId = '001O0000007AN41';     
               Con.Email_Notes__c = EmailContent;
               
               insert Con ;
               
               system.debug('=====::::::::: Inserting Contact :::::::======='+Con );
             
               
                BoothAdminUser.ContactID = Con.id;
                BoothAdminUser.Username = Email;
                BoothAdminUser.Email = Email;
                BoothAdminUser.Firstname = BoothAdminUser.Firstname;
                BoothAdminUser.LastName = BoothAdminUser.LastName;
                BoothAdminUser.Alias ='BAdmin';
                 BoothAdminUser.ProfileID =UserAsBA.Id;
                
             
                BoothAdminUser.LocaleSidKey ='en_US';
                BoothAdminUser.LanguageLocaleKey ='en_US';
                BoothAdminUser.TimeZoneSidKey ='America/Los_Angeles';
                BoothAdminUser.EmailEncodingKey='UTF-8';
                BoothAdminUser.companyName = BoothAdminUser.companyName;
                BoothAdminUser.Company_website__c = BoothAdminUser.Company_website__c;
                BoothAdminUser.CompanyAddr1__c = BoothAdminUser.CompanyAddr1__c;
                BoothAdminUser.CompanyAddr2__c = BoothAdminUser.CompanyAddr2__c;
                BoothAdminUser.CompanyCity__c = BoothAdminUser.CompanyCity__c;               
                BoothAdminUser.Country__c =  BoothAdminUser.Country__c;
                BoothAdminUser.States__c = BoothAdminUser.States__c ;
                BoothAdminUser.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                BoothAdminUser.Companyphone__c = BoothAdminUser.Companyphone__c;
                BoothAdminUser.Zipcode__c = BoothAdminUser.Zipcode__c;
                BoothAdminUser.PoBox__c = BoothAdminUser.PoBox__c;
                
                 system.debug('----- **************** BoothAdminUser'+BoothAdminUser);
               
               
                
                insert BoothAdminUser;
                
                system.debug('----- ****************'+BoothAdminUser.id);
                
                 System.ResetPasswordResult rt= system.ResetPassword(BoothAdminUser.id,true);
                 BoothAdminUser.password__c =rt.getPassword();
               
                 update BoothAdminUser;
                 
                 Database.DMLOptions dmo = new Database.DMLOptions();
                dmo.EmailHeader.triggerUserEmail = true;
                BoothAdminUser.setOptions(dmo);  
               
               
                system.debug('----@@@:::Inserting Boothadmin into User Object:::@@@--------'+BoothAdminUser);
                
                Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User_Profile_Event__c GettingPRID = [Select Id,BLP_id__c from User_Profile_Event__c Where Ev_Id__c=: SelectEvent AND User_Id__c =: LoginUserID AND EventAdmin_Id__c =: LoginUserID];
                
                
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();
                
                UserBoothAdminProfile.BLP_id__c = GettingPRID.BLP_id__c;
                UserBoothAdminProfile.BoothAdmin_id__c = BoothAdminUser.id;
                UserBoothAdminProfile.BT_id__c  = Booth.id;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = BoothAdminUser.Id;
                
                insert UserBoothAdminProfile;
                
                if(UserBoothAdminProfile != NULL){
                
                Reports__c BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Geography';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports;
                
                 BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Industry';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports; 
                
                
                }
              
               forattendee();
               CreatBoothAdminPopUp = False;
               email='';
               ListOfbooths();
               ListOfBoothAdmins(); 
               system.debug('-------:::::::: Inserting Event,Booth,Boothadmin into the CommonTable ::::::------'+UserBoothAdminProfile);       
      }    
               
    
    
   
 }catch(Exception e){
   ApexPages.addMessages(e);
   DataBase.rollBack(sp);
    }  
    Email = '';
    }
    
    
    
 
    Public Void CancelBooth(){   
    CreatBoothAdminPopUp = FaLSE;
    }
    
    public String SelectBoothId{get;set;}
    public void AddBoothAdmin(){
    AddingAdmintoBooth = True;
    con = new Contact();
    BoothAdminUser = new User();  
   // SelectBoothId = ApexPages.currentpage().getparameters().get('BoothName');
   // SelectBooth = SelectBoothId ;
    } 
    
      
    Public void SaveOnlyBA(){  
    
    
      
                system.debug('-------------- ********************8 ------------------'+SelectBooth);
                  
                List<User> ComparingUserEmailsev = [Select Id,Email,Username From User Where UserName =: Email AND  Profile.Name=:'Event Admin' ];
                if(ComparingUserEmailsev.size()!= 0){
                error=true;
                errormessage='Booth Admin is Already an Event Admin for Other Event';
               }
               
               Else{ 
           //-------------------------------------------------     
      try{
                List<User> ComparingUserEmails = [Select Id,Email,Username From User Where UserName =: Email Limit 1];
               
               System.debug('========@@@@@@ Comparing Email with Existing Email From User Object @@@@@ ========='+ComparingUserEmails);
                   
               if(ComparingUserEmails.size()>0){
               
               List<User_Profile_Event__c> FindingDuplicates = [select User_id__r.Email,User_id__r.UserName From User_Profile_Event__c where User_Profile_Event__c.User_id__r.UserName=:Email AND  EV_id__c=:selectEvent ];
               System.debug('========@@@@@@ Comparing Email with Existing Email From User_Profile_Event Object @@@@@ ========='+FindingDuplicates.size());
               
               if(FindingDuplicates.size()>0){
               //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Booth Admin is Already an Admin for this Booth'));
              error=true;
               errormessage='Booth Admin is Already an Admin for this Event for other Booth';
               }
               else{       
               Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();
                UserBoothAdminProfile.BoothAdmin_id__c = ComparingUserEmails[0].id;
                UserBoothAdminProfile.BT_id__c  = SelectBooth;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = ComparingUserEmails[0].id;
                
              insert  UserBoothAdminProfile ;
                
                if(UserBoothAdminProfile != NULL){
                
                Reports__c BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Geography';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports;
                
                system.debug('---Hello Mom make it complete fast---'+BoothAdminReports);
                
                 BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Industry';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
               insert BoothAdminReports; 
                
                system.debug('---Hello DAD make it complete fast---'+BoothAdminReports);
                
                
                }
                
                User_Profile_Event__c EmailAdminCredentials = [Select Id,Name,BoothAdmin_id__r.FirstName,BoothAdmin_id__r.LastName,
                                                                BoothAdmin_id__r.UserName,BT_id__r.BT_Name__c,EV_id__r.EV_Title__c from User_Profile_Event__c 
                                                                where id =:UserBoothAdminProfile.id];
                
                string Firstnametomail = EmailAdminCredentials.BoothAdmin_id__r.FirstName;
                string Lastnametomail = EmailAdminCredentials.BoothAdmin_id__r.LastName;
                string EmailIdtimail = EmailAdminCredentials.BoothAdmin_id__r.UserName;
                string MobileIdtomail = EmailAdminCredentials.Name;
                String EmailEventName = EmailAdminCredentials.EV_id__r.EV_Title__c;
                
                string  tosendid = MobileIdtomail;
                //string totrimtheid = tosendid.substring(6,10);
                string totrimtheid = tosendid.substring(6);
                system.debug('---------to Find what will be the output$$$$$$$$$$$ -------'+totrimtheid);
                //string fromtrimtheid = tosendid.substring(10,17); 
                //system.debug('---------to Find what will be the output####### -------'+fromtrimtheid);
                string Personnelidtosend = totrimtheid;
                // system.debug('---------to Find what will be the output####### -------'+Personnelidtosend );
                
                
                String emailMessage =  'Dear '+Firstnametomail+' '+Lastnametomail+','+'<br/><br/>'+
               'Congratulations!!'+'<br />'+'Your Boothleads id is now added to the event '+ EmailEventName +'<br/>'+' Please continue to use your existing username ' + ''+EmailIdtimail +''+' and password '+'<br />'+
                'combination to access this new event.'+'<br />'+'<br /><br />'+'Please visit http://www.boothleads.com to login to your Portal.'+'<br /><br />'+
                'If you have any questions, please contact your Event Administrator.'
                +'<br/><br/>'+'Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.'
                +'<br/>'+'Please remember to export all your leads.'+'<br/>'+'If you need access beyond this, please contact support.'
                +'<br /><br/><br/>'+'BoothLeads Customer Support'+'<br/>'+'Support@boothleads.com';
                
                
                
                
                 
                 Messaging.singleEmailMessage Mail = new Messaging.singleEmailMessage();
                 string [] toAddresses= new string[]
                 {
                     EmailIdtimail
                 };
                     mail.setToAddresses(toAddresses);
                     mail.setSubject('Booth Admin ID for Mobile App has been created successfully!');
                     mail.setPlainTextBody(emailMessage);
                     mail.setHtmlBody(emailMessage);
                     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
                     forattendee();              
                     AddingAdmintoBooth = false;
                     email='';
                system.debug('-------:::::::: Inserting Event,Booth,Boothadmin into the CommonTable ::::::------'+UserBoothAdminProfile);    
          } 
          
        }
           else{
               Profile UserAsBA = [Select Id,Name from Profile where Name = 'Booth Admin'];
               
               system.debug('======:::::::: Retriving Profile Id from Standard Profile Object ========::::::'+UserAsBA);              
              
               Event__c ee =[select EV_Title__c from Event__c where id =: SelectEvent];
               String EmailContent = 'Congratulations!!'+'\n'+'Your login for your Booth Admin Portal for Event' +'\t\t'+'"'+ee.EV_Title__c+'"'+'\t\t'+ '"was successfully created.'
                               +'\n\n'+'Please visit http://www.boothleads.com to login to your Booth Admin Portal.'+'\n\n'+'If you have any questions, please contact your Event Administrator.'
                               +'\n\n'+'Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.'+'\n'+'Please remember to export all your leads.'
                               +'\n'+'If you need access beyond this, please contact support.'
                               +'\n\n\n'+'Thank you!'+'\n'+'BoothLeads Customer Support'+'\n'+'support@boothleads.com';  
         
               
               
               Con.LastName = BoothAdminUser.LastName;
               Con.FirstName = BoothAdminUser.FirstName;
             //  Con.AccountId = '001F000000qdOJp'; 
                Con.AccountId = '001O0000007AN41';  // Developement Account Id1111111
             
               Con.Email_Notes__c = EmailContent;
               
                insert Con ;
               
               system.debug('=====::::::::: Inserting Contact :::::::======='+Con );
               
                       
               
                BoothAdminUser.ContactID = Con.id;
                BoothAdminUser.Username = Email;
                BoothAdminUser.Email = Email;
                BoothAdminUser.Firstname = BoothAdminUser.Firstname;
                BoothAdminUser.LastName = BoothAdminUser.LastName;
                BoothAdminUser.Alias ='BAdmin';
                BoothAdminUser.ProfileID =UserAsBA.Id;
                //BoothAdminUser.ProfileID ='00e90000000zItK';
                BoothAdminUser.LocaleSidKey ='en_US';
                BoothAdminUser.LanguageLocaleKey ='en_US';
                BoothAdminUser.TimeZoneSidKey ='America/Los_Angeles';
                BoothAdminUser.EmailEncodingKey='UTF-8';
                BoothAdminUser.companyName = BoothAdminUser.companyName;
                BoothAdminUser.Company_website__c = BoothAdminUser.Company_website__c;
                BoothAdminUser.CompanyAddr1__c = BoothAdminUser.CompanyAddr1__c;
                BoothAdminUser.CompanyAddr2__c = BoothAdminUser.CompanyAddr2__c;
                BoothAdminUser.CompanyCity__c = BoothAdminUser.CompanyCity__c;
                
                BoothAdminUser.CompanyCountry__c = BoothAdminUser.CompanyCountry__c;
                
                BoothAdminUser.CompanyState__c = BoothAdminUser.CompanyState__c;
                BoothAdminUser.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                BoothAdminUser.Companyphone__c = BoothAdminUser.Companyphone__c;
                BoothAdminUser.Zipcode__c = BoothAdminUser.Zipcode__c;
                BoothAdminUser.PoBox__c = BoothAdminUser.PoBox__c;
                
               
                
               insert BoothAdminUser;
                
               system.debug('-------------- ******************** ----------------'+BoothAdminUser.id);
                System.ResetPasswordResult rt= system.ResetPassword(BoothAdminUser.id,true);
                system.debug('45454545454545454545454   '+rt);
                BoothAdminUser.password__c = rt.getPassword();
               
           
                Database.DMLOptions dmo = new Database.DMLOptions();
                dmo.EmailHeader.triggerUserEmail = true;
                BoothAdminUser.setOptions(dmo);
                update BoothAdminUser;
                
                
                
                system.debug('----@@@:::Inserting Boothadmin into User Object:::@@@--------'+BoothAdminUser);
                
                Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();
                UserBoothAdminProfile.BoothAdmin_id__c = BoothAdminUser.id;
                UserBoothAdminProfile.BT_id__c  = selectBooth;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = BoothAdminUser.Id;
                
                insert UserBoothAdminProfile;
                
                if(UserBoothAdminProfile != NULL){
                
                Reports__c BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Geography';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports;
                
                system.debug('---Hello vineel make it complete fast---'+BoothAdminReports);
                
                BoothAdminReports= new Reports__c();
                BoothAdminReports.RE_Name__c ='Report By Industry';
                BoothAdminReports.UPE_id__c=UserBoothAdminProfile .id;
                insert BoothAdminReports; 
                system.debug('---Hello Shruthi make it complete fast---'+BoothAdminReports);
                
                }
                
               
                forattendee();                
                AddingAdmintoBooth=false;                  
                email='';
                system.debug('------*********UserBoothAdminProfile.BT_id__c------- '+selectBooth );
              // selectBooth = UserBoothAdminProfile.BT_id__c ;
               
               
                selectBooth = UserBoothAdminProfile.BT_id__c;
               
          
            
     // ListOfBoothAdmins();     
   // getListofBoothAdmins1();
      
                 
   } 
      InnerAdminClass = new List<BoothAdminInnerDisplay>();
                system.debug('------selectBooth********** ------ '+selectBooth );
                User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c  
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent AND BT_ID__c =: SelectBooth 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
             system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
             for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
              EventBoothAdm.BoothAdmin_id__r.FirstName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.FirstName);
              EventBoothAdm.BoothAdmin_id__r.LastName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.LastName);
              EventBoothAdm.BoothAdmin_id__r.CompanyName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.CompanyName);
              EventBoothAdm.BT_id__r.BT_Name__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Name__c);
              EventBoothAdm.BT_id__r.BT_Location__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Location__c);
              
              system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
                
         
            InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm)); 
           }  
   }catch(Exception e){
   //ApexPages.addMessages(e);
    }
     
     
}  
 }    
     Public void CancelBAM(){  
     AddingAdmintoBooth = False;  
  }
}