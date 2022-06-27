/**
 *  Purpose         :    This class is used to show use of different Date Time and String Methods.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class DateTimeAndString{
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to display different Date Time and String Methods.
      * Params        :    Void
      * Return        :    Void
      **/
    public static void dateTimeAndStringMethod(){
        // DateTime Methods
        DateTime myDateTime = DateTime.newInstance(2022, 6, 24, 07, 08, 16);
        System.debug(myDateTime = myDateTime.addHours(3));// 2022-06-24 17:08:16
        System.debug(myDateTime = myDateTime.addMinutes(10)); // 2022-06-24 17:18:16
        System.debug(myDateTime = myDateTime.addMonths(5)); // 2022-11-24 17:18:16
        System.debug(myDateTime = DateTime.now()); //2022-06-24 13:13:01
        string year = '2022';
		string month = '08';
		string day = '10';
		string hour = '15';
		string minute = '40';
		string second = '20';
		string stringDate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute +  ':' + second;
        Datetime myDate = Datetime.valueOf(stringDate);
		System.debug(myDate); //2022-08-10 22:40:20

        //String Methods
        String str = 'ShailendraSharma';
        String str1 =  str.abbreviate(12);
        System.debug(str1); //Shailendr...
        String str2 = 'SHAILENDRA SHARMA';
        System.debug(str2.toLowerCase()); //shailendra sharma
        Integer result = str2.length();
        System.debug(result);// 17
        System.debug(str.remove('Sharma')); //Shailendra
        System.debug(str.removeStart('Shailendra'));//Sharma
    }
}