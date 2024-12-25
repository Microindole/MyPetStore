package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.domain.Sequence;
import csu.web.mypetstore.persistence.DBUtil;
import csu.web.mypetstore.persistence.SequenceDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SequenceDaoImpl implements SequenceDao {
    private final String GET_SEQUENCE = "    SELECT name, nextid\n" +
            "    FROM SEQUENCE\n" +
            "    WHERE NAME = ?";

    private final String UPDATE_SEQUENCE = "    UPDATE SEQUENCE\n" +
            "    SET NEXTID = ?\n" +
            "    WHERE NAME = ?";
    @Override
    public Sequence getSequence(Sequence sequence) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SEQUENCE);
            preparedStatement.setString(1, sequence.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                sequence.setName(resultSet.getString("name"));
                sequence.setNextId(resultSet.getInt("nextid"));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sequence;
    }

    @Override
    public void updateSequence(Sequence sequence) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SEQUENCE);
            preparedStatement.setString(1, sequence.getNextIdAsString());
            preparedStatement.setString(2, sequence.getName());
            preparedStatement.executeUpdate();
            int rows = preparedStatement.getUpdateCount();
            if (rows > 0) {
                System.out.println("Update sequence successful");
            }DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
