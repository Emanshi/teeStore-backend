package com.teestore.backend.entity.generator;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;
import java.sql.*;

public class ImageIdGenerator implements IdentifierGenerator {

    @Override
    public Serializable generate(SharedSessionContractImplementor sharedSessionContractImplementor, Object o) throws HibernateException {
        String prefix = "I";
        Connection connection = sharedSessionContractImplementor.connection();

        try {
            Statement statement=connection.createStatement();
            PreparedStatement preparedStatement = null;
            ResultSet set= null;
            String randomId = null;
            do {
                randomId = "I" + Integer.parseInt((Math.random() * 99999 + 10000) + "");
                preparedStatement= connection.prepareStatement("select * from Images where image_id=?");
                preparedStatement.setString(1, randomId);
                set= preparedStatement.executeQuery();
            }while(set.next());

            return randomId;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
