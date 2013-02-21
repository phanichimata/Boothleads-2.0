public with sharing class BL_EventAdmin_EmailBoothBadgesCon {
Public User_Profile_Event__c QrcodeDisplay{get;set;}
Public string UniqueCode{get;set;}

    Public BL_EventAdmin_EmailBoothBadgesCon(){
       
     UniqueCode =ApexPages.currentPage().getParameters().get('id');
     system.debug('===== :::::::::: ====='+UniqueCode );
     QrcodeDisplay = [Select Name,Id,BT_Id__r.Bt_Name__c,Ev_Id__c From User_Profile_Event__c where User_Id__c = '005O0000000ZJas' Limit 1];
     system.debug('::::::::::::::'+QrcodeDisplay );
    
    
    }
}