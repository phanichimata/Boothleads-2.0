public with sharing class dymosample {

    public PageReference generatepdf() {
    pagereference pg=page.revereseDymo;
        return pg;
    }


    public String x { get; set; }
   public dymosample()
   {
   
   x='transform:rotate(90deg);-ms-transform:rotate(90deg);-moz-transform:rotate(90deg);-webkit-transform:rotate(90deg);-o-transform:rotate(90deg);width:2.41in;height:4.21in';
   }
}