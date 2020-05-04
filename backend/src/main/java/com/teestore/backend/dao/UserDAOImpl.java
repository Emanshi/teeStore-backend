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

        Query query1= entityManager.createQuery("select u from UserEntity u where u.contactNumber =:contactNumber");
        query1.setParameter("contactNumber",user.getContactNumber());

        Query query2= entityManager.createQuery("select u from UserEntity u where u.emailId =:emailId");
        query2.setParameter("emailId",user.getEmailId());

        List<UserEntity> result1= query1.getResultList();
        List<UserEntity> result2= query2.getResultList();
        if((result1!=null && !result1.isEmpty()) && (result2!=null && !result2.isEmpty()))
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
    public String editUser(String userId, User user) throws Exception {
        UserEntity userEntity=entityManager.find(UserEntity.class,userId);

        if(userEntity==null)
            return null;

        userEntity.setUserName(user.getUserName());
        userEntity.setPassword(user.getPassword());
        userEntity.setDateOfBirth(user.getDateOfBirth());

        return userId;
    }

    @Override
    public String addAddress(String userId, Address address) throws Exception {
        UserEntity userEntity=entityManager.find(UserEntity.class,userId);

        if(userEntity==null)
            return null;

        List<AddressEntity> addressEntityList=userEntity.getAddresses();

        if(addressEntityList==null)
            addressEntityList=new ArrayList<>();

        AddressEntity addressEntity=new AddressEntity();
        addressEntity.setStreet(address.getStreet());
        addressEntity.setCity(address.getCity());
        addressEntity.setState(address.getState());
        addressEntity.setPinCode(address.getPinCode());

//        entityManager.persist(addressEntity);
//        address.setAddressId(addressEntity.getAddressId());
//
//        entityManager.persist(userEntity);

        // Changed code

        addressEntityList.add(addressEntity);
        userEntity.setAddresses(addressEntityList);

        entityManager.persist(userEntity);

        return addressEntity.getAddressId();
    }

    @Override
    public String deleteAddress(String userId,String addressId) throws Exception {

        UserEntity userEntity=entityManager.find(UserEntity.class,userId);
        AddressEntity addressEntity=entityManager.find(AddressEntity.class,addressId);

//        String uId=null;
//        if(userEntity!=null){
//
//            List<AddressEntity> addressEntityList=userEntity.getAddresses();
//
//            if(addressEntityList!=null && !addressEntityList.isEmpty() && addressEntity!=null){
//
//                for(AddressEntity aEntity:addressEntityList){
//                    if(aEntity.getAddressId().equals(addressEntity.getAddressId())){
//                        addressEntityList.remove(addressEntity);
//                        break;
//                    }
//                }
//
//            }
//
//            userEntity.setAddresses(addressEntityList);
//            entityManager.persist(userEntity);
//            return userId;
//        }
//
//        return uId;

        String id=null;
        if(userEntity!=null){

            List<AddressEntity> addressEntityList=userEntity.getAddresses();

            if(addressEntityList!=null && !addressEntityList.isEmpty() && addressEntity!=null){

                for(AddressEntity aEntity:addressEntityList){
                    if(aEntity.getAddressId().equals(addressEntity.getAddressId())){
                        addressEntityList.remove(addressEntity);
                        entityManager.persist(addressEntity);
                        id = addressEntity.getAddressId();
                        break;
                    }
                }

            }

            userEntity.setAddresses(addressEntityList);
            entityManager.persist(userEntity);
            return userId;
        }

        return id;
    }
}
