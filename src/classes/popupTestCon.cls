public with sharing class popupTestCon {

   public String valueOne { get; set; }
    public String valueTwo { get; set; }
    
    public PageReference iWantMyJSValues() {
        valueOne = Apexpages.currentPage().getParameters().get('one');
         return null;
    }
   
   

}