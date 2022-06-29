/**
 *  Purpose         :    This class is used to show use of super keyword.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/29
 *  Revision Logs   :    V_1.0 - Created - 2022/06/29
 **/
public virtual class SuperClass {
    public String myFirstName;
    public String mylastName;
    public Integer myAge = 35;
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This constructor is used to initialization the variable.
      * Params        :    Void
      * Return        :    Void
      **/ 
    public SuperClass() {
        myFirstName = 'Ashok';
        myLastName = 'Singh';
    }    
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This constructor is used to pass parameters.
      * Params        :    String
      * Return        :    Void
      **/
    public SuperClass(String firstName , String lastName) {
        myFirstName = firstName;
        myLastName = lastName;
    }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to display the variables.
      * Params        :    Void
      * Return        :    Void
      **/
    public virtual void printName() {
        System.debug('My name is ' + myFirstName + myLastName);
    }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to display the different PrimitiveData
      * Params        :    Void
      * Return        :    Integer
      **/

    public virtual Integer getMyAge() {
       return myAge;
   }
}