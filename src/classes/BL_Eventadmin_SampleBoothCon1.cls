public without sharing class BL_Eventadmin_SampleBoothCon1 {

  Public Boolean Button{get;set;}
  public boolean error{get;set;} 
  public List<User_Profile_Event__c> listOfBoothadminsforExport{get;set;}  
  public Boolean ShowEventName{get;set;}
  public String SelectedEventName{get;set;}
  public String selectedBoothName{get;set;}
  
  public void CommonMethod(){
  ListOfbooths1();
  ListOfBoothAdmins();
   try{
  system.debug(' ---------------- '+selectevent);
  Event__c ForEventName = [select EV_Title__c from Event__c where id=:selectevent];
  SelectedEventName = 'of '+ForEventName.EV_Title__c;
  system.debug(' ------ !!!!!!!!!!!!!! -----'+SelectedEventName );
    }catch(exception ex  ){}
 }
  
   public pageReference importBooths(){
    DisplayNoEventMessage = False;
    pageReference pg = new pageReference ('/apex/BL_boothadmin_import?id='+selectEvent);
    pg.setRedirect(true);
    return pg;
   }
   
  public PageReference exportBoothadmins() { 
    
    system.debug('11111111111111111111111 '+SelectBooth);
    listOfBoothadminsforExport = new List<User_Profile_Event__c>();
    
    if(SelectBooth == null ){
    system.debug(' -------------------------------------- ***********************'+selectevent);
    listOfBoothadminsforExport = [select BT_id__r.BT_Name__c,BT_id__r.BT_Location__c,
                                  EV_id__r.EV_Title__c,BoothAdmin_id__r.Email,BoothAdmin_id__r.Name,
                                  BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Companyphone__c,
                                  BoothAdmin_id__r.CompanyAddr1__c,BoothAdmin_id__r.CompanyAddr2__c,
                                  BoothAdmin_id__r.CompanyCity__c,BoothAdmin_id__r.States__c,
                                  BoothAdmin_id__r.Country__c,BoothAdmin_id__r.CompanyFaxNumber__c,
                                  BoothAdmin_id__r.Company_website__c,BoothAdmin_id__r.Zipcode__c,
                                  BoothAdmin_id__r.PoBox__c from  User_Profile_Event__c where EV_id__c=:selectEvent and Profile_id__r.PR_Name__c='BoothAdmin'];
    system.debug(' ---- $$$$$$$$$$$$$$ ---'+listOfBoothadminsforExport );
    
    }
     else{
     system.debug(' ------ ******************** -----------');
     listOfBoothadminsforExport = [select BT_id__r.BT_Name__c,BT_id__r.BT_Location__c,EV_id__r.EV_Title__c,BoothAdmin_id__r.Email,BoothAdmin_id__r.Name,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Companyphone__c,BoothAdmin_id__r.CompanyAddr1__c,BoothAdmin_id__r.CompanyAddr2__c,BoothAdmin_id__r.CompanyCity__c,BoothAdmin_id__r.States__c,BoothAdmin_id__r.Country__c,BoothAdmin_id__r.CompanyFaxNumber__c,BoothAdmin_id__r.Company_website__c,BoothAdmin_id__r.Zipcode__c,BoothAdmin_id__r.PoBox__c from  User_Profile_Event__c where EV_id__c=:selectEvent and Profile_id__r.PR_Name__c='BoothAdmin' and BT_id__c=:SelectBooth];
     system.debug(' ------ ******************** -----------'+listOfBoothadminsforExport );
    
    }
    
    for(User_Profile_Event__c b:listOfBoothadminsforExport ){
   
    b.BoothAdmin_id__r.Country__c =escape(b.BoothAdmin_id__r.Country__c);
    b.BoothAdmin_id__r.States__c =escape(b.BoothAdmin_id__r.states__c); 
    b.BT_id__r.BT_Name__c=escape(b.BT_id__r.BT_Name__c);
    b.BT_id__r.BT_Location__c=escape(b.BT_id__r.BT_Location__c);
    b.EV_id__r.EV_Title__c=escape(b.EV_id__r.EV_Title__c);
     system.debug('44444444444444444444444444 '+b.BoothAdmin_id__r.CompanyAddr1__c);
      b.BoothAdmin_id__r.CompanyAddr1__c =escape(b.BoothAdmin_id__r.CompanyAddr1__c );
    b.BoothAdmin_id__r.CompanyAddr2__c =escape(b.BoothAdmin_id__r.CompanyAddr2__c );
    b.BoothAdmin_id__r.CompanyName=escape(b.BoothAdmin_id__r.CompanyName); 
    if(b.BoothAdmin_id__r.Zipcode__c!=null){
   if(b.BoothAdmin_id__r.Zipcode__c.length()==5 && b.BoothAdmin_id__r.Zipcode__c.startsWith('0')){
                   string HomeZip =b.BoothAdmin_id__r.Zipcode__c;
                   b.BoothAdmin_id__r.Zipcode__c='';
                   b.BoothAdmin_id__r.Zipcode__c ='"=TEXT('+HomeZip+','+'\""00000\"")"';
                  }
    
    }
    
    if(b.BoothAdmin_id__r.PoBox__c !=null){
   if(b.BoothAdmin_id__r.PoBox__c .length()==5 && b.BoothAdmin_id__r.PoBox__c .startsWith('0')){
                   string HomeZip1 =b.BoothAdmin_id__r.PoBox__c ;
                   b.BoothAdmin_id__r.PoBox__c ='';
                   b.BoothAdmin_id__r.PoBox__c ='"=TEXT('+HomeZip1+','+'\""00000\"")"';
                  }
    
    }
    
    
 }  
    if(listOfBoothadminsforExport.size() > 0){
    PageReference pageRef= new PageReference('/apex/BL_Eventadmin_exportBoothAdmins1');
    pageRef.setredirect(false);
    return pageRef;
    }else {
    
    DisplayNoEventMessage = True;
    
    }
    return null;
    }

 
    
//------------------- CONSTRUCTOR ---------------
    Public BL_Eventadmin_SampleBoothCon1(){
    DisplayNoEventMessage=false;
    system.debug('====================constructor=======================');
    LoginUserId = Userinfo.getuserId();
   
    
    system.debug('-------------'+LoginUserId );    
    //Button = true;// ---------------------- COMMENTED BY SHRUTHI
    ShowButton  = false;
    ListOfEvents1();
    String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); //gets the browser name
    if(browserType != null && browserType.contains('MSIE')){
    Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
    }
    ShowEventName = False;        
    
    }      
