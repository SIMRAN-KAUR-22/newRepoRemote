trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
    //Trigger.New
    if (trigger.isinsert && trigger.isbefore) {
        //AccountTriggerHandlerRT.beforeInsert(Trigger.new);
    } 
    
    //Write a logic for delete , whenever an contact is deleted -> update description of parent to child deleted, child "lastname" deleted
    
    //Writeever you are tring to delete an account, sytop user with an error message
    
    //When a Contact is created or updated,
 	//if their ‘Email’ matches another Contact’s Email,
 	//prevent the action and provide a user-friendly error message. Make sure your solution is bulk-safe
 	
 	//get the count of contacts on account -- 
    
    //aggregateResult, databse.dml operations
    
    //https://interviewprep.org/salesforce-object-query-language-soql-interview-questions/
    if (trigger.isinsert && trigger.isafter) {
        //AccountTriggerHandlerRT.afterInsert(Trigger.new);
        //trigger.adderror('this account ca't be ');
    }  
    
    if (trigger.isupdate && trigger.isbefore) {
       // AccountTriggerHandlerRT.beforeUpdate(Trigger.new, Trigger.old, Trigger.oldMap, Trigger.newMap);
    }
    if (trigger.isupdate && trigger.isafter) {
         //AccountTriggerHandlerRT.afterUpdate(Trigger.new, Trigger.old, Trigger.oldMap, Trigger.newMap);
        //This logic will not do anything to contacts as we have just inserted the account so there will not be any contacts at this moment
        //get the child contacts - parent
        //step 1.all parentids
        //step 2.get the parent related child contacts
        //step 3. prepare map of pafrent child is not avaialble directly 
        
       //Simran Child 1 - Simran
       //Simran Child 2 - Simran
       //MSD Child 1 - MSD
       //MSD CHild 2 - MSD
       /*Map<Id, List<Contact>> accountcontactMap = new Map<Id, List<Contact>>();
        * METHOD 2:
       List<Contact> childList = new List<Contact>();
        for (Contact ct : childrecords) {
            childList = new List<Contact>();
            if  (accountcontactMap.containsKey(ct.accountId)) {  //first this wil not run, Simran, msd
                 accountcontactMap.get(ct.accountId).add(ct);// Simran : Simran child1, simran child 2 // msd: msd child 1, msd child 2
            } else {
                childList.add(ct); //Simran Child 1  // Msd c1
            	accountcontactMap.put(ct.accountId, childList);   // Simran :  Simran Child 1 //Msd : msd child 1
            }
        } 
        
        System.debug('New accs '+trigger.new);
       System.debug('New acc map '+trigger.newMap);
        for (Id accId : accountcontactMap.keyset()) {
            Account acc = trigger.newmap.get(accId);
                for (contact ct : accountcontactMap.get(accid)) {
                    ct.LastName = ct.LastName + ' ' +acc.name;
                    childListToUpdate.add(ct);
            }
        }
        
		METHOD 3:

       List<Account> accountWithContacts = [Select id, name,(select id, phone from contacts) from account where id IN :trigger.newMap.keyset()]; 
        
        for (Account acc: accountWithContacts) {
            if (acc.contacts.size() > 0 ) {
                for (contact ct : acc.contacts) {
                    ct.LastName = ct.LastName + ' ' +acc.name;
                    childListToUpdate.add(ct);
                }
            }
        } */
        
        
        
      //parengt billingcity -> child contacts
      //	old	oldmap	new	newmap
	//list<sobject>	map<id, sobject>	list<sobject>	map<id, sobject>
    //BEFORE Insert	NA	NA	Yes	NA
    //AFTER Insert	NA	NA	Yes	Yes

    }
}