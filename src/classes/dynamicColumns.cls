public class dynamicColumns {


    public map<String , String> mapFieldToShow{get;set;}
    
    
    public Integer noOfColumns 
        { 
            get; 
            set
                {
                    listFieldToShow = new List<String>(); 
                    if(value == 1)
                        {
                            listFieldToShow.add('FirstName');
                        }
                    else if(value == 2)
                        {
                            listFieldToShow.add('FirstName');
                            listFieldToShow.add('LastName');
                        }
                    else if(value != null && value > 2)
                        {
                            listFieldToShow.add('FirstName');
                            listFieldToShow.add('LastName');
                            listFieldToShow.add('Email');
                        }
                        
                } 
        }
    
    public List<String> listFieldToShow {get;set;}
    
    public dynamicColumns()
        {
            listFieldToShow = new List<String>();
            listFieldToShow.add('FirstName');
            mapFieldToShow = new Map<String , String>();
            mapFieldToShow.put('FirstName' , 'FirstName');
            mapFieldToShow.put('LastName' , 'LastName');
            mapFieldToShow.put('Email' , 'Email');
            listTableResult = [Select FirstName, Lastname, Email from Contact limit 20];
        }
    public List<Contact> listTableResult {get;set;}

    public PageReference refreshTable() 
    {
        return ApexPages.currentpage();
    }

}