public with sharing class helplineatt {

    public boolean total{get;set;}
    public boolean printren{get;set;}
    public boolean addren{get;set;}
    public boolean importren{get;set;}
    public helplineatt(){
    total=true;
    }
    public PageReference addatthelp() {
    addren=true;
    total=false;
        return null;
    }
    public PageReference importhelp() {
    addren=false;
    total=false;
    importren=true;
    
        return null;
    }
     public PageReference Printinghelp() {
     addren=false;
     importren=false;
     total=false;
     printren=true;
     
        return null;
    }


}