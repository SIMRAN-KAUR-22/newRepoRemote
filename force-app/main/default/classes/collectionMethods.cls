public class collectionMethods {
    	// list method
    	public void useList() {
    	// creating a list of integers 
        List<Integer> listOfNum = new List<Integer>();

        // add elements 
        listOfNum.add(1);
        listOfNum.add(2);
        listOfNum.add(3);
        listOfNum.add(4);

        // display list
        System.debug('List of Numbers: ' + listOfNum);
    }
    
   public static Account ABCWork() {
    List<Account> acc = [SELECT Id, Name, Industry FROM Account];
//return acc.isEmpty() ? null : acc[0]; ternary operator can also be used
    if (acc.isEmpty()) {
        System.debug('No accounts found');
        return null;
    } else {
        System.debug('Found ' + acc.size() + ' accounts');
        System.debug('I AM USING FOR LOOP TO PROCESS DATA');
        for (Account a : acc) {
            System.debug('Account Name: ' + a.Name + ', Industry: ' + a.Industry);
        }

        if (!acc.isEmpty()) { 
            system.debug('only first account retreive:');
            system.debug(acc.get(0));
            return acc.get(0) ;
        } else {
            return null;
        }
    }
   }
    public static void main(){
        system.debug('This is from main' + ABCWork());
    }
}