//----------------- Variable Declaration -------------
    Public String SelectEvent{get;set;}
    Public String SelectBooth{get;set;}    
    Public String LoginUserID{get;set;}
    Public String DisplayNoEvent{get;set;}   
    Public String DisplayNoBooth {get;set;}
    Public String BoothAdminId{get;set;}
    Public String Email{get;set;}
    Public String SelectedCountry{get;set;}
    Public String Selectedstates{get;set;}
    Public List<User_Profile_Event__c> E{get;set;}
    Public List<User_Profile_Event__c> User_Profile_Event{get;set;}
    Public List<User> BoothAdmininfo {get;set;}
    Public List<Booth__c> OnlyBoothInfo{get;set;}
    Public Booth__c Booth{get;set;}
    Public Booth__c MapBoothID{get;set;}
    Public Contact Con{get;set;}
    Public User Admin {get;set;}
    Public User BoothAdminUser{get;set;}       
    Public Boolean CreatBoothAdminPopUp{get;set;} 
    Public Boolean EditExhibitorPopUp{get;set;}  
    Public Boolean DisplayNoEventMessage{get;set;}
    Public Boolean DisplayNoBoothMessage{get;set;}  
    Public Boolean displayBoothinfoPopUp{get;set;}
    Public Boolean ExchangeButton {get;set;}
    Public Boolean ShowButton {get;set;}
    Public Boolean AddingAdmintoBooth {get;set;} 
    Public string Country{get;set;}
    Public string Adminstates{get;set;}
//-------------- Select Options for Countries,States,Status of Booth --------- 
    Public List<selectOption> getStatuslist(){
    DisplayNoEventMessage = false;
    List<selectoption> Options = new List<selectoption>();
    options.add(new selectoption('Active','Active'));
    options.add(new selectoption('InActive','InActive'));
    return options;
    }   
//---------------- Select Events ------------- 
   public List<selectoption> eventslistforselect {get;set;}
   Public void ListOfEvents1(){
    
     
    
     eventslistforselect = new List<selectoption>();
    try{
    List<User_Profile_Event__c> EventsList = [select Id,EV_id__c,EV_id__r.EV_Title__c from User_Profile_Event__c 
                                where EventAdmin_Id__c =: LoginUserId AND Profile_id__r.PR_Name__c ='EventAdmin' 
                                  ]; 
   eventslistforselect.add(new Selectoption('--Choose Event--','--Choose Event--'));
   
    for(User_Profile_Event__c UserPEvent: EventsList){
    eventslistforselect.add(new Selectoption(UserPEvent.EV_id__c,UserPEvent.EV_id__r.EV_Title__c)); 
    
    }    
  }catch (Exception e){ } 
  //ListOfbooths1();
 // ListOfBoothAdmins();
  system.debug('::::::::::::::::::::::::::::::SelectEvent:::::::::::::;'+SelectEvent);
   system.debug('::::::::::::::::::::::::::::::SelectEvent:::::::::::::;'+Selectbooth); 
   }
// ------------ Select Booth According to Event ------------
    
//--------------- Select Booths ----------------
Public List<Id> BoothIds{get;set;}
 public List<selectoption> boothslistforselect {get;set;}
 Public List<User_Profile_Event__c>  BoothsList{get;set;}
 Public  List<Booth__c> B{get;set;}
 
 public Boolean ImportButton{get;set;}
 
   Public void ListOfbooths1(){
   
   DisplayNoEventMessage = False;
   system.debug(' -------- @@@@@@@ --------'+selectEvent+'------ ****** ------'+selectBooth);
    
    if(selectEvent == '--Choose Event--'){
      ShowButton = False;
      displayBoothExport = False;
      Button = False;
      ImportButton = False;
      SelectedEventName = '';
      SelectedBoothName = '';
    }
    if(selectEvent != '--Choose Event--' &&  selectEvent != null) {
     displayBoothExport = True;
     Button = true;
     ImportButton = true;
     ShowButton = False;
     
    
    }
    if(selectEvent != null && selectBooth != null){
    displayBoothExport = True;
     Button = False;
     ImportButton = False;
     ShowButton = True;
    
    }
    if(selectEvent == '--Choose Event--' && selectBooth != null){
    displayBoothExport = false;
     Button = False;
     ImportButton = False;
     ShowButton = false;
     SelectedEventName = '';
      SelectedBoothName = '';
    }
   
   try{
   
   
   system.debug('------------------ ********'+ShowEventName );
   
   
   system.debug('------------------ @@@@@@@@@@@@'+SelectedEventName );
   
   BoothsList  = new List<User_Profile_Event__c> ();
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
      

  
 // ListOfBoothAdmins();
 } catch (Exception e){} 
  system.debug('::::::::::::::::::::::::::::::SelectEvent:::::::::::::;'+SelectEvent);
  system.debug('::::::::::::::::::::::::::::::SelectEvent:::::::::::::;'+Selectbooth); 
     
   }
 
//------------------ Getting List of Booth Admins ------------
    Public List<BoothAdminInnerDisplay> InnerAdminClass{get;set;}
    Public String Bstatus{get;set;}
    public boolean displayBoothExport{get;set;}
    
    
    Public void  ListOfBoothAdmins(){
    DisplayNoEventMessage = False;
    try{
    String SelectBoothId = ApexPages.currentpage().getparameters().get('BoothName');
    SelectBooth = SelectBoothId ;
    ShowEventName = True;
    InnerAdminClass = new List<BoothAdminInnerDisplay>();
    
   InnerAdminClass = new List<BoothAdminInnerDisplay>();
    system.debug('=============================================='+selectbooth);
        //User_Profile_Event = new List<User_Profile_Event__c>();
        
    if(selectbooth == null && selectEvent != null || selectbooth == null && selectEvent != '--Choose Event--'){
        User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    }else if(selectbooth != null && selectEvent != null){
    ShowButton = true;
    Button = False;
    ImportButton = False; 
    User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent AND BT_ID__c =: SelectBooth 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
   } 
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
       for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
          EventBoothAdm.BoothAdmin_id__r.FirstName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.FirstName);
          EventBoothAdm.BoothAdmin_id__r.LastName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.LastName);
          EventBoothAdm.BoothAdmin_id__r.CompanyName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.CompanyName);
          EventBoothAdm.BT_id__r.BT_Name__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Name__c);
          EventBoothAdm.BT_id__r.BT_Location__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Location__c);
          
          system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
          
        if(EventBoothAdm.UEP_isActive__c == True){
        BStatus = 'Active';
        }else
        {
        BStatus = 'InActive';
        }
        
         InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm,BStatus));
  }
      Booth__c BoothName = [select BT_Name__c from Booth__c where id=: SelectBooth ];
    system.debug(' ------- !!!!!!!!!! @@@@@@@@@@@@-----'+BoothName);
    SelectedeventName = ''; 
    SelectedBoothName = 'of '+BoothName.BT_Name__c;
     system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+selectbooth );
  }     
   
    
    
    catch(Exception ex){
    
    }  
    
   } 
   //--------------------------------------------------
    
    
    public string SelectBoothName {get;set;}
    public Map<string,string> Booth_Name {get;set;}
    
