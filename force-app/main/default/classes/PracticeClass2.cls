public class PracticeClass2 
{
	
    public static void prepListOfContacts ()
    { /* HW 1. get list of contacts and now add them into list based on accountid
  		if accountid == test.accountid  then add else add to another contactlist*/
        
        //creating test account
        Account testAccount = [SELECT Id, Name FROM Account WHERE Name = 'test' LIMIT 1];
        
        // Query all Contacts
        list <Contact> listContact = [SELECT FirstName, LastName, Email, AccountId FROM Contact];
       
        // Two lists for separating contacts
        List<Contact> matchingContacts = new List<Contact>();
        List<Contact> otherContacts = new List<Contact>();
        
        // Loop through all contacts
        For ( Contact cont : listContact) {    
            if (cont.AccountId == testAccount.Id)
        	{
           matchingContacts.add (cont) ;
        	}
            else 
            {
                otherContacts.add(cont);
            }
        }    
        // Debug output
        System.debug('Contacts related to Test Account: ' + matchingContacts);
        System.debug('Contacts NOT related to Test Account: ' + otherContacts);
        
        	/* HW 2. Create a lookup between 2 custom objects
   			and print parent to child and child to parent*/
        //invoice (child) and student(parent) are related objects 
        // parent to child fetch records of student and associated invoices
        list <STUDENT__c> stulist =[SELECT FATHER_NAME__c, MOTHER_NAME__c, ( SELECT Name, Account__c FROM invoices__r) FROM STUDENT__c ];
        for (STUDENT__c stu : stuList) 
        {
    		System.debug('Father: ' + stu.FATHER_NAME__c + ', Mother: ' + stu.MOTHER_NAME__c);
    	for (Invoice__c inv : stu.Invoices__r) 
        	{
        	System.debug('Invoice Name: ' + inv.Name + ', Account: ' + inv.Account__c);
    		}
		}
 
        //invoice (child) and student(parent) are related objects 
        //  child to parent fetch records of student and associated invoices
  	list <Invoice__c> childToParent = [SELECT Name, Account__c, STUDENT__r.FATHER_NAME__c, STUDENT__r.MOTHER_NAME__c FROM Invoice__c];
          // wrong! System.debug('FATHER Name: ' + childToParent.FATHER_NAME__c + ', MOTHER Name: ' + childToParent.MOTHER_NAME__c);
          // childToParent is a list, not a single record.You can’t directly access fields like childToParent.FATHER_NAME__c —
		 // you must loop through the list
         // Loop through each Invoice record
	for (Invoice__c inv : childToParent) 
    {
    	System.debug('Invoice Name: ' + inv.Name + ', Account: ' + inv.Account__c); 
    }
        /* HW 3. query all the accounts along contacts, now prepare a list of contacts if their lastname is only 'Barr' 
   print barr details
   if no barr contacts found in all the accounts then print no conatcts found*/
        // wrong: list <Contact> conlist = [SELECT AccountId, FirstName, LastName, Email, Account.Name, Account.OwnerId FROM Contact];
        // Query all Accounts along with their related Contacts
        List<Account> accList = [SELECT Id, Name, (SELECT Id, FirstName, LastName, Email FROM Contacts ) FROM Account];
        system.debug (acclist);
        // List to store contacts whose last name is 'Barr'
        List<Contact> barrContacts = new List<Contact>();
        
        // Loop through all accounts and their contacts
        for ( Account acc : acclist ) 
        {
            for (Contact con : acc.Contacts) 
            {
                if (con.LastName == 'Barr') 
                {

                    barrContacts.add(con); 
                }
            }
        }       
        
        // Check if any Barr contacts found
        if ( barrContacts == null )
        {
            system.debug ('NO CONTACTS FOUND WITH LAST NAME AS BARR');
        }
        else 
        {
            System.debug('Contacts with last name "Barr":');
            for (Contact nameVar : barrContacts) {
            system.debug ('Name:'+ nameVar.FirstName + ',LastName:' + nameVar.LastName + ',EMAIL:' + nameVar.Email);
        	}
        }
    }
}