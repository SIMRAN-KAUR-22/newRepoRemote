public class MyFirstBatch implements Database.Batchable<SObject>, Database.Stateful, Schedulable {
    Integer count = 0;
    public Database.querylocator start(Database.Batchablecontext bc){
        String qurery = 'SELECT id, Name, description FROM Account';
        return Database.getquerylocator(qurery);
    }
    
    public void execute(Database.Batchablecontext bc, List<Account> scope){
        count++;
        for (Account acc : scope) {
            acc.Description = 'Batch job revert !!';
        }
        update scope;
        
        //use partial dml operatoon database.update
    }
    
    public void finish(Database.Batchablecontext bc){
        //email logic 
        system.debug('count >>> '+count);
    }
    
    public void execute(Schedulablecontext bc){
        database.executebatch(new MyFirstBatch(), 10);
    }
    
    
    //cron expression
    // seconds minutes hours day_of_month month day_of_week  optional_year
    // 0 0 2 ? * * ?
    // 
    // '0 5 * ? * ? ?'
    // System.schedule('simrans job', '0 6 * ? * ? ?', new MyBatchClass());
}