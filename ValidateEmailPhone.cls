public class ValidateEmailPhone {

    public static Boolean isEmailValid(String email) {
        
        
        String emailRegex = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,63}$'; // A valid email will MATCH this
        Pattern MyPattern = Pattern.compile(emailRegex);
        Matcher MyMatcher = MyPattern.matcher(email);

        System.Debug(MyMatcher.matches());
        return MyMatcher.matches();

    }
    
    public static Boolean isPhoneValid(String phone) {
        Boolean isValid = false;
        
        // These three lines strip any non-numeric characters from the phone number
        // so "1 (206) 456-1111" becomes 12064561111
        // Remembr that to use this we have to return BOTH the cleaned numbr AND
        // the validity assessment, so we're goin gto do this later.
        // String onlyDigits = '';
        // for(Integer i = 0; i < phone.length(); i++) {
        //     if(phone.mid(i, 1).isNumeric() == true) { onlyDigits = onlyDigits + phone.mid(i, 1); }
        // }		
        
        String phoneRegex = '^[1]?[\\d]{10}'; // Ten digits. Or eleven if the first one is a 1.
        Pattern MyPattern = Pattern.compile(phoneRegex);
        Matcher MyMatcher = MyPattern.matcher(phone);
        	
        
        System.Debug(MyMatcher.matches());
        return MyMatcher.matches();

    }

    
}