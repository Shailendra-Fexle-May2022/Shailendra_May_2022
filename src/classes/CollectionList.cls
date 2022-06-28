/**
 *  Purpose         :    This class is used to how to initialize and assign value to List
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/

public with sharing class CollectionList {
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the different method of ListCollection
      * Params        :    List<Integer>,List<String>,Set<Integer>
      * Return        :    Void
      **/
    public static void listMethods(){
        // Creating and Initialization of List
    	List<Integer> List1 = new List<Integer>();
        // Adding value to List
         List1.add(11);
         List1.add(12);
         List1.add(13);
         System.debug(List1);  //(11, 12, 13)
         
         // Initialization and assiging the value together
         List<Integer> List2 = new List<Integer>{8,9,10};
         System.debug(List2); //(8, 9, 10)
         
         // Creating and Initialization an String List
         List<String> List3 = new List<String>{'I','AM', 'FELLING','GOOD'};
         System.debug(List3); //|(I, AM, FELLING, GOOD)
         
         // Methods Of List
         List<Integer> List4 = List1.clone();
         System.debug(List4); //(11, 12, 13)
         System.debug(List1.size()); //3
         System.debug(List2.size()); //3
         System.debug(List3.size()); //4
         List4.remove(0); // Remove 0 index value
         System.debug(List4);  //(12, 13)
         System.debug(List3.get(1)); // AM
         System.debug(List3.IsEmpty());  //Flase
         List4.set(0,15);   //Add 15 at 0 Index
         System.debug(List4); //(15, 13)
         List4.sort();
         System.debug(List4); // (13,15)
         List4.clear();
         System.debug(List4); // ( )
         List<Integer> myList = new List<Integer>(List2);
         Set<Integer> mySet = new Set<Integer>(List2);
         System.debug(myList);
         System.debug(mySet);
         Integer i = myList.indexOf(10); //returns the index value of element.
         System.debug(i); //2
         Integer a = myList.indexOf(11);
         System.debug(a); // -1(If list element in not available then returns -1 )
         System.debug(myList.equals(List2)); //true
         System.debug(myList.contains(10)); //true
         Set<Integer> mySet1 = new Set<Integer>{5,7,11};
         myList.addAll(mySet1);
         System.debug(myList);  //  (8, 9, 10, 5, 7, 11)
    }
}