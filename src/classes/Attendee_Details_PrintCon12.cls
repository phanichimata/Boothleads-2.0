public with sharing class Attendee_Details_PrintCon12 {

    public String fileNAme1 { get; set; }

    public PageReference save() {
    
    List<user> acd = new List<USer>();
    system.resetPassword(acd[0].id ,true);
    
        return null;
    }


    public blob blobvalue { get; set; }

    public String fileNAme { get; set; }
}