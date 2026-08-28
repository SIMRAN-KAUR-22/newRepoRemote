public class CollectionWork {

    public  void collectionList() 
    {
        // Query all Accounts into a List
        List<Account> accList = [SELECT Id, Name, Industry, Phone FROM Account ];

        // Display List of Accounts
        System.debug('List of Accounts: ' + accList);
    }
}