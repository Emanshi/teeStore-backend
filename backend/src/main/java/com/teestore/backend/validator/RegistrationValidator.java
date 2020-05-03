package com.teestore.backend.validator;

import com.teestore.backend.model.User;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class RegistrationValidator {

    public static void validateRegistration(User u)throws Exception

    {
        if (!validateContactNumber(u.getContactNumber()))
            throw new Exception("RegistrationValidator.INVALID_CONTACT_NUMBER_FORMAT");
        if (!validatePassword(u.getPassword()))
            throw new Exception("RegistrationValidator.INVALID_PASSWORD_FORMAT");
        if(!validateEmail(u.getEmailId()))
            throw new Exception("RegistrationValidator.INVALID_EMAILID_FORMAT");
        if(!validateName(u.getUserName()))
            throw new Exception("RegistrationValidator.INVALID_USERNAME_FORMAT");
        if(!validateDateOfBirth(u.getDateOfBirth()))
            throw new Exception("RegistrationValidator.INVALID_DATEOFBIRTH_FORMAT");

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
    public static Boolean validateEmail(String email)
    {
        String reg="[A-Za-z0-9]+@[A-Za-z0-9]+(\\.com)";
        if(email.matches(reg))
            return true;
        return false;
    }
    public static Boolean validateName(String name)
    {
        if (name == null)
            return false;
        if(name!="")
        {
            String reg="([A-Za-z]{2,})+( [A-Za-z]{2,}){0,2}";
            if(name.matches(reg))
                return true;
            return false;

        }
        return false;
    }

    public static Boolean validateDateOfBirth(LocalDateTime dateOfBirth)
    {
        if(dateOfBirth == null)
            return false;
        LocalDate dob=dateOfBirth.toLocalDate();
        if(dob.until(LocalDate.now(), ChronoUnit.YEARS)>16)
            return true;
        return  false;
    }
}
