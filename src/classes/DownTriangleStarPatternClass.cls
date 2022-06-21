public with sharing class DownTriangleStarPatternClass 
{
    public DownTriangleStarPatternClass()
     {
        for(integer i=5;i>=1;i--)
        {
            String s = ' ';
            for(integer j=1;j<=5-i;j++)
            {
                s = s + '_';
            }
            for(integer k=1;k<=(2*i-1);k++)
            {
                if(k==1 || i==5 || k==(2*i-1))
                {
                    s = s + '*'; 
                }
               
                else
                {
                    s = s + '_';  
                }
            }
            System.debug(s);
        }
    }
}