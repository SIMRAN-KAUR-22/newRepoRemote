trigger TriggerSelfPractice on Contact (before insert) {
    IF (trigger.isInsert){
        system.debug ('new record: ' + Trigger.New);
        system.debug ('old record: ' + Trigger.Old); //shows null for the first time record insertion
    }
}