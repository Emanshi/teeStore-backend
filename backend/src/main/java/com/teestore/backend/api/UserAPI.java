package com.teestore.backend.api;

import com.teestore.backend.model.Address;
import com.teestore.backend.model.User;
import com.teestore.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@CrossOrigin
@RestController
@RequestMapping("UserAPI")
public class UserAPI {

    @Autowired
    private UserService userService;

    @Autowired
    private Environment environment;

    @RequestMapping(value = "/userRegister", method= RequestMethod.POST)
    public ResponseEntity<User> registerUser(@RequestBody User user) {

        try{
            return new ResponseEntity<User>(userService.addUser(user), HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,e.getMessage());
        }
    }

    @RequestMapping(value = "/userLogin" , method= RequestMethod.POST)
    public ResponseEntity<User> authenticateUser(@RequestBody User user) {

        try{
            return new ResponseEntity<User>(userService.loginUser(user), HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(environment.getProperty(e.getMessage()));
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Not possible",e);
        }
    }

    @RequestMapping(value = "/getUser/{userId}" , method= RequestMethod.GET)
    public ResponseEntity<User> getUser(@PathVariable String userId) {
        try{
            return new ResponseEntity<User>(userService.getUser(userId),HttpStatus.OK);
        }catch(Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,e.getMessage());
        }

    }

    @RequestMapping(value = "/editUserProfile/{userId}" , method= RequestMethod.POST)
    public ResponseEntity<String> editUser(@PathVariable String userId,@RequestBody User user) {

        try{
            return  new ResponseEntity<String>(userService.editUser(userId,user),HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,e.getMessage());
        }
    }

    @RequestMapping(value = "/addAddress/{userId}" , method=RequestMethod.POST)
    public ResponseEntity<String> addAddress(@PathVariable String userId, @RequestBody Address address) {

        try{
            return  new ResponseEntity<String>(userService.addAddress(userId,address),HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }

    @RequestMapping(value = "/editAddress/{addressId}" , method=RequestMethod.PUT)
    public ResponseEntity<String> editAddress(@PathVariable String addressId, @RequestBody Address address) {

        try{
            return  new ResponseEntity<String>(userService.editAddress(addressId,address),HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }

    @RequestMapping(value = "/deleteAddress", method= RequestMethod.GET)
    public ResponseEntity<String> deleteAddress(@RequestParam String userId,@RequestParam String addressId ) {

        try{
            return  new ResponseEntity<String>(userService.deleteAddress(userId,addressId),HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }
}
