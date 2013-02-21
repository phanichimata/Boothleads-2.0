public with sharing class ExtJS_Tree 
{
public LIST<User_Profile_Event__c> mainList{get; set;}
public LIST<FirstInn> usethis{get; set;}
public string LoginUserId {get;set;}

public ExtJS_Tree()
{                
LoginUserId ='005O0000000ZJas';
mainList = new LIST<User_Profile_Event__c>();

//mainList.addAll( [Select u.User_id__c,u.EV_id__c, u.EV_id__r.EV_Title__c , u.Profile_id__c, u.EventAdmin_Id__c, u.BoothAdmin_id__c, u.BLP_id__c,User_id__r.LastName From User_Profile_Event__c u WHERE u.User_id__c=: userInfo.getUserId() AND u.User_id__c != NULL AND u.EventAdmin_Id__c =: userInfo.getUserId() ]);
mainList.addAll( [Select u.User_id__c,u.EV_id__c, u.EV_id__r.EV_Title__c , u.Profile_id__c, u.EventAdmin_Id__c, u.BoothAdmin_id__c, u.BLP_id__c,User_id__r.LastName From User_Profile_Event__c u WHERE u.User_id__c=: LoginUserId  AND u.User_id__c != NULL AND u.EventAdmin_Id__c =: LoginUserId ]); 
system.debug('Hello All'+ mainList);
system.debug('Hello Alllllllllllllllll'+ mainList.size());
// ------------- STEP 1 -----------------
LIST<User_Profile_Event__c> eventsAll = new LIST<User_Profile_Event__c>();
LIST<String> eventIds = new LIST<String>();
for(User_Profile_Event__c Event: mainList)
{
system.debug('++++++++++++++++++++++++++++++++++++++'+ Event);   
system.debug('--------------------------------------'+ Event.EV_id__c);   
eventIds.add(Event.EV_id__c);
eventsAll.add(Event);
}   




// -------------STEP 2 -------------------
LIST<Booth__c> booths = new LIST<Booth__c>();

booths = [Select b.id, b.EV_id__r.EV_Title__c, b.BT_Name__c From Booth__c b WHERE b.EV_id__c IN: eventIds];

system.debug('2222222222222222222222222'+  booths );
LIST<id> boothId = new LIST<Id>();
for(Booth__c bb: booths)
{
boothId.add(bb.id);
}
        
        
        
        
        
//--------------STEP 3 -------------------
LIST<User_Profile_Event__c> booAdm = new LIST<User_Profile_Event__c>();

booAdm = [Select u.EV_id__r.EV_Title__c,User_id__r.LastName,User_id__r.FirstName,u.User_id__c, u.UEP_isActive__c, u.Profile_id__c, u.BT_id__c From User_Profile_Event__c u WHERE u.BT_id__c IN: boothId];

system.debug('3333333333333333333333'+ booAdm );

LIST<User_Profile_Event__c> boothadm = new LIST<User_Profile_Event__c>();

LIST<SecoendInn> second2 = new LIST<SecoendInn>();

for(Booth__c bb: booths)
{
LIST<User_Profile_Event__c> jun2 = new LIST<User_Profile_Event__c>();                     
for(User_Profile_Event__c uu: booAdm )
{
if(bb.Id == uu.BT_id__c)
jun2.add(uu);                                  
}
second2.add(new SecoendInn(bb.BT_Name__c,bb.EV_id__r.EV_Title__c, jun2));
}

system.debug('#####################'+  second2 );
system.debug('RRRRRRRRRRRRRRRRRRRRR'+  second2.size() );
usethis = new LIST<FirstInn>();
for(User_Profile_Event__c jun3: mainList)
{
// FirstInn fi = new FirstInn();
LIST<SecoendInn> secjun5 = new LIST<SecoendInn>();

    
for(SecoendInn jun4:  second2)
{
system.debug('555555555555555555555555555'+ jun4.boothName );  
system.debug('6666666666666666666666666666'+ jun3.EV_id__r.EV_Title__c );  
system.debug('7777777777777777777777777777'+ jun4.EventName );  
       
if(jun4.EventName == jun3.EV_id__r.EV_Title__c)
{
system.debug('$$$$$$$$$$$$$$$$$$$$$'+ jun4 ); 
secjun5.add(jun4);                    
}
}                       
system.debug('@@@@@@@@@@@@@@@@@@@@@@@'+ secjun5 );       
usethis.add( new FirstInn(jun3.EV_id__r.EV_Title__c, secjun5 ));                               
}
system.debug('11111111111111111111111'+  usethis);

}

public Class FirstInn
{
public String upe{get;set;}
public LIST<SecoendInn> booth{get;set;}

public FirstInn(String a, LIST<SecoendInn> b)
{
upe = a;
booth = b;
}
}

public Class SecoendInn
{
public String boothName{get;set;}
public String EventName{get;set;}
public LIST<User_Profile_Event__c> boothad{get;set;}

public SecoendInn(String a,String e, LIST<User_Profile_Event__c> b)
{
boothName = a;
EventName = e;
boothad = b;
}    
public SecoendInn(String a, LIST<User_Profile_Event__c> b)
{
boothName = a;
// EventName = e;
boothad = b;
}              
}

}