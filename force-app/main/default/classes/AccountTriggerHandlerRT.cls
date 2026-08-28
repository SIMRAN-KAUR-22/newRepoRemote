public class AccountTriggerHandlerRT {
    /* public static void beforeInsert(List<Account> newaccounts) { /*
        for (Account acc : newaccounts) {
            if (acc.Name == 'Simran') {
                acc.Description = 'Updated from Trigger';
            }
        }
    }
    
    public static void beforeUpdate(List<Account> newaccounts, List<Account> oldaccounts, Map<id, Account> oldaccountsMap, Map<id, Account> newaccountsMap) {
        for (Account acc : newaccounts) {  //SimranNew
            if (acc.Name != oldaccountsMap.get(acc.Id).Name) {
                acc.Description = 'Account Name is chnaged';
            }
        }
    }
    
    public static void afterUpdate(List<Account> newaccounts, List<Account> oldaccounts, Map<id, Account> oldaccountsMap, Map<id, Account> newaccountsMap) {
        List<Contact> childRecords = [Select id, phone, lastname, accountid from Contact where accountid in : newaccountsMap.keyset()];
    	List<Contact> childListToUpdate = new List<Contact>();
		for (contact ct : childRecords) {
            ct.lastname = ct.LastName + newaccountsMap.get(ct.accountid).Name;
            childListToUpdate.add(ct);
        }
        
        update childListToUpdate;
    }
    
    public static void afterInsert(List<Account> newaccounts) {
        if (trigger.isinsert && trigger.isafter) { 
			List<Contact> contacts=new List<Contact>();//Create a list to hold new Contacts
        		for(Account acc : newaccounts) { //Loop through each newly inserted Account	              
        			Contact con = new Contact(LastName = acc.Name + ' Contact', AccountId = acc.Id, Email = acc.Name + '@example.com'); // one contact per account
            	  	// for validation of Email on contacts side, dummy EMAIL has to be added 
                	contacts.add(con); // add to the contacts list.
        	}
    		insert contacts ; // insert all the new Contact records
    	}
        
       
        FutureClass.mixeddml();*/
    }