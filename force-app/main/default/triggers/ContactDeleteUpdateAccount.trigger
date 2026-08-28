trigger ContactDeleteUpdateAccount on Contact (before delete, after delete, before update, before insert, after update, after insert) {
    if (Trigger.isDelete) {
        // Step 1: Collect all Account IDs from deleted Contacts
        Set<Id> accIds = new Set<Id>(); //using set will remove duplicates; new set mei account Ids stored
			for (Contact con : Trigger.old) {
            	accIds.add(con.AccountId); //accIds will have list of unique Account IDs whose Contacts were deleted.     
        	}

        // Step 2: related Accounts jinki Id match kare accIds wali list ki Id se, acclist mei save krwado
        	List<Account> accList = [SELECT Id, Description FROM Account WHERE Id IN :accIds];

        // Step 3: Update Account descriptions
        	for (Account acc : accList) {
            	for (Contact con : Trigger.old) {
                	if (con.AccountId == acc.Id) {
                    	acc.Description = 'The child of this parent has been deleted. Child name: ' + con.LastName;
                }
            }
        }

        // Step 4: Save changes
        	update accList; // bulk-safe (sirf ek hi update DML statement).
    }

//When a Contact is created or updated,if their ‘Email’ matches another Contact’s Email,
 	//prevent the action and provide a user-friendly error message. Make sure your solution is bulk-safe 
 	//step1: Collect all emails from the new or updated contacts
    // step2: Query existing contacts with same emails
    // step3: Compare and add error if duplicate found
    if ((trigger.isupdate || trigger.isinsert) && trigger.isbefore){
        set < STRING > emailCheck = New  set < STRING > ();
        for (Contact con : trigger.new){
            if (contact.Email != null){
                emailCheck.add (con.Email);
            }
        }
        Map<String, Contact> existingEmailMap = new Map<String, Contact>();
			for (Contact con : [SELECT Id, Email FROM Contact WHERE Email IN :emailCheck]) {
    			existingEmailMap.put(con.Email, con);
				}
        
        for (Contact con : Trigger.new) {
            if(con.Email !=null && existingEmailMap.containskey(con.email)){
            //con.Email.addError('Error: This Email is already in use!');
            }
        }
   	 }       
 	//get the count of contacts on account --
 	//Whenever a Contact is inserted, updated
 	//we want to update the parent Account to show how many Contacts it currently has.
 	
    //Psuedo code
    //get all the account ids of inserted, updated, deleted, undeleted contacts
    //query account and all its child contacts, get size()
    //now add 1 to the existing count
    //update this value on account new field
    //select count(id), accountid from contact group by accountid
    if ((trigger.isinsert || trigger.isupdate )&& trigger.isafter) {
    }
    
}