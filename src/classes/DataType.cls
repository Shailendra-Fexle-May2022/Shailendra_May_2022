public with sharing class DataType 
{
    public DataType() 
    {
        String name =  'Shailendra';
      String surName = 'Sharma' ;
       String fullName = name +'  '+ surName;
       System.debug(fullName);
       Blob b =  Blob.valueOf(fullName);
       System.debug(b);
       Date myBirthDate = Date.newInstance(2022, 5, 25); 
       Datetime myBirthTime = Datetime.newInstance(2022, 5, 25, 23, 15, 30) ;
       Integer age = 34;
       ID id='300000003FXALE'; 
       Double salary=36000.544; 
       Object obj = 34;
	   Integer i = (Integer)obj;    
    }
}