// ----------------- Add Booth Admin --------------
    Public void AddBooth(){
    DisplayNoEventMessage = False;
    CreatBoothAdminPopUp = True;
     Con = New Contact();
     Booth = new Booth__c();
     BoothAdminUser = new User();
     
       Email = '';
      }
      
      Public pageReference AddBoothAdmin(){
      system.debug('++++++++++++++++++++++++++');
       email='';
       errormessage='';
       
        AddingAdmintoBooth = True;
        DisplayNoEventMessage = False;
        con = new Contact();
        BoothAdminUser = new User();  
        //showButton =true;   
         
      return null;
  }

//------------------ Inner Class --------------
    class BoothAdminInnerDisplay{
    Public String Status{get;set;}
    Public User_Profile_Event__c BoothStatus{get;set;}
    Public BoothAdminInnerDisplay(User_Profile_Event__c BoothStatus1,string BoothSta){
    this.BoothStatus = BoothStatus1;
    this.Status = BoothSta; 
     system.debug('================ Checking how it works ========='+this.BoothStatus);       
    }              
   }
    
//------------------ Saving status ------------
    Public String[] statusValue {get;set;}
    Public String SelectStatus{get;set;}
    Public User_Profile_Event__c ForUpdatingBoothstatus{get;set;}
    Public Boolean Statuspopup{get;set;}
    Public User_Profile_Event__c ParticularJuncID{get;set;}
        Public User_Profile_Event__c Admin2{get;set;}
        public void SaveStatus(){
        system.debug(' ------ SelectStatus -----'+SelectStatus );
        if(SelectStatus == 'Active'){
        ForUpdatingBoothstatus.UEP_isActive__c = true;
        ForUpdatingBoothstatus.Status__c = 'Active'; 
        Booth__c Mbooth = [select id,BT_isBoothActive__c FROM Booth__c WHERE id =: ForUpdatingBoothstatus.BT_id__c ];
        
        system.debug('--------Whether Booth is Selected or not ---------'+Mbooth);
        
        Mbooth.BT_isBoothActive__c = TRUE;
        
        
        update Mbooth;
                
        }else if(SelectStatus == 'InActive'){
        ForUpdatingBoothstatus.UEP_isActive__c = false;
        ForUpdatingBoothstatus.Status__c ='InActive'; 
         
         
       List<User_Profile_Event__c>  ForBoothStatus = [Select id,BT_id__r.BT_isBoothActive__c,
                                                      UEP_isActive__c,EV_ID__c,BT_id__c,User_Id__c 
                                                      from User_Profile_Event__c where BT_id__c =:ForUpdatingBoothstatus.BT_id__c AND UEP_isActive__c = true];
                                                     
                                                      system.debug('==========::::::: For generating status for Booth :::::::========'+ForBoothStatus );
        system.debug('----Getting the Size of List------'+ForBoothStatus.size());
        if(ForBoothStatus.size() > 0){
        
        Booth__c Mbooth1 = [select id,BT_isBoothActive__c FROM Booth__c WHERE id =: ForUpdatingBoothstatus.BT_id__c ];
        system.debug('--------Whether Booth is Selected or not ---------'+Mbooth1);
        Mbooth1.BT_isBoothActive__c = TRUE;
        
        update Mbooth1;        
        }
        else {
        Booth__c Mbooth2 = [select id,BT_isBoothActive__c FROM Booth__c WHERE id =: ForUpdatingBoothstatus.BT_id__c ];
        
        Mbooth2.BT_isBoothActive__c = false;
        
        update Mbooth2; 
        
        }        
    }
         update ForUpdatingBoothstatus ;
         
         system.debug(' ---------------- !!!!!!!!!!!!!!! -----------'+ForUpdatingBoothstatus );
                    
         ListOfBoothAdmins();           
         Statuspopup= false;
    }
    
    Public void Cancelstatus(){
    Statuspopup= false;
    }
