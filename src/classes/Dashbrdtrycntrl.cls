public class Dashbrdtrycntrl {

// Constructor Start 

public Dashbrdtrycntrl ()  {
 chartpopup = true;
 // PageReportBool = true; 
 geoChart();
 industryAdminChart();

}

// Constructor End


 // Variable Declaration Start  
   public AggregateResult[] graphy {get;set;} 
   public AggregateResult[] induchrt{get;set;}
   public Boolean chartpopup {get;set;}
   
   public Boolean PageReportBool {get;set;}
   public Boolean EditReportBool {get;set;}
   public List<Reports__c> reportTypes {get;set;}
   public Reports__c editRep  {get;set;}
   public String eventName {get;set;}
   
 // Variable Declaration End
   
   
   // Paginations Start 
   
   

   
   // Paginations End
   
   
   // Methods start
   
    public PageReference ChooseReport()  {
     
     
     return null;
     }

   public Pagereference BackChartAction()  {
   chartpopup = true;
   PageReportBool = false; 
   
   return null;
   }
   
 public pagereference geoChart()
 {       
     graphy = [select AS_WorkState__c,count(id) from AttendeeSummary__c
                   group by AS_WorkState__c]; 
    
     system.debug('hiiiiiiiiiii@@@@' +graphy );
     
     grphy= new list<geographyinner>();
     
     for ( AggregateResult ta : graphy )
     {
  
     geographyinner es = new geographyinner(ta);
     grphy.add(es);
     
     }
     
  return null;
 }

 // Industry chart
public pagereference industryAdminChart()
{
   try
    {    
     induchrt= [select AS_Company__c,count(id) from AttendeeSummary__c group by AS_Company__c];
     system.debug('aaaaaaaaaaaa' +induchrt);
     indus = new list<industryinner>();
     
     for ( AggregateResult iat : induchrt)
     {
     industryinner res = new industryinner(iat);
     indus.add(res);
     }
    } 
   catch (Exception e){}
   
return null;
}

public PageReference SampleAction()  {

chartpopup = false;
  PageReportBool = true; 
   reportTypes = new List<Reports__c>();
   
    
   reportTypes = [select id,RE_Description__c,RE_Name__c,CreatedDate from Reports__c];

return null;
}


public PageReference EditReport()  {

 system.debug('----------------------------'+eventname);
        EditReportBool=TRUE;
        EditRep = new  Reports__c();
        EditRep = [select id,RE_Description__c,RE_Name__c,CreatedDate from Reports__c];
    
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
   
  
// inner class

public list<GeographyInner> grphy{get;set;}

public class GeographyInner
{
public integer georecords{get;set;}
public string geogy{get;set;}

 public GeographyInner(AggregateResult ge)
 {
      georecords= (integer)ge.get('expr0');
      geogy = (string)ge.get('AS_WorkState__c'); 
 }
 
}


//inner class 

public list<IndustryInner> indus{get;set;}

public class IndustryInner
{

public integer indusrec{get;set;}
public string industry{get;set;}

public IndustryInner(AggregateResult re)
 {
      indusrec= (integer)re.get('expr0');
      industry= (string)re.get('AS_Company__c');
 }

}

}