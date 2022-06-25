/*
 *  Purpose          :    This class is showing the Down Triangle Star Pattern
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */
public with sharing class DownTriangleStarPattern{

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to display Down Triangle Star Pattern
    * Params        :    Void
    * Return        :    Void
    */
    public static void downTriangleStarPatternMethod(){
        for(integer i=5;i>=1;i--)
        {
            String s = ' ';
            for(integer j=1;j<=5-i;j++)
            {
                if(i==1 || i==j || i+j==10)
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