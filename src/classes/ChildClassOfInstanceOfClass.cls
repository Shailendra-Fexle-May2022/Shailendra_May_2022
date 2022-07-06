/*
 *  Purpose          :    This class is the child of the parent class.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/7/6
 *  Revision Logs    :    V_1.0 - Created -  2022/7/6
 */
public class ChildClassOfInstanceOfClass extends InstanceOfClass  {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to passing the parameter snd debug the passing value.
    * Params        :    String
    * Return        :    Void
    */
    public override void print(String str){
        System.debug('Print method of class Child1::'+str);
    }
}