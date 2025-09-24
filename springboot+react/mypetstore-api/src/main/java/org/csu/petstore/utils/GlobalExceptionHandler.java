package org.csu.petstore.utils;


import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.csu.petstore.common.CommonResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.resource.NoResourceFoundException;

/*
* Restful API全局异常处理
* */

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);


    /*
    * 三个注解:
    * @ExceptionHandler内写好处理具体的异常对象
    * @ResponseStatus中写出服务器抛出等等异常 Postman中可以看到
    * @ResponseBody将数据转化为具体类型
    * 最后再加一个普通类Exception，存在继承关系的异常时，子类写在父类前面
    * */

    // 400
    @ExceptionHandler(value = MissingServletRequestParameterException.class)
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    @ResponseBody
    public CommonResponse<Object> handleMissingServletRequestParameterException(MissingServletRequestParameterException e) {
        logger.error(e.getMessage());
        return CommonResponse.createForError("缺少参数");
    }

    // 401
//    @ExceptionHandler(value = IllegalArgumentException.class)
//    @ResponseStatus(code = HttpStatus.UNAUTHORIZED)
//    @ResponseBody
//    public CommonResponse<Object> handleIllegalArgumentException(IllegalArgumentException e) {
//        logger.error(e.getMessage());
//        return CommonResponse.createForError("用户未登录，请先登录");
//    }

    // 404
    @ExceptionHandler(NoResourceFoundException.class)
    @ResponseStatus(code = HttpStatus.NOT_FOUND)
    @ResponseBody
    public CommonResponse<Object> handleNoResourceFoundException(NoResourceFoundException e){
        logger.error(e.getMessage());
        return CommonResponse.createForError("资源未找到");
    }

    // 405
    @ExceptionHandler(IllegalStateException.class)
    @ResponseStatus(code = HttpStatus.METHOD_NOT_ALLOWED)
    @ResponseBody
    public CommonResponse<Object> handleIllegalStateException(IllegalStateException e){
        logger.error(e.getMessage());
        return CommonResponse.createForError("请求方法不支持");
    }



    // 500
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public CommonResponse<Object> handleConstraintViolationException(ConstraintViolationException e){
        logger.error(e.getMessage());
        return CommonResponse.createForError(e.getMessage());
    }


//    @ExceptionHandler(Exception.class)
//    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
//    @ResponseBody
//    public CommonResponse<Object> handException(Exception e){
//        logger.error(e.getMessage());
////        e.printStackTrace();
//        return CommonResponse.createForError("服务器异常");
//    }
}
