public class CampaignHierarchyController {
Public string LoginUserId ;
  class CampaignHierarchyLevel {        
        // representing a level in the tree - an ID and a list of child nodes
        User_Profile_Event__c camp;                                                       
        List<CampaignHierarchyLevel> children;                               
        CampaignHierarchyLevel(User_Profile_Event__c c) {                                 
            camp = c;                                                        
            children = new List<CampaignHierarchyLevel>();                   
        }                                                                    
    }                                                                        
    // for communicating with VF we have a sort of vestigial Campaign class  
    public class CampaignLevelInfo {                                         
        // three fields from Campaign, plus a flag to tell us if it's a leaf 
        public Id parentId {get;set;}                                        
        public ID id {get;set;}                                              
        public String name {get;set;}                                        
        public Boolean isLeaf {get;set;}                                     
    }                                                                        
                                                                             
    List<CampaignHierarchyLevel> toplevel_campaigns;  // the top of our data structure
    public CampaignHierarchyController() { 
      // LoginUserId = UserInfo.getuserId();
       LoginUserId = '005O0000000ZJas';
//     AddCamp = new Campaign();                                                     
        // create a tree structure from the Campaign hierarchy and store it for VF reference
        toplevel_campaigns = new List<CampaignHierarchyLevel>();                            
        // if we fill the campaign tree by repeated SOQL queries (based on ParentId) we exceed the limit very quickly
        // instead let's do a single query for active campaigns, and process the results                             
        // question: would it be better to get all campaigns, and disable selecting the ones that are inactive?      
        // this way we may end up missing active campaigns that are descendants of inactive ones                     
        Map<ID, List<User_Profile_Event__c>> child_campaigns = new Map<ID, List<User_Profile_Event__c>>();                                     
        for (User_Profile_Event__c c : [select Id, BT_id__c,BoothAdmin_id__c from User_Profile_Event__c where EventAdmin_Id__c =:LoginUserId AND BT_id__c != NULL]) {                           
            system.debug('===========############ Lsit of Campainges ########### ========='+c);
            if (c.BoothAdmin_id__c == null) {                                                                                
                toplevel_campaigns.add(new CampaignHierarchyLevel(c));                                               
            }                                                                                                        
            else {                                                                                                   
                // add this campaign to its parent's list of child campaigns                                         
                if (!child_campaigns.containsKey(c.BT_id__c)) {                                                      
                    child_campaigns.put(c.BT_id__c, new List<User_Profile_Event__c>());                                           
                }                                                                                                    
                child_campaigns.get(c.BT_id__c).add(c);                                                                                                                                                                                      
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        // now all of our campaigns are in one of two places:                                                                                                                                                                                
        // 1) in toplevel_campaigns, if they had no parent, or                                                                                                                                                                               
        // 2) listed as children of the appropriate parent (flat, by parent) in child_campaigns                                                                                                                                              
        // now we turn this into a tree in a depth-first manner                                                                                                                                                                              
        List<CampaignHierarchyLevel> camp_expand_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                               
        while (!camp_expand_stack.isEmpty()) {                                                                                                                                                                                               
            // remove the last one from the end                                                                                                                                                                                              
            CampaignHierarchyLevel chl = camp_expand_stack.remove(camp_expand_stack.size() - 1);                                                                                                                                             
            if (child_campaigns.containsKey(chl.camp.Id)) {                                                                                                                                                                                  
                // this campaign has children.  Create hierarchy levels for them and push on stack                                                                                                                                           
                for (User_Profile_Event__c cc : child_campaigns.get(chl.camp.BoothAdmin_id__c)) {
                system.debug('==========:::::::::::==============='+cc );                                                                                                                                                                       
                    CampaignHierarchyLevel cchl = new CampaignHierarchyLevel(cc);                                                                                                                                                            
                    chl.children.add(cchl);                                                                                                                                                                                                  
                    camp_expand_stack.add(cchl);                                                                                                                                                                                             
                }                                                                                                                                                                                                                            
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        SelectedCampaign = new User_Profile_Event__c();                                                                                                                                                                                                   
    }                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                             
    public List<CampaignLevelInfo> getCampaignTree() {                                                                                                                                                                                       
        List<CampaignLevelInfo> ctree = new List<CampaignLevelInfo>();                                                                                                                                                                       
        // DFS traversal will ensure parent campaigns appear before children in output list                                                                                                                                                  
        List<CampaignHierarchyLevel> camp_lvl_stack = new List<CampaignHierarchyLevel>(toplevel_campaigns);                                                                                                                                  
        while (!camp_lvl_stack.isEmpty()) {                                                                                                                                                                                                  
            CampaignHierarchyLevel chl = camp_lvl_stack.remove(camp_lvl_stack.size() - 1);                                                                                                                                                   
            CampaignLevelInfo cli = new CampaignLevelInfo();                                                                                                                                                                                 
            // copy Campaign fields and add "isleaf" flag based on child count from tree                                                                                                                                                     
            cli.id = chl.camp.BoothAdmin_id__c;                                                                                                                                                                                                            
            cli.parentId = chl.camp.BT_id__c;                                                                                                                                                                                                
            cli.name = chl.camp.id;                                                                                                                                                                                                        
            cli.isLeaf = (chl.children.size() == 0);                                                                                                                                                                                         
            ctree.add(cli); 
            system.debug('==========:::::::::::==============='+ctree);                                                                                                                                                                                                                   
            // queue up children for future processing                                                                                                                                                                                       
            for (CampaignHierarchyLevel cchl : chl.children) {                                                                                                                                                                               
                camp_lvl_stack.add(cchl);                                                                                                                                                                                                    
            }                                                                                                                                                                                                                                
        }                                                                                                                                                                                                                                    
        return ctree;                                                                                                                                                                                                                        
    }                                                                                                                                                                                                                                        

    public PageReference selectCampaign() {
        // do lookup and set SelectedCampaign based on ID chosen by user
        if (SelectedId != null) {                                       
            SelectedCampaign = [select Id, BT_id__c, BoothAdmin_id__c from User_Profile_Event__c where Id=:SelectedId limit 1];
        }                                                                                             
        return null;                                                                                  
    }                                                                                                 
    public string SelectedId {get;set;}                                                               
    public User_Profile_Event__c SelectedCampaign {get;set;} 
    }