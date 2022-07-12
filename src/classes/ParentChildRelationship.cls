/*
 *  Purpose          :    This class is show child to parent and parent to child query.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/11
 *  Revision Logs    :    V_1.0 - Created - 2022/07/11
 */
public with sharing class ParentChildRelationship {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing child to parent and parent to child query.
    * Params        :    Void
    * Return        :    Void
    */
    public static void parentChildQuery_Method() {

        //Parent to Child Quiers of relationship
        List<Account> listOfAccount  = [Select Name, (Select Name from Contacts) from Account];
        for(Account act : listOfAccount ){
            System.debug('Name:'+ act.Name );
        }    

        //Child to Parent Quiers of relationship
        List<Contact> listOfContact = [Select FirstName, LastName, Account.Name,
                                        Account.Industry from Contact ];
        for(Contact con : listOfContact){
            System.debug('Account Name:' + con.Account.Name);
            System.debug('Industry:' + con.Account.Industry);
        }                                   
    }
}