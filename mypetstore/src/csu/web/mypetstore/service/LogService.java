package csu.web.mypetstore.service;

import csu.web.mypetstore.persistence.LogDao;
import csu.web.mypetstore.persistence.impl.LogDaoImpl;
import csu.web.mypetstore.domain.Log;

public class LogService {
    Log log;
    private LogDao logDao;

    public LogService(){
        log = new Log();
        logDao = new LogDaoImpl();
    }

    public String logInfo(Object ...s){
        return log.logInfomation(s);
    }

    public void insertLogInfo(String username, String logInfo){
        logDao.insertLog(username, logInfo);
    }
}
