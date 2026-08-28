trigger AccuntFieldShowContactCount on Contact (after insert, after update, after delete, after undelete ) {
    // Collect all Account Ids in set
    Set<Id> accountIds = new Set<Id>();

    if ((Trigger.isInsert || Trigger.isUpdate) && Trigger.isAfter) {
        for (Contact c : Trigger.new) {
             accountIds.add(c.AccountId);
        }
    }
	//update se pehle wali id
    	if ( trigger.isupdate ){
        	for (Contact c : Trigger.old) {
            	 accountIds.add(c.AccountId);
    }
        
    if (Trigger.isDelete) {
        for (Contact c : Trigger.old) {
            accountIds.add(c.AccountId);
        }
    }
            if (Trigger.isUnDelete) {
        for (Contact c : Trigger.new) {
            accountIds.add(c.AccountId);
        }
    }

    
     Map<Id, Integer> accIdToCountMap = new Map<Id, Integer>();
    for (AggregateResult ar : [SELECT AccountId, COUNT(Id) countContacts 
                               FROM Contact 
                               WHERE AccountId IN :accountIds 
                               	GROUP BY AccountId]) {
        accIdToCountMap.put( (Id) ar.get('AccountId'), (Integer) ar.get('countContacts'));
            
            system.debug ('account id: ' + (Id) ar.get('AccountId') + ',total contacts: ' + (Integer) ar.get('countContacts') );
       }
            //Prepare list of Accounts to update the count field
            //If no contacts exist, set count to 0
            //Update Account with new Contact count

//get the count of contacts on account --
 	//Whenever a Contact is inserted, updated
 	//we want to update the parent Account to show how many Contacts it currently has.
 	
    //Psuedo code
    //get all the account ids of inserted, updated, deleted, undeleted contacts
    //query account and all its child contacts, get size()
    //now add 1 to the existing count
    //update this value on account new field
    //select count(id), accountid from contact group by accountid
        }
}