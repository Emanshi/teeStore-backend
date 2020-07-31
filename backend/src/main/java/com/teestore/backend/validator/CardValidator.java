package com.teestore.backend.validator;


import com.teestore.backend.model.Card;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class CardValidator {

    public static void validateCard(Card c)throws Exception {
        if (!validateCardNumber(c.getCardNumber()))
            throw new Exception("CardValidator.INVALID_CONTACT_NUMBER_FORMAT");
        if (!validateCardHolderName(c.getCardHolderName()))
            throw new Exception("CardValidator.INVALID_CONTACT_NUMBER_FORMAT");
        if (!validateCardExpiryMonthYear(c.getExpiryMonthYear()))
            throw new Exception("CardValidator.INVALID_CONTACT_NUMBER_FORMAT");
        if (!validateCardCvv(c.getCvv()))
            throw new Exception("CardValidator.INVALID_CONTACT_NUMBER_FORMAT");

    }

    private static Boolean validateCardNumber(String cardNumber){
        if(cardNumber == null || cardNumber.length()!=16)
            return false;
        if(!cardNumber.equals("")){
            String reg="(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6" +
                    "(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]" +
                    "|[68][0-9])[0-9]{11}|(?:2131|1800|35\\d{3})\\d{11})";
            return cardNumber.matches(reg);
        }
        return false;
    }

    private static Boolean validateCardHolderName(String name) {
        if (name == null || name.length()>50)
            return false;
        if(!name.equals("")) {
            String reg="([A-Za-z]{2,})+( [A-Za-z]{2,}){0,2}";
            return name.matches(reg);
        }
        return false;
    }

    private static Boolean validateCardExpiryMonthYear(String expiryMonthYear){

        if(expiryMonthYear == null || expiryMonthYear.equals(""))
            return  false;

        DateTimeFormatter fmt = new DateTimeFormatterBuilder()
                // month-year
                .appendPattern("MM-yy")
                // default value for day
                .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
                // create formatter
                .toFormatter();
        LocalDate dt = LocalDate.parse(expiryMonthYear, fmt);

        if(dt.isBefore(LocalDate.now()) || dt.isAfter(LocalDate.now().plusYears(6)))
            return false;
        return true;
    }

    private static Boolean validateCardCvv(String cvv){
       if(cvv == null)
           return false;

       if(!cvv.equals("")){
           String reg="[0-9]{3}";
           return cvv.matches(reg);
       }
       return false;
    }
}