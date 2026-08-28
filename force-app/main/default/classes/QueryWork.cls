public class QueryWork 
{		//list method----------------------------------------
    	public static void getFirstAccountslist()
    	{
            
         /* Account acc = new Account();
            
         Utility qq = new Utility();
         String str = qq.lengthCheck('Testingstring');
         
         System.debug('info from child '+str);    
        // Querying all Account records
        // 
        for (Integer i =1 ; i < 200 ; i++) {
            
            System.debug('Accounts (LIST METHOD) : ' +i); 
            
        }
            
        List<Account> accList = [SELECT Id, Name, Industry, Phone FROM Account ORDER BY name Asc]; 
        //List<Account> accList = [SELECT Id, Name, Industry, Phone FROM Account ORDER BY name Asc];

        // Displaying results
        
        return accList[0]; */
            
            
           
    	}
        
    	//set method--------------------------------------------------
    	public static void getaccountset()
        { // SOQL queries always return a List<sObject>, not a Set<sObject>. First create a list and then convert it to set
         //create a list
         list <Account> accList = [SELECT Id, Name, Industry, Phone, (Select id, lastname from Contacts) FROM Account ORDER BY Name Asc];
         
         //child to parent
         List<Contact> ctList = [SELECT id, Lastname, Accountid, Account.Name, Account.AnnualRevenue FROM Contact limit 50000];  
            
            for (Contact ct : ctList) {
                System.debug(ct.LastName + 'acc name >> '  +ct.Account.Name);
            } 
            
            //add query directly in for each
            for (Contact ct : [SELECT id, Lastname, Accountid, Account.Name, Account.AnnualRevenue FROM Contact limit 50000]) {
                System.debug(ct.LastName + 'acc name >> '  +ct.Account.Name);
            } 
            
            
         // Convert List to Set (Set ensures uniqueness of records)
    	 //Set<Account> accSet = new Set<Account>(accList);
            Set<Account> accSet = new Set<Account>();
            for (Integer i =0 ; i < 5 ; i++) {
                System.debug('Simran ' + i);
            }
            
            for (Account acc : accList) {
                //19
                System.debug('Account Name ' + acc.Name);
                /*if (acc.Name != 'test') {
                    accSet.add(acc);
                }*/
                
                for (Contact ct : acc.contacts) {
                    System.debug('Contcat Name ' + ct.lastName);
                }
                
            }
            
            System.debug('Account Set>> ' + accSet.size());
           for (Account acc : accset) {
                System.debug('Account from Set>> ' + acc.Name);
            } 
		//query for all account records
		//set <Account> accset= [SELECT Id, Name, Industry, Phone FROM Account]; we cannot do this directly. 
	
         //display result 
         System.debug ('Accounts (set methdod): ' + accset);
            
		// To check every record clearly, loop through them individually:
		for (Account acc : accList) 
    	{
    	System.debug('Name: ' + acc.Name + ', Industry: ' + acc.Industry + ', Phone: ' + acc.Phone);        	
    	}
            
        FutureClass.updateUser(UserInfo.getUserId(), '001dL00001MAp8fQAD' );
        /**/
          
        
	}  
    
    
    
}