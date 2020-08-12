package com.teestore.backend.service;

import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;

public interface UserService {

    User addUser(User user) throws Exception;

    User loginUser(User user) throws Exception;

    User getUser(String userId) throws Exception;

    String editUser(String userId, User user) throws Exception;

    String addAddress(String userId, Address address) throws Exception;

    String editAddress(String userId, Address address) throws Exception;

    String deleteAddress(String userId, String addressId) throws Exception;
}
