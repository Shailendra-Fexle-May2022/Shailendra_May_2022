public class Pyramid
{
	public static void MyMethod()
    {
        for(integer i=1;i<=5;i++)
        {
            String s = '';

            String str = 'Hello';
            Integer b = 6;
            Integer a = 7;
            Integer a = 5;
            for(integer j=1;j<=9;j++)
              {
                if(j>=6-i && j<=5+i && j>=j+i+2)
                {
                   s = s +'7';  
                } 
                  else
                  {
                      s = s +' 3'; 
                  }
                  System.debug('s');
               }     
        }
    }
}