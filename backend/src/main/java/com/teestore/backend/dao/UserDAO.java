package com.teestore.backend.dao;

import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;

public interface UserDAO {

    public User addUser(User user) throws Exception;
    public User getUserByContactNumber(String contactNumber) throws Exception;
    public User getUserByEmailId(String emailId) throws Exception;
    public User getUser(String userId) throws Exception;
    public String editUser(String userId,User user) throws Exception;
    public String addAddress(String userId, Address address) throws Exception;
    public String deleteAddress(String userId,String addressId) throws Exception;
}
