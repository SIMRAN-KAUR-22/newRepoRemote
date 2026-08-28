public class AccountController {
    @AuraEnabled(cacheable=true)
    public static Account fetchRecordApex(Id recordIdApex) {
        List<Account> accountsList = [SELECT Id, Name FROM Account WHERE Id = :recordIdApex];
        return accountsList[0];
    }
    
    @AuraEnabled
    public static Account fetchRecordNameApex(String nameApex) {
        List<Account> accountsList = [SELECT Id, Name FROM Account WHERE Name = :nameApex];
        return accountsList[0];
    }
}

/*
 * <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <types>
        <members>AccountController</members>
        <name>ApexClass</name>
    </types>
    <types>
        <members>myfirstlwc</members>
        <name>LightningComponentBundle</name>
    </types>
    <version>65.0</version>
</Package>*/