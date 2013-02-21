public with sharing class bl_boothQrCon {

public boolean disableseeventselection { get; set; }
public boolean displayPopUpForQRCODE {get;set;}
public string code{get;set;}
public String selectedEvent { get; set; }
public boolean registrationDisplay { get; set; }
public boolean broucherDisplay { get; set; }
public boolean secondDisplay { get; set; }
public boolean firstDiplayBool { get; set; }
public Boolean rendervalue { get; set; }
public String sn { get; set; }
public Integer listsize{get;set;}
public String sitename { get; set; }
public Booth_Qrcode__c booth{get;set;}
public transient Blob broacherBlob{get;set;}
public List<Booth_Qrcode__c> ListOfUserLinks{get;set;}
public DateTime lastlogindate{get;set;}
public String fileName{ get; set; }

public Booth_Qrcode__c boothEdit{get;set;}
public Booth_Qrcode__c booth1{get;set;}
public Booth_Qrcode__c booth2{get;set;}
public Booth_Qrcode__c booth3{get;set;}
public Booth_Qrcode__c booth4{get;set;}
public Booth_Qrcode__c booth5{get;set;}
public User_Profile_Event__c BoothValue {get;set;}
public Boolean r1{ get; set; }
public Boolean r2{ get; set; }
public Boolean r3{ get; set; }
public Boolean r4{ get; set; }
public Boolean r5{ get; set; }
public string boothname{get;set;}

    public PageReference backbrocher() {
      broucherDisplay= false;
       firstDiplayBool = true;
       secondDisplay = false;
       registrationDisplay = false;
        return null;
    }

    public PageReference Cancel() {
        firstDiplayBool = true;secondDisplay = false; registrationDisplay  = false;broucherDisplay = false; 
        return null;
    }
    
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

   public boolean displaybuttons{get;set;}
    public PageReference closePopupdetail() {
    displayPopUpForQRCODE = false;
        return null;
    }


    public PageReference Printaspdf() {
         pagereference pf=page.bl_boothpdf;
     return pf;
    }


      public PageReference generateQrcode() {
  
  
  String sfdcBaseURL = URL.getSalesforceBaseUrl().toExternalForm();
    string ret=sfdcBaseURL+'/BL_MobileScreen?id='+BoothName+'&vid=1'+'&Eid='+selectedEvent; 
    String encoded = EncodingUtil.urlEncode(ret, 'UTF-8');   
    code=encoded;
    
     system.debug('ppppppppppppppppppppp '+ret);
     
    displayPopUpForQRCODE = true;
        return null;
    }




    public PageReference save() {
    system.debug('0000000000000000000000 '+sitename);
      if(boothEdit.Data_Types__c =='Contact Information'){
        if(sitename !=null){
         boothEdit.Link_LabelName__c=sitename;
         List<attachment> attch = new List<attachment>();      
         attch  = [select id from attachment where parentId=:boothEdit.id];
         delete attch;
         
         
         
          string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+ boothEdit.Name__c+';;;\n'+'FN:'+ boothEdit.Name__c+'\n'+'TITLE:'+boothEdit.Title__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+boothEdit.Email_Address__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+boothEdit.Phone_number__c+'\n'+'ORG:'+boothEdit.Company__c+'\n'+'ADR;TYPE=WORK:;;'+boothEdit.Address__c+';'+boothEdit.Address_2__c+';'+boothEdit.City__c+';'+boothEdit.State__c+';'+boothEdit.Country__c+'\n'+'URL;WORK:'+boothEdit.Website_URL__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
     string paramvalue = EncodingUtil.base64Encode(beforeblob);
     
     string s= 'BEGIN:VCALENDAR\n'+
     'VERSION:2.0\n'+
     'BEGIN:VEVENT\n'+
     'DTSTART;TZID=Europe/London:20120708T220000\n'+
     'DTEND;TZID=Europe/London:20120708T230000\n'+
     'SUMMARY:Click to download contact to your address book\n'+
     'DTSTAMP:20120708T203910Z\n'+
     'ATTACH;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/directory;\n'+
     ' X-APPLE-FILENAME=iphonecontact.vcf:\n'+' '+paramvalue+'\n'+
     'END:VEVENT\n'+
     'END:VCALENDAR';
      blob b = blob.valueOf(s);
      attachment attach  = new attachment();
      attach.Name ='iphonecontact.ics';
      attach.body=b;
      attach.parentId=boothEdit.id;
     insert attach;
    
    
    
    
    
    string trertr1 ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+boothEdit.Name__c+';;;\n'+'FN:'+boothEdit.Name__c+'\n'+'TITLE:'+boothEdit.Title__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+boothEdit.Email_Address__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+boothEdit.Phone_number__c+'\n'+'ORG:'+boothEdit.Company__c+'\n'+'ADR;TYPE=WORK:;;'+boothEdit.Address__c+';'+boothEdit.Address_2__c+';'+boothEdit.City__c+';'+boothEdit.State__c+';'+boothEdit.Country__c+'\n'+'URL;WORK:'+boothEdit.Website_URL__c+'\n'+
     'END:VCARD';
     Blob beforeblob1 = Blob.valueOf(trertr1);
    
      attachment attach1  = new attachment();
      attach1.Name ='Android.Vcf';
      attach1.body=beforeblob1 ;
      attach1.parentId=boothEdit.id;
     insert attach1;
      }
        update boothEdit;
                
       }else if(boothEdit.Data_Types__c =='Registration Link'){
        boothEdit.Link_LabelName__c=sn;
        string sd =boothEdit.Registration_Link__c;
        system.debug('666666666677777777777 '+sd);
       if(sd!=null && sd!=''){
      if(sd.contains('http://')){
      boothEdit.Registration_Link__c=(boothEdit.Registration_Link__c).substringAfter('http://');
    }else{
      boothEdit.Registration_Link__c =boothEdit.Registration_Link__c;
    }
     }
    
        update boothEdit;
       }
       else if(boothEdit.Data_Types__c =='Company Broacher'){
        if(broacherBlob != null){
        
        List<attachment> attch1 = new List<attachment>();      
         attch1  = [select id from attachment where parentId=:boothEdit.id];
         delete attch1;       
       system.debug('hiiiiiiiiiiiiiiiiiiiiiiiii ');
        attachment a = new attachment();
        if(broacherBlob!=null){
        a.parentId=boothEdit.id;
        a.body =broacherBlob;
        a.Name =fileName;
       insert a;
      }
      }
      system.debug('!!!!!!!!!!!!!!!!!!'+boothEdit);
        update boothEdit;
       }
    
     system.debug('~~~~~~~~~~~~~~~~~~'+boothEdit);
     firstMethod();  
     firstDiplayBool = true;secondDisplay = false; registrationDisplay  = false;broucherDisplay = false;   
        return null;
    }


    

    public PageReference editRecord() {
    
    firstDiplayBool = false;secondDisplay = false; registrationDisplay  = false;broucherDisplay = false;
    boothEdit  = new Booth_Qrcode__c();
    boothEdit = [select id,Address__c,Address_2__c,Booth__c,City__c,Company__c,Country__c,Email_Address__c,Data_Types__c,Link_LabelName__c,Name__c,Phone_number__c,Pin_code__c,POBox__c,Registration_Link__c,State__c,Title__c,Website_URL__c,(select id,name from attachments limit 1) from Booth_Qrcode__c where id=:Apexpages.currentpage().getparameters().get('editRecord')];
   
    if(boothEdit.Data_Types__c =='Contact Information'){
     sitename=boothEdit.Link_LabelName__c;
    secondDisplay = true;
    
    }else if(boothEdit.Data_Types__c =='Registration Link'){
    sn =boothEdit.Link_LabelName__c;
    registrationDisplay  = true;
    
    }else if(boothEdit.Data_Types__c =='Company Broacher'){
     
      broucherDisplay = true;
    
    }
    
   
   return null;
    }




 public PageReference deleteRecord() {
 Booth_Qrcode__c s =[select id from Booth_Qrcode__c where id=:Apexpages.currentpage().getparameters().get('deleterecord')];
 delete s;
 firstMethod();
 return null;
}


Public List<User_Profile_Event__c > Events {get;set;}
public List<selectOption> options{get;set;}


public bl_boothQrCon(){
Events = new List<User_Profile_Event__c > ();
options = new List<selectOption>();
Events=[select EV_id__r.EV_Title__c,EV_id__c,Status__c,BoothAdmin_id__c,id,User_id__r.Name,User_id__r.FaceBookId__c,User_id__c,User_id__r.FirstName,UEP_isActive__c ,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title from User_Profile_Event__c where   BoothAdmin_id__c=:UserInfo.getUserId() and Profile_id__r.PR_Name__c='BoothAdmin'  and EV_id__r.EV_Title__c!=null and (Status__c!='Mobile only access' And Status__c!='InActive') ]; 

for(User_Profile_Event__c eve:Events){
system.debug('44444444444444 '+eve.EV_id__c);
system.debug('55555555555555 '+eve.EV_id__r.EV_Title__c);
 options.add(new selectOption(eve.EV_id__c,eve.EV_id__r.EV_Title__c));
}  

if(Events.size()>0){
selectedEvent =Events[0].EV_id__c;
}
onchangeRender();
firstDiplayBool  = true;

firstMethod();
}


public pageReference onchangeRender(){
try{
BoothValue = new User_Profile_Event__c();
BoothValue =[select BT_id__r.BT_Name__c,EV_id__r.EV_Title__c,EV_id__c,Status__c,BoothAdmin_id__c,id,User_id__r.Name,User_id__r.FaceBookId__c,User_id__c,User_id__r.FirstName,UEP_isActive__c ,User_id__r.LastName,User_id__r.Email,User_id__r.CompanyName,User_id__r.Title,BT_id__c from User_Profile_Event__c where   BoothAdmin_id__c=:UserInfo.getUserId() and Profile_id__r.PR_Name__c='BoothAdmin' and EV_id__c=:selectedEvent limit 1]; 
boothname =BoothValue.BT_id__c;

firstMethod();
}catch(exception e){}
return null;
}

public List<Booth_Qrcode__c> forUrlType{get;set;}
public List<Booth_Qrcode__c> forContactType{get;set;}
public List<Booth_Qrcode__c> forPdfType{get;set;} 
public List<Booth_Qrcode__c> forEmpty{get;set;} 


public pageReference firstMethod(){

rendervalue  = false;
forEmpty = new List<Booth_Qrcode__c>();
forUrlType= new List<Booth_Qrcode__c>();
forPdfType= new List<Booth_Qrcode__c>();
forContactType  = new List<Booth_Qrcode__c>();
displaybuttons = true;
ListOfUserLinks = new List<Booth_Qrcode__c>();
 user u =[select lastloginDate from user where id=:userInfo.getuserId()];
 lastlogindate =u.lastloginDate;
 ListOfUserLinks  =  [select id,Address__c,Address_2__c,Booth__c,City__c,Company__c,Country__c,Email_Address__c,Data_Types__c,Link_LabelName__c,Name__c,Phone_number__c,Pin_code__c,POBox__c,Registration_Link__c,State__c,Title__c,Website_URL__c,(select id,name from Booth_Qrcode__c.attachments)  from Booth_Qrcode__c where Booth__c=:BoothName and  Event__c=:selectedEvent];
system.debug('w111111111111111111 '+ListOfUserLinks);

for(Booth_Qrcode__c b:ListOfUserLinks){
if(b.Data_Types__c=='Contact Information'){
 forContactType.add(b);
}

if(b.Data_Types__c=='Registration Link'){
forUrlType.add(b);
system.debug('w3333333333333333333333 '+b);
}

if(b.Data_Types__c=='Company Broacher'){

forPdfType.add(b);
}
}
 
 
for(integer f=1;f<=5-ListOfUserLinks.size();f++){
Booth_Qrcode__c iu = new Booth_Qrcode__c();
forEmpty.add(iu); 

} 
 
 
 
system.debug('w111111111111111111 '+ListOfUserLinks.size()); 
 
 
 listsize=ListOfUserLinks.size();
 if(ListOfUserLinks.size()>0){
 rendervalue = true;
  }
  
  if(ListOfUserLinks.size()>=5){ 
  displaybuttons =false;
  }
  
 
 booth = new Booth_Qrcode__c();
return null;
}


//---------------------------- Add contact Method --------------------------
  
    public PageReference addContact() {
      system.debug('44444444444444444444444 '+sitename);
    booth.Data_Types__c ='Contact Information';
    booth.Link_LabelName__c =sitename;
    booth.Booth__c=boothname;
    booth.Event__c=selectedEvent;
    insert booth;
   
    List<attachment> att = [select name,id  from attachment where parentId=:booth.id];
    delete att;
    
    
    string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+ booth.Name__c+';;;\n'+'FN:'+ booth.Name__c+'\n'+'TITLE:'+Booth.Title__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.Email_Address__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.Phone_number__c+'\n'+'ORG:'+booth.Company__c+'\n'+'ADR;TYPE=WORK:;;'+Booth.Address__c+';'+Booth.Address_2__c+';'+Booth.City__c+';'+Booth.State__c+';'+Booth.Country__c+'\n'+'URL;WORK:'+Booth.Website_URL__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
     string paramvalue = EncodingUtil.base64Encode(beforeblob);
     
     string s= 'BEGIN:VCALENDAR\n'+
     'VERSION:2.0\n'+
     'BEGIN:VEVENT\n'+
     'DTSTART;TZID=Europe/London:20120708T220000\n'+
     'DTEND;TZID=Europe/London:20120708T230000\n'+
     'SUMMARY:Click to download contact to your address book\n'+
     'DTSTAMP:20120708T203910Z\n'+
     'ATTACH;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/directory;\n'+
     ' X-APPLE-FILENAME=iphonecontact.vcf:\n'+' '+paramvalue+'\n'+
     'END:VEVENT\n'+
     'END:VCALENDAR';
      blob b = blob.valueOf(s);
      attachment attach  = new attachment();
      attach.Name ='iphonecontact.ics';
      attach.body=b;
      attach.parentId=booth.id;
     insert attach;
    
    
    
    
    
    string trertr1 ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+booth.Name__c+';;;\n'+'FN:'+booth.Name__c+'\n'+'TITLE:'+Booth.Title__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.Email_Address__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.Phone_number__c+'\n'+'ORG:'+booth.Company__c+'\n'+'ADR;TYPE=WORK:;;'+Booth.Address__c+';'+Booth.Address_2__c+';'+Booth.City__c+';'+Booth.State__c+';'+Booth.Country__c+'\n'+'URL;WORK:'+Booth.Website_URL__c+'\n'+
     'END:VCARD';
     Blob beforeblob1 = Blob.valueOf(trertr1);
    
      attachment attach1  = new attachment();
      attach1.Name ='Android.Vcf';
      attach1.body=beforeblob1 ;
      attach1.parentId=booth.id;
     insert attach1;
    
    
     sitename ='';
     
    firstMethod();
    return null;
    }


// ---------------------------- Add Broacher Method -------------------------- 
    public PageReference addbrochureAction() {
    booth.Data_Types__c ='Company Broacher';
     booth.Event__c=selectedEvent;
     booth.Booth__c=boothname;
    insert booth;
    
    attachment a = new attachment();
    if(broacherBlob!=null){
    a.parentId=booth.id;
    a.body =broacherBlob;
    a.Name =fileName;
    insert a;
    }
    broacherBlob=null;
    firstMethod();
        return null;
    }
    

// ---------------------------- Add Registration  Link Method --------------------------  -->
    public PageReference addAction() {
    system.debug('77777777777777777777 '+ sn);
    booth.Link_LabelName__c =sn;     
    booth.Booth__c=boothname;
    booth.Data_Types__c ='Registration Link';
    booth.Event__c=selectedEvent;
    string sd =booth.Registration_Link__c;
    if(sd.contains('http://')){
    booth.Registration_Link__c=booth.Registration_Link__c;
    }else{
    booth.Registration_Link__c ='http://'+booth.Registration_Link__c;
    }
    upsert booth;
    sn ='';
    firstMethod();
 
    return null;
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
                  
                  
 // ------------------------------- booth Admin --------------------
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
            
     
     Booth_Qrcode__c boothQr = new Booth_Qrcode__c(Booth__c=booth.Id,Event__c=eventId,Data_Types__c='Registration Link',Title__c='Registration Link');
     insert boothQr;
     
      Booth_Qrcode__c boothQr2 = new Booth_Qrcode__c(Booth__c=booth.Id,Event__c=eventId,Data_Types__c='Contact Information',Title__c='Contact Information');
     insert boothQr2;
     
     
      Booth_Qrcode__c boothQr3 = new Booth_Qrcode__c(Booth__c=booth.Id,Event__c=eventId,Data_Types__c='Company Broacher',Title__c='Company Broacher');
     insert boothQr3;
     
     
     BoothVisitSummary__c boothVisitSummary= new BoothVisitSummary__c(BVS_LeadRating__c=4.4,Follow_Update__c=datetime.valueOf('2012-05-15 00:00:00'),ScanTime__c=datetime.valueOf('2012-05-15 00:00:00'),BVS_FirstName__c='Scan',BVS_LastName__c='Me',BVS_Email__c='testboothadmin@noemail.com',EA_AttendeeBarcode__c=getEvent_att_map.Id,User_id__c=bAdmin.Id);
     insert boothVisitSummary;
     
     
     User_Event_BVS__c  use_Eve_BVS = new User_Event_BVS__c(BVS_id__c=boothVisitSummary.Id,EV_id__c=EventId,UPE_id__c=upe.Id);
     insert use_Eve_BVS;
     
     
    SecurityControls__c secControl = new SecurityControls__c(EV_id__c=EventId,EV_Req_Fields__c='AS_FirstName__c',EV_Fields__c='AS_FirstName__c,AS_Company__c,AS_Title__c,AS_CellPhone__c,AS_Age__c,AS_Gender__c,AS_BirthDate__c,AS_HomeAddress1__c,AS_ShippingAddress1__c,AS_WorkAddress1__c,AS_NAICSCode1__c,AS_NAICSCode2__c,AS_NAICSCode3__c,AS_NAICSCode4__c,AS_NAICSCode5__c,AS_PrimaryBusinessCategory__c,AS_SecondaryBusinessCategory__c,AS_NumberOfEmployees__c,AS_BusinessEstablishedDate__c,AS_BusinessRevenue__c,AS_BusinessTaxId__c,AS_BusinessDunsNumber__c,AS_WebsiteUrl__c,AS_BlogUrl__c,AS_BusinessDescription__c,AttendeePic'); 
    insert  secControl ;                    
           
      PageReference pageRef = Page.Bl_boothQr;
    Test.setCurrentPage(pageRef);     
           
                
        system.runas(bAdmin){        
          bl_boothQrCon blattendee= new bl_boothQrCon ();
          blattendee.login();
           blattendee.sitename='adding Contact';
           blattendee.boothname=boothId;
           blattendee.selectedEvent=Eventid;
           blattendee.booth.Name__c ='DevBooth';
           blattendee.Booth.Title__c='Contact Information';
            blattendee.booth.Email_Address__c ='phanich8@gmail.com';
             blattendee.booth.Phone_number__c ='0000000020';
            blattendee.booth.Company__c ='Nest';
            blattendee.Booth.Address__c ='Hyderabad';
           blattendee.Booth.Address_2__c ='Ap';
           blattendee.Booth.City__c='Hyd';
          blattendee.Booth.State__c ='Ap';
           blattendee.Booth.Country__c ='India';
           blattendee.Booth.Website_URL__c='www.google.com';
           blattendee.addContact();
           
           blattendee.Booth.Title__c='pdf';
           blattendee.fileName='pdfname';
          blattendee.broacherBlob =blob.valueOf('phani');
          blattendee.addbrochureAction();
          
           blattendee.Booth.Title__c='reglink';
          blattendee.booth.Registration_Link__c ='www.google.com';
          blattendee.addAction();
          blattendee.backbrocher();
          blattendee.Cancel();
          blattendee.closePopupdetail();
          blattendee.Printaspdf();
          ApexPages.currentPage().getParameters().put('editRecord', boothQr3.Id);
          blattendee.editRecord(); 
          
          blattendee.sitename ='phani Brochure';
          blattendee.fileName='pdfname';
          blattendee.broacherBlob =blob.valueOf('phani');
          blattendee.save();
          
          
          blattendee.boothEdit=boothQr;
           blattendee.fileName='reg link';
           blattendee.booth.Registration_Link__c='Hiiiii ';
           blattendee.save();
          
          blattendee.boothEdit=boothQr2 ;
           blattendee.fileName='contact info';
           blattendee.save();
           
           blattendee.generateQrcode();
           ApexPages.currentPage().getParameters().put('deleterecord', boothQr.Id);
           //blattendee.deleteRecord();
        }        
                
                  
    system.runas(u){
    bl_boothQrCon blattendee= new bl_boothQrCon ();
    blattendee.login();
   }
    
  }

}