//------------------ Saving Booth Admin ------------
   public string errormessage{get;set;}
    Public Void SaveBooth(){
   
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
                 errormessage='Email ID is already registered as Booth Admin for this Event';
               }
               else{
               
               
                Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
                User ForU = [select FirstName,LastName,id from User where Username =:Email ];
                
                ForU.FirstName = BoothAdminUser.FirstName;
                ForU.LastName  = BoothAdminUser.LastName;
                ForU.companyName = BoothAdminUser.companyName;
                ForU.Company_website__c = BoothAdminUser.Company_website__c;
                ForU.CompanyAddr1__c = BoothAdminUser.CompanyAddr1__c;
                ForU.CompanyAddr2__c = BoothAdminUser.CompanyAddr2__c;
                ForU.CompanyCity__c = BoothAdminUser.CompanyCity__c;
               // if(SelectedCountry != '--None--')
                ForU.Country__c = BoothAdminUser.Country__c;
                //if(Selectedstates != '--None--')
                ForU.States__c =  BoothAdminUser.States__c;
                ForU.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                ForU.Companyphone__c = BoothAdminUser.Companyphone__c;
                Update ForU; 
                
                User_Profile_Event__c GettingPRID = [Select Id,BLP_id__c from User_Profile_Event__c Where Ev_Id__c=: SelectEvent AND User_Id__c =: LoginUserID AND EventAdmin_Id__c =: LoginUserID ];   
               
                
               
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();                
                UserBoothAdminProfile.BLP_id__c = GettingPRID.BLP_id__c;
                UserBoothAdminProfile.BoothAdmin_id__c =ForU.id;
                UserBoothAdminProfile.BT_id__c  = Booth.id;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Status__c='Active';
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = ForU.id;
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
                     mail.setSubject('Welcome to '+'"'+EmailEventName +'"'+' Event - Your registration was successful');
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
              
              String EmailContent = 'We are working with BoothLeads to help you with your event '+ ee.EV_Title__c +'. All badges will now have a QR code specific to your name and company. You will be able to scan the QR code on-site, make notes about that individual and follow up with them.'+'\n\n'+'You have been added to the BoothLeads database for '+ ee.EV_Title__c +'\n\n\n'+'Now what?'
                               +'\n\n\n'+'•   Go to  http://www.boothleads.com to login into your Booth Admin Portal as well as your mobile app.USERNAME AND PASSWORD ARE PROVIDED AT THE BOTTOM OF THIS EMAIL.'                              
                               +'\n\n\n'+'•   Here are some youtube videos to give you an idea of what will happen:'+'\n\n'+'    o   What is a QR code: http://www.youtube.com/watch?v=b8EpazIwFys'+'\n\n'+'    o   How to generate a QR code so that attendees can view your brochures or '+'\n'+'        flyers: http://www.youtube.com/watch?v=jcg2qbS_TaM&feature=youtu.be'
                               +'\n\n\n'+'•   Next step….Download the appropriate app to your phone either from Google'+'\n'+'Play Store or AppStore or BlackBerry World.'
                               +'\n\n\n\n'+'        Then you are ready to scan the badges on-site!'+'\n\n'+'        Please note that your Booth Leads portal access is valid only for 30 days from the end of your event'
                               +'\n\n'+ '        We will be available on-site at the show (across from the registration desk) to assist you throughout the event.'+'\n\n'+'        If you need assistance before that time, contact us at support@boothleads.com.'+'\n\n\n'+'        Thank you!'+'\n'+'        BoothLeads Customer Support'+'\n'+'        Phone: 1-(800)-492-1289'  ;
                   
                   String EmailSubject = 'Booth Leads and '+ee.EV_Title__c;
                   
                                 
               
               Con.LastName = BoothAdminUser.LastName;
               Con.FirstName = BoothAdminUser.FirstName;
             //Con.AccountId = '001F000000qdOJp';  // Developement Account Id
                 Con.AccountId = '001O0000007AN41';     
              Con.Email_Notes__c = EmailContent;
            //  Con.HTML_Email__c = HTMLEmailContent ;
                  con.Email_Subject__c = EmailSubject;
               insert Con ;
               
               system.debug('=====::::::::: Inserting Contact :::::::======='+Con);
             
               
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
                 Database.DMLOptions dmo = new Database.DMLOptions();
                 dmo.EmailHeader.triggerUserEmail = true;
                 BoothAdminUser.setOptions(dmo); 
                 update BoothAdminUser;
                 
                   
               
               
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
                system.debug('-------:::::::: Inserting Event,Booth,Boothadmin into the CommonTable ::::::------'+UserBoothAdminProfile);       
      }    
               
    
    CommonMethod(); 
   
}catch(Exception e){
   ApexPages.addMessages(e);
   DataBase.rollBack(sp);
    }   
  
    
    }
    
    Public Void CancelBooth(){
    String browserType = Apexpages.currentPage().getHeaders().get('USER-AGENT'); //gets the browser name
    if(browserType != null && browserType.contains('MSIE')){
    Apexpages.currentPage().getHeaders().put('X-UA-Compatible', 'IE=9');
    }    
    CreatBoothAdminPopUp = FaLSE;
    }
   
