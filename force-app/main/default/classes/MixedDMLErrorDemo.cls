public class MixedDMLErrorDemo {

    public static void myMethod() {
        /*Contact a = new Contact(LastName='ApexHours', email='tetsf@nf.com');
        insert a;
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='apexhours@apexhours.com');
        insert usr;*/
        
        List<User> userList = [SELECT id, username from user where id ='005dL000016rRH7' limit 1];
        User usr = userList[0];
        usr.Alias = 'Future';
        update usr;
            
        Contact acc = new contact();
        acc.lastName = 'Future testing';
            acc.email = 'tetsing@gmail.com';
        insert acc;
        
    }
}