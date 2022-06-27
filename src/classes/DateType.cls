/**
 *  Purpose         :    This class is used to show different Mehods of DateTypeData
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class DateType{   
   
    /**
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to display different Mehods of DateTypeData
    * Params        :    Void
    * Return        :    Void
    **/
    public static void dateTypeDataMthod(){
        //Date Type Method
        Date myDate = Date.newInstance(2022,08,24);
        System.debug(myDate);// 2022-08-24
        myDate = Date.today(); // Returns the current date
        System.debug(myDate); //2022-06-22
        System.debug(myDate = myDate.toStartOfMonth());//2022-06-01
        System.debug(myDate = myDate.toStartOfWeek()); //2022-05-29
        System.debug(myDate = myDate.addMonths(4)); //2022-09-29
        System.debug(myDate = myDate.addDays(6));  // 2022-10-05
        System.debug(myDate = myDate.addYears(5)); // 2027-10-05
        Date myDate1 = Date.newInstance(2022,08,29);
        Integer day = myDate1.day();
        System.debug(day); // 29
        
        //dayOfYear => Returns the day-of-year component of a Date.
        System.debug(day = myDate1.dayOfYear()); //241
     
        //daysBetween => Returns the difference between two dates
        Date myDate2 = Date.newInstance(2022,09,10);
        Integer noOfDays = myDate1.daysBetween(myDate2);
        System.debug(noOfDays); //12
        
        //monthsBetween => Returns the difference between two Months
        Date firstDate = Date.newInstance(2022, 08, 2);
		Date secondDate = Date.newInstance(2022, 12, 8);
        Integer monthsBetween = firstDate.monthsBetween(secondDate);
        System.debug(monthsBetween); // 4
        
        //daysInMonth => Returns the number of days in the month for the specified year
        Integer days = Date.daysInMonth(2022,8);
        System.debug(days); // 31
             
		String dayString =myDate2.format();
        System.debug(dayString); // before(2022,09,10)=> after 9/10/2022
        System.debug(Date.isLeapYear(2022)); // false
    }
}