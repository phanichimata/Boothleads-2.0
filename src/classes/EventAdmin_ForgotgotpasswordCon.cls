/**
 * An apex page controller that exposes the site forgot password functionality
 */
public class EventAdmin_ForgotgotpasswordCon {
    public String username {get; set;}
       
    public EventAdmin_ForgotgotpasswordCon() {}
        
        public PageReference forgotPassword() {
                boolean success = Site.forgotPassword(username);
               // PageReference pr = Page.portal_forgotpasswordconfirm;
                PageReference pr = Page.Eventadmin_forgotpasswordconfirm;
                pr.setRedirect(true);
                
                if (success) {                          
                        return pr;
                }
                return null;
        }
        
         public static testMethod void testForgotPasswordController() {
        // Instantiate a new controller with all parameters in the page
        ForgotPasswordController controller = new ForgotPasswordController();
        controller.username = 'test@salesforce.com';            
    
        System.assertEquals(controller.forgotPassword(),null); 
    }
}