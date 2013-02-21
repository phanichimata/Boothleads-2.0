public class QRCode_NeedPasswordCon {
/**
 * An apex page controller that exposes the site forgot password functionality
 */
    public String username {get; set;}   
       
    public QRCode_NeedPasswordCon() {}
        
        public PageReference forgotPassword() {
                boolean success = Site.forgotPassword(username);
               // PageReference pr = Page.portal_forgotpasswordconfirm;
                PageReference pr = Page.BL_Eventadmin_Signup;
                pr.setRedirect(true);
                
                if (success) {                          
                        return pr;
                }
                return null;
        }
        
         public static testMethod void testQRCode_NeedPasswordCon() {
        // Instantiate a new controller with all parameters in the page
        QRCode_NeedPasswordCon controller = new QRCode_NeedPasswordCon();
        controller.username = 'test@salesforce.com';            
    
        System.assertEquals(controller.forgotPassword(),null); 
    }
}