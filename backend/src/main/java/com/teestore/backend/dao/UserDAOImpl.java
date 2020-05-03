package com.teestore.backend.dao;

import com.teestore.backend.entity.AddressEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository(value="userDAO")
public class UserDAOImpl implements UserDAO{

    @Autowired
    private EntityManager entityManager;

    @Override
    public User addUser(User user) throws Exception {
        Query query= entityManager.createQuery("select u from UserEntity u where u.contactNumber =:contactNumber");
        query.setParameter("contactNumber",user.getContactNumber());

        List<UserEntity> result= query.getResultList();
        if(result!=null && !result.isEmpty())
            return null;

        UserEntity userEntity=new UserEntity();
        userEntity.setUserName(user.getUserName());
        userEntity.setContactNumber(user.getContactNumber());
        userEntity.setEmailId(user.getEmailId());
        userEntity.setDateOfBirth(user.getDateOfBirth());
        userEntity.setPassword(user.getPassword());

        List<Address> addressList=user.getAddresses();
        List<AddressEntity> addressEntityList=null;

        if(addressList==null && !addressList.isEmpty()){

            addressEntityList=new ArrayList<>();
            for(Address address:addressList){
                AddressEntity addressEntity=new AddressEntity();
                addressEntity.setStreet(address.getStreet());
                addressEntity.setCity(address.getStreet());
                addressEntity.setState(address.getState());
                addressEntity.setPinCode(address.getPinCode());

                entityManager.persist(addressEntity);
                address.setAddressId(addressEntity.getAddressId());
                addressEntityList.add(addressEntity);
            }

        }

        userEntity.setAddresses(addressEntityList);
        entityManager.persist(userEntity);
        user.setUserId(userEntity.getUserId());

        return user;
    }

    @Override
    public User getUserByContactNumber(String contactNumber) throws Exception {

        Query query=entityManager.createQuery("select u from UserEntity u where u.contactNumber =:contactNumber");
        query.setParameter("contactNumber",contactNumber);
        User user=null;
        List<UserEntity> userEntities=query.getResultList();
        if(userEntities!=null && !userEntities.isEmpty()){
            UserEntity userEntity=userEntities.get(0);
            user =new User();
            user.setUserId(userEntity.getUserId());
            user.setUserName(userEntity.getUserName());
            user.setEmailId(userEntity.getEmailId());
            user.setContactNumber(userEntity.getContactNumber());
            user.setPassword(userEntity.getPassword());
            user.setDateOfBirth(userEntity.getDateOfBirth());

            List<AddressEntity> addressEntityList=userEntity.getAddresses();
            List<Address> addressList=null;

            if(addressEntityList!=null && !addressEntityList.isEmpty()){
                addressList=new ArrayList<>();

                for(AddressEntity addressEntity: addressEntityList){
                    Address address=new Address();
                    address.setAddressId(addressEntity.getAddressId());
                    address.setStreet(addressEntity.getStreet());
                    address.setCity(addressEntity.getCity());
                    address.setState(addressEntity.getState());
                    address.setPinCode(addressEntity.getPinCode());
                    addressList.add(address);
                }
            }
            user.setAddresses(addressList);
        }
        return user;
    }

    @Override
    public User getUserByEmailId(String emailId) throws Exception {
        Query query=entityManager.createQuery("select u from UserEntity u where u.emailId =:emailId");
        query.setParameter("emailId",emailId);
        User user=null;
        List<UserEntity> userEntities=query.getResultList();

        if(userEntities!=null && !userEntities.isEmpty()){
            UserEntity userEntity=userEntities.get(0);
            user =new User();
            user.setUserId(userEntity.getUserId());
            user.setUserName(userEntity.getUserName());
            user.setEmailId(userEntity.getEmailId());
            user.setContactNumber(userEntity.getContactNumber());
            user.setPassword(userEntity.getPassword());
            user.setDateOfBirth(userEntity.getDateOfBirth());

            List<AddressEntity> addressEntityList=userEntity.getAddresses();
            List<Address> addressList=null;

            if(addressEntityList!=null && !addressEntityList.isEmpty()){
                addressList=new ArrayList<>();

                for(AddressEntity addressEntity: addressEntityList){
                    Address address=new Address();
                    address.setAddressId(addressEntity.getAddressId());
                    address.setStreet(addressEntity.getStreet());
                    address.setCity(addressEntity.getCity());
                    address.setState(addressEntity.getState());
                    address.setPinCode(addressEntity.getPinCode());
                    addressList.add(address);
                }
            }
            user.setAddresses(addressList);
        }
        return user;
    }

    @Override
    public User getUser(String userId) throws Exception {

        UserEntity userEntity=entityManager.find(UserEntity.class,userId);

        if(userEntity==null)
            return null;

        User user =new User();
        user.setUserId(userEntity.getUserId());
        user.setUserName(userEntity.getUserName());
        user.setEmailId(userEntity.getEmailId());
        user.setContactNumber(userEntity.getContactNumber());
        user.setPassword(userEntity.getPassword());
        user.setDateOfBirth(userEntity.getDateOfBirth());

        List<AddressEntity> addressEntityList=userEntity.getAddresses();
        List<Address> addressList=null;

        if(addressEntityList!=null && !addressEntityList.isEmpty()){
            addressList=new ArrayList<>();

            for(AddressEntity addressEntity: addressEntityList){
                Address address=new Address();
                address.setAddressId(addressEntity.getAddressId());
                address.setStreet(addressEntity.getStreet());
                address.setCity(addressEntity.getCity());
                address.setState(addressEntity.getState());
                address.setPinCode(addressEntity.getPinCode());
                addressList.add(address);
            }
        }
        user.setAddresses(addressList);

        return user;
    }

    @Override
    public User editUser(String userId, User user) throws Exception {
        return null;
    }

    @Override
    public User addAddress(String userId, Address address) throws Exception {

        return null;
    }

    @Override
    public String deleteAddress(String addressId) throws Exception {

        AddressEntity addressEntity=entityManager.find(AddressEntity.class,addressId);


        return null;
    }
}
