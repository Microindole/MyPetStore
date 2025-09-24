package org.csu.petstore.common;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;

/**
 * 通用响应的设计
 * */

@Getter  // 内部的变量不允许用setter方法，只允许在构造时就获得
@JsonInclude(JsonInclude.Include.NON_NULL)  //非null的数据不进行json序列化
public class CommonResponse<T> {
    private final int status;
    private final String msg;
    private T data;  //T 泛型

    private CommonResponse(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    private CommonResponse(int status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    // 判断响应是否成功
    // Spring Boot中的插件默认会把public方法都去获取值
    @JsonIgnore //加注解避免自动序列化
    public boolean isSuccess() {
        return this.status == ResponseCode.SUCCESS.getCode();
    }

    // <.>...<.>是泛型的语法格式（内部调用时的）

    public static <T>CommonResponse<T> createForSuccess(){
        return new CommonResponse<>(ResponseCode.SUCCESS.getCode(), ResponseCode.SUCCESS.getDesc());
    }

    public static <T>CommonResponse<T> createForSuccessMessage(String msg){
        return new CommonResponse<>(ResponseCode.SUCCESS.getCode(), msg);
    }

    public static <T>CommonResponse<T> createForSuccess(T data){
        return new CommonResponse<>(ResponseCode.SUCCESS.getCode(), ResponseCode.SUCCESS.getDesc(), data);
    }

    public static <T>CommonResponse<T> createForSuccess(String msg, T data){
        return new CommonResponse<>(ResponseCode.SUCCESS.getCode(),msg,data);
    }

    public static <T>CommonResponse<T> createForError(){
        return new CommonResponse<>(ResponseCode.ERROR.getCode(), ResponseCode.ERROR.getDesc());
    }

    public static <T>CommonResponse<T> createForError(String msg){
        return new CommonResponse<>(ResponseCode.ERROR.getCode(), msg);
    }

    public static <T>CommonResponse<T> createForError(int code, String msg){
        return new CommonResponse<>(code, msg);
    }
}
