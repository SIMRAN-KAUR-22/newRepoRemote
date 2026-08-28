trigger ConcatenateParentName on Contact ( before insert, before update) {
   if (( trigger.isupdate || trigger.isinsert) && trigger.isbefore) {
       
        system.debug ('working on concatenation trigger');
        set <id> accid = new set <id>();
        for ( contact con : trigger.new ){
            if( con.AccountId != null ){
                accid.add(con.AccountId);
            }
        }
        map<id, account > accmap = new map<id, account> ([SELECT id, name from account where id in: AccId ]);
        list <contact> con = new list <contact>();
        for (contact c : trigger.new){
            if ( c.AccountId != null && accmap.containskey (c.AccountId)){
                account a = accmap.get (c.AccountId);
                c.Contatenation_field__c = c.lastname + '-' + a.Name;
                con.add(c);
            }
        }
       //update con;
        
        //for (contact con : trigger.new){
           // con.AssistantPhone = '123321 from trigger';
        
    }
}