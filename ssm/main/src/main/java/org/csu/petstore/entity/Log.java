package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@TableName("log")
public class Log {
    @TableId(value = "log_id", type = IdType.AUTO)
    private Integer logId;
    @TableField("log_user_id")
    private String logUserId;
    @TableField("log_info")
    private String logInfo;
    @TableField("log_timestamp")
    private Timestamp logDate;

}
