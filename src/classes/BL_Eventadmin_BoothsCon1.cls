public with sharing class BL_Eventadmin_BoothsCon1 {
    
    
    Public String selectBooth{get;set;}
    Public String SelectEvent{get;set;}
    Public String DisplayNoEvent {get;set;}
    Public Boolean DisplayNoEventMessage {get;set;}
    Public Boolean AddBoothPopUp {get;set;}
    Public Boolean AddBoothAdminPopUp {get;set;}
    Public String LoginUserId{get;set;}
    Public Booth__c Booth{get;set;}
    Public List<User_Profile_Event__c> User_Profile_Event{get;set;}
    Public String BoothAdminId{get;set;}
    Public User BoothAdminUser {get;set;}
    Public String Email{get;set;}
    Public Boolean CreatBoothAdminPopUp{get;set;}
    Public String FirstName{get;set;}
    Public string LastName{get;set;}
    Public List<Booth__c> BoothsList{get;set;}
    Public Boolean DisplayNoBoothMessage{get;set;} 
    Public string DisplayNoBooth{get;set;}
    Public Boolean OnlyBoothAdminPopUp{get;set;}
    Public Contact Con{get;set;}
    Public List<User_Profile_Event__c> E{get;set;}
    Public Boolean EditExhibitorPopUp{get;set;}
    Public Boolean displayBoothinfoPopUp{get;set;}
    Public Boolean displayBoothDetailsPopUp{get;set;}
    Public Boolean Statuspopup{get;set;}
    Public String SelectStatus{get;set;}
    Public Booth__c ForUpdatingBoothstatus  {get;set;}
    Public Boolean PrintPopUp{get;set;}
    Public string SelectFields{get;set;}
    Public string SelectFontstyles{get;set;}
  
   
    
    
    
    Public Void Print(){
    
    PrintPopUp = True;
    
    }
    
    Public List<selectoption> getFiledstobeprinted(){
    List<selectoption> Options = new List<selectoption>();
    Options.add(new selectoption('Registration Link','Registration Link'));
    Options.add(new selectoption('Contact Name','Contact Name'));
    Options.add(new selectoption('Booth Name','Booth Name'));
    return Options;    
    }
    
    Public List<SelectOption> getFontStyle(){
        List<selectoption> Options = new List<selectoption>();
        Options.add(new selectoption('OCR A Extended','OCR A Extended'));
        Options.add(new selectoption('Old Century','Old Century'));
        Options.add(new selectoption('Pegasus','Pegasus'));
        Options.add(new selectoption('Pickwick','Pickwick'));
        Options.add(new selectoption('Poster','Poster'));
        Options.add(new selectoption('Pythagoras','Pythagoras'));
        Options.add(new selectoption('Sceptre','Sceptre'));
        Options.add(new selectoption('Sherwood','Sherwood'));
        Options.add(new selectoption('Signboard','Signboard'));
        Options.add(new selectoption('Socket','Socket'));
        Options.add(new selectoption('Steamer','Steamer'));
        Options.add(new selectoption('Storybook','Storybook'));
        Options.add(new selectoption('Subway','Subway'));
        Options.add(new selectoption('Tahoma','Tahoma'));
        Options.add(new selectoption('Technical','Technical'));
        Options.add(new selectoption('Teletype','Teletype'));
        Options.add(new selectoption('Tempus Sans ITC','Tempus Sans ITC'));
        Options.add(new selectoption('Times New Roman ','Times New Roman '));
        Options.add(new selectoption('Calligrapher ','Calligrapher '));
        
        
    return Options;  
    }
     
    
    Public List<selectOption> getStatuslist(){
        
    List<selectoption> Options = new List<selectoption>();
    options.add(new selectoption('Active','Active'));
    options.add(new selectoption('InActive','InActive'));
    
    return options;
    }
   
    Public String[] statusValue {get;set;}
    Public Void ActiveInactive(){
    system.debug('BoothAdminId::::--------------------------------'+BoothAdminId); 
    statusValue = BoothAdminId.split('-'); 
    system.debug('========== Spliting the Id value======'+statusValue );
    if(statusValue[1] == 'Active'){
            SelectStatus = 'Active';
            }else{
            SelectStatus= 'InActive';
            } 
             
            User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: statusValue[0]];
            
            system.debug('=======::::::::::: Mapping Junction EventID :::::::::::========='+ParticularJuncID);           
            
         List<Booth__c>  BoothStatus = [Select Id,BT_isBoothActive__c from Booth__c where Id =:ParticularJuncID.BT_id__c];
            
             ForUpdatingBoothstatus  = new Booth__c();
            
            system.debug('------:::::::::: For Editing Particular Event Record :::::::::::-------'+BoothDetails1 ); 
            
            for(Booth__c Admin1:BoothStatus )
            {
                if(statusValue[0]!= null && statusValue[0]!='' )
                {
                    
                   system.debug('-------+++++++++++-----------'+Admin1.Id);
                   
                   ForUpdatingBoothstatus  = Admin1;
                   
                   Statuspopup= True;
                    
                    break;
                    
                }
              
            }
    }
    public void SaveStatus(){
    
    if(SelectStatus == 'Active')
        {
        ForUpdatingBoothstatus.BT_isBoothActive__c = true;
        }else
        {
         ForUpdatingBoothstatus.BT_isBoothActive__c= false;
        }
         update ForUpdatingBoothstatus ;
         
         Statuspopup= false;
    }
    
    Public void Cancelstatus(){
    
    }
    
    Public Void Save(){
    }
    
   // Public BL_Eventadmin_BoothsCon1(){
    //LoginUserId = UserInfo.getUserId();
    //  LoginUserId = '005O0000000ZJas';
    
   // }
    
    Public List<selectoption> getListOfEvents(){
    //LoginUserId = UserInfo.getUserId(); 
    List<selectoption> Options = new List<selectoption>();
    List<User_Profile_Event__c> EventsList = [select Id,EV_id__c,EV_id__r.EV_Title__c from User_Profile_Event__c where EventAdmin_Id__c =: LoginUserId AND Profile_id__r.PR_Name__c ='EventAdmin' ]; 
    system.debug('===========$$$$$$$$$ Getting list of Events $$$$$$$$$ ============'+EventsList );
    Options.add(new Selectoption('--Choose Event--','--Choose Event--'));
    for(User_Profile_Event__c UserPEvent: EventsList){
    Options.add(new Selectoption(UserPEvent.EV_id__c,UserPEvent.EV_id__r.EV_Title__c));
   }
     return Options;
 }
    
         Public List<selectOption> ChangeOfBooths(){
         E = new List<User_Profile_Event__c>();
        System.debug('---------Selected Booths From List--------'+SelectBooth);
        getListOfBooths();        
        return null;
        
        }
    
    
    Public List<selectoption> getListOfBooths(){ 
    
    List<selectoption> Options = new List<selectoption>();
    
    List<User_Profile_Event__c> BoothsList = [select BT_id__c,BT_id__r.BT_Name__c from User_Profile_Event__c where EventAdmin_Id__r.id=: LoginUserId AND EV_id__c =:SelectEvent AND Profile_id__r.PR_Name__c ='BoothAdmin' ]; 
   // List<Booth__c> BoothsList = [select Id,BT_Name__c from Booth__c where EV_id__c =: SelectEvent ]; 
    system.debug('--------------:::::::: getting Selected Booths from Selected Event::::::::-----------'+BoothsList );
   
    Options.add(new Selectoption('--Choose Booth--','--Choose Booth--'));
    for(User_Profile_Event__c EventVBooth: BoothsList){
    Options.add(new Selectoption(EventVBooth.BT_id__c,EventVBooth.BT_id__r.BT_Name__c));
   }
     return Options;
 }
 
   /**Public List<User_Profile_Event__c> getListOfBoothAdmins(){
    
    User_Profile_Event = new List<User_Profile_Event__c>();
    
    User_Profile_Event = [Select Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,BoothAdmin_id__r.LastName,
                          BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName from User_Profile_Event__c 
                          where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent AND Profile_id__r.PR_Name__c ='BoothAdmin' AND BT_id__c=:selectBooth ];
    
    system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
    return null;
    
    }*/
     Public String Bstatus{get;set;}
     Public List<BoothAdminInnerDisplay> InnerAdminClass{get;set;}
      
      Public void getListOfBoothAdms(){
      
        InnerAdminClass = new List<BoothAdminInnerDisplay>();
    
        //User_Profile_Event = new List<User_Profile_Event__c>();
    
        User_Profile_Event = [Select Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
       for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
          EventBoothAdm.BoothAdmin_id__r.FirstName = EventBoothAdm.BoothAdmin_id__r.FirstName;
          EventBoothAdm.BoothAdmin_id__r.LastName = EventBoothAdm.BoothAdmin_id__r.LastName;
          EventBoothAdm.BoothAdmin_id__r.CompanyName = EventBoothAdm.BoothAdmin_id__r.CompanyName;
          EventBoothAdm.BT_id__r.BT_Name__c = EventBoothAdm.BT_id__r.BT_Name__c;
          
          system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
          
        if(EventBoothAdm.BT_id__r.BT_isBoothActive__c == True){
        BStatus = 'Active';
        }else
        {
        BStatus = 'InActive';
        }
        
          InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm,BStatus));
        }
   
      //  return null;
    
    }
    
    Public List<BoothAdminInnerDisplay> getListOfBoothAdmins1(){
    return null;
    }

      Public void AddBooth(){
      if(selectEvent == '--Choose Event--'){
      DisplayNoBoothMessage = False; 
      DisplayNoEvent = 'Please Select an event';
      DisplayNoEventMessage = True;
      }
       else 
      {   
          DisplayNoEventMessage = False;
          AddBoothPopUp = True;
      }
       Con = New Contact();
       Booth = new Booth__c();
       BoothAdminUser = new User();
      }

        Public void Add_BoothAdmins(){//Adding Only BoothAdmin's Button
                if(SelectBooth == '--Choose Booth--'){
                 DisplayNoBooth = 'Please Select a Booth';
                 DisplayNoBoothMessage = True; 
                   }else {
                OnlyBoothAdminPopUp = True;
                  }
                  
                  Con = New Contact();
                  BoothAdminUser = new User();
               }
               
       Public void Next(){
           CreatBoothAdminPopUp = true; 
       }
   
       Public Pagereference SaveBooth(){
   
  
               Booth.BT_BoothUserCount__c   =  Booth.BT_BoothUserCount__c;
               Booth.BT_ContactEmail__c     =  Booth.BT_ContactEmail__c;
               Booth.BT_ContactName__c      =  Booth.BT_ContactName__c;
               Booth.BT_ContactPhone__c     =  Booth.BT_ContactPhone__c;
               Booth.BT_Description__c      =  Booth.BT_Description__c;
               Booth.EV_id__c               =  SelectEvent;
               Booth.BT_isBoothActive__c    =  true;
               Booth.BT_Location__c         =  Booth.BT_Location__c;
               Booth.BT_Name__c             =  Booth.BT_Name__c;
               Booth.BT_Phone__c            =  Booth.BT_Phone__c;
               Booth.BT_RegistrationLink__c =  Booth.BT_RegistrationLink__c;
               Booth.BT_WebsiteURL__c       =  Booth.BT_WebsiteURL__c;
               
               insert Booth;
               
               system.debug('::::::::: Inserting Booth ::::::::::::'+Booth);
               
               
               
               Profile UserAsBA = [Select Id,Name from Profile where Name = 'standard User'];
               
               system.debug('======:::::::: Retriving Profile Id from Standard Profile Object ========::::::'+UserAsBA);              
              
               
               Con.LastName = BoothAdminUser.LastName;
               Con.AccountId = '001O00000072aPq';
               
               insert Con ;
               
               system.debug('=====::::::::: Inserting Contact :::::::======='+Con );
               
                              /**      string df = string.valueOf(Email);
                                    integer i = df.indexOf('@');
                                    if(i>3){
                                    string ght = df.substring(0,3);
                                    }else{
                                    string ght = df.substring(0,1);
                                    
                                    }
                                    System.debug('UserName'+Email);*/
               
                
                BoothAdminUser.Username = BoothAdminUser.Email;
                BoothAdminUser.Email = BoothAdminUser.Email;
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
                BoothAdminUser.CompanyCountry__c = BoothAdminUser.CompanyCountry__c;
                BoothAdminUser.CompanyState__c = BoothAdminUser.CompanyState__c;
                BoothAdminUser.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                BoothAdminUser.Companyphone__c = BoothAdminUser.Companyphone__c;
                
                Database.DMLOptions dmo = new Database.DMLOptions();
                dmo.EmailHeader.triggerUserEmail = true;
                BoothAdminUser.setOptions(dmo);
                
                insert BoothAdminUser;
                
                system.debug('----@@@:::Inserting Boothadmin into User Object:::@@@--------'+BoothAdminUser);
                
                Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User_Profile_Event__c GettingPRID = [Select Id,BLP_id__c from User_Profile_Event__c Where Ev_Id__c=: SelectEvent AND User_Id__c =: LoginUserID];
                
                
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
                
                system.debug('-------:::::::: Inserting Event,Booth,Boothadmin into the CommonTable ::::::------'+UserBoothAdminProfile); 
           
                Booth__c UpdatingBoothUserCount = [select Id,BT_BoothUserCount__c from Booth__c where Id=:Booth.id AND EV_id__c=: SelectEvent]; 
           
                System.debug('--------::::::::::: Finding the Count of Userliscence Per Booth and updating :::::::::::::------'+UpdatingBoothUserCount);
           
                UpdatingBoothUserCount.BT_BoothUserCount__c = UpdatingBoothUserCount.BT_BoothUserCount__c-1;
                Update UpdatingBoothUserCount; 
      
                return null; 
     }
       
       Public void CancelBooth(){
       CreatBoothAdminPopUp = false;
      // AddBoothPopUp = false;   
       }
   
      Public Pagereference SaveOnlyBA(){//Inserting Admin to Selected Booth
       
           /**     List<User> ComparingUserEmails = [Select Id,Email,Username From User Where UserName =: Email Limit 1];
               
               System.debug('========@@@@@@ Comparing Email with Existing Email From User Object @@@@@ ========='+ComparingUserEmails);
                   
               if(ComparingUserEmails.size()>0){
               
               List<User_Profile_Event__c> FindingDuplicates = [select User_id__r.Email,User_id__r.UserName From User_Profile_Event__c where User_Profile_Event__c.User_id__r.UserName=:Email AND  EV_id__c=:selectEvent AND BT_id__c =:SelectBooth];
               System.debug('========@@@@@@ Comparing Email with Existing Email From User_Profile_Event Object @@@@@ ========='+FindingDuplicates);
               
               if(FindingDuplicates.size()>0){
               ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Booth Admin is Already an Admin for this Booth {!selectBooth}'));
               }
               else{
               User_Profile_Event__c CheckingForAdminLimit = [select BT_id__c,BT_id__r.BT_BoothUserCount__c from User_Profile_Event__c where User_Profile_Event__c.BT_id__c=:SelectBooth AND EV_id__c=: SelectEvent]; 
               system.debug('==========:::::::::::::: Checking For USerLimit ::::::::=========='+CheckingForAdminLimit);
               
               if(CheckingForAdminLimit.BT_id__r.BT_BoothUserCount__c == 0){
               ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'No Licenses available for Booth {!selectBooth}'));               
              }
              else if(CheckingForAdminLimit.BT_id__r.BT_BoothUserCount__c > 0){
                      
               Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();
                UserBoothAdminProfile.BoothAdmin_id__c = ComparingUserEmails[0].id;
                UserBoothAdminProfile.BT_id__c  = CheckingForAdminLimit.BT_id__c;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = ComparingUserEmails[0].id;
                
                insert  UserBoothAdminProfile ;
                
                Booth__c BoothUserCountForDup = [select Id,BT_BoothUserCount__c from Booth__c where Id=:CheckingForAdminLimit.BT_id__c AND EV_id__c=: SelectEvent]; 
           
                System.debug('--------::::::::::: Finding the Count of Userliscence Per Booth and updating :::::::::::::------'+BoothUserCountForDup );
           
                BoothUserCountForDup.BT_BoothUserCount__c = BoothUserCountForDup.BT_BoothUserCount__c-1;
                Update BoothUserCountForDup;
           }    
          } 
        }
           else{
               Con = new Contact();
               Con.LastName = 'Shruthi';
               Con.AccountId = '001O00000072aPq';
               
               insert Con ;
               
               system.debug('=====::::::::: Inserting Contact :::::::======='+Con );
               
               Profile UserAsBA = [Select Id,Name from Profile where Name = 'standard User'];
               system.debug('======:::::::: Retriving Profile Id from Standard Profile Object ========::::::'+UserAsBA);              
             
               
                
                BoothAdminUser.Username = Email;
                BoothAdminUser.Email = Email;
                BoothAdminUser.Firstname = BoothAdminUser.Firstname;
                BoothAdminUser.LastName = BoothAdminUser.LastName;
                BoothAdminUser.Alias ='BAdmin';
                BoothAdminUser.ProfileID = UserAsBA.Id;    
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
                
                insert BoothAdminUser;
                
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
                
               system.debug('-------:::::::: Inserting Event,Booth,Boothadmin into the CommonTable ::::::------'+UserBoothAdminProfile); 
           
               Booth__c UpdatingBoothUserCount = [select Id,BT_BoothUserCount__c from Booth__c where Id=:selectBooth AND EV_id__c=: SelectEvent]; 
           
               System.debug('--------::::::::::: Finding the Count of Userliscence Per Booth and updating :::::::::::::------'+UpdatingBoothUserCount);
           
               UpdatingBoothUserCount.BT_BoothUserCount__c = UpdatingBoothUserCount.BT_BoothUserCount__c-1;
               Update UpdatingBoothUserCount; 
       
    
   } */
       return null;  
}   
       Public void CancelBA(){
       EditExhibitorPopUp= False;
       }
   
   Public List<User> BoothDetails1{get;set;}
   Public List<User> returnList {get;set;}
   Public User Admin {get;set;}
   
   public void EditBoothAdmin()
        {
            system.debug('=========BoothAdminId::::'+BoothAdminId);
         
            User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: BoothAdminId];
            
            system.debug('=======::::::::::: Mapping Junction EventID :::::::::::========='+ParticularJuncID);           
            
            BoothDetails1 = [Select Id,FirstName,LastName,CompanyName,Email,Company_website__c,CompanyAddr1__c,
                             CompanyAddr2__c,CompanyCity__c,CompanyCountry__c,CompanyState__c,CompanyFaxNumber__c,
                             Companyphone__c from User where Id =:ParticularJuncID.User_Id__c];
                             
             OnlyBoothInfo = [Select Id,BT_BoothUserCount__c,BT_ContactEmail__c,BT_ContactName__c,BT_ContactPhone__c,BT_Description__c,BT_isBoothActive__c,
                             BT_Location__c,BT_Name__c,BT_PDFLocation__c,   BT_Phone__c,BT_RegistrationLink__c,
                             BT_WebsiteURL__c from  Booth__c where Id =:ParticularJuncID.BT_id__c];
             system.debug('============ Booth For Edit ======'+OnlyBoothInfo );                 
            
            Admin = new User();
            
            system.debug('------:::::::::: For Editing Particular Event Record :::::::::::-------'+BoothDetails1 ); 
            
            for(User Admin1 :BoothDetails1 )
            {
                for(Booth__c BoothInfo:OnlyBoothInfo )
                {
                if(BoothAdminId!= null )
                {
                    
                   system.debug('-------+++++++++++-----------'+Admin1.Id);
                   
                    Admin = Admin1;
                    MapBoothID = BoothInfo;                    
                    EditExhibitorPopUp = True;
                    break;
                    
                }
             }  
          }
        /** for(Booth__c BoothInfo:OnlyBoothInfo )
        {
            if(BoothAdminId!= null && BoothAdminId!='')
            {
                displayBoothDetailsPopUp = true;
                MapBoothID = BoothInfo;
                break;
            }
            
        }*/
            
          // EditBoothadmin();
        } 
   
           Public Void UpdateBoothadmin(){
           
                //Admin.Username = Email;
               // Admin.Email = Email;
                Admin.Firstname = Admin.Firstname;
                Admin.LastName = Admin.LastName;
                Admin.companyName = Admin.companyName;
                Admin.Company_website__c = Admin.Company_website__c;
                Admin.CompanyAddr1__c = Admin.CompanyAddr1__c;
                Admin.CompanyAddr2__c = Admin.CompanyAddr2__c;
                Admin.CompanyCity__c = Admin.CompanyCity__c;
                Admin.CompanyCountry__c = Admin.CompanyCountry__c;
                Admin.CompanyState__c = Admin.CompanyState__c;
                Admin.CompanyFaxNumber__c  = Admin.CompanyFaxNumber__c;
                Admin.Companyphone__c = Admin.Companyphone__c;
                
                update Admin;
                
                 MapBoothID.BT_Name__c  =  MapBoothID.BT_Name__c;
                 
                 update MapBoothID;
                
          }
          
          Public Pagereference UpdateBoothadmin1(){
           
                //Admin.Username = Email;
               // Admin.Email = Email;
                Admin.Firstname = Admin.Firstname;
                Admin.LastName = Admin.LastName;
                Admin.companyName = Admin.companyName;
                Admin.Company_website__c = Admin.Company_website__c;
                Admin.CompanyAddr1__c = Admin.CompanyAddr1__c;
                Admin.CompanyAddr2__c = Admin.CompanyAddr2__c;
                Admin.CompanyCity__c = Admin.CompanyCity__c;
                Admin.CompanyCountry__c = Admin.CompanyCountry__c;
                Admin.CompanyState__c = Admin.CompanyState__c;
                Admin.CompanyFaxNumber__c  = Admin.CompanyFaxNumber__c;
                Admin.Companyphone__c = Admin.Companyphone__c;
                
                update Admin;
                
                 MapBoothID.BT_Name__c  =  MapBoothID.BT_Name__c;
                 
                 update MapBoothID;
                 
                 EditExhibitorPopUp = false;
                 
                 getListOfBooths();
                 return null;
                
          }
          
          
          
    public void getBoothdetails()
    {
        system.debug('=========BoothAdminId::::'+BoothAdminId);
        
        returnList = new List<User>();
        
        User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: BoothAdminId];
        
         system.debug('==******************=====::::'+ParticularJuncID);
        
        BoothDetails1 = [Select Id,FirstName,LastName,CompanyName,Email,Company_website__c,CompanyAddr1__c,
                             CompanyAddr2__c,CompanyCity__c,CompanyCountry__c,CompanyState__c,CompanyFaxNumber__c,
                             Companyphone__c from User where Id =:ParticularJuncID.User_Id__c];
                           
                         system.debug('==&&&&&&&&&&&&&&&&&&=====::::'+BoothDetails1 );
         
        
        for(User BooAdm :BoothDetails1 )
        {
            if(BoothAdminId!= null && BoothAdminId!='')
            {
                displayBoothinfoPopUp = true;
                returnList.add(BooAdm);
                break;
            }
            
        }
        
        //return null;
    }
    
    Public void Close(){
    displayBoothinfoPopUp = false;
    }
    
    Public List<Booth__c> OnlyBoothInfo {get;set;}
    Public Booth__c MapBoothID{get;set;}
    
    public void getOnlyBoothdetails()
    {
        system.debug('=========BoothAdminId::::'+BoothAdminId);
        
        MapBoothID = new Booth__c();
        
        User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: BoothAdminId];
        
         system.debug('==******************=====::::'+ParticularJuncID);
        
        OnlyBoothInfo = [Select Id,BT_BoothUserCount__c,BT_ContactEmail__c,BT_ContactName__c,BT_ContactPhone__c,BT_Description__c,BT_isBoothActive__c,
                             BT_Location__c,BT_Name__c,BT_PDFLocation__c,   BT_Phone__c,BT_RegistrationLink__c,
                             BT_WebsiteURL__c from  Booth__c where Id =:ParticularJuncID.BT_id__c];
                           
                         system.debug('==&&&&&&&&&&&&&&&&&&=====::::'+OnlyBoothInfo);
         
        
        for(Booth__c BoothInfo:OnlyBoothInfo )
        {
            if(BoothAdminId!= null && BoothAdminId!='')
            {
                displayBoothDetailsPopUp = true;
                MapBoothID = BoothInfo;
                break;
            }
            
        }
        
        //return null;
    }
   
    Public Void UpdateBooth(){
    
               MapBoothID.BT_BoothUserCount__c   =  MapBoothID.BT_BoothUserCount__c;
               MapBoothID.BT_ContactEmail__c     =  MapBoothID.BT_ContactEmail__c;
               MapBoothID.BT_ContactName__c      =  MapBoothID.BT_ContactName__c;
               MapBoothID.BT_ContactPhone__c     =  MapBoothID.BT_ContactPhone__c;
               MapBoothID.BT_Description__c      =  MapBoothID.BT_Description__c;
               MapBoothID.EV_id__c               =  SelectEvent;
               MapBoothID.BT_isBoothActive__c    =  true;
               MapBoothID.BT_Location__c         =  MapBoothID.BT_Location__c;
               MapBoothID.BT_Name__c             =  MapBoothID.BT_Name__c;
               MapBoothID.BT_Phone__c            =  MapBoothID.BT_Phone__c;
               MapBoothID.BT_RegistrationLink__c =  MapBoothID.BT_RegistrationLink__c;
               MapBoothID.BT_WebsiteURL__c       =  MapBoothID.BT_WebsiteURL__c;
               
               Update MapBoothID;    
        }
   
   Public void CancelUpdateBooth(){
   displayBoothDetailsPopUp = false;
   }
   
    public PageReference Reportsaction() {
        return null;
    }


    public PageReference AttendeesAction() {
        return null;
    }


    public PageReference BoothAction() {
        return null;
    }


    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/BL_Eventadmin_Events');
    pg.setredirect(true);
        return pg;
    }


    public PageReference ProfileSettings() {
        return null;
    }
