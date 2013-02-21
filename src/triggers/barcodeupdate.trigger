trigger barcodeupdate on Event_Attendee_Mapping__c (after insert ) {

    LIST<Event_Attendee_Mapping__c> barcodeMapping = new LIST<Event_Attendee_Mapping__c>();

    for(Event_Attendee_Mapping__c mp:trigger.new)
    {
    system.debug('QQQQQQQQQQQQQQQQQQQ   '+  mp.id + '--------'+ mp.EV_id__c );
    String s1= String.valueOf( mp.id + '-'+ mp.EV_id__c);
      Event_Attendee_Mapping__c EAM=new Event_Attendee_Mapping__c(id = mp.id,EA_AttendeeBarcode__c = s1 );
        barcodeMapping.add(EAM);
    }


    upsert barcodeMapping;



}