public class CustomObjectBTriggerHelper {
    public static List<CustomObjectB__c> customObjectBNewList = new List<CustomObjectB__c>();
    public static Map<ID, CustomObjectB__c> customObjectBOldMap = new Map<ID, CustomObjectB__c>();
    public static List<CustomObjectB__c> customObjectBOldList = new List<CustomObjectB__c>();
    public static void updateSecondHighestSalary(){
        List<CustomObjectA__c> listCustomObjectAToUpdate = new List<CustomObjectA__c>();
        Set<Id> setOfCustomObjectAId = new Set<Id>();
        for(CustomObjectB__c element : customObjectBNewList){
            if((element.CustomObjectA__c != null && customObjectBOldMap.isEmpty())||
               (!customObjectBOldMap.isEmpty() && element.salary__c != customObjectBOldMap.get(element.ID).salary__c)){
                   setOfCustomObjectAId.add(element.CustomObjectA__c);
               }
        }
        for(CustomObjectB__c element : customObjectBOldList){
            if(element.CustomObjectA__c != null){
                   setOfCustomObjectAId.add(element.CustomObjectA__c);
               }
        }
        for(CustomObjectA__c objAelement : [SELECT Id, SecondHighestSalary__c, (SELECT id, salary__c from CustomObjectB__r ORDER BY salary__c DESC LIMIT 2) 
                                            from CustomObjectA__c where Id IN : setOfCustomObjectAId]){
                                                CustomObjectA__c newelement = new CustomObjectA__c(id = objAelement.Id);
                                                if(objAelement.CustomObjectB__r.size()==2){
                                                    newelement.SecondHighestSalary__c = objAelement.CustomObjectB__r[1].Salary__c;
                                                }
                                                else{
                                                    newelement.SecondHighestSalary__c = 0;
                                                }
                                                listCustomObjectAToUpdate.add(newelement);
        }
        if(!listCustomObjectAToUpdate.isEmpty()){
            update listCustomObjectAToUpdate;
        }
    }
}
