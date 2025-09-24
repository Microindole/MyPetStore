package org.csu.petstore.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Target(ElementType.METHOD)//注解放置的目标位置即方法级别
@Retention(RetentionPolicy.RUNTIME)//注解在哪个阶段执行
@Documented
public @interface Annotation {
    String value() default "";

//    String operModul() default ""; // 操作模块
//
//    String operType() default "";  // 操作类型
//
//    String operDesc() default "";  // 操作说明
}
