public class BirthdayEmail implements database.batchable<sobject> {
    public database.querylocator start (database.batchablecontext context){
        string soql ='SELECT Id, Birthdate, Email, Name FROM Contact WHERE Birthdate != null and birthdate = TODAY';
        return database.getquerylocator(soql);  
    }
    public void execute (database.batchablecontext context, list<contact> scope){
        list <contact> contactsToNotify = new list <contact>();
        date todayVal = date.today();
        system.debug('todayVal' +todayVal);
        for (contact con : scope){
            /*if(con.birthdate != null && con.birthdate == todayVal) {//&& con.birthdate.month() == today.month() && con.birthdate.day()== today.day()){
                contactsToNotify.add(con);
            }*/
            //if (!contactsToNotify.isempty()){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            	List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
                mail.setToAddresses (new string[] {con.Email, 'km08082021@gmail.com'});
                mail.setSubject ('Happy birthdy,' + con.name );
                mail.setPlainTextBody ('Wishing you a very Happy Birthday!'+ con.name + '; from batch' + '\n\n' );
            	mailList.add(mail);
                system.debug ('SENT BIRTHDAY MAIL');
            	Messaging.sendEmail(mailList);
            	// how to know if this is sandbox /production
            //}
            //else {
              //  system.debug ('NO BIRTHDAYS TODAY');
            //}
        }
    }

    public void finish (Database.Batchablecontext context) {
         System.debug(' Birthday Email Batch completed successfully.');
        //future from future
    }
}