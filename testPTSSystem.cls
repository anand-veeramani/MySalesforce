@isTest
public class testPTSSystem {
    public void testMethod1(){
        System.debug('Ran Test Trigger1');        
    	Contact ct = [Select id,Phone from contact limit 1];
        ct.Phone = '999-777-9988';
    	update ct;
        System.debug('Ran Test Trigger2');
    }
}