public with sharing class LeftPascalClass 
{
    public LeftPascalClass() 
    {
        for(integer i=1;i<=5;i++) 
        {
            String s = ' ';
            for(integer k=1;k<=5-i;k++)
            {
                s = s + '_';
            }
            for(integer j=1;j<=i;j++)
            {
                s = s + '*';
            }
            System.debug(s);
        }
        for(integer i=4;i>=1;i--) 
        {
            String s1 = ' ';
            for(integer k=1;k<=5-i;k++)
            {
                s1 = s1 + '_';
            }
            for(integer j=1;j<=i;j++)
            {
                s1 = s1 + '*';
            }
            System.debug(s1);
    	}
    }
}