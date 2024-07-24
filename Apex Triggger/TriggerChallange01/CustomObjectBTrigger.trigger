trigger CustomObjectBTrigger on CustomObjectB__c (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete){
            CustomObjectBTriggerHelper.customObjectBNewList = Trigger.new;
        }
        if(Trigger.isUpdate){
            CustomObjectBTriggerHelper.customObjectBNewList = Trigger.new;
            CustomObjectBTriggerHelper.customObjectBOldMap = Trigger.oldMap;
        }
        if(Trigger.isDelete){
            
            CustomObjectBTriggerHelper.customObjectBOldList = Trigger.old;
        }
        CustomObjectBTriggerHelper.updateSecondHighestSalary();
    }
}
