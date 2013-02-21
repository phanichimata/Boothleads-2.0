public with sharing class BL_Eventadmin_EventsConForDoc 
{
Public Document mydoc;
Public Id LoginUserID {get;set;}
    Public Document getmyimage()
    {
        mydoc = new Document();
        return mydoc;
    }
   
    Public BL_Eventadmin_EventsConForDoc(){
    
   // LoginUserId = UserInfo.getUserId();
    LoginUserId = '005O0000000ZJas';
     
    }
   
    Public Pagereference Savedoc()
    {
        mydoc.folderid = LoginUserId ;
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+mydoc.folderid);
        mydoc.Ispublic = true;
       // my.doc.Description ='https://c.cs5.content.force.com/servlet/servlet.ImageServer?id=015O0000000DeMm&oid=00DO000000075G4&lastMod=1342680029000';
      //  UserInfo.getUserId();  Stores in the currennt users "My Personal Documents" folder
        //mydoc.folderid = 'any other id you want here'; // Fetch Id dynamically by using [Select Id from Folder where Name='My Images']. Specifying a FolderId is mandatory
        insert mydoc;
         system.debug(':::::::::::::::::::::::::::::::::'+mydoc.id);
        return NULL;
    }       
    
}