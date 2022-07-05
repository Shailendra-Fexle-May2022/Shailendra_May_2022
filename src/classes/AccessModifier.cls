/*
 *  Purpose          :    This class shows different access modifier.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/7/5
 *  Revision Logs    :    V_1.0 - Created -  2022/7/5
 */
public with sharing class AccessModifier {
    private Integer rollNo = 10;
    protected String name = 'Jorge';
    public static String classSection = 'B';
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to debug the statement.
    * Params        :    Void
    * Return        :    Void
    */

    public static void accessModifier_Method() {
        System.debug('Print the AcessModifier'); //Print the AcessModifier
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to debug the statements and call the static method and private, protected, public variable.
    * Params        :    Void
    * Return        :    Void
    */

   public static void accessModifier_Method1(){
        System.debug('Call the accesccModifier_Method');//Call the accesccModifier_Method
        AccessModifier.accessModifier_Method();
        System.debug('Call public variable::'+classSection); //Call public variable::B
        AccessModifier call = new AccessModifier();
        System.debug('Call private integer variable::'+call.rollNo);//Call private integer variable::10
        System.debug('Call proteted variable=>'+call.name); //Call proteted variable=>Jorge
       
    }
}