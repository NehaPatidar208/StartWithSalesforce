@isTest
public class CustomObjectBTriggerHelperTest {
    @testsetup
    private static void setup(){
        
    }
    @isTest
    public static void updateSecondHighestSalaryTest(){
        //only for insert case
        List<CustomObjectA__c> customObjAList = new List<CustomObjectA__c>();
        Set<Id> customObjAset = new Set<Id>();
        List<CustomObjectB__c> customObjBList = new List<CustomObjectB__c>();
        for(integer i=0;i<2;i++){
            customObjAList.add(new CustomObjectA__c(Name = 'test'+i+1));
        }
        insert customObjAList;
        System.debug(customObjAList);
        for(CustomObjectA__c objA : customObjAList){
            customObjAset.add(objA.id);
            for(integer i =0; i<5;i++){
                CustomObjectB__c element  = new CustomObjectB__c(salary__c = 100+i, CustomObjectA__c = objA.id);
                customObjBList.add(element);
            }
        }
        Test.startTest();
        insert customObjBList;
        Test.stopTest();
        List<CustomObjectA__c> quearyedA = [select id, SecondHighestSalary__c from CustomObjectA__c where ID IN: customObjAset];
        System.assertEquals(103.0,quearyedA[0].SecondHighestSalary__c);
        
    }
}