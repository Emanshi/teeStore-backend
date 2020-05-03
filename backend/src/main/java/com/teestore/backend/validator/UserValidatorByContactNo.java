package com.teestore.backend.validator;

public class UserValidatorByContactNo {

    public static void validateUserForLogin(String contactNumber, String password) throws Exception {

        if (!validateContactNumber(contactNumber))
            throw new Exception("UserValidatorByContactNo.INVALID_CONTACT_NUMBER_FORMAT");

        if (!validatePassword(password))
            throw new Exception("UserValidatorByContactNo.INVALID_PASSWORD_FORMAT");
    }

    public static Boolean validatePassword(String password) {
        if (password == null)
            return false;
        Boolean flag = false;
        if (password.length() >= 7 && password.length() <= 20)
            if (password.matches(".*[A-Z]+.*"))
                if (password.matches(".*[a-z]+.*"))
                    if (password.matches(".*[0-9]+.*"))
                        if (password.matches(".*[!@#$%^&*].*"))
                            flag = true;
        return flag;
    }

    public static Boolean validateContactNumber(String contactNumber) {
        if (contactNumber == null)
            return false;
        Boolean flag = false;
        if (contactNumber.matches("[6-9][0-9]{9}"))
            flag = true;
        return flag;
    }
}
