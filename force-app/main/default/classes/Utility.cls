public class Utility {
    /*public final integer limitval;// = 10;
    
    public Utility() {
        limitval = 20;
    }
    public String lengthCheck(String input) {
        system.debug(limitval);
        //limitval = 20;
        String returnType = '';
        if (!String.isempty(input) && input.length() > 10) {
            returnType = '10Chars';
        } else {
            returnType = 'MoreChars';
        }
        return returnType;
    }
    
    public static void mapMethods() {
        Map<Id, Account> accountMap = new Map<Id, Account>();
         Map<Id, String> accountNameMap = new Map<Id, String>();
        //List<Account> accountList = [SELECT id, name from Account limit 10];
        //
        for (Account acc: [SELECT id, name, site, AccountNumber from Account limit 10]) {
            accountMap.put(acc.id, acc);
            accountNameMap.put(acc.id, acc.name);
        }
        
        System.debug('all keys '+ accountMap.keyset());
        
        System.debug('all values '+ accountMap.values());
        
        for (Id accId : accountMap.keyset()) {
            System.debug('map details !!');
            System.debug('map key: ' + accId);
            System.debug('map Value: ' + accountMap.get(accId));
        }
    } */
        Public static void hwMap(){
            //HW (28/OCT)-------------------------------------------------------------------------
        //prepare a map with accid as a key and add any of the contact for that account
        //Map<Id, Contact>
      	// Define a map where key = AccountId, value = contact
      	 
      	
         Map<Id, Contact> accContactMap = new Map<Id, Contact>();
        // Query all contacts with their related AccountId
		for (Contact con : [SELECT Id, Name, AccountId FROM Contact WHERE AccountId != null])
        {
            if (!accContactMap.containsKey(con.AccountId)) // if map does not have already this AccountId as a key.
            {
        accContactMap.put(con.AccountId, con);
    				}
				}
        }
    
        //create a static variable inside class - and try accessing inside static methods and non static methods
            
    //Create a static variable
    public static String courseName = 'Salesforce Developer';

    // Create a static method
    public static void usingStaticMethod() {
        System.debug('usingStaticMethod: ' + courseName);
    }
//Utility. usingStaticMethod() <=FOR EXECUTION
    //Create a non-static method
    public void usingNonStaticMethod() {
        System.debug('usingNonStaticMethod: ' + courseName);
        }
    //Utility obj = new Utility(); obj.usingNonStaticMethod(); <=FOR EXECUTION
}