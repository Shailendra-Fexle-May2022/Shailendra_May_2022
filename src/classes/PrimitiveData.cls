/**
 *  Purpose         :    This class is used to show different use of PrimitiveData
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class PrimitiveData{
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to display the different PrimitiveData
      * Params        :    Void
      * Return        :    Void
      **/
    public static void primitiveDataMethod(){
       String name =  'Shailendra';
       String surName = 'Sharma';
       String fullName = name +'  '+ surName;
       System.debug(fullName);
       Blob b =  Blob.valueOf(fullName);
       System.debug(b);
       Date myBirthDate = Date.newInstance(2022, 5, 25);
       Datetime myBirthTime = Datetime.newInstance(2022, 5, 25, 23, 15, 30);
       Integer age = 34;
       ID id='300000003FXALE';
       Double salary=36000.544;   
    }
}