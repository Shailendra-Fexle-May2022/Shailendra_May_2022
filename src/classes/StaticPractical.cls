/*
 *  Purpose          :    This class shows different way to use static and nonstatic method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/28
 *  Revision Logs    :    V_1.0 - Created - 2022/06/28
 */
public with sharing class StaticPractical {
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This nonstatic method is used to call other static method,nonstatic method and variables.
      * Params        :    Void
      * Return        :    Void
      **/
    public void nonStatic_SP_M1() {
       // Call nonstatic method nonStatic_M3() of StaticMethod class by nonstatic method nonStatic_SP_M1() of StaticPractical class.
        System.debug('Call NonStatic Method From NonStatic Method OF Other Class.');//Call NonStatic Method From Other Class.
        //System.debug(nonStatic_M3()); // Method does not exist or incorrect signature: void nonStatic_M3() from the type StaticPractical
        StaticMethod sh = new StaticMethod();
        sh.nonStatic_M3(); // m3 method call,   m2 method call

        //Call nonstatic method nonStatic_M5() of StaticMethod class by nonstatic method nonStatic_SP_M1() of StaticPractical class.
        // This method is accessing Static variable(college) and nonstaic variable (name,rollNo).
        sh.nonStatic_M5(23,'Ayush Sharma'); // Ayush Sharma 23 A.I.E.T
        System.debug('Static Variable from other class'+StaticMethod.college);

        StaticMethod nonStatic = new StaticMethod();
        System.debug('NonStatic Variable from other class'+nonStatic.rollNo);
        System.debug('NonStatic Variable from other class'+nonStatic.name);

        //Call static method m7() return type of StaticMethod class by nonstatic method nonStatic_SP_M1 of StaticPractical class.
        Integer i = StaticMethod.m7();
        System.debug(i);// 10

        //Call static method m1() void type of StaticMethod class by nonstatic method nonStatic_SP_M1 of StaticPractical class.
        System.debug(StaticMethod.m8());
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This static method is used to call other static method,nonstatic method and variables.
      * Params        :    Void
      * Return        :    Void
      **/
    public static void sP_M2(){
        //Call static method m7() return type of StaticMethod class by static method sP_M2() of StaticPractical class.
        System.debug('Call Static Method From Static Method OF Other Class.'); //Call Static Method From Static Method OF Other Class.
        Integer i = StaticMethod.m7();
        System.debug(i);// 10

        // Call nonstatic method nonStatic_M3() of StaticMethod class by static method sP_M2() of StaticPractical class.
        StaticMethod method = new StaticMethod();
        method.nonStatic_M3(); //m3 method call,  m2 method call
        StaticMethod.m6(); // Static method cannot be referenced from a non static context: void StaticMethod.m6()

        // This method is accessing Static variable(college) and nonstaic variable (name,rollNo).
        method.nonStatic_M5(35,'Manoj Kumar'); //Calling By Static Method,  Manoj Kumar 35 A.I.E.T

        //Call static method m1() void type of StaticMethod class by static method sP_M2() of StaticPractical class.
       /System.debug(StaticMethod.m8());
       // Accessing Static variable(college) and nonstaic variable (name,rollNo).
        System.debug('Static Variable from other class'+StaticMethod.college);

        StaticMethod nonStatic = new StaticMethod();
        System.debug('NonStatic Variable from other class'+nonStatic.rollNo);
        System.debug('NonStatic Variable from other class'+nonStatic.name);
    }
}