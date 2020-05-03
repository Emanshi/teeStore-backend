package com.teestore.backend.validator;

public class UserValidatorByEmailId {

    public static void validateUserForLogin(String emailId , String password) throws Exception {

        if (!validateEmail(emailId))
            throw new Exception("UserValidatorByEmailId.INVALID_EMAILID_FORMAT");

        if (!validatePassword(password))
            throw new Exception("UserValidatorByEmailId.INVALID_PASSWORD_FORMAT");
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

    public static Boolean validateEmail(String email)
    {
        String reg="[A-Za-z0-9]+@[A-Za-z0-9]+(\\.com)";
        if(email.matches(reg))
            return true;
        return false;
    }
}
