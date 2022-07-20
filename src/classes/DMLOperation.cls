/*
 *  Purpose          :    This class is for different leve of DML operation.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/10
 *  Revision Logs    :    V_1.0 - Created - 2022/07/10
 */
public with sharing class DMLOperation {
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing different level of update Update DML operation.
    * Params        :    Void
    * Return        :    Void
    */
    public static void allDmlOperation() { 
        //Level 1     
        List<Contact> conList = [Select Department , Description from Contact];
        for(Contact badCon : conList) {
            if (badCon.Department == 'Finance') {
                badCon.Description = 'New description';
            }
            // Not a good practice since governor limits might be hit.
            //update badCon;
        }    
        // Level 2
            List<Contact> upDateList = new  List<Contact>();
            List<Contact> conList2 = [Select Department , Description from Contact];
        for(Contact badCon2 : conList2) {
            if (badCon2.Department == 'Finance') {
                badCon2.Description = 'New description';
                upDateList.add(badCon2);
            }
        }
        update upDateList; //This results in one call for the entire list

        List<Contact> upDateList2 = new  List<Contact>();   
        for(Contact badCon3 : [Select Department , Description from Contact where Department = 'Finance']) {
                badCon3.Description = 'New description';
                upDateList.add(badCon3);
        }
        update upDateList2; //This results in one call for the entire list
        // INSERT
        Account insertAcc = new Account();
        insertAcc.Name = 'Basil';
        insertAcc.AccountNumber = '4423537157351';
        insertAcc.NumberOfEmployees = 150; 
        insertAcc.Phone ='9987543745';
        insert insertAcc;
        //  UPSERT
        List<Account> combine = new List<Account>();
        Account a = new Account(Name='Tech-Trash-Four', Phone = '232323');
        Account b = [SELECT Id,Name, Phone FROM Account WHERE Name='Personal Account'];
        b.Phone = '777777'; 
        combine.add(a);
        combine.add(b);
        upsert combine;
        //  MERGE
        Account acc4 = [SELECT Name, Phone FROM Account WHERE Name='Training Coordinator2' Limit 1];
        // Accessing a existing record which have contact details
        Account accMerge = [SELECT Name, Phone FROM Account WHERE Name='Training Coordinator'Limit 1];
        // Now initiate the Merge operation
        merge acc4 accMerge;

        //  DELETE RECORDS
        List<Account> delAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Gorge'];
        delete delAcc;
    
        //  UNDELETE RECORDS
        List<Account> deletedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Gorge' ALL ROWS];
        undelete deletedAcc;   
    }
}