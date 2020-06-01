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

    @PostMapping(value = "/userRegister")
    public ResponseEntity<User> registerUser(@RequestBody User user) throws Exception {
        try{
            User res = userService.addUser(user);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,e.getMessage());
        }
    }

    @PostMapping(value = "/userLogin")
    public ResponseEntity<User> authenticateUser(@RequestBody User user) throws Exception {
        try{
            User res = userService.loginUser(user);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, e.getMessage());
        }
    }

    @GetMapping(value = "/getUser/{userId}")
    public ResponseEntity<User> getUser(@PathVariable String userId) throws Exception {
        try{
            User res = userService.getUser(userId);
            return new ResponseEntity<>(res,HttpStatus.OK);
        }catch(Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,e.getMessage());
        }

    }

    @PutMapping(value = "/editUserProfile/{userId}")
    public ResponseEntity<String> editUser(@PathVariable String userId,@RequestBody User user) throws Exception {
        try{
            String res = userService.editUser(userId,user);
            return  new ResponseEntity<>(res,HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,e.getMessage());
        }
    }

    @PostMapping(value = "/addAddress/{userId}")
    public ResponseEntity<String> addAddress(@PathVariable String userId, @RequestBody Address address) throws Exception {
        try{
            String res = userService.addAddress(userId,address);
            return  new ResponseEntity<>(res,HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }

    @PutMapping(value = "/editAddress/{addressId}")
    public ResponseEntity<String> editAddress(@PathVariable String addressId, @RequestBody Address address) throws Exception {
        try{
            String res = userService.editAddress(addressId,address);
            return  new ResponseEntity<>(res,HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }

    @DeleteMapping(value = "/deleteAddress")
    public ResponseEntity<String> deleteAddress(@RequestParam String userId,@RequestParam String addressId ) throws Exception {
        try{
            String res = userService.deleteAddress(userId,addressId);
            return  new ResponseEntity<>(res,HttpStatus.OK);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE,e.getMessage());
        }
    }
}
