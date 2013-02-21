public with sharing class AttendeeSelfRegistrationCon {


// DIversity Type
public pagereference eventinfo(){
     return null;
}
public pagereference eventschedule(){
     return null;
}




 
    public list<Selectoption> options{get;set;}
   
    
    
    public Boolean welcomeNote{get;set;}
   
    public String FirstName{get;set;}  
    
    public String Lastname{get;set;}
    
    public boolean eventInfo{get;set;}
    
    public boolean eventSchedule{get;set;}
    
    Public string selectedvaluesfordiversity{get;set;}

 public String[] selectedTicTypes{get;set;}
 public AttendeeSummary__c AtSummary{get;set;}
 
 public boolean out_variable{get;set;}
 
 public id  attid = apexpages.currentpage().getParameters().get('id');
 
 public id Eventid = apexpages.currentpage().getParameters().get('eid');
 
  public LIST<EventSchedule__c> eventscheduleDB{get; set;}
   public String[] DiversityTypes{get;set;}
   public String[] DiversityTypesforfirstLine{get;set;}
   public String[] DiversityTypesforsecondLine{get;set;}
   public List<Selectoption> Divoptions {get;set;}
   public List<Selectoption> Divoptionsforsecondline {get;set;}
   public Event__c eventInformation{get;set;}
   public Event__c evdiv{get;set;}
   public Event_Attendee_Mapping__c eam{get;set;}
    public AttendeeSelfRegistrationCon ()
    {
    
    
    
    }
    public AttendeeSelfRegistrationCon(ApexPages.StandardController controller) {
    
    Divoptions=new list<Selectoption>{};
    Divoptionsforsecondline=new list<Selectoption>{};
    eam = new Event_Attendee_Mapping__c();
     AtSummary = (AttendeeSummary__c)controller.getRecord();
     system.debug('+++++++++++++++++++++++++++++++++++++++++++++++++'+AtSummary);
    //FirstName = AtSummary.AS_FirstName__c;
    //Lastname= AtSummary.AS_LastName__c;
    system.debug('==================event id==================='+eventid);
    evdiv =[select EventDiversityValues__c from Event__c where id =: Eventid ];
     system.debug('==================event id==================='+evdiv.EventDiversityValues__c);
    String Div=evdiv.EventDiversityValues__c;
       string[] DiversityTypes1=Div.split(';');
       integer i=0;
         for(String Diversty : DiversityTypes1 ){
         if(math.MOD(i,2)==0){
        Divoptions.add(new SelectOption(Diversty ,Diversty ));
        }else{
         Divoptionsforsecondline.add(new SelectOption(Diversty ,Diversty ));
        }      
    i++;
    }try{
     eam=[select id,DiversityType__c,TicketTypes__c from Event_Attendee_Mapping__c where AS_id__c=:attid  AND EV_id__c =:Eventid];
     system.debug('===========11111=============='+eam.DiversityType__c);
     DiversityTypesforfirstline=new string[]{};
     DiversityTypesforsecondline=new string[]{};
     if(eam.DiversityType__c != null){
      system.debug('===========2222222=============='+eam.DiversityType__c);
    string diversity=eam.DiversityType__c;
    list<string> seldivs=diversity.split(';');
   system.debug('===========33333333=============='+seldivs);
    for(string dd:seldivs){
    
    DiversityTypesforfirstline.add(dd);
    
    DiversityTypesforsecondline.add(dd);
    system.debug('===========4444444444=============='+DiversityTypesforsecondline);
    }
    }
    options = new List<SelectOption>();
      string tickets=eam.TicketTypes__c;
        list<string> seldtics=tickets.split(',');
        for(string Tic:seldtics){
        options.add(new SelectOption(Tic,Tic));
        }
     string  TTT='';
             TTT=eam.TicketTypes__c;
    list<string> regticket=TTT.split(',');
    selectedTicTypes=new String[]{};
    for(string reg:regticket){
    selectedTicTypes.add(reg);
    }
    }catch(exception e){}
 eventInformation = [Select id,EV_Description__c,EV_EndDate__c,EV_EndTime__c,EV_EventLogo__c,EV_HistingAddr1__c,EV_HostedByEventBrite__c,AS_HostingAddr2__c,AS_HostingCity__c,EV_HostingCountry__c,
                        EV_HostingFax__c,EV_HostingLocation__c,EV_HostingOrgName__c,EV_HostingPhone__c,EV_HostingState__c,EV_HostingTimeZone__c,
                       EV_HostingZipcode__c,Primary__c,SecondaryCategory__c,EV_StartDate__c,StartTime__c,Status__c,EV_Title__c, EV_WebsiteURL__c from  Event__c where id =:Eventid];
    
    
    
    welcomeNote = true;
    
    out_variable = false;
    
    eventInfo = false;
   
    eventSchedule = false;
    
    
    System.debug('@@@@@AtSummary'+AtSummary );
    
   eventscheduleDB =[SELECT ES_StartDate__c,ES_StartTime__c,id,ES_Description__c, ES_EndTime__c, ES_Location__c, ES_Presenter__c,ES_ProgramName__c FROM EventSchedule__c WHERE EV_id__c =: Eventid ORDER BY ES_StartTime__c,ES_StartDate__c ];
    
    
     System.debug('@@@@@eventscheduleDB'+eventscheduleDB);
    

    }

   
  public pagereference submit(){
  
    system.debug('===========FFFFFFFFFFFFFF1111111=============='+ AtSummary.AS_LastName__c);
      system.debug('===========TTTTTTTTTTTTTT=============='+AtSummary);
 

   system.debug('===========FFFFFFFFFFFFFF22222222=============='+ AtSummary.AS_LastName__c);
 
  eam .DiversityType__c='';
           if(DiversityTypesforfirstline.size() != 0){
           for(string dtypes:DiversityTypesforfirstline){
           eam.DiversityType__c+=dtypes+';';
           }
           }
           if(DiversityTypesforsecondline.size() != 0){
           for(string dtypes:DiversityTypesforsecondline){
           eam.DiversityType__c+=dtypes+';';
           }
           }
            update eam ;
    
     update AtSummary;
  
    
    out_variable = true;
    
    
  return null;
  
  }


public pagereference cancel(){




pagereference pf = new pagereference('http://www.boothleads.force.com');

pf.setRedirect(true);

return pf;


}


public pagereference Check(){


pagereference pf = new pagereference('https://c.cs5.visual.force.com/apex/AttendeeSelfRegistration?id='+attid);

pf.setRedirect(true);

return pf;




return null;
}


public pagereference eventDetails(){

eventInfo = true; 

return null;

}


public pagereference EventClose(){

 eventInfo = false; 

return null;

}


public pagereference eventscheduleDetails(){

eventSchedule  = true;

return null;

}


public pagereference EventClose2(){

 eventSchedule = false; 

return null;

}

public pagereference UpdateProfile(){

welcomeNote = false;
return null;

}

// sates and Countries

public string SelectedCountry{get;set;}

public String SelectedState{get;set;}




public string SelectedCountry1{get;set;}

public String SelectedState1{get;set;}




public string SelectedCountry2{get;set;}

public String SelectedState2{get;set;}




static testMethod void testrest(){

Event__c event1 = new Event__c(EV_Title__c='testEvent1',EV_HostingTimeZone__c='Eastern Time(USA)',EV_EndDate__c=date.valueOf('2012-05-15 00:00:00'),EV_StartDate__c=date.valueOf('2012-05-11 00:00:00'),Event_Printer__c ='Avery 5392 Name badges',EventDiversityValues__c='Minority Owned Business Enterprise;Disadvantaged Business Enterprise;Service Disabled Veteran Business Enterprise;Small Business Enterprise;Ability One;Woman Owned Business Enterprise;SBA 8(A) Program;Veteran Owned Business Enterprise;Lesbian Gay Bisexual Transgender Business;Alaskan Native Corporation Owned Firm;Small Disadvantaged Business;Historically Underutilized Business Zone;Disabled Business Enterprise;Historically Black Colleges And Universities;SELF-CERTIFIED SMALL DISADVANTAGED BUSINESS');
insert event1;



AttendeeSummary__c att = new AttendeeSummary__c(AS_Age__c=20,AS_BirthDate__c=date.valueOf('1995-05-05'),AS_BlogUrl__c='www.globalnest.com',AS_BusinessDescription__c='fgsdamnabfbhsd',AS_BusinessDunsNumber__c='2450153',
               AS_BusinessEstablishedDate__c=date.valueOf('1995-05-06'),AS_BusinessRevenue__c=324533,AS_BusinessTaxId__c='hngsdvdvf',AS_CellPhone__c='9858590231',
               AS_Company__c='testattendeecompany',AS_DiversityType__c='Minority Owned Business Enterprise;Disadvantaged Business Enterprise;Service Disabled Veteran Business Enterprise;Small Business Enterprise;Ability One;Woman Owned Business Enterprise;SBA 8(A) Program;Veteran Owned Business Enterprise;Lesbian Gay Bisexual Transgender Business;Alaskan Native Corporation Owned Firm;Small Disadvantaged Business;Historically Underutilized Business Zone;Disabled Business Enterprise;Historically Black Colleges And Universities;SELF-CERTIFIED SMALL DISADVANTAGED BUSINESS ',
               AS_Email__c='test123@noemail.com',AS_FaxNumber__c='9858985032',AS_FirstName__c='testattendeesummaryfirstname',AS_Gender__c='Male',
               AS_HomeAddress1__c='mjbfnmf',AS_HomeAddress2__c='nbdfhj',AS_HomeCity__c='mhsdfgfd',As_Home_Country__c='India',AS_HomePhone__c='6998878422',
               AS_HomePoBox__c=22125,AS_HomePoboxNo__c='84367',As_Home_State__c='Goa',AS_HomeZipcode__c=32121,AS_ImageUrl__c='www.globalnest.com',AS_LastName__c='testattendeelastname',AS_NAICSCode1__c=524621,
               AS_NAICSCode2__c=524421,AS_NAICSCode3__c=524671,AS_NAICSCode4__c=523621,AS_NAICSCode5__c=528921,AS_NumberOfEmployees__c=200,AS_prefixNew__c='mr',
               AS_PrimaryBusinessCategory1__c='Accounting',AS_SecondaryBusinessCategory1__c='Animation',AS_ShippingAddress1__c='dfdf',AS_ShippingAddress2__c='dsyhg',
               AS_ShippingCity__c='asfdsf',As_Shipping_Country__c='India',AS_ShippingPhone__c='3554353132',AS_ShippingPoBox__c=32224,AS_Shippingpoboxno__c='35521',As_Shipping_States__c='Goa',
               AS_shippingzip__c='32122',AS_ShippingZipcode__c=89524,AS_SuffixNew__c='dr',AS_ThroughEventBrite__c=true,AS_Title__c='hmjnhgh',AS_WebsiteUrl__c='hasdas.com',AS_WorkAddress1__c='dsag',
               AS_WorkAddress2__c='fdwe',AS_WorkCity__c='ewqrwd',AS_Work_Country__c='India',AS_WorkPhone__c='3554353132',AS_WorkPoBox__c=52346,AS_Workpoboxno__c='85231',AS_Work_States__c='Goa',AS_WorkZipCode__c=85246,AS_WorkZip__c='89523',
               Registration_type__c='kdsmkas');
   insert att; 
   Event_Attendee_Mapping__c EAM1=new Event_Attendee_Mapping__c(EV_id__c=event1.id,AS_id__c=att.id,DiversityType__c='Service Disabled Veteran Business Enterprise',TicketTypes__c='Reception',EA_AttendeeBarcode__c='a0nvwsdwkde',EA_isBadgePrinted__c=true,IsPrifileUpdate__c=true);
insert EAM1;


    
    
    
    
    apexpages.currentpage().getparameters().put('eid' , event1.id);
     apexpages.currentpage().getparameters().put('id' , att.id);
   ApexPages.StandardController  controller = new ApexPages.StandardController (att); 
    AttendeeSelfRegistrationCon  bsExt = new AttendeeSelfRegistrationCon(controller);
    Test.setCurrentPageReference(new PageReference('AttendeeSelfRegistration')); 
   bsExt.submit();
      bsExt.eventDetails();
        bsExt.UpdateProfile();
          bsExt.EventClose2();
            bsExt.EventClose();
              bsExt.Check();
                bsExt.cancel();
                  bsExt.eventschedule();
                   bsExt.eventinfo();
   System.currentPageReference().getParameters().put('id' , att.id);
   
    System.currentPageReference().getParameters().put('eid' , event1.id);
 }
       
     
}