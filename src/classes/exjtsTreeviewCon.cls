public with sharing class exjtsTreeviewCon {
Public List<User_Profile_Event__c> EventsTree{get;set;}
Public String LoginUSerId{get;set;}

class CampaignHierarchyLevel {        
     
        User_Profile_Event__c camp;                                                       
        List<CampaignHierarchyLevel> children;                               
        CampaignHierarchyLevel(User_Profile_Event__c c) {                                 
            camp = c;                                                        
            children = new List<CampaignHierarchyLevel>();                   
        }                                                                    
    }                                                                        
  
    public class CampaignLevelInfo {                                         
     
        public ID parentId {get;set;}                                        
        public ID id {get;set;}                                              
        public String name {get;set;}                                        
        public Boolean isLeaf {get;set;}
        Public string BoothName{get;set;}                                     
    }                                                                        
                                                                             
    List<CampaignHierarchyLevel> toplevel_campaigns; 
    public exjtsTreeviewCon () { 
    LoginUserId ='005O0000000ZJas';
    // AddCamp = new exjtsTreeviewCon();                                                     
       
        toplevel_campaigns = new List<CampaignHierarchyLevel>();                            
                       
       Map<ID, List<User_Profile_Event__c>> child_campaigns = new Map<ID, List<User_Profile_Event__c>>(); 
         List<User_Profile_Event__c> Child_BoothAdmins = new  List<User_Profile_Event__c>();                                  
         List<User_Profile_Event__c> Child_Booths = new  List<User_Profile_Event__c>();                                  
        for (User_Profile_Event__c c : [select Id,Name,BoothAdmin_id__c,BoothAdmin_id__r.Name,BT_id__c,EV_id__c,EV_id__r.EV_Title__c from  User_Profile_Event__c where User_ID__c =: loginuserId]) {                           
           system.debug('====================== 1111111111 =============='+c);
            if (c.BT_id__c == null) {                                                                                
                toplevel_campaigns.add(new CampaignHierarchyLevel(c)); 
                system.debug('=========@@@@@@@@@@@@==============='+toplevel_campaigns);                                              
            }                                                                                                        
            else { 
                  Child_BoothAdmins.add(c);  
                   system.debug('222222222222222222222'+c);                                                                                                  
                // add this campaign to its parent's list of child campaigns                                         
                //  if (!child_campaigns.containsKey(c.BT_id__c)) {   
               //  system.debug('=========&&&&&&&&&&&&&&&&==============='+child_campaigns.containsKey(c.BT_id__c));                                                            
              //      child_campaigns.put(c.BT_id__c , new List<User_Profile_Event__c>());                                           
             //  }                                                                                                    
             //   child_campaigns.get(c.BT_id__c ).add(c);  
                                                                                                                                                                                                 
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
                                                                                                                                                                             
        List<CampaignHierarchyLevel> camp_expand_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                               
        while (!camp_expand_stack.isEmpty()) {                                                                                                                                                                                               
                                                                                                                                                                                          
            CampaignHierarchyLevel chl = camp_expand_stack.remove(camp_expand_stack.size() - 1);
            system.debug('========================== Excuse me =============='+chl);
                                                                                                                                   
           if (child_campaigns.containsKey(chl.camp.Id)) {
            system.debug('======== shruthi========='+child_campaigns.containsKey(chl.camp.Id));                                                                                                                                                                                   
                                                                                                                             
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
                                                                                                                                   
        List<CampaignHierarchyLevel> camp_lvl_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                                  
        while (!camp_lvl_stack.isEmpty()) {                                                                                                                                                                                                  
            CampaignHierarchyLevel chl = camp_lvl_stack.remove(camp_lvl_stack.size() - 1);                                                                                                                                                   
            CampaignLevelInfo cli = new CampaignLevelInfo();                                                                                                                                                                                 
                                                                                                                                                   
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
                                                                                                                                                                                 
            for (CampaignHierarchyLevel cchl : chl.children) {                                                                                                                                                                               
                camp_lvl_stack.add(cchl);                                                                                                                                                                                                    
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        return ctree;                                                                                                                                                                                                                        
    }                                                                                                                                                                                                                                        

    public PageReference selectCampaign() {
       
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

}