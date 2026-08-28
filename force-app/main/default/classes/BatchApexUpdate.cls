public class BatchApexUpdate implements database.batchable<sobject>, database.stateful  {
    integer runCount =0;
    list <string> successEmail = new list <string>();
    list <string> failureEmail = new list <string>();
    integer successCount = 0;
    integer failCount = 0;
    //Start
    public database.querylocator start (database.batchablecontext context){
		string que = 'SELECT Id, Name, TickerSymbol, (SELECT Id, Email FROM Contacts WHERE Email != null) FROM Account';
        return database.getquerylocator (que);        
    }
    
    //Execute
	public void execute(Database.Batchablecontext context, List<Account> scope)
    { 
        runCount++ ;
        for (account acc : scope){
            acc.TickerSymbol = 'Batch updated' ;
        }
     	// Partial DML — allow success even if some records fail
        //update scope;
       Database.SaveResult[] results = Database.update(scope, false);
       for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                successCount++;
            } else {
                failCount++;
                for (Database.Error err : sr.getErrors()) {
                    System.debug(' Record failed: ' + err.getMessage());
                }
            }
        }
        System.debug('Execute called ' + runCount + ' time(s)');
        System.debug('Successful updates: ' + successCount);
        System.debug('Failed updates: ' + failCount);
    }
    
    public void finish (Database.Batchablecontext context){
        System.debug('Batch finished. Total execute() runs: ' + runCount);
        //use the custom label email addresses to send emails to
        //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
        
    }
}