/***********************************************************************************************
*   Controller Name : QRCode_DataImportCon
*   Date            : 06/07/2012 
*   Author          : Naga Mallikarjuna Rao B
*   Purpose         : This class is for Import Attendee Information FROM CSV File
*   Change History  : 18/07/2012 
*       Date                 Programmer                     Reason
*   --------------      -------------------           -------------------------
*   23/07/2012          Naga Mallikarjuna Rao B           Tocreate Comments in TopOfPage
*   03/07/2012                BMR                         First Name,Last Name Fields positions change In VF
*   06/07/2012                BMR                         Writing Test method
*   16/08/2012                BMR                         Writing Code For Avoid Duplicates Through MAP(CheckDuplicate)
**************************************************************************************************/



public class QRCode_DataImportCon {
 
    
    public String searchStr{get; set;}
    public Blob contentFile { get; set; }
    public Boolean ErrorFilesize{get; set;}
    public String nameFile { get; set; }
    
    public Integer rowCount { get; set; }
    public Integer colCount { get; set; }    
    
    public string[] selectedValue{get;set;}
    
    public String singleEvent{get; set;}
    public Boolean showselectCSV{get; set;}

    public Static Integer UnSuccessPop{get; set;}
    public Boolean headerDisplay{get; set;}
    
    public Transient LIST<String> Displayrecords{get; set;}
    public LIST<String> StdImportHeaderNames1{get; set;}
    public LIST<String> StdImportHeaderNames2{get; set;}
    
    public List<SelectOption> csvHeaders{get; set;} 
    public MAP<String, String> CSVHeaderMapping{get; set;}
    public LIST<String> CSVHeaderToStore{get; set;}
     
    public String SelectdValue{get; set;}
    public String SelectdValue2{get; set;}
    
    public MAP<String, String> DBField{get; set;}
    public Transient String DBValue{get; set;}
    public Transient String DBValue2{get; set;}
    public LIst<InnerClass> innnnn{get;set;}
    public LIst<InnerClass2> innnnn2{get;set;}
    public Integer BeforeInsert{get; set;}
    public Integer AfterInsert{get; set;}
    public Boolean Successbool{get; set;}
    public Boolean DataImportBool{get; set;}

    public Boolean noFileChooseBool{get; set;}
    public String csvHeadersForFail{get; set;} 
    public static LIST<InnerClass> innerStatic{get; set;}
    public static LIST<InnerClass2> inner2Static{get; set;}
    public Static ID eventIdForAtt{get; set;}
    
    public String allFields1 {get;set;}
    public String allFields2{get;set;} 
   
   
   public Event__c eventToImport{get; set;}
   
    

    public Id UserId{get; set;}
    public String RecordStatus{get; set;}
       
