public class DMLClass {
    public static String dMLForAccount() {
        String returnType = 'SUCCESS';
        try {
            List<Account> accList = [SELECT id, name from account limit 5];
        	List<Account> updatedAccList = new List<Account>();
        	for (Account acc : accList) {
            	if (acc.Name == 'Dickenson plc') {
                	acc.Name = 'Test Account';
            	} else {
                	acc.Name = 'Simran Test Account';
            	}
            
            	updatedAccList.add(acc);
        	}
        
	        //update updatedAccList;
    	    List<Database.SaveResult> srList = Database.update(updatedAccList, false); 


			// Iterate through each returned result
			for (Database.SaveResult sr : srList) {
    			if (sr.isSuccess()) {
        			// Operation was successful, so get the ID of the record that was processed
        			System.debug('Successfully inserted account. Account ID: ' + sr.getId());
    			}
    			else {
        			// Operation failed, so get all errors                
        			for(Database.Error err : sr.getErrors()) {
            			System.debug('The following error has occurred.');                    
            			System.debug(err.getStatusCode() + ': ' + err.getMessage());
            			System.debug('Account fields that affected this error: ' + err.getFields());
        			}
    			}
			}
        } catch(Exception e) {
            System.debug('exception  '+ e.getmessage());
            returnType = 'EXCEPTION_OCCURED';
        }
        return returnType;
    }
    
    public static String aggregateResultAccount() {
        List<AggregateResult> accounts = [SELECT id, sum(annualrevenue) total from account group by id having sum(annualrevenue) > 1000000];
        
        for (AggregateResult ar : accounts) {
            System.debug(ar.get('Id')  +  ' : ' + ar.get('total'));
        }
        
        
        accounts = [SELECT count(id) childCount from contact group by accountid];
        
        for (AggregateResult ar : accounts) {
            System.debug(ar.get('childCount'));
        }
        
        List<account> accountsToUpsert = new List<account>();
        Account acc = new Account();
        acc.Name = 'Testing';
        acc.Type = 'Other';
        acc.Phone = '123456789';
        accountsToUpsert.add(acc);
        
        acc = new Account(id = '001dL00001MAp8eQAD', Name = 'Testing2', Type = 'Other', Phone = '123456789');
        accountsToUpsert.add(acc);
        
        upsert accountsToUpsert;
        
        return 'FINE';
    }
}