@istest
public class Test_MyRestService {

    @testsetup
    public static void createData(){
        CreateTestData.createData();
    }
    
    @istest
    public static void postTestSuccess(){
        JSONGenerator theBody = JSON.createGenerator(true);
       	theBody.writeStartObject();
            theBody.writeStringField('FirstName','Bruce');
            theBody.writeStringField('LastName','Wayne');
            theBody.writeStringField('AddressCity','Seattle');
            theBody.writeStringField('AddressCountry','US');
            theBody.writeStringField('AddressState','WA');
            theBody.writeStringField('AddressStreet','1 Wayne Tower');
            theBody.writeStringField('AddressZip','98124');
            theBody.writeStringField('Email','billy@billybilly.com');
            theBody.writeStringField('Phone','2024561111');
        theBody.writeEndObject();
        
       // MyRestService.createRegistration theRequest = new MyRestService.createRegistration();
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/MyRestService/v1';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf(theBody.getAsString());

        RestContext.request = req;
        RestContext.response= res;
        
        Test.startTest();
        	MyRestService.createRegistration('Gotham', 
                                            '1 Wayne Manor Way',
                                            'US',
                                            'Washington',
                                            '98124',
                                            'goddambatmanwayneenterprisescom',
                                            'Bruce',
                                            'Wayne',
                                            '2890A3743',
                                            false);
        Test.stopTest(); 

    }
    
    @istest
    public static void postTestFail(){
        JSONGenerator theBody = JSON.createGenerator(true);
       	theBody.writeStartObject();
            theBody.writeStringField('FirstName','Bruce');
            theBody.writeStringField('LastName','Wayne');
            theBody.writeStringField('AddressCity','Seattle');
            theBody.writeStringField('AddressCountry','US');
            theBody.writeStringField('AddressState','WA');
            theBody.writeStringField('AddressStreet','1 Wayne Tower');
            theBody.writeStringField('AddressZip','98124');
            theBody.writeStringField('Email','billy@billybilly.com');
            theBody.writeStringField('Phone','2024561111');
        theBody.writeEndObject();
        
       // MyRestService.createRegistration theRequest = new MyRestService.createRegistration();
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/MyRestService/v1';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf(theBody.getAsString());

        RestContext.request = req;
        RestContext.response= res;

    global static void createRegistration(String AddressCity, 
                                            String AddressStreet,
                                            String AddressCountry,
                                            String AddressState,
                                            String AddressZip,
                                            String Client,
                                            String Email,
                                            String FirstName,
                                            String LastName,
                                            String Phone,
                                            Boolean ValidateEmail) {

        
        Test.startTest();
        	MyRestService.createRegistration('Gotham', 
                                            '1 Wayne Manor Way',
                                            'US',
                                            'Washington',
                                            '98124',
                                            'goddambatmanwayneenterprisescom',
                                            'Bruce',
                                            'Wayne',
                                            '2890A3743',
                                            false);
        Test.stopTest(); 

    }
    
    @istest
    public static void postTestMissingPhone(){
        JSONGenerator theBody = JSON.createGenerator(true);
       	theBody.writeStartObject();
            theBody.writeStringField('FirstName','Bruce');
            theBody.writeStringField('LastName','Wayne');
            theBody.writeStringField('AddressCity','Seattle');
            theBody.writeStringField('AddressCountry','US');
            theBody.writeStringField('AddressState','WA');
            theBody.writeStringField('AddressStreet','1 Wayne Tower');
            theBody.writeStringField('AddressZip','98124');
            theBody.writeStringField('Email','billy@billybilly.com');
            theBody.writeStringField('Phone','');
        theBody.writeEndObject();
        
       // MyRestService.createRegistration theRequest = new MyRestService.createRegistration();
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/MyRestService/v1';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf(theBody.getAsString());

        RestContext.request = req;
        RestContext.response= res;
        
        Test.startTest();
        	MyRestService.createRegistration('Gotham', 
                                            '1 Wayne Manor Way',
                                            'US',
                                            'Washington',
                                            '98124',
                                            'goddambatmanwayneenterprisescom',
                                            'Bruce',
                                            'Wayne',
                                            '',
                                            false);
        Test.stopTest(); 

    }
    
}