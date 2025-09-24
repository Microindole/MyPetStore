package org.csu.petstore.aop;


import jakarta.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.csu.petstore.annotation.Annotation;
import org.csu.petstore.entity.Log;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.time.LocalDate;

@Aspect
@Component
public class LogAspect {

    //    @Resource
    @Autowired
    private LogService logService;
    @Autowired
    private HttpSession session;

    //定义切点 @Pointcut
    //在注解的位置切入代码
    @Pointcut("@annotation(org.csu.petstore.annotation.Annotation)")
    public void logPointCut(){
    }

    @AfterReturning("logPointCut()")
    public void saveSysLog(JoinPoint joinPoint) {
        //保存日志
        Log log = new Log();

        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();


        //获取操作
        Annotation annotation = method.getAnnotation(Annotation.class);
        String logInfo = "";
        if (annotation != null) {
            String value = annotation.value();
//            log.setRequestDesc(value);
            logInfo += "   Desc: "+value;//保存获取的操作
        }

        //获取请求的类名
        String className = joinPoint.getTarget().getClass().getName();
        //获取请求的方法名
        String methodName = method.getName();

        //注入log对象
        //username应从session里取出
//        try{
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        String username = "admin";

//        String username = accountVO.getUsername();
        if (accountVO != null) {
            username = "account@"+accountVO.getUsername();
        }
        else {
            username = "Visitor";
        }

//        }catch (Exception e){
//            username = "visitor";
//        }
        log.setLogUserId(username);
        log.setLogInfo("invoke "+className + "." + methodName+logInfo);
        log.setLogDate(new Timestamp(System.currentTimeMillis()));

        //调用service保存Log实体类到数据库
        logService.saveLog(log);
    }
}