       public Pagereference checkUserId()
       {
       
           System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
          
        if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
        {
                                  
           Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=QRCode_extendsDataImport');
                 Pg.setredirect(true);
                 return pg;
    
           
        }else {
                 return null;
            }
            
            
          
       
       }
       
      
       
       
        public QRCode_DataImportCon()
        {
            
            headerDisplay = TRUE;
            showselectCSV=FALSE;
            ErrorFilesize=FALSE;
            noFileChooseBool = FALSE;
            
            eventIdForAtt = ApexPages.currentpage().getparameters().get('id');

            system.debug('kkkkkkkkkkkkkkkkkkkkkk'+ eventIdForAtt );
            
            DBField = new MAP<String, String>();
            
            DBField.put('none','NONE');
            DBField.put('Prefix','AS_Prefix__c');
            DBField.put('First Name','AS_FirstName__c');
            DBField.put('Last Name','AS_LastName__c');
            DBField.put('Suffix', 'AS_Suffix__c');
            DBField.put('Company Name', 'AS_Company__c');
            DBField.put('Designation','AS_Title__c');
            DBField.put('Email Id', 'AS_Email__c');
            DBField.put('Mobile Number', 'AS_CellPhone__c');
            DBField.put('Gender','AS_Gender__c');
            DBField.put('Age','AS_Age__c');
            DBField.put('Date Of Birth' , 'AS_BirthDate__c');
            DBField.put('Work Address 1','AS_WorkAddress1__c');
            DBField.put('Work Address 2', 'AS_Workaddress2__c');
            DBField.put('Work City','AS_Workcity__c');
            DBField.put('Work State', 'AS_WorkState__c');
            DBField.put('Work Country', 'AS_WorkCountry__c');
            DBField.put('Work Phone Number','AS_WorkPhone__c');
            DBField.put('Work Zip Code', 'AS_WorkPOBox__c');
            DBField.put('Business Description','AS_BusinessDescription__c');
            DBField.put('Business Establish Date', 'AS_BusinessEstablishedDate__c');
            DBField.put('Business DnB Id', 'AS_BusinessDunsNumber__c');
            DBField.put('No. Of Employes','AS_NumberOfEmployees__c');
            DBField.put('Business Revenue','AS_BusinessRevenue__c');
            DBField.put('Business Tax Id', 'AS_BusinessTaxId__c');
            DBField.put('Work Fax Number', 'AS_FaxNumber__c');
            DBField.put('Primary Business Category', 'AS_PrimaryBusinessCategory1__c');
            DBField.put('Secondary Business Category','As_SecondaryBusinessCategory1__c');
            DBField.put('Shipping Address 1', 'AS_Shippingaddress1__c');
            DBField.put('Shipping City','AS_shippingCity__c');
            DBField.put('Shipping State', 'AS_shippingState__c');
            DBField.put('Shipping Zip Code','AS_ShippingPOBox__c');
            DBField.put('Shipping Address 2','AS_ShippingAddress2__c');
            DBField.put('Shipping Zip COde','AS_ShippingPOBox__c');
            DBField.put('Blog URL','AS_BlogURL__c');
            DBField.put('WebSite URL', 'AS_WebsiteURL__c');
            DBField.put('Home Phone Number','AS_HomePhone__c');
            DBField.put('Home Address 1','AS_Homeaddress1__c');
            DBField.put('Home Address 2', 'AS_Homeaddress2__c');
            DBField.put('Home City','AS_HomeCity__c');
            DBField.put('Home State', 'AS_HomeState__c');
            DBField.put('Home Zip Code','AS_HomeZipcode__c');
            DBField.put('Through EventBrite', 'AS_ThroughEventBrite__c');
            DBField.put('Survey Answers','AS_Survey_Answers__c');
            DBField.put('Diversity Type', 'AS_DiversityType__c');
            DBField.put('NAICS Code 1','AS_NAICSCode1__c');
            DBField.put('NAICS Code 2', 'AS_NAICSCode2__c');
            DBField.put('NAICS Code 3','AS_NAICSCode3__c');
            DBField.put('NAICS Code 4','AS_NAICSCode4__c');
            DBField.put('NAICS Code 5', 'AS_NAICSCode5__c');
            DBField.put('Registration Type', 'Registration_type__c');
    
          /*  
           allFields1='Prefix,Last Name,Email Id,Designation,Mobile Number,Work Fax Number,Gender,Home Address 1,Home City,Home Zip Code,Work Address 2,Work State,Shipping Address 1,Shipping City,Shipping Zip Code,Secondary Business Category,Business Establish Date,Business Tax Id,WebSite URL,Diversity Type,NAICS Code 1,NAICS Code 3,NAICS Code 5';
           StdImportHeaderNames1= allFields1.split(',');
          
           allFields2='First Name,Suffix,Company Name,Home Phone Number,Work Phone Number,Age,Date Of Birth,Home Address 2,Home State,Work Address 1,Work City,Work Zip Code,Shipping Address 2,Shipping State,Primary Business Category,No. Of Employes,Business Revenue,Business DnB Id,Blog URL,Business Description,NAICS Code 2,NAICS Code 4';
           StdImportHeaderNames2=allFields2.split(',');
        */
            RecordStatus = 'BoothLeads.com will now begin to import your file. You will be notified by email at' + '<B>'+' {!$user.Username}'+'</b>'+' when your import is completed.'+ '<br/>'+ 'Based on the current volume of import activity, we estimate that your import will be completed in approximately 3 minutes.';
            
           //----------------------------------------------------------------------------
            
            BL_SecuritySettingsCon attendeeSetting = new BL_SecuritySettingsCon(ApexPages.currentpage().getparameters().get('id'));
            
            String allFields1='';
            String allFields2='';
            
           if(attendeeSetting.Prefix)
               allFields1 +='Prefix,';
           if(attendeeSetting.ReqFields)
               allFields1 +='First Name,';
           if(attendeeSetting.ReqFields)
               allFields1 +='Email Id,';
           if(attendeeSetting.degi)
               allFields1 +='Designation,';
           if(attendeeSetting.mobile)
               allFields1 +='Mobile Number,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work Fax Number,';
           if(attendeeSetting.gen)
               allFields1 +='Gender,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home Address 1,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home City,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home Zip Code,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work Address 2,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work State,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping Address 1,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping City,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping Zip Code,';
           if(attendeeSetting.SBC)
               allFields1 +='Secondary Business Category,';
           if(attendeeSetting.BEDate)
               allFields1 +='Business Establish Date,';
           if(attendeeSetting.BTaxID)
               allFields1 +='Business Tax Id,';
           if(attendeeSetting.webUrl)
               allFields1 +='WebSite URL,';    
           if(attendeeSetting.DT)
               allFields1 +='Diversity Type,';
           if(attendeeSetting.NAICSCode1)
               allFields1 +='NAICS Code 1,';    
           if(attendeeSetting.NAICSCode3)
               allFields1 +='NAICS Code 3,';
           if(attendeeSetting.NAICSCode5)
               allFields1 +='NAICS Code 5,';
                   
              
           
     allFields1.substring(0, allFields1.lastIndexOf(','));
     StdImportHeaderNames1= allFields1.split(',');
     
          if(attendeeSetting.sufix)
               allFields2 +='Suffix,';
           if(attendeeSetting.ReqFields)
               allFields2 +='Last Name,';  
           if(attendeeSetting.comp)
               allFields2 +='Company Name,';  
           if(attendeeSetting.homeinfo)
               allFields2 +='Home Phone Number,';
           if(attendeeSetting.workinfo)
               allFields2 +='Work Phone Number,';  
           if(attendeeSetting.age)
               allFields2 +='Age,';
           if(attendeeSetting.dob)
               allFields2 +='Date Of Birth,';  
           if(attendeeSetting.homeinfo)
               allFields2 +='Home Address 2,Home State,';
           if(attendeeSetting.workinfo)
               allFields2 +='Work Address 1,Work City,Work Zip Code,';
           if(attendeeSetting.Shippinginfo)
               allFields2 +='Shipping Address 2,Shipping State,';  
           if(attendeeSetting.pbc)
               allFields2 +='Primary Business Category,';
           if(attendeeSetting.NOEmp)
               allFields2 +='No. Of Employes,';  
           if(attendeeSetting.BRev)
               allFields2 +='Business Revenue,';
           if(attendeeSetting.BDN)
               allFields2 +='Business DnB Id,';  
           if(attendeeSetting.blogURL)
               allFields2 +='Blog URL,';
           if(attendeeSetting.BDesc)
               allFields2 +='Business Description,';  
           if(attendeeSetting.NAICSCode2)
               allFields2 +='NAICS Code 2,';
           if(attendeeSetting.NAICSCode4)
               allFields2 +='NAICS Code 4,';
           if(attendeeSetting.Registration)
               allFields2 +='Registration Type,';
          
          
       allFields2.substring(0,allFields2.lastIndexOf(','));
       StdImportHeaderNames2=allFields2.split(',');    
       
       
       //------------------------------------------------------------------------------------
            
            
            
        }
        
        public List<SelectOption> getEvents() 
         {
             
             
               return null;
         }
        
        public PageReference Events () {
        Pagereference pg = new Pagereference('/apex/BL_EventAdmin_Events');
        Pg.setredirect(true);
        return pg;
      
        }
       public PageReference Attendees() {
           Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_Attendees');
                pg.setRedirect(true);
                return pg;
           
        }
        
        public PageReference reportact() {
            
             pagereference pg = new pagereference('/apex/BL_Evntadmreports');
             pg.setredirect(true);
            return pg;
        
            
        }
        
