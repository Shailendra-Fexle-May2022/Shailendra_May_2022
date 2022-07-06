/*
 *  Purpose          :    This class is used to access the child class.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/7/6
 *  Revision Logs    :    V_1.0 - Created -  2022/7/6
 */
public with sharing class AcessClassOfInstanceOfClass {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to check instanceOf key.
    * Params        :    Void
    * Return        :    Void
    */
    public void acess_Method(){
        InstanceOfClass acc1 = new InstanceOfClass();
        InstanceOfClass acc = new Child2ClassOfInstanceOfClass();
       
        if(acc instanceOf ChildClassOfInstanceOfClass ){
            acc.print('Hello');
        }
        else
        {
           acc.print('Excuse'); 
        }
        if(acc instanceOf Child2ClassOfInstanceOfClass ){
            acc.print('Hello Dear');
        }
        else{
            acc.print('Bye Bye');
        }
    }
}