package com.pubmed.medicine.Helper;


import com.pubmed.medicine.model.User;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;

/**
 * Created by IntelliJ IDEA.
 * User: kuang
 * Date: 12-8-15
 * Time: 下午3:20
 */
public class UserHelper {
    
    public static void vaildID(User user_client,User user_sql,  Errors errors) {
    	if(user_sql==null) return;
        else{
        	errors.rejectValue("name", null,"用户名不可用");
        }
    }


	public static void checkLogin(User user, User sessionUser,
			BindingResult errors) {
		if(sessionUser==null) {
			errors.rejectValue("name", null,"用户名不存在");
        }else if(!sessionUser.getPassword().equals(user.getPassword())){
        	errors.rejectValue("password", null,"密码错误");
        }
		
	}

}
