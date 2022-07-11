/*
 *  Purpose          :    This class shows how to insert and update data in object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/7/5
 *  Revision Logs    :    V_1.0 - Created -  2022/7/5
 */
public with sharing class DmlInsertClass {
    static List<Contact> contacts = new List<Contact>();
    static List<Lead> leads = new List<Lead>();
    static List<Account> accounts = new List<Account>();
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to retrieve, insert and update the data.
    * Params        :    Void
    * Return        :    Void
    */
    public static void dml_Method() {

        Account a = new Account(Name='Account Example');
        insert a;
        System.debug('Account Name:: ' + a.Name);//Account Name:: Account Example

        Account b = [SELECT Name,Industry FROM Account WHERE Name='Account Example' LIMIT 1];

        // Write the old values the debug log before updating them.
        System.debug('Account Name before update: ' + b.Name); // Account Name before update: Account Example
        System.debug('Account Industry before update: ' + b.Industry);// Account Industry before update: null

        // Modify the two fields on the sObject.
        b.Name = 'Account of the Day';
        b.Industry = 'Technology';
        b.Phone = '9982876350';

        // Persist the changes.
        update b;

        System.debug('Account Name after update: ' + b.Name); // Account Name after update: Account of the Day
        System.debug('Account Industry after update: ' + b.Industry);// Account Industry after update: Technology
        System.debug('Account Phone after update: ' + b.Phone);//Phone after update: 9982876350

        SObject s =new  Account();
        s.put('Name', 'Account Example');
        System.debug('Account Name: ' + s);//Account Name: Account:{Name=Account Example}

    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to retrieve the data.
    * Params        :    List<Account>,List<Lead>,List<Contact>
    * Return        :    Void
    */
    
    public static void convertType(String phoneNumber) {
        List<List<SObject>> results = [FIND :phoneNumber IN Phone FIELDS RETURNING 
        Contact(Id, Phone, FirstName, LastName), 
        Lead(Id, Phone, FirstName, LastName), 
        Account(Id, Phone, Name)];
        System.debug(results);
        //((), (), (Account:{Id=0015i00000JAfByAAL, Phone=9982876350, Name=Account of the Day}, Account:{Id=0015i00000JAfBPAA1, Phone=9982876350, Name=Account of the Day}))
        List<SObject> records = new List<SObject>();
        records.addAll(results[0]); //add Contact results to our results super-set
        records.addAll(results[1]); //add Lead results
        records.addAll(results[2]); //add Account results
        System.debug(records);
        //(Account:{Id=0015i00000JAfByAAL, Phone=9982876350, Name=Account of the Day}, Account:{Id=0015i00000JAfBPAA1, Phone=9982876350, Name=Account of the Day})
        if (!records.isEmpty()) { 
            for (Integer i = 0; i < records.size(); i++) { 
                SObject record = records[i];
                if (record.getSObjectType() == Contact.sObjectType) { 
                    contacts.add((Contact) record);
                    System.debug(contacts);
                } else if (record.getSObjectType() == Lead.sObjectType){ 
                    leads.add((Lead) record);
                    System.debug(leads);
                } else if (record.getSObjectType() == Account.sObjectType) { 
                    accounts.add((Account) record); 
                    System.debug(accounts );
                    //(Account:{Id=0015i00000JAfByAAL, Phone=9982876350, Name=Account of the Day})
                }
            }
        }
    }
}
