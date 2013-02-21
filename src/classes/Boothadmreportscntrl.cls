public class Boothadmreportscntrl {


// Constructor Start 

public Boothadmreportscntrl()   {
  
   getvalues();
   PageReportBool = true; 
 
}

// Constructor End


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
        
      }  
    return input;
    
    }




// Variable Declarations Start 

   public Boolean  GeographyReportBool {get;set;}
   public Boolean  IndustryReportBool {get;set;}
   public Boolean PageReportBool {get;set;}
   public Boolean EditReportBool {get;set;}
   public List<Reports__c> reportTypes {get;set;}
   public List<Reports__c> evntReports{get;set;}
   public Reports__c editRep  {get;set;}
   public String eventName {get;set;}
   public String eventSelected {get;set;}
   public LIST<SelectOption> Items{get; set;}
 
   public LIST<LIST<User_Event_BVS__c>> geographycus{get;set;}
   public LIST<LIST<User_Event_BVS__c>> customers{get;set;}
   public LIST<User_Event_BVS__c> query{get;set;} 
   public LIST<User_Event_BVS__c> query1{get;set;}
   public LIST<User_Event_BVS__c> cus12{get;set;} 
   public List<User_Event_BVS__c> an{get;set;}
   public string s {get;set;}
   public List<Event__c> eventlist {get;set;}
   public List<User_Event_BVS__c> gn{get;set;}
   public string t{get;set;}

    
    
   
// Variable Declarations End





// Paginations Start

    public PageReference ReportsAction() {
        return null;
    }


    public PageReference AttendeesAction() {
        return null;
    }
 

    public PageReference CustomerAction() {
        return null;
    }


    public PageReference EventAction() {
        return null;
    }


    public PageReference ProfileAction(){ 
        return null;
    }




// Paginations End


// Methods Start

public void BackAction() {
        IndustryReportBool = false;
        GeographyReportBool = false;
        PageReportBool = true;
       
    }



  public void getevents()
    {
    
     string tt= userInfo.getUserName();
        
           evntReports = new list<Reports__c>();
           if(eventSelected != null || eventSelected !='')
           {
             integer reccount = 0;
             
             evntReports = [select id,RE_Description__c,RE_Name__c,CreatedDate from Reports__c WHERE  UPE_id__r.EV_id__r.EV_Title__c =:eventSelected ];  
            system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee and UPE_id__r.User_id__r.UserName =:\'Anil N\''+evntReports);
           for(Reports__c j:evntReports )
           {
               j.RE_Description__c = escapeSpecialCharacters(j.RE_Description__c);
               recCount++;
            
               system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'+evntReports); 
                             
    } 
    
    
           }    
   
    } 


 public void getvalues()
   {
   
       LIST<User_Profile_Event__c> events = new LIST<User_Profile_Event__c>();
       string ss = userInfo.getUserName();
       system.debug('ssssssssssssssssssssssssssssssssssssssssssss'+ss);
       Items = new LIST<selectoption>();
  
       
       events = [SELECT id,EV_id__c, EV_id__r.EV_Title__c,Profile_id__r.PR_Name__c  FROM User_Profile_Event__c WHERE User_id__r.UserName =:ss ORDER BY CreatedDate ASC];
     
      system.debug('anillllllllllllllllllll'+ss);
     
     set<id> eventids = new set<id>();
     
     for(User_Profile_Event__c eventtitle :events )
     {
     if(eventtitle.Profile_id__r.PR_Name__c !='Attendee' && eventtitle.Profile_id__r.PR_Name__c !='BoothPersonnel'){
        system.debug('8888888888888888888888888888888888888888888888888888888888'+eventtitle.Profile_id__r.PR_Name__c); 
     
    }
     eventids.add(eventtitle.EV_id__c);
     
     
     }
     
     eventlist = [select id,EV_Title__c from Event__c where id in :eventids];
    
     eventSelected =eventlist[0].id;
           for(Event__c Even: eventlist)
           {
              
               Items.add(new SelectOption(Even.id, Even.EV_Title__c));
              
           }
      getevents();
       
     
            
   }



     public PageReference ChooseReport()  {
     
       system.debug('----------------------------eventname------------------'+eventname);
         PageReportBool=false;
  
       if(eventname !=null && eventname == 'Report By Industry')
       {
       system.debug('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'+eventname); 
        IndustryReportBool = TRUE;
       
        customers = new List<List<User_Event_BVS__c>> ();
        integer recCount=0;
        
        query =  [select id,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c,
                            BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c,
                            BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c,
                            BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c,
                            BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c,
                            BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c
                         from User_Event_BVS__c where EV_id__r.EV_Title__c =:eventSelected];
                         
                         
                           
               system.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+query);            
          
             an=new List<User_Event_BVS__c>();
       
      for(User_Event_BVS__c s:query)
      
   {
   
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c);
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c);
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c);
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c= escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c);
      s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c = escapeSpecialCharacters(s.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_PrimaryBusinessCategory__c);
   
       recCount++;
       an.add(s);
       if(recCount==1000){
       customers.add(an);
       an = new LIST<User_Event_BVS__c>();
       recCount=0;
       }
      
  }
  if(recCount !=0)
  customers.add(an);
          
                
      }  
      else if(eventname !=null && eventname== 'Report By Geography')
       {
      
                // geochart();
              
                
                GeographyReportBool=TRUE;
               
                geographycus = new list<list<User_Event_BVS__c>> ();
                integer recCount=0;
                
                
                
      query1 =  [select id,BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c,
                        BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c,
                        BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c,
                        BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c,
                        BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c,
                        BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c
                         from User_Event_BVS__c where EV_id__r.EV_Title__c =:eventSelected];
                         
                                 system.debug('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'+geographycus);
      
             gn = new List<User_Event_BVS__c>();
       
      for(User_Event_BVS__c t:query1)
  {
  
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c = escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_FirstName__c);
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c = escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_LastName__c);
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c = escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_CellPhone__c);
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c = escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Email__c);
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c= escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_Company__c);
      t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c = escapeSpecialCharacters(t.BVS_id__r.EA_AttendeeBarcode__r.AS_id__r.AS_WorkState__c);
  
  
       recCount++;
       gn.add(t);
       if(recCount==1000){
       geographycus .add(gn);
       gn= new LIST<User_Event_BVS__c>();
       recCount=0;
       }
      
  }
  
  if(recCount !=0)
  geographycus.add(gn);
        
       }
      
    
     
     return null;
     }


public PageReference EditReport()  {

 system.debug('----------------------------'+eventname);
        EditReportBool=TRUE;
        EditRep = new Reports__c();
        EditRep = [select id,RE_Description__c ,RE_Name__c,CreatedDate from Reports__c where UPE_id__r.EV_id__r.EV_Title__c =:eventSelected ];
    
return null;
}


public PageReference UpdateReport()  {

EditRep.RE_Description__c = EditRep.RE_Description__c;
EditRep.RE_Name__c = EditRep.RE_Name__c;

update EditRep;

            Pagereference pg = new Pagereference('/apex/BL_Evntadmreports');
            pg.setRedirect(true);
            return pg; 
}

public PageReference cancel()  {
    
    EditReportBool=False;
 return null;
}


// Methods End





}