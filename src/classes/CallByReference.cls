/*
 *  Purpose          :    This class shows how a List argument is passed by reference into the method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/26
 *  Revision Logs    :    V_1.0 - Created - 2022/06/26
 */

public with sharing class CallByReference {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the string argument.
    * Params        :    String
    * Return        :    Void
    */

    public static void list_Method(String a, String b) {
        List<String> listOfString = new List<String>(); 
        listOfString.add(a);
        listOfString.add(b);
        system.debug('Name of Person in first list::' + listOfString); //(Say, Who)

        listCallByReference(listOfString);
        System.debug('Name of Person in second list:: '+listOfString);//(Say, Who, Hello, By)

        listCallByReference1(listOfString);
        System.debug('Name of Person in third list:: '+listOfString);//(Say, Who, Hello, By, Jhon, Michal)

        } 
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created List 
    * Params        :    List<String>
    * Return        :    Void
    */

     public static void listCallByReference(List<String> list1) {
        system.debug('Name of Person in list2::' + list1); //(Say, Who)
        list1.add('Hello');
        list1.add('By');
        system.debug('Updated number of Person in list2::' + list1); //(Say, Who, Hello, By) 
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created List 
    * Params        :    List<String>
    * Return        :    Void
    */

    public static void listCallByReference1(List<String> list2){
        system.debug('Name of Person in list3::' + list2); //(Say, Who, Hello, By)
        list2.add('Jhon');
        list2.add('Michal');
        system.debug('Updated number of Person in list3::' + list2); //(Say, Who, Hello, By, Jhon, Michal)       
    }
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the integer argument.
    * Params        :    Integer
    * Return        :    Void
    */

    public static void set_Method(Integer a, Integer b) {
        Set<Integer> setOfInteger = new Set<Integer>(); 
        setOfInteger.add(a);
        setOfInteger.add(b);
        system.debug('Roll no of two students::' + setOfInteger); //{1, 2}

        setCallByReference(setOfInteger);
        System.debug('Roll no of four students:: '+setOfInteger);//{1, 2, 3, 4}

        setCallByReference1(setOfInteger);
        System.debug('Roll no of six students:: '+setOfInteger);//{1, 2, 3, 4, 5, 6}

        } 
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created Set 
    * Params        :    Set<Integer>
    * Return        :    Void
    */

     public static void setCallByReference(Set<Integer> set1) {
        system.debug('Roll no of two students::' + set1); //{1, 2}
        set1.add(3);
        set1.add(4);
        system.debug('Roll no of four students:: ' + set1); //{1, 2, 3, 4}
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created Set 
    * Params        :    Set<Integer>
    * Return        :    Void
    */

    public static void setCallByReference1(Set<Integer> set2){
        system.debug('Roll no of four students:: ' + set2); //{1, 2, 3, 4}
        set2.add(5);
        set2.add(6);
        system.debug('Roll no of six students:: ' + set2); //{1, 2, 3, 4, 5, 6}       
    } 
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the argument.
    * Params        :    String, Integer
    * Return        :    Void
    */

    public static void map_Method(String s, Integer i) {
        Map<String, Integer> mapOfStringKey= new Map<String, Integer>{s => i}; 
        system.debug('Name and Roll of student::' + mapOfStringKey); //{Abhishek=1}

        mapCallByReference(mapOfStringKey);
        System.debug('Name and Roll of two students:: '+mapOfStringKey);//{Abhishek=1, David=2, John=3}

        mapCallByReference1(mapOfStringKey);
        System.debug('Name and Roll three of students:: '+mapOfStringKey);//{Abhishek=1, Aman=5, David=2, John=3, Rahul=4}

        } 
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created Map 
    * Params        :    Map<String, Integer>
    * Return        :    Void
    */

     public static void mapCallByReference(Map<String, Integer> map1) {
        system.debug('Name and Roll of student::' + map1); //{Abhishek=1}
        map1.put('David', 2);
        map1.put('John', 3);
        system.debug('Name and Roll of two students:: ' + map1); //{Abhishek=1, David=2, John=3}
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created Map 
    * Params        :    Map<String, Integer>
    * Return        :    Void
    */

    public static void mapCallByReference1(Map<String, Integer> map2){
        system.debug('Name and Roll of two students:: ' + map2); //{Abhishek=1, David=2, John=3}
        map2.put('Rahul', 4);
        map2.put('Aman', 5);
        system.debug('Name and Roll three of students:: ' + map2); //{Abhishek=1, Aman=5, David=2, John=3, Rahul=4}      
    } 
    
}