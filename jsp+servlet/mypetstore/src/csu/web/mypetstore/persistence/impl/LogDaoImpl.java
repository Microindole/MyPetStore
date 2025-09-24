package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.persistence.DBUtil;
import csu.web.mypetstore.persistence.LogDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class LogDaoImpl implements LogDao {

    private static final String insertLogString = "insert into log (logUserId, logInfo) VALUES (?, ?)";

    @Override
    public void insertLog(String username, String logInfo) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(insertLogString);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, logInfo);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
