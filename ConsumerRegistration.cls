
// This defines the API endpoint's name. It's a good practic to add a version number
// so that you can more easily makd changes etc.
@RestResource(urlMapping='/EndpointName/v1/*')
global with sharing class MyRestService {


	// We are only going to define a POST here. Other options are
	// @HttpGet
	// @HttpPut
	// @HttpDelete
	

	// The list of fields in the method's input should match the COMPLETE list of
	// fields in the JSON payload. 
    @HttpPost
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
		System.Debug('Running Post Method');
        
        // BUSINESS RULES
        // The first thing we're going to do is enforce any business rules for the
        // payload (e.g. an email is required.) This is OPTIONAL.
        
        
		// The easiest way to handle errors is to add them to a list. We can check to see
		// if the list has anything in it and response accordingly.
		List<String> payloadErrors = new List<String>();
		// You don't gotta give me digits and an email, but you gotta give me at least one
        if((Email == null || Email.length() == 0) || (Phone == null || Phone.length() == 0)) {
    		payloadErrors.add('At least one of Email or Phone has to be provided');
	        }
		// First and Last Name are required, as two separate fields
        if((FirstName == null || FirstName.length() == 0) || (LastName == null || LastName.length() == 0)) {
    		payloadErrors.add('Both First Name and Last Name are required');
	        }

		// OTHER ERROR EXAMPLES
		// Some other Error examples. I kicked the "validate" phone out to a separate
		// method so that it might be reused somewhere else
		//
		// Phone has to be 10 digits OR 11 digits if the first is 1
//        if(Phone != null && ValidateEmailPhone.isPhoneValid(Phone) == false) {
//            payloadErrors.add('Phone number is not valid. Phone numbers should be 10 digits only.');
//            }
        // Email has to be a valid email format                                        
//        if(Email != null && ValidateEmailPhone.isEmailValid(Email) == false) {
//            payloadErrors.add('Email is not a valid email address.');
//            }
//        if(AddressState != null) {
//            if(AddressState.length() != 2) {
//	            payloadErrors.add('Please use the two letter code for the state. You can find a list of valid two letter state codes here: https://en.wikipedia.org/wiki/List_of_U.S._state_and_territory_abbreviations');
//            }
//        }
                                                

		
		// In this case we're going to create a lead using the data we got so
		// we instantiate it
        Lead theLead = new Lead();
        // If we haven't already got errors, let's keep going!
        if(payloadErrors.isEmpty() == true) {                                                
                                                
				theLead.City = AddressCity;
				theLead.Source = 'Our Custom API'; // You can use hard coded values 
												   // for specific fields
				// Person Information
				theLead.FirstName = FirstName;
				theLead.LastName = LastName;
				theLead.Email = Email;
				theLead.Phone = Phone;

				// We
				try{
					if(payloadErrors.isEmpty() == true) { 
						// Comment out the IF and add this line to force an error
						// theLead.Business_Unit_kcrm__c = null;
						insert theLead; }
				} catch(Exception e) {
					payloadErrors.add('Unknown error: ' + e);
				}
        }
                                                

		// THE REST RESPONSE        
        // Build an RestResponse string
		RestResponse theResponse = RestContext.response;
                                                		
		JSONGenerator theResponseBody = JSON.createGenerator(true);                                 		
        if(payloadErrors.isEmpty() == true) {
            theResponse.statusCode = 200;
            
// To include a body in the response, uncomment these lines and make the body what you want
//
//            theResponseBody.writeStartObject();
//                theResponseBody.writeStringField('Lead ID', theLead.Id);
//			theResponseBody.writeEndObject();
//
//            theResponse.responseBody = Blob.valueOf(theResponseBody.getAsString());
        } else {

                theResponse.statusCode = 400;
				theResponseBody.writeStartObject();

                    theResponseBody.writeFieldName('Errors');
                    theResponseBody.writeStartObject();
                        for(String e : payloadErrors) {
                                theResponseBody.writeStringField('Error', e);
                        }
                    theResponseBody.writeEndObject();
			theResponseBody.writeEndObject();
            
            theResponse.responseBody = Blob.valueOf(theResponseBody.getAsString());

//			OPTIONAL: Create a custom object and log API errors
//			Probably             
//            API_Error_Log__c theError = new API_Error_Log__c();
//
//            	theError.API_Name__c = 'Consumer Registration v1';
//            	theError.API_User__c = System.UserInfo.getUserId();
//            	theError.API_Payload__c = 'Name: ' + FirstName + ' ' + LastName;
//            	theError.API_Payload__c += '\nEmail & Phone: ' + Email + ' - ' + Phone;
//            	theError.API_Payload__c += '\nBusiness Unit/Trigger Type: ' + Client + ' - ' + Source;
//            	theError.Errors__c = theResponseBody.getAsString();
//            insert theError;
            	

        }                                 

		System.Debug(theResponseBody.getAsString());
                                                
    }
    
   
}