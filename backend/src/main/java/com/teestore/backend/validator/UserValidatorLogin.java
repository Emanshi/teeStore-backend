package com.teestore.backend.validator;

import com.teestore.backend.model.User;

public class UserValidatorLogin {

    public static void validateUserForLogin(User user) throws Exception {

        if (user.getEmailId() == null && !validateContactNumber(user.getContactNumber()))
            throw new Exception("UserValidatorByContactNo.INVALID_CONTACT_NUMBER_FORMAT");
        if (user.getContactNumber() == null && !validateEmail(user.getEmailId()))
            throw new Exception("UserValidatorByEmailId.INVALID_EMAIL_ID_FORMAT");
        if (!validatePassword(user.getPassword()))
            throw new Exception("UserValidatorByContactNo.INVALID_PASSWORD_FORMAT");
    }

    public static Boolean validatePassword(String password) {
        if (password == null)
            return false;
        if (password.length() >= 7 && password.length() <= 20)
            if (password.matches(".*[A-Z]+.*"))
                if (password.matches(".*[a-z]+.*"))
                    if (password.matches(".*[0-9]+.*"))
                        return password.matches(".*[!@#$%^&*].*");
        return false;
    }

    public static Boolean validateContactNumber(String contactNumber) {
        if (contactNumber == null)
            return false;
        boolean flag = false;
        if (contactNumber.matches("[6-9][0-9]{9}"))
            flag = true;
        return flag;
    }

    public static Boolean validateEmail(String email) {
        String reg="^[A-Za-z0-9+_.-]+@([a-zA-Z0-9]+\\.)+[a-zA-Z0-9]+$";
        return email.matches(reg);
    }
}
