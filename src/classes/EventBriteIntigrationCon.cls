public with sharing class EventBriteIntigrationCon {
public String SelectEventId1 { get; set; }
 public list<attendee1> EventbriteAtt{get;set;}
 public String User_key { get; set; }
 public String EventBriteId1 { get; set; }
 public String EventBriteId { get; set; } 
 public List<Event> EventbriteEv{get;set;}
 
 
 
public PageReference getAttendees() {
 if(SelectEventId1 == null){
 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please Select Event'));
 return null;
 }
 
 
    
    
      String URL ='https://www.eventbrite.com/json/event_list_attendees?app_key=CNXSCEVA32E6U6REQF&user_key='+User_key+'&id='+EventBriteId;
    
    
    //EventbriteAtt = new  list<Attedees>();
    System.debug('@@@@@@@@####URL'+EventBriteId);
    System.debug('@@@@@@@@####URL'+URL);
    
      Http h = new Http();

    HttpRequest req = new HttpRequest();
    req.setEndpoint(URL);
    req.setMethod('GET');

    HttpResponse res = h.send(req);
    
    System.debug('Original Body'+res.getBody());
    String json1= res.getBody();
    String json2 = json1.replace('currency','money');
    System.debug('@@@@@replaced string'+json2);
    
    //String jsonStr= '{"attendee":[{"website": "www.globlanest", "first_name": "balaji", "last_name": "j", "home_city": "Secbad", "suffix": "Singh", "event_id": 3135031965, "company": "GlobalnestLLC", "prefix": "Mr.", "blog": "", "work_city": "Secbad", "ticket_id": 13279069, "quantity": 1, "id": 95625983, "job_title": "WebDesigner"}]}';
    
   // JSONParser parser = JSON.createParser(res.getBody());
        JSONParser parser = JSON.createParser(json2);
       System.debug('@@@@@*****Parser Values'+parser);
       
        EventbriteAtt = new  list<attendee1>();
       
       System.debug('@@@@@Parser'+parser);
       
        while (parser.nextToken() != null) {
        
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
        
            while (parser.nextToken() != null) {

                if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                   
         parser.nextToken();
         
         System.debug('@@@@@parsertext'+Parser.getText());
       parser.nextToken();
         
        
         
         System.debug('@@@@findValues'+parser.getText());

                   attendee1 inv = (attendee1)parser.readValueAs(attendee1.class);
                    
                   System.debug('attendees values'+inv);
                   EventbriteAtt.add(inv);
                    
                    }
                   
                    parser.skipChildren();
             
                }
 
        }
        
 
        }
    
     
  System.debug('@@@@@EventbriteAtt'+EventbriteAtt);
  
  
    return null;
    
    }
    
    
    
    
    
     public class attendee1{
 
 public boolean selected{get;set;}
 public String work_country_code {get;set;}
 public String notes {get;set;}
 public String cell_phone {get;set;}
 public String ship_phone {get;set;}
 public String ship_postal_code {get;set;}
 public String home_region {get;set;}
 public String home_phone {get;set;}
 public String work_address {get;set;}
 public String age {get;set;}
 public String work_address_2 {get;set;}
 public String work_region {get;set;}
 public String ship_address_2 {get;set;}
 public String home_country {get;set;}
 public String home_address_2{get;set;} 
 public String ship_city {get;set;}
 public String work_phone {get;set;}
 public String gender{get;set;}
 public String ship_region {get;set;}
 public String home_address{get;set;}
 public String work_postal_code {get;set;}
 public String discount {get;set;}
 public String event_date{get;set;}
 public String affiliate{get;set;}
 public String barcode{get;set;}
 public String money{get;set;}
 public boolean isSelected{get;set;}
 public string website {get;set;}
 public String first_name{get;set;}
 public String home_city {get;set;}
 public String last_name{get;set;}
 public string suffix {get;set;}    
 public string company{get;set;}
 public String  event_id{get;set;}
 public String created{get;set;}
 public String prefix{get;set;} 
 public String  blog {get;set;}
 public String order_id {get;set;}
 public String work_city{get;set;}
 public String home_country_code {get;set;}
 public String  email{get;set;}
 public String ship_country {get;set;}
 public String modified{get;set;}
 public String amount_paid {get;set;}
 public String order_type{get;set;}
 public String ticket_id{get;set;} 
 public Integer quantity{get;set;} 
 public String home_postal_code{get;set;}
 public String id{get;set;} 
 public String ship_address {get;set;}
 public String job_title{get;set;} 
 public String ship_country_code {get;set;}
 public String birth_date {get;set;}
 public String work_country{get;set;}
 public boolean eventBrite4{get;set;}
 
 public attendee1(String web,String first,String last,String home,String suff,String comp,String eid,String pref,String blog,String work,String ticket,Integer qua,String id,String jid,String order,String gender1,String age1){

 selected=false;
 website =web;
 
 first_name=first;
 
 
 last_name= last;
 
 order_type=order;
 suffix = suff; 
  
 company = comp;
  
 
  event_id= eid;
  
  prefix=pref;
  
  
  blog=blog;
 
  work_city = work;
  
  ticket_id= ticket;

  quantity =qua;
  
  id=id;
  
  job_title=jid;
  
   gender = gender1;
   
   
   age = age1;
  
  
 }
 
  
 
 }

}