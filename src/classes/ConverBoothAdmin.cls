public without sharing class ConverBoothAdmin {
	
   public void boothadminConversion(set<Id> setOfatts,id eventName){
    List<string> AllattendeeEmail = new  List<string>();
    MAP<string,sobject> mapEmailwithatt = new  MAP<string,sobject>();
    MAP<string,id> mapContact = new MAP<string,id>();
    List<booth__c> booths = new List<booth__c>(); 
    MAP<string,id> mapBooth = new MAP<string,id>();
     
     Profile__c profileCustom = new Profile__c();
     profileCustom =[select id,PR_Name__c from Profile__c where PR_Name__c='BoothAdmin' limit 1]; 
     
    for(AttendeeSummary__c att:[select  AS_FirstName__c ,AS_LastName__c,AS_Email__c,AS_Company__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,AS_WorkAddress2__c,AS_WorkCity__c,  AS_Work_States__c ,AS_Work_Country__c,AS_FaxNumber__c,AS_WorkPhone__c,AS_WorkZip__c from AttendeeSummary__c where Id IN :setOfatts]){
     AllattendeeEmail.add(att.AS_Email__c);	  
     mapEmailwithatt.put(att.AS_Email__c,att); 
      booth__c boothinsert = new booth__c();   
     boothinsert.BT_Name__c=att.AS_Company__c;
     boothinsert.EV_id__c = eventName;    
     booths.add(boothinsert); 
     
    } 
   		
	LIST<USER> updatedRequiredUsers = new LIST<USER>();
	LIst<string> insertedRequiredUsers = new LIst<string>();
	updatedRequiredUsers =[SELECT id,userName,Email,CompanyName,FirstName,LastName,Company_website__c,CompanyAddr1__c,CompanyAddr2__c,CompanyCity__c,Country__c,CompanyFaxNumber__c,Companyphone__c,States__c,Zipcode__c from USER where userName IN :AllattendeeEmail and Profile.Name!='Event Admin'];
    // update feture method is called
       
   
    for(user u :updatedRequiredUsers){
   	insertedRequiredUsers.add(u.userName);
   }
   system.debug('1111111111111111111 '+insertedRequiredUsers+'22222222222222222 '+setOfatts);
    
  
  
  // =================== insert contacts and booths ================================
  event__c eve = new event__c();
  eve =[select 	EV_Title__c from event__c where id=:eventName limit 1];
 string eventName1 =eve.EV_Title__c;
  
  
   String EmailBody = 'We are working with BoothLeads to help you with your event '+ eventName1 +'. All badges will now have a QR code specific to your name and company. You will be able to scan the QR code on-site, make notes about that individual and follow up with them.'+'\n\n'+'You have been added to the BoothLeads database for '+ eventName1 +'\n\n\n'+'Now what?'
+'\n\n\n'+'• Go to http://www.boothleads.com to login into your Booth Admin Portal as well as your mobile app.USERNAME AND PASSWORD ARE PROVIDED AT THE BOTTOM OF THIS EMAIL.'
+'\n\n\n'+'• Here are some youtube videos to give you an idea of what will happen:'+'\n\n'+' o What is a QR code: http://www.youtube.com/watch?v=b8EpazIwFys'+'\n\n'+' o How to generate a QR code so that attendees can view your brochures or '+'\n'+' flyers: http://www.youtube.com/watch?v=jcg2qbS_TaM&feature=youtu.be'
+'\n\n\n'+'• Next step….Download the appropriate app to your phone either from Google'+'\n'+'Play Store or AppStore or BlackBerry World.'
+'\n\n\n\n'+' Then you are ready to scan the badges on-site!'+'\n\n'+' Please note that your Booth Leads portal access is valid only for 30 days from the end of your event'
+'\n\n'+ ' We will be available on-site at the show (across from the registration desk) to assist you throughout the event.'+'\n\n'+' If you need assistance before that time, contact us at support@boothleads.com.'+'\n\n\n'+' Thank you!'+'\n'+' BoothLeads Customer Support'+'\n'+' Phone: 1-(800)-492-1289' ;
  
  
  
  String EmailSubject = 'Booth Leads and '+eventName1;
  
  List<contact> conList = new List<contact>();
  for(AttendeeSummary__c attsum : [select AS_FirstName__c ,AS_Company__c,AS_LastName__c,AS_Email__c from AttendeeSummary__c  where AS_Email__c NOT IN :insertedRequiredUsers]){
     contact con = new contact();
      con.FirstName =attsum.AS_FirstName__c;
  	  con.lastName= attsum.AS_LastName__c;
  	  con.Email =attsum.AS_Email__c;
  	 // Con.AccountId='001O0000007AN41';
  	    Con.AccountId='001F000000rVD6z';
      Con.Email_Subject__c = EmailSubject;
      Con.Email_Notes__c = EmailBody;
      conList.add(Con);
      
    
   
  }
   
 
  database.Saveresult[] conSaveres = database.insert(conList,false);
  Database.SaveResult[] MySaveResultBooth =dataBase.insert(booths,false); 
  
  for(contact co:conList){
  mapContact.put(co.email,co.id);
  } 
  
   for(booth__c bo:booths){
  mapBooth.put(bo.BT_Name__c,bo.id);
  } 
  if(insertedRequiredUsers.size()>0){
   MymethodForUpsate(insertedRequiredUsers,mapBooth,eventName,setOfatts); 
  }
 //------------------------- contact insertion completed ---------------------
  
 //======================= Inserting users ===================================
 
 LIST<USER> InserteduserList =new  LIST<USER>();
 for(AttendeeSummary__c atts : [select  AS_FirstName__c ,AS_LastName__c,AS_Email__c,AS_Company__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,AS_WorkAddress2__c,AS_WorkCity__c,  AS_Work_States__c ,AS_Work_Country__c,AS_FaxNumber__c,AS_WorkPhone__c,AS_WorkZip__c from AttendeeSummary__c  where AS_Email__c NOT IN :insertedRequiredUsers and AS_Email__c IN :AllattendeeEmail]){
   user u = new user(); 
   u.FirstName =atts.AS_FirstName__c;
   u.LastNAme =atts.AS_LastName__c;
   u.CompanyName =atts.AS_Company__c;
   u.email =atts.AS_Email__c;
   u.userName=atts.AS_Email__c;
   u.Company_website__c=atts.AS_WebsiteUrl__c;
   u.CompanyAddr1__c=atts.AS_WorkAddress1__c;
   u.CompanyAddr2__c=atts.AS_WorkAddress2__c;
   u.CompanyCity__c=atts.AS_WorkCity__c;
   u.Country__c =atts.AS_Work_Country__c;
   u.CompanyFaxNumber__c=atts.AS_FaxNumber__c;
   u.Companyphone__c =atts.AS_WorkPhone__c;
   u.States__c  =atts.AS_Work_States__c;
   u.contactId=mapContact.get(u.email);
   u.Alias ='BAdmin';
   u.ProfileID ='00eF0000000FYkG';
   //u.ProfileID ='00eO0000000Dkqz';
   u.LocaleSidKey ='en_US';
   u.LanguageLocaleKey ='en_US';
   u.TimeZoneSidKey ='America/Los_Angeles';
   u.EmailEncodingKey='UTF-8';
   InserteduserList.add(u);
 }
  Database.saveResult[] MySaveResultUser =dataBase.insert(InserteduserList,false); 
  
  //------------------------- USer insertion completed ---------------------
  
  
//======================= Inserting user Profile Events ===================================  
  
  List<id> IdssendToFuture =new List<id>();
  List<id> IdssendToFutureReal =new List<id>();
  integer i=0;
   for(Database.saveResult SaveRes:MySaveResultUser){
   if(SaveRes.issuccess()){
   	 i=i+1;
   	if(i==100){
   	myMethod(IdssendToFutureReal);	
   	i=0;
   	IdssendToFutureReal = new List<id>();
   	}else{
   	IdssendToFutureReal.add(SaveRes.getId());	
   		
   	}   	
     IdssendToFuture.add(SaveRes.getId());	
   }
  } 
  
  if(IdssendToFutureReal.size()>0){
  		myMethod(IdssendToFutureReal);	
  }
  
   List<User_Profile_Event__c> UPEList = new List<User_Profile_Event__c>();
    for(user uf :[select id,companyName from user where id IN :IdssendToFuture]){
  	User_Profile_Event__c upe = new User_Profile_Event__c();
     upe.BT_id__c =mapBooth.get(uf.companyName);
     upe.EV_id__c =eventName;
     upe.User_id__c=uf.id;
     upe.BoothAdmin_id__c=uf.id;
     upe.status__c ='Active';
     upe.EventAdmin_Id__c=userInfo.getuserId();
     upe.UEP_isActive__c=TRUE;
     upe.Profile_id__c =profileCustom.id;
     UPEList.add(upe);
  
  }
    database.saveResult[] upeInsert=dataBase.insert(UPEList);
 //----------------------------  user Profile Events END-----------------------------  
   
   
 //======================= Inserting Reports ===================================  
    
   List<Reports__c> rpList = new List<Reports__c>();
   List<id> upeIds = new List<Id>();
  
  for(database.saveResult saveRes:upeInsert){
    upeIds.add(saveRes.getId()); 
  }
  
  
  for(User_Profile_Event__c  uList:[select id from User_Profile_Event__c where  id IN:upeIds]){
   Reports__c rp =new Reports__c();
    rp.RE_Name__c='Report By Industry';
    rp.UPE_id__c =uList.id;
    rpList.add(rp);
    Reports__c rp2 =new Reports__c();
    rp2.RE_Name__c='Report By Geography';
    rp2.UPE_id__c =uList.id;
    rpList.add(rp2);
  }
   database.insert(rpList);
  // --------------------- Reports End ------------------------------
  
  List<string> forattjunupdate = new List<string>();
   for(user uy:[select id,userName from user where id IN :IdssendToFutureReal]){
   	forattjunupdate.add(uy.userName);   
   }
   
   
   List<Event_Attendee_Mapping__c> attupdate =new List<Event_Attendee_Mapping__c> ();
   for(Event_Attendee_Mapping__c UA : [SELECT id,AS_id__c,Boothleads_Profile__c,AS_id__r.AS_Email__c from Event_Attendee_Mapping__c  where AS_id__r.AS_Email__c IN :forattjunupdate and EV_id__r.id=:eventName]){
   	UA.Boothleads_Profile__c='Booth Admin';
   	attupdate.add(UA);
   }
   dataBase.update(attupdate,false);
   
   
   
 
  // --------------------- Method End ------------------------------
   }
  
  
   
   @future
  public static void MymethodForUpsate(List<string> usersList,MAP<string,id> boothNapping,id eventId,set<id> attendees){
  Map<string,AttendeeSummary__c> mapEmailwithatt2 = new Map<string,AttendeeSummary__c>();
  
  event__c eve = new event__c();
  eve =[select 	EV_Title__c from event__c where id=:eventId limit 1];
 string eventName =eve.EV_Title__c;
  
  
  for(AttendeeSummary__c att:[select  AS_FirstName__c ,AS_LastName__c,AS_Email__c,AS_Company__c,AS_WebsiteUrl__c,AS_WorkAddress1__c,AS_WorkAddress2__c,AS_WorkCity__c,  AS_Work_States__c ,AS_Work_Country__c,AS_FaxNumber__c,AS_WorkPhone__c,AS_WorkZip__c from AttendeeSummary__c where Id IN :attendees]){
     mapEmailwithatt2.put(att.AS_Email__c,att);  	
    } 	 	
  	
  List<user> InserteduserList2 = new List<user>();	
  for(user u :[SELECT id,userName,Email,CompanyName,FirstName,LastName,Company_website__c,CompanyAddr1__c,CompanyAddr2__c,CompanyCity__c,Country__c,CompanyFaxNumber__c,Companyphone__c,States__c,Zipcode__c from user where userName IN :usersList]){
  	
   AttendeeSummary__c atts = new AttendeeSummary__c();
   	atts=mapEmailwithatt2.get(u.userName);
   	
   u.FirstName =atts.AS_FirstName__c;
   u.LastNAme =atts.AS_LastName__c;
   u.CompanyName =atts.AS_Company__c;
   u.email =atts.AS_Email__c;
   u.userName=atts.AS_Email__c;
   u.Company_website__c=atts.AS_WebsiteUrl__c;
   u.CompanyAddr1__c=atts.AS_WorkAddress1__c;
   u.CompanyAddr2__c=atts.AS_WorkAddress2__c;
   u.CompanyCity__c=atts.AS_WorkCity__c;
   u.Country__c =atts.AS_Work_Country__c;
   u.CompanyFaxNumber__c=atts.AS_FaxNumber__c;
   u.Companyphone__c =atts.AS_WorkPhone__c;
   u.States__c  =atts.AS_Work_States__c;
   
   InserteduserList2.add(u);
  }	
   Database.saveResult[] updatedRec =dataBase.update(InserteduserList2,false); 
  	
  	List<id> sendEmailToUploaded = new List<id>();
  	
    for(Database.saveResult res:updatedRec){
     if(res.isSuccess()){
       sendEmailToUploaded.add(res.getId());
      }
    }	
    /*
   List<Messaging.SingleEmailMessage> mails= new List<Messaging.SingleEmailMessage>();
   for(user sendEmail:[select id,firstname,Name,LastName,email,userName from user where id IN :sendEmailToUploaded ]){
    string email =sendEmail.Email;
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { email });
    mail.setSubject('Welcome to '+eventName+' – Your registration was successful!');
    mail.setHtmlBody('Dear '+sendEmail.Name+','+'<br /><br />Congratulations!!<br />Your login for your Booth Admin Portal for Event "'
    +eventName  +'" was successfully created.<br /><br />Please visit http://www.boothleads.com to login to your Booth Admin Portal.<br /><br />If you have any questions, please contact your Event Administrator.<br /><br />Please note that your Booth Leads portal access is valid only for 30 days from the end of your event.<br />Please remember to export all your leads.<br />If you need access beyond this, please contact support.<br /><br />'
    +'Thank you!<br />BoothLeads Customer Support<br />support@boothleads.com');
    mails.add(mail);
   }
   Messaging.sendEmail(mails);
   
   */
    
   
   
    
    
   // ================================= insert UPES ================================= 
 
   List<User_Profile_Event__c> AllUPEs = new List<User_Profile_Event__c>(); 
   List<User_Profile_Event__c> UPEList = new List<User_Profile_Event__c>();
   
   AllUPEs =[SELECT id,User_id__c,EV_id__c,User_id__r.id from User_Profile_Event__c where EV_id__r.id=:eventId];
   set<Id> UPEUsers = new set<Id>();
   
   
   for(User_Profile_Event__c userIdsInUPE:AllUPEs){
       UPEUsers.add(userIdsInUPE.User_id__r.id);
     }
     
   Profile__c profileCustom = new Profile__c();
   profileCustom =[select id,PR_Name__c from Profile__c where PR_Name__c='BoothAdmin' limit 1];  
     
  for(user saveResultOfUser:[select id,email,companyName from user where id IN:sendEmailToUploaded]){
   if(UPEUsers.contains(saveResultOfUser.id)){
   
    } else{
     User_Profile_Event__c upe = new User_Profile_Event__c();
     upe.BT_id__c =boothNapping.get(saveResultOfUser.companyName);
     upe.EV_id__c =eventId;
     upe.User_id__c=saveResultOfUser.id;
     upe.BoothAdmin_id__c=saveResultOfUser.id;
     upe.status__c ='Active';
     upe.EventAdmin_Id__c=userInfo.getuserId();
     upe.UEP_isActive__c=TRUE;
     upe.Profile_id__c =profileCustom.id;
     UPEList.add(upe);
    } 
  }
  database.saveResult[] upeInsert=dataBase.insert(UPEList,false);
 
// ================================= insert reports ================================= 
 
   List<Reports__c> rpList = new List<Reports__c>();
  List<id> upeIds = new List<Id>();
  
  for(database.saveResult saveRes:upeInsert){
    upeIds.add(saveRes.getId()); 
  }
    
  for(User_Profile_Event__c  uList:[select id from User_Profile_Event__c where  id IN:upeIds]){
   Reports__c rp =new Reports__c();
    rp.RE_Name__c='Report By Industry';
    rp.UPE_id__c =uList.id;
    rpList.add(rp);
    Reports__c rp2 =new Reports__c();
    rp2.RE_Name__c='Report By Geography';
    rp2.UPE_id__c =uList.id;
    rpList.add(rp2);
  }
   database.insert(rpList);
   
   
    //==================== update att-event jun ===================
     List<string> forattjunupdate = new List<string>();
   for(user uy:[select id,userName from user where id IN :sendEmailToUploaded]){
   	forattjunupdate.add(uy.userName);   
   }
   
   
   List<Event_Attendee_Mapping__c> attupdate =new List<Event_Attendee_Mapping__c> ();
   for(Event_Attendee_Mapping__c UA : [SELECT id,AS_id__c,Boothleads_Profile__c,AS_id__r.AS_Email__c from Event_Attendee_Mapping__c  where AS_id__r.AS_Email__c IN :forattjunupdate]){
   	UA.Boothleads_Profile__c='Booth Admin';
   	attupdate.add(UA);
   }
   dataBase.update(attupdate,false);
   
   
   
  }
   
   
   
  @future
  public static void myMethod(List<id> userIds){
  	List<user> emailPasswords = new List<user>();
  for(user BoothAdminUser:[select id,userName,Email from user where Id IN:userIds]){
    System.ResetPasswordResult rt= system.ResetPassword(BoothAdminUser.id,true);
    BoothAdminUser.password__c =rt.getPassword();
    emailPasswords.add(BoothAdminUser);   
   }
     dataBase.Saveresult[] rty= dataBase.update(emailPasswords,false) ;
  	
  } 
   
   
}