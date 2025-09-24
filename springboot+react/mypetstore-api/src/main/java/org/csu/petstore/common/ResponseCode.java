package org.csu.petstore.common;

import lombok.Getter;

@Getter
public enum ResponseCode {
    // java枚举类型的使用
    SUCCESS(0, "SUCCESS"),
    ERROR(1, "ERROR"),
    NEED_LOGIN(10, "NEED_LOGIN"),
    ILLEGAL_ARGUMENT(2, "ILLEGAL_ARGUMENT");

    private final int code;
    private final String desc;

    ResponseCode(final int code, final String desc) {
        this.code = code;
        this.desc = desc;
    }
}
