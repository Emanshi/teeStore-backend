package com.teestore.backend.service;

import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;

public interface UserService {

    public User addUser(User user) throws Exception;
    public User loginUser(User user) throws Exception;
    public User getUser(String userId) throws Exception;
    public String editUser(String userId,User user) throws Exception;
    public String addAddress(String userId, Address address) throws Exception;
    public String deleteAddress(String userId,String addressId) throws Exception;
}
