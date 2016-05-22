public class updatePetTrackingSystem {
    public static HttpResponse sendContactInfoFromSF() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.salesforce.com/petTracking');
        req.setMethod('PUT');
        Http h = new Http();
        HttpResponse res = h.send(req);
        return res;
    }
}