@isTest
private class PTSCalloutTestClass {
     @isTest static void testCallout() {
          //Test versioning
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new petTrackingSystemHTTPTestResponse());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse res = updatePetTrackingSystem.sendContactInfoFromSF();
        
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"foo":"bar"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        SYstem.debug('Test Completed Successfully');
    }
}
