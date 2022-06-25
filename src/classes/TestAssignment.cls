/*
 *  Purpose          :    This Class is used for Testing Purpose
 *  Created By       :    Shailendra Sharma  
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */
public with sharing class TestAssignment {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to add two values.
    * Params        :    Void
    * Return        :    Void
    */
    public void testAssignmentMethod(){
        Integer a = 2;
        Integer b = 4;
        Integer c = a + b;
        System.debug(c);
    }
}