public class FutureClass {
    @future
    public static void updateUser(Id userId, Id accountId) {
       /* Try{
        List<User> userList = [SELECT id, username from user where id = : userId];
        User usr = userList[0];
        usr.Alias = 'Future';
        update usr;*/
        //HW:::::::::::Update User and Account in the Same Future Method
     		User usr = [SELECT Id, title FROM User WHERE Id = :userId];
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :AccountId ];
        
       		 usr.title ='updated from future';
       		 acc.name = 'updated from future';
        		update new List<SObject>{usr, acc};
				System.debug(' User and Account updated successfully via Future!');
    /*}
    
    catch (exception e) {
        System.debug(' Cannot update due to error:'+ e.getmessage());
    }*/
  }
    
    @future
    public static void mixeddml(){
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