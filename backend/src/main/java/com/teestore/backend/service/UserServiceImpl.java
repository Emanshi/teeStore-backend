package com.teestore.backend.service;

import com.teestore.backend.dao.UserDAO;
import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;
import com.teestore.backend.utility.HashingUtility;
import com.teestore.backend.validator.RegistrationValidator;
import com.teestore.backend.validator.UserValidatorLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service(value="userService")
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDAO userDAO;

    @Override
    public User addUser(User user) throws Exception {
        RegistrationValidator.validateRegistration(user);
        user.setPassword(HashingUtility.getHashValue(user.getPassword()));
        User u=userDAO.addUser(user);
        if(u==null)
            throw new Exception("UserService.INVALID_REGISTRATION");
        return u;
    }

    @Override
    public User loginUser(User user) throws Exception {
        UserValidatorLogin.validateUserForLogin(user);
        User userFromDB=null;

        if(user.getContactNumber()!=null)
            userFromDB =userDAO.getUserByContactNumber(user.getContactNumber());
        else if(user.getEmailId()!=null)
            userFromDB=userDAO.getUserByEmailId(user.getEmailId());

        if(userFromDB == null)
            throw new Exception("UserService.INVALID_CREDENTIALS");

        String passwordFromDB= userFromDB.getPassword();

        if(passwordFromDB!=null) {
            String hashedPassword = HashingUtility.getHashValue(user.getPassword());

            if (hashedPassword.equals(passwordFromDB)) {
                userFromDB.setPassword(null);
            } else {
                throw new Exception("UserService.INVALID_CREDENTIALS");
            }
        }
        return userFromDB;
    }

    @Override
    public User getUser(String userId) throws Exception {

        User userFromDB=userDAO.getUser(userId);

        if(userFromDB == null)
            throw new Exception("UserService.USER_NOT_FOUND");

        return userFromDB;
    }

    @Override
    public String editUser(String userId, User user) throws Exception {

        if(userId==null || user==null)
            throw new Exception("UserService.INVALID_USER");

        if(user.getPassword() !=null)
            user.setPassword(HashingUtility.getHashValue(user.getPassword()));

        String uId=userDAO.editUser(userId, user);

        if(uId==null)
            throw new Exception("UserService.USER_NOT_FOUND");

        return uId;
    }

    @Override
    public String addAddress(String userId, Address address) throws Exception {

        if(userId==null)
            throw new Exception("UserService.INVALID_USER");

        if(address==null)
            throw new Exception("UserService.INVALID_ADDRESS");

        String aId=userDAO.addAddress(userId,address);

        if(aId==null)
            throw new Exception("UserService.INVALID_USER");

        return aId;
    }

    @Override
    public String deleteAddress(String userId, String addressId) throws Exception {

        if(userId==null)
            throw new Exception("UserService.INVALID_USER");

        if(addressId==null)
            throw new Exception("UserService.INVALID_ADDRESS_ID");

        String aId=userDAO.deleteAddress(userId,addressId);

        if(aId==null)
            throw new Exception("UserService.INVALID_USER");

        return aId;

    }
}