         public PageReference DataImportaction() {
           
         pagereference pg = new pagereference('/apex/QRCode_DataImport?id='+ApexPages.currentpage().getparameters().get('id'));
         pg.setredirect(true);
            return pg;
            
        }
    
        
        public PageReference CustomerAdminAct() 
        {
            pagereference pg = new Pagereference('/apex/BL_Eventadmin_samplebooth');
            pg.setredirect(true);
                return pg;
        }

        Public PageReference ProfileSettings()
        {
            Pagereference pg = new Pagereference('/apex/BL_Eventadmin_Profile');
            Pg.setredirect(true);
            Return pg;
        }    
        
       public PageReference DashboardAction() {
           pagereference pg = new pagereference('/apex/BL_Eventadmin_Dashboard');
           pg.setredirect(true);
             return pg;
     }
        
    
         public List<String> parseCSV(String contents,Boolean skipHeaders) {
         
                List<String> allFields = new List<String>();
              // csvHeaders= new List<String>();
               
               
                // replace instances where a double quote begins a field containing a comma
                // in this case you get a double quote followed by a doubled double quote
                // do this for beginning and end of a field
                //contents = contents.replaceAll(',',',DBLQT').replaceall(',','DBLQT,');
                contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
                // now replace all remaining double quotes - we do this so that we can reconstruct
                // fields with commas inside assuming they begin and end with a double quote
                //contents = contents.replaceAll('"','DBLQT');
                contents = contents.replaceAll('""','DBLQT');
                // we are not attempting to handle fields with a newline inside of them
                // so, split on newline to get the spreadsheet rows
                List<String> lines = new List<String>();
                try {
                    //lines = contents.split('\n'); //correction: this only accomodates windows files
                    lines = contents.split('\r'); // using carriage return accomodates windows, unix, and mac files
                    //http://www.maxi-pedia.com/Line+termination+line+feed+versus+carriage+return+0d0a
                    system.debug('{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{'+ contents  );
                    system.debug('}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}'+ lines  );
                   // system.debug('}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}'+ lines.size()  );
                    
                } catch (System.ListException e) {
                    System.debug('Limits exceeded?' + e.getMessage());
                }
                Integer num = 0;
                for(String line: lines) {
                
                system.debug('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'+ line);
                system.debug('``````````````````````````````````````````'+ lines.size()  );
                    // check for blank CSV lines (only commas)
                    if (line.replaceAll(',','').trim().length() == 0) break;
                   
                    List<String> fields = line.split(','); 
                    String cleanFields='';
                    String compositeField;
                    Boolean makeCompositeField = false;
                    for(String field: fields) {
                    system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+ field );
                    field = field.trim();
                    system.debug('5555555555555555555555555'+ field.startsWith('"') );
                    system.debug('6666666666666666666666666'+ field.endsWith('"') );
                    system.debug('7777777777777777777777777'+ (field.startsWith('"') && field.endsWith('"')) );
                   // system.debug('8888888888888888888888888'+ field.endsWith('"') );
                   
                       if(field == '"'){ 
                        system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ field);
                            compositeField += ',' + field;
                            cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                              makeCompositeField = FALSE;
                        }else if (field.startsWith('"') && field.endsWith('"')) {
                            cleanFields+=(field.replaceAll('DBLQT','"')+';;;:::' );
                            system.debug('1111111111111111111111111111111111111111111111111'+ field); 
                        } else if (field.startsWith('"')) {
                          system.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'+ field);
                            makeCompositeField = true;
                            compositeField = field;
                        }else if (field.endsWith('"')) {
                            system.debug('22222222222222222222222222222222'+ field);
                            compositeField += ',' + field;
                            cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                            makeCompositeField = false;
                        } else if (makeCompositeField) {
                        system.debug('3333333333333333333333333333333333333'+ field);
                            compositeField +=  ',' + field;
                        } else {
                        system.debug('444444444444444444444444444444444444444'+ field);
                            cleanFields+=(field.replaceAll('DBLQT','"')+';;;:::');
                        }
                        
                       
                     }
                     system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ cleanFields);  
                    allFields.add(cleanFields);
                }
                
               // if (skipHeaders) allFields.remove(0);
                return allFields;      
            }
     
        
    
        
        public List<String> getResults() {
        
          List<String> parsedCSV = new List<String>();
    
            
            
            
        try{
            rowCount = 0;
            colCount = 0;
            if (contentFile != null){
    
                system.debug('11111111111111111111111111111111'+ contentFile );
                String fileString = contentFile.toString();
                parsedCSV = parseCSV(fileString, true);
                
                integer columncount = 0;
                CSVHeaders = new List<SelectOption>();
                CSVHeaderMapping = new MAP<String, String>();
                CSVHeaderToStore = new LIST<String>();
                CSVHeaders.add(new SelectOption('NONE','NONE'));
                
                
                for(String ss: parsedCSV[0].split(';;;:::'))
                  {
                      CSVHeaders.add(new SelectOption(String.valueOf(columncount),ss));
                      CSVHeaderMapping.put(ss.toLowerCase() , String.valueOf(columncount));
                      CSVHeaderToStore.add(ss);
                      columncount ++;
                  }
                
                system.debug('rrrrrrrrrrrrrrrrrrrrrrrrrrr'+ CSVHeaders );
                
                rowCount = parsedCSV.size();
            }
            Displayrecords = parsedCSV;
         }
         catch(Exception e)
         {
             UTF8Bool=TRUE;
         }
          return Displayrecords;
        }    
       
        public Boolean ShowMapping{get; set;}
        public Boolean UTF8Bool{get; set;}
    
        public void clickUpload()
        { 
          if(contentFile!= NULL)
          {     
            if(contentFile.size() <=460000)
            {
    
            try{
                    getResults();
                    
                    headerDisplay = FALSE;
                    showselectCSV = TRUE;
                    
               }catch(Exception e){
                    UTF8Bool=TRUE;
              }
            
           innnnn = new LIst<InnerClass>();
           innnnn2 = new LIst<InnerClass2>();
           innerStatic = new LIst<InnerClass>(); 
           inner2Static = new LIst<InnerClass2>();
           
         /*  LIST<String> arrayofString = new LIST<String>();
           
           arrayofString.add('Last Name');
           arrayofString.add('First Name');
           arrayofString.add('Title');
           arrayofString.add('Account Name');
           arrayofString.add('Email');
           arrayofString.add('Title');
           */
         // SelectOption CSVHeaders;// = new SelectOption();
         // CSVHeaders = new SelectOption('malli','mallik');
           
         //  arrayofString[iii]
           integer iii = 0;
           
           system.debug('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'+ CSVHeaderMapping );
           
            callingCustomNapping();
           
            system.debug('1111111111111111111111'+ innnnn);
            
          }else{
              contentFile =null; 

              ErrorFilesize=TRUE;
          }  
        
        }else
           noFileChooseBool=TRUE;
        
        }
     
         
         // To perform The Custom Mapping of Fields
        public void callingCustomNapping()
        {
          
            User uu = [SELECT id, Attemdees_Mapping__c FROM USER WHERE id =: userInfo.getUserId() ];
               
               system.debug('!!!!!!!!!!!!!!!!!!!!!'+ uu.Attemdees_Mapping__c );
          
          
            if(uu.Attemdees_Mapping__c == NULL){
                 
                for(String dis: StdImportHeaderNames1)
               {
                   system.debug('yyyyyyyyyyyyyyyyyyyyyyyy'+ dis );
                   system.debug('ttttttttttttttttttttttttt'+ CSVHeaderMapping.get(dis.toLowerCase()) );
              /* if(dis == 'Prefix')
                  {
                      dis = 'Prefix 123'; 
                      system.debug('zzzzzzzzzzzzzzzzzzzzzzzzz'+ dis );
                      system.debug('wwwwwwwwwwwwwwwwwwwwwwwww'+ CSVHeaderMapping.get(dis.toLowerCase()) );
                  } 
               */   
                  
                  
                   innnnn.add(new innerclass(dis,CSVHeaderMapping.get(dis.toLowerCase())));
                   innerStatic.add(new innerclass(dis,SelectdValue));
                   
                  /*
                   else{
                   innnnn.add(new innerclass(dis,SelectdValue));
                   innerStatic.add(new innerclass(dis,SelectdValue));
                   }  */
               }
                      
               
               for(string DBValue2: StdImportHeaderNames2)
               {
                    innnnn2.add(new InnerClass2(DBValue2,CSVHeaderMapping.get(DBValue2.toLowerCase())));
                    inner2Static.add(new InnerClass2(DBValue2,SelectdValue2));
               }
            }else{
                    
                   
                   
                    String ss = uu.Attemdees_Mapping__c;
                    LIST<String> goToMap = new LIST<String>();
                    
                    system.debug('AAAAAAAAAAAAAAAAAA'+ ss.length() );
                    
                    system.debug('QQQQQQQQQQQQQQQQQQQQ'+ ss.indexOf(';;;;;:::::',0) );
                    
                    system.debug('QQQQQQQQQQQQQQQQQQQQ'+ ss.split(';;;;;:::::').size() );
                    
                    goToMap.addAll(ss.split(';;;;;:::::'));
                    
                   system.debug('BBBBBBBBBBBBBBBBBBBBBBBBBBB'+ goToMap );
                    system.debug('CCCCCCCCCCCCCCC'+ goToMap.size() );
                    
                    Map<String, String> matchingMap = new Map<String, String>();
                    
                    for(String s1: goToMap ){
                        
                        matchingMap.put(s1.SubString(0, s1.indexOf('&*$%^', 0)).toLowerCase(), s1.SubString(s1.IndexOf('^')+1)  );
                    
                    }
                    
                   system.debug('DDDDDDDDDDDDDDDDDDDDDDDDDD'+ matchingMap );
                     
                   
              //------------------------------------------------     
               for(String dis: StdImportHeaderNames1)
               {
                 try{  
                   innnnn.add(new innerclass(dis,CSVHeaderMapping.get(matchingMap.get(dis.toLowerCase()).toLowerCase() )));
                   innerStatic.add(new innerclass(dis,SelectdValue));
                   }catch(Exception e){
                       
                       innnnn.add(new innerclass(dis,SelectdValue));
                        innerStatic.add(new innerclass(dis,SelectdValue));
                   
                   }
                 
               }
                      
               
               for(string DBValue2: StdImportHeaderNames2)
               {    
                   try{
                   system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ DBValue2  );
                    innnnn2.add(new InnerClass2(DBValue2,CSVHeaderMapping.get(matchingMap.get(DBValue2.toLowerCase()).toLowerCase() )));
                    inner2Static.add(new InnerClass2(DBValue2,SelectdValue2));
                    }catch(Exception e){
                    
                        innnnn2.add(new InnerClass2(DBValue2,SelectdValue2));
                        inner2Static.add(new InnerClass2(DBValue2,SelectdValue2));
                    }
               }
                   
               //---------------------------------------------------------    
                system.debug('VVVVVVVVVVVVVVVVVVVVVVVVV'+ innnnn);
                      
            }   
        
        
        }
         
         
     
        public Transient  LIST<AttendeeSummary__c> totalAttendee{get; set;} 
        public Static Integer Successpop{get; set;}
        public string phnumber {get;set;}
        public Transient LIST<AttendeeSummary__c> reqMissing{get; set;}
        
         public static Boolean validateEMail(string s)
         {
               Boolean  EmailBool = TRUE;
                   integer atpos=s.indexOf('@');
                   integer dotpos=s.lastIndexOf('.');
                                    
                   if (atpos<1 || dotpos<atpos+2 || dotpos+2>=s.length())
                  {
                       EmailBool = FALSE;
                  }
                    return EmailBool;
         }
    
        public static Boolean validateNAICSCode(integer s)
        {
        
            Boolean nAICSCode = FALSE;
            try{
                integer naCode = s;
                if(naCode > 100000 && naCode < 999999)
                   nAICSCode = TRUE;
                else
                    nAICSCode = FALSE;
               }catch(exception e){nAICSCode = FALSE;}
        
            return nAICSCode;
        }
        
        public static String ValidatePhone(String s)
        {
          Boolean isValid;
          
          String phoneString =s.replace(')','').replace('(','').replace(' ','').replace('-','');
          String  phNumber;  
            Pattern phonePattern = Pattern.compile('\\D*?(\\d\\D*?){10}'); 
            Pattern numericPattern = Pattern.compile('[0-9]{10}');
       
            Matcher phoneMatcher = phonePattern.matcher(phoneString );
            Matcher   numericMatcher = numericPattern.matcher(phoneString );
            
           if(numericMatcher.matches())  
           {  
               isValid =true;
                string countrycode = phoneString .Substring(0, 3); 
                string Areacode = phoneString .Substring(3, 6); 
                string number23 = phoneString .Substring(6,phoneString .Length()); 
                
              phNumber='('+countrycode+')' +' '+Areacode+'-' +number23 ;
            }else{  
             
              isValid =false;
           }  
          return phNumber;  
        }
       public Pagereference RecordsSuccess()
       {
           Successbool = FALSE;
             Pagereference pg = new Pagereference('/apex/QR_Attendee_extjs');
                pg.setRedirect(true);
                return pg;
       
       }
       
        public PageReference EventAdminDashboard() 
        {
            pagereference pg = new Pagereference('/apex/BL_EventAdmin_Dashboard');
            pg.setredirect(true);
                return pg;
        }
        
        
        public Pagereference AfterSuccess()
        {
    
            Pagereference pg = new Pagereference('/apex/QR_Attendee_extjs');
                pg.setRedirect(true);
                return pg;
        }
        
        public Pagereference AllErrorClear()
        {
          UTF8Bool = FALSE;
           Successbool = FALSE;
            Pagereference pg = new Pagereference('/apex/QRCode_extendsDataImport');
                pg.setRedirect(true);
                return pg;
               
        }
        
        // Inner Class For Getting Selected Value from Select Options AND Field Name
        public class InnerClass
        {
    
            public String DBField1{get; set;}
            public String SelectdValue{get; set;}
           
            public InnerClass(string s,string y){
            this.DBField1 =s;
            this.SelectdValue=y;
            }
            
            
        } 
        
        public class InnerClass2
        {
    
    
            public String DBField2{get; set;}
    
            public String SelectdValue2{get; set;}
            public InnerClass2(string s,string y){
            this.DBField2 =s;
            this.SelectdValue2=y;
            }
            
            
        } 
            // END Of Inner Class
        
    
       
        public static Integer UnSuccessRecords{get; set;} 
        public LIST<AttendeeSummary__c> duplicatesOfAttendees{get; set;} //Tofind the duplicates in the CSV File
        
       @future 
       public static void checkMapping(LIST<String> records100, LIST<String> Scolumns, LIST<String> DBFields, string singleEvent, Integer oldRec, Integer CSVRec,string fileName, id eventIdFor )
       { 
                   
             system.debug('FFFFFFFFFFFFFFFFF'+ eventIdFor );
             
               Successpop = 0;
               UnSuccessPop=0;
               //MyDataImport myDI = new MyDataImport();
               LIST<String> hunrecords = new LIST<String>();
               integer hunreccount=0;
                     
               LIST<AttendeeSummary__c> totAttendee100  = new LIST<AttendeeSummary__c>();
              // LIST<AttendeeSummary__c> totAttendee = new LIST<AttendeeSummary__c>();  
              // LIST<AttendeeSummary__c> beforeAttendee = new LIST<AttendeeSummary__c>();
               LIST<AttendeeSummary__c> afterAttendee = new LIST<AttendeeSummary__c>();  
               LIST<String> SuccessCSVRecords = new LIST<String>();
               LIST<String> UnsuccessCSVRecords = new LIST<String>();
               LIST<String> DuplicateCSVRecords = new LIST<String>();
               
              id eventId = eventIdFor;
               
              // LIST<AttendeeSummary__c>  eventAttendees = new LIST<AttendeeSummary__c>();
               MAP<String ,AttendeeSummary__c>  myEventAttendeesMap = new MAP<String, AttendeeSummary__c>();
              //eventAttendees = [select id, AS_Email__c,AS_FirstName__c,AS_LastName__c FROM AttendeeSummary__c WHERE Event_Id__c=: singleEvent];
        /*
              for(AttendeeSummary__c toMap :eventAttendees)
              {
                  myEventAttendeesMap.put(toMap.Attendee_EmailId__c.trim()+toMap.Attendee_FirstName__c+toMap.Attendee_LastName__c , toMap);
              }
              */
              
               String insertedId = '';
               LIST<String> insetedEmails = new LIST<String>();
               
               DataImport_SavePoint__c dbsavePoint = new DataImport_SavePoint__c();
               // QR_Eventadmin__c eventAdminid = new QR_Eventadmin__c();
               //-------------------------------------------------      
                    system.debug('`````````````````````````````````````````````'+ myEventAttendeesMap );
                
                    system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ records100.size());
                    
                     if(records100.size()>=250 )  
                     {
                          for(String tenrec: records100)
                          {
                                       
                            if(hunreccount == 500)
                            {
                            totAttendee100.addAll(MyDataImportRotate( hunRecords ,Scolumns, DBFields, singleEvent,myEventAttendeesMap ));
                            hunrecords = new LIST<String>();
                            hunreccount=0;
                            
                            }
                           else{
                               hunRecords.add(tenrec);
                                hunreccount++; 
                           }   
                        }
                        if(hunreccount != 0)
                        {
                            totAttendee100.addAll(MyDataImportRotate( hunRecords ,Scolumns, DBFields, singleEvent,myEventAttendeesMap));
                        }
                     }else
                      {
                         system.debug('~~~~~~~~~~~~~~~~~~~~~'+ myEventAttendeesMap );
                         totAttendee100.addAll(MyDataImportRotate( records100 ,Scolumns, DBFields, singleEvent,myEventAttendeesMap ));
                      }
                      
                     
              //-------------------------------------------         
          //  BeforeAttendee = [select id FROM AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
           
            
          //--//  eventAdminid = [select id FROM QR_Eventadmin__c WHERE User_ID__c =: UserInfo.getUserId()];
           
           system.debug('oooooooooooooooooooooooooooo'+ UserInfo.getUserId());
           
           
            Database.UpsertResult[] MySaveResult = Database.upsert(totAttendee100,AttendeeSummary__c.AS_Email__c.getDescribe().getSObjectField()  ,false);
             
          // Schema.DescribeFieldResult F = AttendeeSummary__c.Attendee_EmailId__c.getDescribe();
         //  Schema.sObjectField T = F.getSObjectField();
           
           
           LIST<ID> event_Attendee_Mappaing = new LIST<ID>(); // For Adding Junction Object-----------
          
           
         //  Database.UpsertResult[] MySaveResult = Database.upsert(totAttendee100,T, false);  
             UnSuccessRecords = 0;
             Integer csvRecordsCount=0;
             Integer Afterinsert= 0;  ///////////////********* [select count() FROM AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
              for(Database.UpsertResult rer : MySaveResult){
              
                  
                 if(!rer.isSuccess())
                 {
                     // When the record is fails-----------------
                     Database.Error Inserterrors = rer.getErrors()[0]; 
                     system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'+ csvRecordsCount+'REC'+records100[csvRecordsCount]);
                     
                         unsuccessCSVRecords.add(records100[csvRecordsCount] );
                     system.debug('**************************************'+ unsuccessCSVRecords[UnSuccessRecords]+ 'eeeeeeeeeee'+ rer.getErrors()[0]);
                     
                       csvRecordsCount++;
                       UnSuccessRecords ++;
                   } else if(rer.isSuccess())
                   {
                         // insertedId.add(rer.getId());
                        
                        event_Attendee_Mappaing.add(rer.getId());

                        SuccessCSVRecords.add(records100[csvRecordsCount]); 
                        csvRecordsCount++;
                        
                   }
  
                }
    
               LIST<Event_Attendee_Mapping__c> EventATtendeeMap = new LIST<Event_Attendee_Mapping__c>();
               
               for(id mapId: event_Attendee_Mappaing)
               {
                   Event_Attendee_Mapping__c SingleMapping = new Event_Attendee_Mapping__c();
               
                   SingleMapping.AS_id__c = mapId;
                   SingleMapping.EV_id__c = eventId;
                   SingleMapping.Attendee_Event_IDs__c = (String)mapId+eventId;
                   EventATtendeeMap.add(SingleMapping);
               
               }

                Database.upsertResult[] AttEventJun = Database.upsert(EventATtendeeMap , Event_Attendee_Mapping__c.Attendee_Event_IDs__c.getDescribe().getSObjectField() , false);
                
                integer insertRec=0;
                integer updateRec=0;
                
                for(Database.UpsertResult rer : AttEventJun){
                
                    if(rer.IsSuccess())
                    {
                        if(rer.isCreated())
                        {
                            insertRec++;
                            insertedId += rer.getId()+','; //ID's are storing in "DataBase Save Point" For Roll Back 
                        }else if(!rer.isCreated()){
                            updateRec++;
                        
                        }
                    
                    }
                    
                    system.debug('UUUUUUUUUUUUUUUUUUUUU'+ rer );
                
                }
                
             //  afterAttendee  = [select id,Attendee_EmailId__c FROM AttendeeSummary__c WHERE (Event_Id__c =: singleEvent AND id !=: BeforeAttendee) ];
                afterinsert = [select Count() FROM Event_Attendee_Mapping__c WHERE EV_id__c =: eventId];
               Successpop = SuccessCSVRecords.size();
               UnSuccessPop = CSVRec - Successpop-1;
                
               if(CSVRec >=2 )
               CSVRec--;
               
               String success =  'Number of records imported: '+ CSVRec + '<br/>'+
                                 'Number of records created successfully: '+ insertRec +'<br/>'+
                                 'Number of records updated successfully: '+ updateRec +'<br/>'+
                                 'Number of records failed: '+ UnSuccessPop +'<br/>'+ 
                                 'Number of records prior to import: '+ OldRec +'<br/>'+
                                 'Total number of records: '+Afterinsert+ '<br/><br/>';
                
               String emailMessage =  'BoothLeads.com has just completed your import process!'+'<br/><br/>'+
                                       success +
                                       'We strongly recommend that you check a few of your imported records to verify that your information was imported as expected.'+'<br/><br/>'+
                                       'If you encounter any problems or have any questions, please contact Boothleads Customer Support.<br/><br/>'+
                                       'Thank you! <br/> BoothLeads Customer Support <br/> support@boothleads.com' ;
                
                
                system.debug('MALLIKKKKKKKKKKK'+ 'OOOOOORRRRR'+ insertedId+'QQQQQQQQ'+ FileName );
                if(insertedId != '' && FileName != NULL)
                {
                    
                    system.debug('STARTEDDDDDDDDDDDDDDDDDDDDDDDD');
                    dbsavePoint.DS_FileName__c = FileName;
                    dbsavePoint.DS_ImportedHistory__c = success;
                    dbsavePoint.DS_ImportedId__c = insertedId.subString(0, insertedId.lastIndexOf(','));
                    dbsavePoint.User_id__c = Userinfo.getUserId();
                    dbsavePoint.DS_TotalRecords__c = Successpop;
                    insert dbsavePoint;
                    
                    system.debug('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
                    
                }
                
                String mailCSVAttachment='';
                for(String ss: UnsuccessCSVRecords)
                {
                  mailCSVAttachment = mailCSVAttachment + ss.replaceAll(',',' ').replaceAll(';;;:::', ',')+'\r';
                }
             system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+ mailCSVAttachment );
              /*  mailCSVAttachment += ('\n'+'SUccess Records'+'\n');
                
                for(String suc: SuccessCSVRecords)
                {
                   string recordString = suc;
                   mailCSVAttachment = mailCSVAttachment + recordString;
                } */
    
                //Prepare Mail For Failure Attachments
                Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
                blob csvBlob = Blob.valueOf(mailCSVAttachment);
                string csvname= 'Import Attendees Failures.csv';
                csvAttc.setFileName(csvname);
                csvAttc.setBody(csvBlob);
                
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                 String[] toAddresses = new String[] {UserInfo.getUserName()};
                 
                 mail.setToAddresses(toAddresses);
                 mail.setReplyTo('support@boothleads.com');
                 mail.setSubject('Import Attendees Summary');
                 mail.setPlainTextBody(emailMessage);
                 mail.setHtmlBody(emailMessage);
                 mail.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
                 Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
              
              
              
       }
       
       
     //  LIST<AttendeeSummary__c> eventAttendees {get; set;} //To find the duplicates 
     //  MAP<String ,AttendeeSummary__c> eventAttendeesMap{get; set;} //Tofind Duplicates
    //public LIST<AttendeeSummary__c> oneTransactionTotalAttendees; // Assigned to Attendee summary Records FROM CSV file From @feture methode calling
       
    //@@@@---->Future Calling methode----------Execution Start's HERE----------------
       public static LIST<AttendeeSummary__c> MyDataImportRotate(LIST<String> record100, LIST<String> ColNum, LIST<String> DBFields, String singleEvent, Map<String, AttendeeSummary__c> eventAttendeesMap )
       {
            LIST<AttendeeSummary__c> oneTransactionTotalAttendees = new LIST<AttendeeSummary__c>();  
            
            MAP<String, String> checkDuplicate = new MAP<String, String>();
                          
              for(String singrec: record100)
              {
                  AttendeeSummary__c singleAttendee = new AttendeeSummary__c(); 
                     
                    System.debug('111111111111111111111111111'+ singrec);
                     
                    LIST<String> Record = singrec.split(';;;:::');
                      System.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$'+ Record);
                      integer DBRow = 0;
                        
              System.debug('##########################'+ ColNum);
              
                       for(String rec: ColNum)
                       {
                         
                         try{ 
                          
                          try{          
                               if(Record[Integer.ValueOf(Rec)].contains('"'))
                                {
                                 Record[Integer.ValueOf(Rec)]= Record[Integer.ValueOf(Rec)].replaceAll('"','');
            
                                }            
                               }catch(Exception e){}           
                                          
                             If(DBFields[DBRow] =='AS_Email__c')
                             {
                                 // if(validateEMail(Record[Integer.ValueOf(Rec)].trim())){
                                     if(!checkDuplicate.containsKey(Record[Integer.ValueOf(Rec)].trim().toLowerCase()) ){
                                         checkDuplicate.put(Record[Integer.ValueOf(Rec)].trim().toLowerCase(), singrec);
                                         singleAttendee.put(DBFields[DBRow] ,Record[Integer.ValueOf(Rec)].trim().toLowerCase());
                                     }
                                // }
                             }          
                         
                             Else if(DBFields[DBRow]=='AS_Age__c'||DBFields[DBRow]=='AS_NumberOfEmployees__c'||DBFields[DBRow]=='AS_BusinessRevenue__c'||DBFields[DBRow]=='AS_NAICSCode1__c'||DBFields[DBRow]=='AS_NAICSCode2__c'||DBFields[DBRow]=='AS_NAICSCode3__c'||DBFields[DBRow]=='AS_WorkZipCode__c'||DBFields[DBRow]=='AS_ShippingZipcode__c'||DBFields[DBRow]=='AS_NAICSCode4__c'||DBFields[DBRow]=='AS_NAICSCode5__c'||DBFields[DBRow]=='AS_HomeZipcode__c'||DBFields[DBRow]=='AS_BusinessTaxId__c'||DBFields[DBRow]=='AS_BusinessRevenue__c'||DBFields[DBRow]=='AS_BusinessDunsNumber__c')
                             {
                                
                               if(DBFields[DBRow]=='Attendee_NAICS_Code1__c'||DBFields[DBRow]=='Attendee_NAICS_Code2__c'||DBFields[DBRow]=='Attendee_NAICS_Code3__c')
                               {
                               
                                   try{
                                    if(validateNAICSCode(Integer.valueOf(Record[Integer.ValueOf(Rec)].trim())))
                                        singleAttendee.put(DBFields[DBRow] , Integer.valueOf(Record[Integer.ValueOf(Rec)].trim()));
                                       }catch(Exception e){}
                               }else{ 
                                try{
                                 singleAttendee.put(DBFields[DBRow] , Integer.valueOf(Record[Integer.ValueOf(Rec)].trim()));
                                 }catch(Exception e){}
                                 }
                             }
                             Else If(DBFields[DBRow]=='AS_BirthDate__c'|| DBFields[DBRow]=='AS_BusinessEstablishedDate__c')
                             {
                                try{
                                 singleAttendee.put(DBFields[DBRow] , Date.parse(Record[Integer.ValueOf(Rec)].trim()));
                                }catch(Exception e){}
                             }
                             Else If(DBFields[DBRow]=='AS_WorkPhone__c'||DBFields[DBRow]=='AS_CellPhone__c'||DBFields[DBRow]=='AS_HomePhone__c'||DBFields[DBRow]=='AS_ShippingPhone__c')
                             {
                                try{
                                       singleAttendee.put(DBFields[DBRow] , ValidatePhone(Record[Integer.ValueOf(Rec)].trim()));
                                    }catch(Exception e){}
                             
                             }
                             Else{
                                 try{
                                 singleAttendee.put(DBFields[DBRow] , Record[Integer.ValueOf(Rec)].trim());
                                }catch(Exception e){} 
                           }
                           
                           }Catch(Exception e){}
                        DBRow++;
    
                     } 
                     
                     system.debug('4444444444444444444444444'+ singleAttendee );
                     oneTransactionTotalAttendees.add( singleAttendee);
                 // End of Single Field    
                           
          }
       
       return oneTransactionTotalAttendees;
            
       }
       
       
       
        public void CheckMap( )
        {
             
                 
               LIST<String> myInfo = new LIST<String>();
               LIST<String> mySelectdValue= new LIST<String>();
               String storeItems=''; 
               
               
               
                for(InnerClass x:innnnn)
                {
                     
                  system.debug('777777777777777777777'+ x.DBField1 );
                  system.debug('888888888888888888888'+ x.SelectdValue );
                  // system.debug('9999999999999999999999999999999'+ CSVHeaderToStore[Integer.ValueOf(x.SelectdValue)]);
                  
                   
                     
                       if(x.SelectdValue != 'NONE')
                       {
                          String ss= DBField.get(x.DBField1);
                          myInfo.add(ss);
                          mySelectdValue.add(x.SelectdValue);
                          
                          storeItems += x.DBField1+'&*$%^'+ CSVHeaderToStore[Integer.ValueOf(x.SelectdValue)]+';;;;;:::::' ;
                          
                       }else
                       {
                            storeItems += x.DBField1+'&*$%^'+ 'NONE'+';;;;;:::::';
                       
                       }
                       
                       
                       
                }
        
                system.debug('0000000000000000000000000000000000'+ storeItems);
                
                for(InnerClass2 x:innnnn2)
                {
                    //  storeItems.add(DBField.get(x.DBField2));
                      if(x.SelectdValue2 != 'NONE')
                      {
                          String ss= DBField.get(x.DBField2);
                          myInfo.add(ss);
                          mySelectdValue.add(x.SelectdValue2);
                            
                          storeItems += x.DBField2+'&*$%^'+ CSVHeaderToStore[Integer.ValueOf(x.SelectdValue2)]+';;;;;:::::';
                            
                      }else
                       {
                            storeItems += x.DBField2+'&*$%^'+ 'NONE'+';;;;;:::::' ;
                       }
                }
                system.debug('nnnnnnnnnnnnnnnnnnnnnnnnnn'+ innnnn + innnnn2 );
               
               system.debug('mmmmmmmmmmmmmmmmmmmmmmmmmmm'+ mySelectdValue );
               
               system.debug('ooooooooooooooooooooooooo'+ myInfo );
               
               system.debug('pppppppppppppppppppppppppppppppppp'+ storeItems );
               
               
              User u = [select id, Attemdees_Mapping__c FROM USER WHERE id =: USerInfo.getUserId()];
              
              u.Attemdees_Mapping__c = storeItems;
              
              update u;
               
               
               // string[] innervalue = String(innnnn);
                
        
           Displayrecords = new LIST<String>();
                   integer iii=0;
        
                  totalAttendee = new LIST<AttendeeSummary__c>();
                
                  
                  reqMissing = new  LIST<AttendeeSummary__c>();
              Displayrecords.addAll(getResults());
              
              LIST<String> hunrecords = new LIST<String>();
              integer hunreccount=0;
              integer remainHun=0;
        
             UnSuccessPop =0;
        
              AfterInsert=0;
              rowcount=Displayrecords.size();
             
             
             
           //  integer BeforeInsert=0; //= [select count() FROM AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
             
            integer BeforeInsert = [select Count() FROM Event_Attendee_Mapping__c WHERE EV_id__c =: ApexPages.currentpage().getparameters().get('id') ];
             eventIdForAtt = ApexPages.currentpage().getparameters().get('id');
             system.debug('ggggggggggggggggggggggggggggggggggggggg'+ eventIdForAtt ); 
              
              checkMapping(Displayrecords, mySelectdValue, myInfo,singleEvent,BeforeInsert,rowcount, nameFile , eventIdForAtt );
               
           
        
                    Successbool = TRUE;
                    showselectCSV = FALSE;
                    headerDisplay=TRUE;
                  
               
           
              
                
        }
    
        public void cancelInSelect(){
            showselectCSV = FALSE;
            headerDisplay=TRUE;
        
        }
    
        public PageReference exportToCSV()
        {
                PageReference pageRef= new PageReference('/apex/QRCode_Attendee_Template');
                pageRef.setredirect(false);
                return pageRef;
        }
    
    
    
    
        public void ShowPreviousList()
        {
           
        }
        
        
        
        
        
     
     //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
    
    //----------------Test Class----------------
      static testMethod void myUnitTest() {
          
          Event__c event = new Event__c(EV_Title__c = 'Test Event', StartTime__c = '09:00 AM', EV_EndTime__c='09:00 PM',EV_StartDate__c = Date.newInstance(2012,05,01),EV_EndDate__c = Date.newInstance(2012,05,01) );
          insert event;
          
        //  SecurityControls__c sc = new SecurityControls__c(EV_id__c = event.id, EV_Req_Fields__c= 'AS_FirstName__c' );
        //  insert sc;
          
          
          System.currentPageReference().getParameters().put('id', event.id);
            
          
          QRCode_DataImportCon imp= new QRCode_DataImportCon();
          
          string fieldsOf = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,Attendee_NewPrefix__c,Attendee_NewSuffix__c,Attendee_Designation__c,Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_Gender__c,Attendee_BirthDate__c,Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,Attendee_Business_NoOfEmployees__c,Attendee_BusineesEstablished_Date1__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,Attendee_Business_DnB_Id__c,Attendee_WebsiteURL__c,Attendee_BlogURL__c,Attendee_DiversityType1__c,Attendee_BusineesDescription__c,AttendeePic';
         
       imp.contentFile = blob.valueOf('Prefix,Last Name,First Name,Email Id,Designation,Mobile Number,Work Fax Number,Gender,Home Address 1,Home City,Home Zip Codek,Work Address 2,Work State,Shipping Address 1,Shipping City'); 
      // imp.contentFile = blob.valueOf('ym,mn2,mn3,mn4,24,02/05/1985,$4231,this is businessdescrption');
      // imp.contentFile = blob.valueOf('ym,mn2,"mn3,",mn4,24,02/05/1985,$4231,this is businessdescrption');
      // imp.contentFile = blob.valueOf('ym,mn2,mn3@test.com,mnp","mn4",24,02/05/1985,$4231,this is businessdescrption');
       
          
          imp.checkUserId();
          imp.Events();
          imp.Attendees();
          imp.reportact();
          imp.DataImportaction();
          imp.CustomerAdminAct();
          imp.ProfileSettings();
          
          imp.clickUpload();
          
          validateEMail('test@test.com');
          validateNAICSCode(125478);
          ValidatePhone('1234567890');
          
          LIST<InnerClass> innnnn = new LIST<InnerClass>();
          
         // innnnn = new InnerClass('Prefix', 'Prefix');
          
          
          //imp.innnnn.add(DBField1= 'Prefix', SelectdValue = 'Prefix'); 
          
       // system.debug('44444444444444444444444444444'+ imp.innnnn);
       // system.debug('wwwwwwwwwwwwwwwwwwwwwwww'+ userinfo.getUserId());

          imp.callingCustomNapping();
          imp.CheckMap();
          
            
      }
    
    
    
    
    }