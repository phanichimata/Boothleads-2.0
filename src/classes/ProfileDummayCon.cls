public with sharing class ProfileDummayCon {
 public PageReference resetPassword() {
     Pagereference pg = new pagereference('/apex/BL_ResetPassword');
    pg.setredirect(true);
        return pg;
    }


public PageReference EventAction() {
    Pagereference pg = new pagereference('/apex/BL_Events');
    pg.setredirect(true);
        return pg;
        
    }
    public PageReference Customeraction() {
   Pagereference pg = new pagereference('/apex/BL_BoothPersonnels');
    pg.setredirect(true);
        return pg;
       
    }
    public PageReference AttendeesAction() {
     Pagereference pg = new pagereference('/apex/BL_Attendees');
    pg.setredirect(true);
        return pg;
       
    }
public PageReference Reportsaction() {
   Pagereference pg = new pagereference('/apex/BL_Reports');
    pg.setredirect(true);
        return pg;
     
    }
    
    public String booleanforDisplayBoothadminTab { get; set; }

    public PageReference save() {
    update listOfSummary;
    
    user u=[select FirstName,LastName,Email,Title from user where email =:userInfo.getUserName() limit 1];
    
    u.FirstName = listOfSummary.AS_FirstName__c;
    u.LastName =listOfSummary.AS_LastName__c;
    u.Title =listOfSummary.AS_Title__c;
   update u;
    
        return null;
    }

public AttendeeSummary__c listOfSummary {get;set;}
public string tax{get;set;}
    public ProfileDummayCon(){ 
   listOfSummary = new AttendeeSummary__c();
   listOfSummary=[Select a.SystemModstamp, a.OwnerId, a.Name, a.LastModifiedDate,
                    a.LastModifiedById, a.LastActivityDate, a.IsDeleted, a.Id, a.CreatedDate,
                    a.CreatedById, a.AS_WorkZipCode__c, a.AS_WorkState__c, a.AS_WorkPoBox__c,
                    a.AS_WorkPhone__c, a.AS_WorkCountry__c, a.AS_WorkCity__c, a.AS_WorkAddress2__c, 
                    a.AS_WorkAddress1__c, a.AS_WebsiteUrl__c, a.AS_Title__c, a.AS_ThroughEventBrite__c,
                    a.AS_Suffix__c, a.AS_ShippingZipcode__c, a.AS_ShippingState__c, a.AS_ShippingPoBox__c,
                    a.AS_ShippingPhone__c, a.AS_ShippingCountry__c, a.AS_ShippingCity__c, a.AS_ShippingAddress2__c,
                    a.AS_ShippingAddress1__c, a.AS_SecondaryBusinessCategory1__c, a.AS_PrimaryBusinessCategory1__c, 
                    a.AS_Prefix__c, a.AS_NumberOfEmployees__c, a.AS_NAICSCode5__c, a.AS_NAICSCode4__c, a.AS_NAICSCode3__c,
                    a.AS_NAICSCode2__c, a.AS_NAICSCode1__c, a.AS_LastName__c, a.AS_ImageUrl__c, a.AS_HomeZipcode__c, 
                    a.AS_HomeState__c, a.AS_HomePoBox__c, a.AS_HomePhone__c, a.AS_HomeCountry__c, a.AS_HomeCity__c, 
                    a.AS_HomeAddress2__c, a.AS_HomeAddress1__c, a.AS_Gender__c, a.AS_FirstName__c, a.AS_FaxNumber__c, 
                    a.AS_Email__c, a.AS_DiversityType__c, a.AS_Company__c, a.AS_CellPhone__c, a.AS_BusinessTaxId__c, 
                    a.AS_BusinessRevenue__c, a.AS_BusinessEstablishedDate__c, a.AS_BusinessDunsNumber__c, a.AS_BusinessDescription__c,
                    a.AS_BlogUrl__c, a.AS_BirthDate__c, a.AS_Age__c From AttendeeSummary__c a where a.AS_Email__c =:UserInfo.getUserName() limit 1];
   
    
       string AllNumbers =String.valueOf(listOfSummary.AS_NumberOfEmployees__c);
       string tax1=String.valueOf(listOfSummary.AS_BusinessTaxId__c); 
     
       
          
     system.debug('xxxxxxxxxxxxxxxxxx   '+AllNumbers );
     // =integer.valueOf(removeComma(String.valueOf(listOfSummary.AS_BusinessRevenue__c)));
    // system.debug('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy '+integer.valueOf(removeComma(String.valueOf(listOfSummary.AS_BusinessRevenue__c))));
     if(AllNumbers != null || AllNumbers != '')
     tax = removeComma(AllNumbers);
     tax1= removeComma(tax1); 
   
   }
   
   
    public String removeComma(String s){
        
        
        if(s.contains(','))
        {
            s=s.replaceall(',','');
        }
        
    return s;
    }
}