package com.pubmed.medicine.telmodel;

/**
 * Created by PC-S510 on 2014/7/14.
 */
public enum ExceptionEnum {
    //对应的语言提示：对不起，系统忙，请稍候再拨
    UNKNOWN_ERROR(1000, "未知错误!"),

    //对应的语言提示：分机号不正确	您所拨的分机号不正确
    EXT_NUMBER_ERROR(1001, "分机号不正确!"),

    //对应的语言提示：被叫号码格式不正确
    CALLED_PHONE_FORMAT_ERROR(1002, "被叫号码格式不正确!"),

    //对应的语言提示：您无权拨打号码，请先将您的号码录入系统
    PHONE_COME_ILLEGAL(1003, "主叫不合法!"),//对应的语言提示：

    //对应的语言提示：对不起，系统忙，请稍候再拨
    ARGUMENT_ILLEGAL(1004, "参数不正确定!"),//对应的语言提示：

    //对应的语言提示：分机号不存在	您所拨的分机号不正确
    EXT_NOT_EXIST(1005, "分机号不存在!"),

    CREATE_BILL_ERROR(10010, "创建话单失败");


    private final int value;

    private final String reasonPhrase;


    private ExceptionEnum(int value, String reasonPhrase) {
        this.value = value;
        this.reasonPhrase = reasonPhrase;
    }

    public int getValue() {
        return value;
    }

    public String getReasonPhrase() {
        return reasonPhrase;
    }
}
