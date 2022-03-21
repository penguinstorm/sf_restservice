@istest
public class Test_ValidateEmailPhone {

    @istest
    public static void testValidEmail(){
        String email = 'bilbo@baggins.com';
        System.assert(ValidateEmailPhone.isEmailValid(email) == true, true);
    }
    
    @istest
    public static void testInvalidEmail(){
        // Dude. You're missing an @ symbol
        String email = 'bilbobaggins.c';
        System.assert(ValidateEmailPhone.isEmailValid(email) == false, true);

        // Domain name is too short
        String email2 = 'bilbo@baggins.c';
        System.assert(ValidateEmailPhone.isEmailValid(email2) == false, true);
    }

    @istest
    public static void testValidPhone(){
        // 10 digit north american
        String phone = '4162983738';
        System.assert(ValidateEmailPhone.isPhoneValid(phone) == true, true);

        // 11 digit north american (the first digit has to be a 1)
        String phone2 = '14162983738';
        System.assert(ValidateEmailPhone.isPhoneValid(phone2) == true, true);
    }

    @istest
    public static void testInvalidPhone(){
        // Too short.
        String phone = '2983738';
        System.assert(ValidateEmailPhone.isPhoneValid(phone) == false, true);

        // 11 digits but it doesn't start with a 1
        String phone2 = '44162983738';
        System.assert(ValidateEmailPhone.isPhoneValid(phone2) == false, true);

        // Too long
        String phone3 = '14162983738456';
        System.assert(ValidateEmailPhone.isPhoneValid(phone3) == false, true);

        // Uses letters
        String phone4 = '416KL53738';
        System.assert(ValidateEmailPhone.isPhoneValid(phone4) == false, true);
    }

}