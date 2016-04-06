package com.pubmed.medicine.Helper;

import com.pubmed.Validations;
import org.springframework.validation.Errors;

/**
 * Created by IntelliJ IDEA.
 * User: kuang
 * Date: 12-11-2
 * Time: 下午4:03
 */
public class InfoHelper {

    public static void validate(Errors errors) {
        Validations.rejectIfEmpty(errors, "title", "标题必填");
        Validations.rejectIfEmpty(errors, "content", "内容必填");
        Validations.rejectIfEmpty(errors, "categoryId", "类别必选");
    }
}
