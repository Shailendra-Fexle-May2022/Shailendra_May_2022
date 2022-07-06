/**
 *  Purpose         :    This class is used to show use of this keyword.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/29
 *  Revision Logs   :    V_1.0 - Created - 2022/06/29
 **/

public with sharing class ThisKeyWord {
    String name;
    Integer classNo;    
    Integer rollNo;    
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This constructor is used to passing the parameters and showing intance variable using this keyword
      * Params        :    String,Integer
      * Return        :    Void
      **/ 

    public ThisKeyWord(String name,Integer classNo, Integer rollNo){  
        this.name = name;  
        this.classNo = classNo;  
        this.rollNo = rollNo; 
        System.debug('The details of Student ::' + name+' '+classNo+' '+ rollNo);

    } 
     /**
    * Created By    :    Shailendra Sharma
    * Purpose       :    This constructor is used to call parameterized constructor from other constructor.
    * Params        :    Void
    * Return        :    Void
    **/     
    public ThisKeyWord() {
        this('Ram', 12, 256);
    }
}

//ThisKeyWord a = new ThisKeyWord();