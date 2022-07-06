/*
 *  Purpose          :    This class shows different way to use static and nonstatic method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/28
 *  Revision Logs    :    V_1.0 - Created - 2022/06/28
 */
public with sharing class StaticMethod {
    public Integer rollNo = 12;
    public String name = 'Sahil';
    public static String college = 'A.I.E.T';
      /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to call other static method.
      * Params        :    Void
      * Return        :    Void
      **/
   
	public static void m1() {
        System.debug('m1 method call');  // m1 method call 
        //Call static method m2() by static method m1().
         m2(); 							//  m2 method call 
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to call other nonstatic method.
      * Params        :    Void
      * Return        :    Void
      **/

    public static void m2() {
        System.debug('m2 method call'); // m2 method call
        // Call nonstatic method nonStatic_m3() by static method m2().
       // nonStatic_M(); // Non static method cannot be referenced from a static context: void void StaticMethod.nonStatic_M()
        StaticMethod st = new StaticMethod();
        st.nonStatic_M(); // Calling By Static Method
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to called by other static method.
      * Params        :    Void
      * Return        :    Void
      **/
      
    public void nonStatic_M() {
        System.debug('Calling By Static Method');
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This  nonstatic method is used to call other static method.
      * Params        :    Void
      * Return        :    Void
      **/

    public void nonStatic_M3() {
        System.debug('m3 method call');   // m3 method call
        // Call static method m2() by nonstatic method nonStatic_M3().
        m2();					   // m2 method call
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This  nonstatic method is used to call other nonstatic method.
      * Params        :    Void
      * Return        :    Void
      **/

    public void nonStatic_M4() {
        System.debug('m4 method call'); // m4 method call 
        // Call non static method nonStatic_M3() by nonstatic method nonStatic_M4().
        nonStatic_M3(); // m3 method call  ,  m2 method call
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This nonstatic method is used to call static and nonstatic variable.
      * Params        :    Integer,String
      * Return        :    Void
      **/
    public void nonStatic_M5(Integer r,String n){
        //access nonStatic(name,rollNo) and Static variable(college) from nonstatic method nonStatic_M5().
        rollNo = r;
        name = n;  
        System.debug(name +' '+ rollNo +' '+ college ); // Sohan 12 A.I.E.T
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This static method is used to call static and nonstatic variable.
      * Params        :    Void
      * Return        :    Void
      **/
    public Static void m6(){

        //access nonStatic(name,rollNo) and Static(colleg) variable  from static method
        //System.debug('My RollNo and Name are::'+ name +' '+ rollNo ); // Errors: Variable does not exist: name, Variable does not exist: rollNo
        StaticMethod f = new StaticMethod();
        System.debug('My RollNo and Name are::'+ f.name +' '+ f.rollNo );
        System.debug(' My College Name is::'+ college ); // My College Name is::A.I.E.T
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This static method is used to return local variable.
      * Params        :    Void
      * Return        :    Integer
      **/
    public Static Integer m7(){
        Integer x = 10;
        return x;
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This static method is used to dispaly.
      * Params        :    Void
      * Return        :    Integer
      **/
      public Static void m8(){
        System.debug('m8 method call'); 
      }
}