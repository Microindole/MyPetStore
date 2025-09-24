package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Log;
import org.csu.petstore.persistence.LogMapper;
import org.csu.petstore.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("logService")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public void saveLog(Log Log) {
        logMapper.insert(Log);
    }
}
