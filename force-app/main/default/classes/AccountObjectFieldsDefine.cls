public class AccountObjectFieldsDefine {
// method to create and initalise the account

    public void createAccountRecord()
    {
        //create a new account and accept each field values using field name not labels
        Account acc = new Account();

		//defining standard fields-----------------------------------------------------------
        acc.Name = 'Bhavya from Apex';
        acc.AccountNumber = 'A-111';
        User userObj = new User();
        userObj = [SELECT id FROM User WHERE email = '461simran@gmail.com' limit 1];
        acc.OwnerId = userObj.Id; // '005dL00000vHPqsQAG'; //userinfo.getuserId (); //current user
        
        // This field is stored as a lookup to the User object, so it expects a User Id value.
		// UserInfo is a system class in Apex that gives details about the currently logged-in user (the one who’s running the code)
		// .getUserId() returns that user’s Salesforce User ID (a unique 18-character Id, like 0052x00000ABCdEAA1).
		// If you are logged in as Simran Kaur and run this Apex code in the Developer Console, then the newly created Account record’s Owner will automatically be you (Simran Kaur)
    	acc.Site = 'Mumbai';
        acc.AccountSource = 'web' ;     // picklist
        acc.AnnualRevenue = 5000000;
        acc.Description = 'this account has been added through APEX DEMO';
        
        //shipping address
        acc.ShippingCountry = 'india';
        acc.ShippingCity = 'kapurthala';
        acc.ShippingPostalCode = '144602' ;
        acc.ShippingState = 'punjab';
		acc.ShippingStreet= '123 type-4 near complex' ;
        acc.Industry ='chemical';
        acc.phone = '1231231231';

		//defining custom fields-----------------------------------------------------------
        acc.SLAExpirationDate__c = date.today().addDays(365);
        Account accInst = [SELECT id FROM Account Where Name = 'Bhavya' limit 1];
        
        acc.ParentId = accInst.Id; // '001dL00001ZFAs2QAH';
        
        insert acc;
    }
}