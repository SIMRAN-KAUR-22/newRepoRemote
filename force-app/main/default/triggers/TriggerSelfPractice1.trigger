/*trigger TriggerSelfPractice1 on Account (before insert) {
   
    if (trigger.isinsert && trigger.isbefore) {
        
        for ( Account acc : Trigger.New){
            system.debug ('Found acoount');
            acc.Phone='1234567999';
        }
        
    }
}*/
//HW: Write a trigger on:: to insert a new contact whenever an account is inserted.


trigger TriggerSelfPractice1 on Account (before delete) {
//Whenever user try to delete an account, stop  with an error message
    if(trigger.isdelete && trigger.isbefore){
        for (Account acc : Trigger.old) { //Deleted records ka data Trigger.old mein aata hai (read-only)
            acc.addError('ERROR: You cannot delete this account.');
        }
    }
}

/*HW: PROS AND CONS OF trigger on:: to insert a new contact whenever an account is inserted.
PROS: 1. bulkified data
2. ensuring each account has its related contact
3. recursivess of trigger is prevented, by using insert contacts once outside the for loop, causing gov limits to not to exceed. 
CONS: 1. validation error: without email field contacts cannot be saved even if code is correct.
2. without account Id , this cannot work. for each contact, accId is needed to be linked with respective contacts. Thus, before insert won't work
*/