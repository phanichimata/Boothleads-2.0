public class Dashboardcntrltryjuly23 
{
// Constructor Start 

 public Dashboardcntrltryjuly23() 
 { 
  PageReportBool=true;
  geoChart();
  industryAdminChart();
 }

// Constructor End   
   
   
// Variable Declaration Start  
  public AggregateResult[] graphy {get;set;} 
  public AggregateResult[] induchrt{get;set;}
  public Boolean PageReportBool {get;set;}
// Variable Declaration End 
 
   
// Methods start
   
 public pagereference geoChart()
 {       
   graphy = [select AS_WorkState__c,count(id) from AttendeeSummary__c group by AS_WorkState__c LIMIT 5];     
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
   induchrt= [select AS_Company__c,count(id) from AttendeeSummary__c group by AS_Company__c limit 5];
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