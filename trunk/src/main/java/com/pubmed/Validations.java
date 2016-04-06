package com.pubmed;

import java.util.regex.Pattern;
import org.springframework.util.Assert;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

public class Validations {
    public Validations() {
    }

    public static void rejectIfNull(Errors errors, String field, String message) {
        ValidationUtils.rejectIfEmpty(errors, field, (String)null, message);
    }

    public static void rejectIfEmpty(Errors errors, String field, String message) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, (String)null, message);
    }

    public static void rejectIfNotInteger(Errors errors, String field, String message) {
        Assert.notNull(errors, "Errors object must not be null");
        String value = getFieldValue(errors, field, message);
        Pattern pattern = Pattern.compile("[0-9]*");
        if(!pattern.matcher(value + "").matches()) {
            errors.rejectValue(field, (String)null, message);
        }

    }

    public static void rejectLength(Errors errors, String field, int minLength, int maxLenght, String message) {
        String value = getFieldValue(errors, field, message);
        if(value.length() < minLength || value.length() > maxLenght) {
            errors.rejectValue(field, (String)null, message);
        }

    }

    public static void rejectValue(Errors errors, String field, String message) {
        errors.reject(field, (Object[])null, message);
    }

    private static String getFieldValue(Errors errors, String field, String message) {
        Assert.notNull(errors, "Errors object must not be null");
        Object value = errors.getFieldValue(field);
        if(value == null) {
            errors.rejectValue(field, (String)null, message);
        }

        return String.valueOf(value);
    }
}
