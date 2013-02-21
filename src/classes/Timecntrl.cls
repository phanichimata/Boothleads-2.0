public class Timecntrl {

public Timecntrl()
{
TimeMethod();
}



    public PageReference TimeMethod() {
    
                 Time myTime = Time.newInstance(18, 30, 2, 20);

                  Integer myMinutes = myTime.minute();
                  myMinutes = myMinutes + 5;

           
    
    
    
        return null;
    }

}