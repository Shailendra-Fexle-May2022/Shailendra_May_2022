/*
 *  Purpose          :    This class is showing the Left Pascal Pattern
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */
public with sharing class LeftPascal{

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to display the Left Pascal Pattern
    * Params        :    Void
    * Return        :    Void
    */
    public static void leftPascalMethod(){
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