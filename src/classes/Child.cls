/**
 *  Purpose         :    This child class is using super keyword and calling method from Parent class.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/29
 *  Revision Logs   :    V_1.0 - Created - 2022/06/29
 **/

public class Child extends Superclass {
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to call method of parent class using super keyword.
      * Params        :    Void
      * Return        :    Void
      **/

    public override void printName() {
        super.printName(); // call the method by super keyword.
        System.debug('My age is:: ' + super.getMyAge());
      }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This constructor is used to pass values in the constructor of parent class.
      * Params        :    Void
      * Return        :    Void
      **/

    public Child(){
        super('Aman','Sharma');
   } 
  }
/*SuperClass sup = new  Child();
sup.printName();
new  Child();*/