Public List<User_Profile_Event__c> EventsTree{get;set;}
//Public String LoginUSerId{get;set;}

class CampaignHierarchyLevel {        
        // representing a level in the tree - an ID and a list of child nodes
        User_Profile_Event__c camp;                                                       
        List<CampaignHierarchyLevel> children;                               
        CampaignHierarchyLevel(User_Profile_Event__c c) {                                 
            camp = c;                                                        
            children = new List<CampaignHierarchyLevel>();                   
        }                                                                    
    }                                                                        
    // for communicating with VF we have a sort of vestigial Campaign class  
    public class CampaignLevelInfo {                                         
        // three fields from Campaign, plus a flag to tell us if it's a leaf 
        public ID parentId {get;set;}                                        
        public ID id {get;set;}                                              
        public String name {get;set;}                                        
        public Boolean isLeaf {get;set;}
        Public string BoothName{get;set;}                                     
    }                                                                        
                                                                             
    List<CampaignHierarchyLevel> toplevel_campaigns;  // the top of our data structure
    public BL_Eventadmin_BoothsCon1() { 
    getListOfBoothAdms();
    LoginUserId = UserInfo.getUserId();
    //LoginUserId ='005O0000000ZJas';
     AddCamp = new User_Profile_Event__c();                                                     
        // create a tree structure from the Campaign hierarchy and store it for VF reference
        toplevel_campaigns = new List<CampaignHierarchyLevel>();                            
        // if we fill the campaign tree by repeated SOQL queries (based on ParentId) we exceed the limit very quickly
        // instead let's do a single query for active campaigns, and process the results                             
        // question: would it be better to get all campaigns, and disable selecting the ones that are inactive?      
        // this way we may end up missing active campaigns that are descendants of inactive ones                     
       Map<ID, List<User_Profile_Event__c>> child_campaigns = new Map<ID, List<User_Profile_Event__c>>(); 
         List<User_Profile_Event__c> Child_Booths = new  List<User_Profile_Event__c>();                                  
        for (User_Profile_Event__c c : [select Id,Name,BoothAdmin_id__c,BoothAdmin_id__r.Name,BT_id__c,EV_id__c,EV_id__r.EV_Title__c from  User_Profile_Event__c where User_ID__c =: loginuserId]) {                           
           system.debug('====================== 1111111111 =============='+c);
            if (c.BT_id__c == null) {                                                                                
                toplevel_campaigns.add(new CampaignHierarchyLevel(c)); 
                system.debug('=========@@@@@@@@@@@@==============='+toplevel_campaigns);                                              
            }                                                                                                        
            else { 
                  Child_Booths.add(c);  
                   system.debug('222222222222222222222'+c);                                                                                                  
                // add this campaign to its parent's list of child campaigns                                         
                //  if (!child_campaigns.containsKey(c.BT_id__c)) {   
               //  system.debug('=========&&&&&&&&&&&&&&&&==============='+child_campaigns.containsKey(c.BT_id__c));                                                            
              //      child_campaigns.put(c.BT_id__c , new List<User_Profile_Event__c>());                                           
             //  }                                                                                                    
             //   child_campaigns.get(c.BT_id__c ).add(c);  
                                                                                                                                                                                                 
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        // now all of our campaigns are in one of two places:                                                                                                                                                                                
        // 1) in toplevel_campaigns, if they had no parent, or                                                                                                                                                                               
        // 2) listed as children of the appropriate parent (flat, by parent) in child_campaigns                                                                                                                                              
        // now we turn this into a tree in a depth-first manner                                                                                                                                                                              
        List<CampaignHierarchyLevel> camp_expand_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                               
        while (!camp_expand_stack.isEmpty()) {                                                                                                                                                                                               
            // remove the last one from the end                                                                                                                                                                                              
            CampaignHierarchyLevel chl = camp_expand_stack.remove(camp_expand_stack.size() - 1);
            system.debug('========================== Excuse me =============='+chl);
                                                                                                                                   
           if (child_campaigns.containsKey(chl.camp.Id)) {
            system.debug('======== shruthi========='+child_campaigns.containsKey(chl.camp.Id));                                                                                                                                                                                   
               //  this campaign has children.  Create hierarchy levels for them and push on stack                                                                                                                                           
                for (User_Profile_Event__c cc : child_campaigns.get(chl.camp.Id)) { 
                                                                                                                                                                                       
                    CampaignHierarchyLevel cchl = new CampaignHierarchyLevel(cc);                                                                                                                                                            
                    chl.children.add(cchl);                                                                                                                                                                                                  
                    camp_expand_stack.add(cchl); 
                    system.debug('--------Finding for Childern========='+cchl);                                                                                                                                                                                            
                }                                                                                                                                                                                                                            
           }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        SelectedCampaign = new User_Profile_Event__c();                                                                                                                                                                                                   
    }                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                             
    public List<CampaignLevelInfo> getCampaignTree() {                                                                                                                                                                                       
        List<CampaignLevelInfo> ctree = new List<CampaignLevelInfo>();                                                                                                                                                                       
        // DFS traversal will ensure parent campaigns appear before children in output list                                                                                                                                                  
        List<CampaignHierarchyLevel> camp_lvl_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                                  
        while (!camp_lvl_stack.isEmpty()) {                                                                                                                                                                                                  
            CampaignHierarchyLevel chl = camp_lvl_stack.remove(camp_lvl_stack.size() - 1);                                                                                                                                                   
            CampaignLevelInfo cli = new CampaignLevelInfo();                                                                                                                                                                                 
            // copy Campaign fields and add "isleaf" flag based on child count from tree                                                                                                                                                     
            cli.id = chl.camp.id;
              system.debug('============H111111111111111111111111111111110========'+cli.id);                                                                                                                                                                                                            
            cli.ParentId = chl.camp.BT_id__c; 
            system.debug('============H000000000000000000000========'+cli.ParentId);                                                                                                                                                                                                
            cli.name = chl.camp.EV_id__r.EV_Title__c;
             system.debug('============Hippppppppppppppppp========'+cli.name); 
            cli.BoothName =  chl.camp.BoothAdmin_id__r.name;
            system.debug('============Hurryyyyyyyyyyyyyyyyy========'+cli.BoothName);                                                                                                                                                                                                        
            cli.isLeaf = (chl.children.size() == 0);
            system.debug('============KKKKKKKKUUUUUUUUUUUUU========'+cli.isLeaf);                                                                                                                                                                                         
            ctree.add(cli);                                                                                                                                                                                                                  
            // queue up children for future processing                                                                                                                                                                                       
            for (CampaignHierarchyLevel cchl : chl.children) {                                                                                                                                                                               
                camp_lvl_stack.add(cchl);                                                                                                                                                                                                    
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        return ctree;                                                                                                                                                                                                                        
    }                                                                                                                                                                                                                                        

    public PageReference selectCampaign() {
        // do lookup and set SelectedCampaign based on ID chosen by user
        if (SelectedId != null) {                                       
            SelectedCampaign = [select Id, Name,BT_id__r.Name,BT_id__c from User_Profile_Event__c where Id=:SelectedId limit 1];
            system.debug('=======Very Intresting ==========='+SelectedCampaign );
        }                                                                                             
        return null;                                                                                  
    }                                                                                                 
    public string SelectedId {get;set;}                                                               
    public User_Profile_Event__c SelectedCampaign {get;set;} 
    Public User_Profile_Event__c AddCamp{get;set;}
    Public Boolean OpenPanel{get;set;} 
    Public void OpenCampaign(){
        OpenPanel = true;
        } 
        Public Pagereference SaveCampaign(){      
//        AddCamp.IsActive = True;
       // AddCamp.Name = AddCamp.Name;
     //   AddCamp.ExpectedRevenue = AddCamp.ExpectedRevenue;
      //  insert AddCamp;
        Pagereference Pg = new Pagereference('/apex/sampleextjstreeview');
        pg.setredirect(true);
        return pg;
        } 
        
        class BoothAdminInnerDisplay{
        Public String Status{get;set;}
        Public User_Profile_Event__c BoothStatus{get;set;}
        Public BoothAdminInnerDisplay(User_Profile_Event__c BoothStatus1,string BoothSta){
        this.BoothStatus = BoothStatus1;
        this.Status = BoothSta; 
         system.debug('================ Checking how it works ========='+this.BoothStatus);       
        }
       
       /** if(BoothStatus.BT_id__r.BT_isBoothActive__c == True){
        this.Status = 'Active';
        }else
        {
        this.Status = 'InActive';
        }       
    }  */       
 }
        
      
}