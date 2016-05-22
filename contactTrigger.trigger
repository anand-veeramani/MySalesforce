trigger contactTrigger on Contact (after insert,after update,before update,before insert,before delete,after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            System.debug('Test Successfull1');
            for(Contact ct:Trigger.New){
            //contactTriggerHandler.alertPetTrackingSystem();
            System.debug('Test Successfull');
            }
        }
    }
    if(Trigger.isBefore){
       
    }
    
}