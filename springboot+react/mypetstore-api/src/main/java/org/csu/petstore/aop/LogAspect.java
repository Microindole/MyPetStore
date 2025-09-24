package org.csu.petstore.aop;


import jakarta.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.entity.Log;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.sql.Timestamp;

@Aspect
@Component
public class LogAspect {

    @Autowired
    private LogService logService;
    @Autowired
    private HttpSession session;

    /* *************************************************************
     * @LogAccount是关于原JPetStore的日志，@LogAdmin是关于后台管理系统的日志 *
     ****************************************************************/

    //定义切点 @Pointcut
    //在注解的位置切入代码
    @Pointcut("@annotation(org.csu.petstore.annotation.LogAccount)")
    public void logPointCutAccount(){
    }

    @Pointcut("@annotation(org.csu.petstore.annotation.LogAdmin)")
    public void logPointCutAdmin(){
    }

    @AfterReturning("logPointCutAccount()")
    public void saveSysLog4Account(JoinPoint joinPoint) {
        Log log = toBeSysLog(joinPoint);
        //注入log对象
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        String username;
        if (accountVO != null) {
            username = "account@"+accountVO.getUsername();
        }else {
            username = "Visitor";
        }

        log.setLogUserId(username);
        //调用service保存Log实体类到数据库
        logService.saveLog(log);
    }

    @AfterReturning("logPointCutAdmin()")
    public void saveSysLog4Admin(JoinPoint joinPoint) {
        Log log = toBeSysLog(joinPoint);
        //注入log对象
        AdminVO adminVO = (AdminVO) session.getAttribute("admin");
        String username;
        if (adminVO != null) {
            username = "admin@"+adminVO.getUsername();
        }else {
            username = "Visitor";
        }

        log.setLogUserId(username);
        //调用service保存Log实体类到数据库
        logService.saveLog(log);
    }


    public Log toBeSysLog(JoinPoint joinPoint) {
        //保存日志
        Log log = new Log();
        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();
        //获取操作
        LogAccount logAccount = method.getAnnotation(LogAccount.class);
        //获取请求的类名
        String className = joinPoint.getTarget().getClass().getName();
        //获取请求的方法名
        String methodName = method.getName();
        log.setLogInfo("invoke "+className + "." + methodName+" successfully");
        log.setLogDate(new Timestamp(System.currentTimeMillis()));
        return log;
    }
}