// ---------------------------- Create Multiple Booth Admins to Single Booth --------------------------
                Public Pagereference SaveOnlyBA(){
                
 
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
               errormessage='Email ID is already registered as Booth Admin for this Event';
               }
               else{       
               Profile__c CustomProfile = [select Id,PR_Name__c,PR_Version__c from Profile__c where PR_Name__c='BoothAdmin'];
                
               User ForU = [select FirstName,LastName,id from User where Username =:Email ];
                
                 ForU.FirstName = BoothAdminUser.FirstName;
                ForU.LastName  = BoothAdminUser.LastName;
                ForU.companyName = BoothAdminUser.companyName;
                ForU.Company_website__c = BoothAdminUser.Company_website__c;
                ForU.CompanyAddr1__c = BoothAdminUser.CompanyAddr1__c;
                ForU.CompanyAddr2__c = BoothAdminUser.CompanyAddr2__c;
                ForU.CompanyCity__c = BoothAdminUser.CompanyCity__c;
               // if(SelectedCountry != '--None--')
                ForU.Country__c = BoothAdminUser.Country__c;
                //if(Selectedstates != '--None--')
                ForU.States__c =  BoothAdminUser.States__c;
                ForU.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                ForU.Companyphone__c = BoothAdminUser.Companyphone__c;
                Update ForU;  
                
                
                
                User_Profile_Event__c UserBoothAdminProfile = new User_Profile_Event__c();
                UserBoothAdminProfile.BoothAdmin_id__c = ForU.id;
                UserBoothAdminProfile.BT_id__c  = SelectBooth;
                UserBoothAdminProfile.EV_id__c = SelectEvent;
                UserBoothAdminProfile.EventAdmin_Id__c = LoginUserId;
                UserBoothAdminProfile.UEP_isActive__c = True;
                UserBoothAdminProfile.Profile_id__c = CustomProfile.Id;
                UserBoothAdminProfile.User_id__c = ForU.id;
                
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
                     mail.setSubject('Welcome to '+'"'+EmailEventName +'"'+' Event - Your registration was successful');
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
              String EmailContent = 'We are working with BoothLeads to help you with your event '+ ee.EV_Title__c +'. All badges will now have a QR code specific to your name and company. You will be able to scan the QR code on-site, make notes about that individual and follow up with them.'+'\n\n'+'You have been added to the BoothLeads database for '+ ee.EV_Title__c +'\n\n\n'+'Now what?'
                               +'\n\n\n'+'•   Go to  http://www.boothleads.com to login into your Booth Admin Portal as well as your mobile app.USERNAME AND PASSWORD ARE PROVIDED AT THE BOTTOM OF THIS EMAIL.'                              
                               +'\n\n\n'+'•   Here are some youtube videos to give you an idea of what will happen:'+'\n\n'+'    o   What is a QR code: http://www.youtube.com/watch?v=b8EpazIwFys'+'\n\n'+'    o   How to generate a QR code so that attendees can view your brochures or '+'\n'+'        flyers: http://www.youtube.com/watch?v=jcg2qbS_TaM&feature=youtu.be'
                               +'\n\n\n'+'•   Next step….Download the appropriate app to your phone either from Google'+'\n'+'Play Store or AppStore or BlackBerry World.'
                               +'\n\n\n\n'+'        Then you are ready to scan the badges on-site!'+'\n\n'+'        Please note that your Booth Leads portal access is valid only for 30 days from the end of your event'
                               +'\n\n'+ '        We will be available on-site at the show (across from the registration desk) to assist you throughout the event.'+'\n\n'+'        If you need assistance before that time, contact us at support@boothleads.com.'+'\n\n\n'+'        Thank you!'+'\n'+'        BoothLeads Customer Support'+'\n'+'        Phone: 1-(800)-492-1289'  ;
                       
               String EmailSubject = 'Booth Leads and '+ee.EV_Title__c;
               
               Con.LastName = BoothAdminUser.LastName;
               Con.FirstName = BoothAdminUser.FirstName;
               //Con.AccountId = '001F000000qdOJp'; 
                  Con.AccountId = '001O0000007AN41';  // Developement Account Id1111111             
               Con.Email_Notes__c = EmailContent;
               Con.Email_Subject__c = EmailSubject;
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
                BoothAdminUser.Country__c = BoothAdminUser.Country__c;                
                BoothAdminUser.States__c = BoothAdminUser.States__c;
                BoothAdminUser.CompanyFaxNumber__c  = BoothAdminUser.CompanyFaxNumber__c;
                BoothAdminUser.Companyphone__c = BoothAdminUser.Companyphone__c;
                BoothAdminUser.Zipcode__c = BoothAdminUser.Zipcode__c;
                BoothAdminUser.PoBox__c = BoothAdminUser.PoBox__c;
                
               
                
               insert BoothAdminUser;
                
               system.debug('-------------- ******************** ----------------'+BoothAdminUser.id);
                System.ResetPasswordResult rt= system.ResetPassword(BoothAdminUser.id,true);
                system.debug('45454545454545454545454   '+rt);
                BoothAdminUser.password__c = rt.getPassword();
               
           
               
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
               selectBooth = UserBoothAdminProfile.BT_id__c;
           }     
           InnerAdminClass = new List<BoothAdminInnerDisplay>();
           system.debug(' -------- @@@@ -----selectBooth = UserBoothAdminProfile.BT_id__c.id' +selectBooth );    
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
        BStatus = 'Active';
        }else
        {
        BStatus = 'InActive';
        }
        
         InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm,BStatus));
  }
  

   }catch(Exception e){
   ApexPages.addMessages(e);
    }
   }   
       return null;  
}   
    public void forattendee(){
    system.debug('++++++++++++++++++++++++++++++'+BoothAdminUser.Firstname);
    string unique =  Email.tolowercase();
            system.debug('++++++++++++++++++++++++++++++'+unique );     
                List<AttendeeSummary__c> AttendeeDetails = [select  id  from AttendeeSummary__c Where AS_Email__c =: unique ];
                
                
                
                
                system.debug(' ===== Alredy Existed Attendee Email Id ===='+AttendeeDetails);
                
                if(AttendeeDetails.size() > 0){
                AttendeeSummary__c UpdatingAttendee = [select id,AS_FirstName__c,AS_LastName__c from AttendeeSummary__c where id=:AttendeeDetails[0].id];
                
                UpdatingAttendee.AS_FirstName__c = BoothAdminUser.FirstName; 
                UpdatingAttendee.AS_LastName__c = BoothAdminUser.LastName;
                UpdatingAttendee.AS_Company__c  = BoothAdminUser.CompanyName;
                UpdatingAttendee.AS_CellPhone__c  = BoothAdminUser.Companyphone__c;
                UpdatingAttendee.AS_uniqueField__c=(BoothAdminUser.FirstName+BoothAdminUser.LastName+Email).tolowercase();

                Update UpdatingAttendee;
                
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
                       AttendeeSummary.AS_Company__c  = BoothAdminUser.CompanyName;
                       AttendeeSummary.AS_CellPhone__c  = BoothAdminUser.Companyphone__c;
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
//----------------------------- Editing Booth Information -----------------
    
     public void EditBoothAdmin()
        {
            system.debug('=========BoothAdminId::::'+BoothAdminId);
         
            User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c,isFirstBoothAdmin__c  from User_Profile_Event__c where id =: BoothAdminId];
            
            system.debug('=======::::::::::: Mapping Junction EventID :::::::::::========='+ParticularJuncID);           
            
            BoothAdmininfo = [Select Id,FirstName,LastName,CompanyName,Email,Company_website__c,CompanyAddr1__c,
                             CompanyAddr2__c,CompanyCity__c,CompanyCountry__c,CompanyState__c,CompanyFaxNumber__c,Country__c,States__c,
                             Companyphone__c,Zipcode__c,PoBox__c from User where Id =:ParticularJuncID.User_Id__c];
                             
             OnlyBoothInfo = [Select Id,BT_BoothUserCount__c,BT_ContactEmail__c,BT_ContactName__c,BT_ContactPhone__c,BT_Description__c,BT_isBoothActive__c,
                             BT_Location__c,BT_Name__c,BT_PDFLocation__c,BT_Phone__c,BT_RegistrationLink__c,
                             BT_WebsiteURL__c from  Booth__c where Id =:ParticularJuncID.BT_id__c];
             
             
            system.debug('============ Booth For Edit ======'+OnlyBoothInfo );                 
            
            Admin = new User();
            
            system.debug('------:::::::::: For Editing Particular Event Record :::::::::::-------'+BoothAdmininfo ); 
            
            for(User Admin1 :BoothAdmininfo)
            {
                for(Booth__c BoothInfo:OnlyBoothInfo )
                {
                if(BoothAdminId!= null )
                {
                    
                   system.debug('-------+++++++++++-----------'+Admin1.Id );         
                    Admin = Admin1;
                    MapBoothID = BoothInfo;                    
                    EditExhibitorPopUp = True;
                    break;
                    
                    
                }
             }  
          }
    }
//--------------------- Update Booth Admin info --------------------------
    Public  Void  UpdateBoothAdmin(){
    try{
    User_Profile_Event__c ParticularJuncID = [select isFirstBoothAdmin__c  from User_Profile_Event__c where id =: BoothAdminId];
    system.debug('=================================='+ParticularJuncID.isFirstBoothAdmin__c);
     system.debug('------------Admin.Email------------------'+Admin.Email );
   
    AttendeeSummary__c AttendeeEdit = [select AS_FirstName__c,AS_LastName__c,id from AttendeeSummary__c  where AS_Email__c =: Admin.Email];
    system.debug('------------------------------'+AttendeeEdit );
    
    AttendeeEdit.AS_FirstName__c = Admin.Firstname;
    AttendeeEdit.AS_LastName__c = Admin.LastName;

    Update AttendeeEdit;
    
    system.debug('YYYYYYYYYYYYYYYYYYYYYY ZZZZZZZZZZZZZZ'+AttendeeEdit.AS_FirstName__c);
    Admin.Firstname = AttendeeEdit.AS_FirstName__c;
    Admin.LastName = AttendeeEdit.AS_LastName__c;
    
    Admin.companyName = Admin.companyName;
    Admin.Company_website__c = Admin.Company_website__c;
    Admin.CompanyAddr1__c = Admin.CompanyAddr1__c;
    Admin.CompanyAddr2__c = Admin.CompanyAddr2__c;
    Admin.CompanyCity__c = Admin.CompanyCity__c;
   // if(SelectedCountry != '--None--')
    Admin.Country__c = Admin.Country__c;
    //if(Selectedstates != '--None--')
    Admin.States__c =  Admin.States__c;
    Admin.CompanyFaxNumber__c  = Admin.CompanyFaxNumber__c;
    Admin.Companyphone__c = Admin.Companyphone__c;
    
    update Admin;
    
    
    if(ParticularJuncID.isFirstBoothAdmin__c == true){
    system.debug('=================');
    MapBoothID.BT_Location__c         =  MapBoothID.BT_Location__c;
    MapBoothID.BT_Name__c             =  MapBoothID.BT_Name__c;
    MapBoothID.BT_ContactName__c            =    Admin.Firstname + Admin.LastName;
    MapBoothID.BT_ContactPhone__c    =      Admin.Companyphone__c;
    MapBoothID.BT_WebsiteURL__c      =    Admin.Company_website__c;
    
    Update MapBoothID;
    system.debug('=============ID========'+MapBoothID.id);
    }else{
    MapBoothID.BT_Location__c         =  MapBoothID.BT_Location__c;
    MapBoothID.BT_Name__c             =  MapBoothID.BT_Name__c;
    
    Update MapBoothID; 
    }
     
    // selectBooth = MapBoothID.Id; 
     InnerAdminClass = new List<BoothAdminInnerDisplay>();
           system.debug(' -------- @@@@ -----selectBooth = UserBoothAdminProfile.BT_id__c.id' +selectBooth );  
           if(selectBooth == null){  
           User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   }
   else {
        User_Profile_Event = [Select UEP_isActive__c,Name,Id,BT_id__r.BT_Name__c,BoothAdmin_id__r.FirstName,
                              BoothAdmin_id__r.LastName,BT_id__r.BT_isBoothActive__c,BT_id__r.BT_Location__c,
                              BoothAdmin_id__r.Username,BoothAdmin_id__r.CompanyName,BoothAdmin_id__r.Email,BoothAdmin_id__r.Companyphone__c,
                              BoothAdmin_id__r.LastLoginDate from User_Profile_Event__c 
                              where EventAdmin_Id__c=: LoginUserId AND EV_id__c =:SelectEvent AND BT_ID__c =: SelectBooth 
                              AND Profile_id__r.PR_Name__c ='BoothAdmin'];
    
        system.debug(':::::::::: -------- Getting List of BoothAdmins --------::::::::'+User_Profile_Event);
   
   }
       for(User_Profile_Event__c EventBoothAdm : User_Profile_Event){
        
          EventBoothAdm.BoothAdmin_id__r.FirstName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.FirstName);
          EventBoothAdm.BoothAdmin_id__r.LastName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.LastName);
          EventBoothAdm.BoothAdmin_id__r.CompanyName = escapeSpecialCharacters(EventBoothAdm.BoothAdmin_id__r.CompanyName);
          EventBoothAdm.BT_id__r.BT_Name__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Name__c);
          EventBoothAdm.BT_id__r.BT_Location__c = escapeSpecialCharacters(EventBoothAdm.BT_id__r.BT_Location__c);
          
          system.debug('================= Hello:==============='+EventBoothAdm.BT_id__r.BT_isBoothActive__c);
          
        if(EventBoothAdm.UEP_isActive__c == True){
        BStatus = 'Active';
        }else
        {
        BStatus = 'InActive';
        }
        
         InnerAdminClass.add(new BoothAdminInnerDisplay(EventBoothAdm,BStatus));
  }
   
  ListOfbooths1();
  exportBoothadmins();
   // ListOfBoothAdmins();
    
    EditExhibitorPopUp = false;
   }catch (Exception e){} 
    
    
   }  
    Public void CancelBA(){
    AddingAdmintoBooth = False;
    EditExhibitorPopUp = FALSE;
    
    }
    public map<string,string> states{get;set;} 
    public map<string,string> countries{get;set;}
    
    public void StatesCountry(){
        states=new map<string,string>();
        states.put('None','None');
        states.put('Alabama','AL');
        states.put('Alaska', 'AK');
        states.put('Arizona','AZ');
        states.put('Arkansas','AR');
        states.put('California','CA');
        states.put('Colorado','CO');
        states.put('Connecticut','CT');
        states.put('Delaware','DE');
        states.put('District of Columbia','DC');
        states.put('Florida','FL');
        states.put('Georgia','GA');
        states.put('Hawaii','HI');
        states.put('Idaho','ID');
        states.put('Illinois','IL');
        states.put('Indiana','IN');
        states.put('Iowa','IA');
        states.put('Kansas','KS');
        states.put('Kentucky','KY');
        states.put('Louisiana','LA');
        states.put('Maine','ME');
        states.put('Maryland','MD');
        states.put('Massachusetts','MA');
        states.put('Michigan','MI');
        states.put('Minnesota','MN');
        states.put('Mississippi','MS');
        states.put('Missouri','MO');
        states.put('Montana','MT');
        states.put('Nebraska','NE');
        states.put('Nevada','NV');
        states.put('New Hampshire','NH');
        states.put('New Jersey','NJ');
        states.put('New Mexico','NM');
        states.put('New York','NY');
        states.put('North Carolina','NC');
        states.put('North Dakota','ND');
        states.put('Ohio','OH');
        states.put('Oklahoma','OK');
        states.put('Oregon','OR');
        states.put('Pennsylvania','PA');
        states.put('Rhode Island','RI');
        states.put('South Carolina','SC');
        states.put('South Dakota','SD');
        states.put('Tennessee','TN');
        states.put('Texas','TX');
        states.put('Utah','UT');
        states.put('Vermont','VT');
        states.put('Virginia','VA');
        states.put('Washington','WA');
        states.put('West Virginia','WV');
        states.put('Wisconsin','WI');
        states.put('Wyoming','WY');                     
        states.put('Andhra Pradesh','Andhra Pradesh');
        states.put('Arunachal Pradesh','Arunachal Pradesh');
        states.put('Assam','Assam');
        states.put('Bihar','Bihar');
        states.put('Chhattisgarh','Chhattisgarh');
        states.put('Goa','Goa');
        states.put('Gujarat','Gujarat');
        states.put('Haryana','Haryana');
        states.put('Himachal Pradesh','Himachal Pradesh');
        states.put('Jammu and Kashmir','Jammu and Kashmir');
        states.put('Jharkhand','Jharkhand');
        states.put('Karnataka','Karnataka');
        states.put('Kerala','Kerala');
        states.put('Madhya Pradesh','Madhya Pradesh');
        states.put('Maharashtra','Maharashtra');
        states.put('Manipur','Manipur');
        states.put('Meghalaya','Meghalaya');
        states.put('Mizoram','Mizoram');
        states.put('Nagaland','Nagaland');
        states.put('Orissa','Orissa');
        states.put('Punjab','Punjab');
        states.put('Rajasthan','Rajasthan');
        states.put('Sikkim','Sikkim');
        states.put('Tamil Nadu','Tamil Nadu');
        states.put('Tripura','Tripura');
        states.put('Uttar Pradesh','Uttar Pradesh');
        states.put('Uttarakhand','Uttarakhand');
        states.put('West Bengal','West Bengal');
        states.put('Andaman and Nicobar Islands','Andaman and Nicobar Islands');
        states.put('Daman and Diu','Daman and Diu');
        states.put('Lakshadweep','Lakshadweep');
        states.put('National Capital Territory of Delhi','National Capital Territory of Delhi');                                     
    
         countries = new map<string,string>();
         countries.put('India','India');
         countries.put('United States of America','USA');
    
    }
 //---------------- For Preview ---------------
     public void getBoothdetails()
    {     
       StatesCountry();
        
    

        
        system.debug('=========BoothAdminId::::'+BoothAdminId);
        
        //returnList = new List<User>();
        
        User_Profile_Event__c ParticularJuncID = [select EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: BoothAdminId];
        
         system.debug('==******************=====::::'+ParticularJuncID);
        
        BoothAdmininfo = [Select Id,FirstName,LastName,CompanyName,Email,Company_website__c,CompanyAddr1__c,
                             CompanyAddr2__c,CompanyCity__c,CompanyCountry__c,CompanyState__c,CompanyFaxNumber__c,
                             Companyphone__c,Zipcode__c,PoBox__c,Country__c,States__c from User where Id =:ParticularJuncID.User_Id__c];
                           
                         system.debug('==&&&&&&&&&&&&&&&&&&=====::::'+BoothAdmininfo );
                         
        OnlyBoothInfo = [Select Id,BT_BoothUserCount__c,BT_ContactEmail__c,BT_ContactName__c,BT_ContactPhone__c,BT_Description__c,BT_isBoothActive__c,
                             BT_Location__c,BT_Name__c,BT_PDFLocation__c,   BT_Phone__c,BT_RegistrationLink__c,
                             BT_WebsiteURL__c from  Booth__c where Id =:ParticularJuncID.BT_id__c];
             system.debug('============ Booth For Edit ======'+OnlyBoothInfo );                 
           
        
        for(User BooAdm :BoothAdmininfo )
        {
            for(Booth__c BoothInfo:OnlyBoothInfo ){
            { 
            if(BoothAdminId!= null && BoothAdminId!='')
            {   
                Admin = BooAdm ;
                system.debug(':@@@@@@@@@@@@@@@@@@:::::::'+Admin.Country__c);
                Country = countries.get(Admin.Country__c);
                system.debug('::::::::::::::::::::::::::::'+Country );
                Adminstates = states.get(Admin.states__c);
                MapBoothID = BoothInfo;
                displayBoothinfoPopUp = true;
                break;
            }  
            
        }                //return null;
     }
   } 
  }  
  
  Public void CancelBAM(){
  button = false;
  AddingAdmintoBooth = False;
  
  }
  public PageReference cancel2() {
   displayBoothinfoPopUp = false;
        return null;
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
  
   
 // --------------- Page Navigations ---------------
    
    public PageReference checkUserId() {
       
       if(userInfo.getUserType()== 'guest'){
            Pagereference pg = new pagereference('/apex/BL_Eventadmin_signup');
            pg.setredirect(true);
            return pg;
       } else{
            return null;
       }     
      
  }
   
    
     public PageReference boothadminstatus() {
     system.debug(' ------------ ************ -------------');
     statusValue = BoothAdminId.split(','); 
     system.debug('status of BA '+statusValue );
    if(statusValue[1] == 'Active'){
     SelectStatus = 'Active';
    }else{
     SelectStatus= 'InActive';
    }              
    User_Profile_Event__c ParticularJuncID = [select id,UEP_isActive__c,EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where id =: statusValue[0]];
                    
    List<User_Profile_Event__c>  BoothStatus = [Select Status__c,id,BT_id__r.BT_isBoothActive__c,UEP_isActive__c,EV_ID__c,BT_id__c,User_Id__c from User_Profile_Event__c where Id =:ParticularJuncID.id];
            
    ForUpdatingBoothstatus  = new User_Profile_Event__c();
             
    ParticularJuncID  = new User_Profile_Event__c();
  
    for(User_Profile_Event__c Admin1:BoothStatus )            
    {
     if(statusValue[0]!= null && statusValue[0]!='' )
     {
      ForUpdatingBoothstatus  = Admin1;
      Statuspopup= false;
      break;
     }
    }
    SaveStatus();
        return null;
    }

//------------------------------Test Class -------------------------------------
static testmethod void test_BL_Eventadmin_SampleBoothCon1(){  


   contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           insert m;
       Profile w = [select id from profile where name='Standard User'];
   // ------------------ Eventadmin Insert ---------------------
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com',CompanyAddr1__c ='global"//',CompanyAddr2__c='global"//',CompanyName='Globalnest');
                  insert u;
                  Id eventAdminId=u.id;  
               
               
               Event__c eve = new Event__c(EV_Title__c='Global Event',EV_HostingTimeZone__c='Eastern Time(USA)',
                             EV_EndDate__c =  Date.Parse('01/18/2014'),
                             EV_StartDate__c = Date.Parse('01/18/2014'),
                             EV_EndTime__c='09:00 AM',
                             StartTime__c='11:00 AM');
      insert eve;
      Id EventId=eve.Id; 
      
              
       Profile__c customProfileeve= new Profile__c (PR_Name__c='EventAdmin',PR_Version__c='1.5');        
       insert  customProfileeve;  
         
      User_Profile_Event__c upebootheve = new User_Profile_Event__c(EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,Profile_id__c=customProfileeve.id,Status__c='Active',User_id__c=eventAdminId,UEP_isActive__c=true);         
      insert upebootheve; 
      
         
     // ------------------ Boothtadmin Insert ---------------------
         
       user bAdmin =  new User(alias = 'testboot', email='testboothadmin@noemail.com',firstName='phani',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='testboothadmin@noemail.com',CompanyAddr1__c ='global"//',CompanyAddr2__c='global"//',CompanyName='Globalnest',Zipcode__c='02345',PoBox__c='02345');
                  insert bAdmin ;
                  Id boothAdminId=bAdmin.id;
         
                  
       Profile__c customProfile= new Profile__c (PR_Name__c='BoothAdmin',PR_Version__c='1.5');        
       insert  customProfile;
       
       
       
       
       Booth__c booth = new Booth__c(BT_Name__c='TestBooth',BT_BoothUserCount__c=100.0,EV_id__c=EventId);
      insert booth; 
      string boothId =booth.Id;
      
      User_Profile_Event__c upebooth = new User_Profile_Event__c(BoothAdmin_id__c=boothAdminId,BT_id__c=boothId ,EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,Profile_id__c=customProfile.id,Status__c='Active',User_id__c=boothAdminId,UEP_isActive__c=true,isFirstBoothAdmin__c=true);         
      insert upebooth;   
     
         // User_Profile_Event__c upeboothforadd = new User_Profile_Event__c(BoothAdmin_id__c=boothAdminId,BT_id__c=boothId ,EV_id__c=EventId,EventAdmin_Id__c=eventAdminId,Profile_id__c=customProfile.id,Status__c='Active',User_id__c=boothAdminId,UEP_isActive__c=true);         
         // insert upeboothforadd ;
      
      
      
      
      user bAdmin2 =  new User(alias = 'testbo', email='phanich8@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='phanich8@noemail.com',CompanyAddr1__c ='global"//',CompanyAddr2__c='global"//',CompanyName='Globalnest',Zipcode__c='02345',PoBox__c='02345');
                  insert bAdmin2 ;
                  
           AttendeeSummary__c attSummary = new AttendeeSummary__c(As_prefixNew__c='Mr',AS_FirstName__c='te\"st',AS_LastName__c='boothadmin',AS_Email__c='testboothadmin@noemail.com');
     insert attSummary;
       
  
    BL_Eventadmin_SampleBoothCon1 samplecon1 = new BL_Eventadmin_SampleBoothCon1();
    samplecon1.LoginUserId =string.valueOf(u.Id);
    samplecon1.selectEvent=EventId;
    samplecon1.SelectBooth=boothId ;
    samplecon1.exportBoothadmins();
   
    samplecon1.AddBoothAdmin();
    samplecon1.AddBooth();  
    samplecon1.getStatuslist();  
    samplecon1.selectevent='';
   samplecon1.selectevent=null;    
    samplecon1.selectevent = EventId;
    //samplecon1.getListOfBooths();
    samplecon1.selectevent = '--Choose Event--';
    samplecon1.ListOfBoothAdmins();
    samplecon1.AddBooth();
    samplecon1.BoothAdminId=upebooth.id;
    samplecon1.EditBoothAdmin();
    samplecon1.ForUpdatingBoothstatus =upebooth;
    samplecon1.SelectStatus ='Active';
    samplecon1.SaveStatus();
    samplecon1.SelectStatus ='InActive';
    samplecon1.SaveStatus();
    samplecon1.Cancelstatus();
    samplecon1.Booth.BT_Name__c ='Sample Booth ';
    samplecon1.selectevent =EventId;
   // samplecon1.BoothAdminUser = bAdmin;
   samplecon1.BoothAdminUser.LastName ='phani';
   samplecon1.BoothAdminUser.FirstName='kumar';
   samplecon1.Email='sderfgh@gmail.com';  
   samplecon1.SaveBooth();
   samplecon1.CommonMethod();
   samplecon1.CancelBooth();
   samplecon1.Con=new contact();
   samplecon1.BoothAdminUser= new user();
   samplecon1.BoothAdminUser.LastName ='phani';
   samplecon1.BoothAdminUser.FirstName='kumar';
   samplecon1.Email ='phani12345@globalnest.com';
   samplecon1.BoothAdminUser.companyName ='Globalnest';
   samplecon1.BoothAdminUser.Company_website__c ='www.boothleads.com';
   samplecon1.BoothAdminUser.CompanyAddr1__c ='Madhapur';
   samplecon1.BoothAdminUser.CompanyAddr2__c ='Hyderabad';
   samplecon1.BoothAdminUser.CompanyFaxNumber__c='9999999999';
   samplecon1.BoothAdminUser.Companyphone__c ='9999999999';
   samplecon1.BoothAdminUser.Zipcode__c='511112';
   samplecon1.BoothAdminUser.PoBox__c ='511112';
   samplecon1.selectBooth =boothId ;
   samplecon1.LoginUserId= u.Id;   
   samplecon1.SaveOnlyBA();
   samplecon1.Admin=bAdmin;
   samplecon1.UpdateBoothAdmin();
   samplecon1.BoothAdminId=upebooth.Id;
   samplecon1.CancelBA();
   samplecon1.getBoothdetails();
   samplecon1.checkUserId();
   samplecon1.CancelBAM();  
   samplecon1.BoothAdminId =upebooth.Id+','+'Active';
   samplecon1.boothadminstatus();
   samplecon1.cancel2();
   samplecon1.importBooths();
  
 }   

   
 

    
    
    
}