package org.taxFlow.services;


import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.taxFlow.entity.Users;
import org.taxFlow.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;

    public void saveUser(Users user) {
    	userRepo.save(user);
    }
    public List<Users> getAllUsers() {
        return userRepo.findAll();
    }

    public List<Users> getUsersByRole(String role) {
        return userRepo.findByRole(role);
    }
   
    
 public void updateUser(Users user){
userRepo.save(user); 
 
 }
 
    
    // Delete user from the database
    
    public void deleteUserById(Integer userId) {
        userRepo.deleteById(userId);
    }

    public Users getUserById(Integer userId) {
        return userRepo.findById(userId).orElse(null);
    }
//    public Optional<Users> getUserById(int userid) {
//        return userRepo.findById(userid);
//    }

//    public void editById(int userid, Users updatedUser) {
//        Optional<Users> existingUser = userRepo.findById(userid);
//        if (existingUser.isPresent()) {
//            Users user = existingUser.get();
//            user.setOfficername(updatedUser.getOfficername());
//            user.setUsername(updatedUser.getUsername());
//            user.setPassword(updatedUser.getPassword());
//            user.setRole(updatedUser.getRole());
//            user.setHasskill(updatedUser.getHasskill());
//            userRepo.save(user);
//        }
//    }
    public Users editbyid(Integer userid,Users u) {
    	Users  user = new Users();		
		if (userRepo.findById(userid).isPresent()) {
			user=userRepo.save(user);
		}
		return user;
	
	
	}
    public Users getUserByUsername(String username) {
        return userRepo.findByUsername(username);
    }
    
    // Verify user credentials
//       public Users verifyUser(String username, String password) {
//           Users user = userRepo.findByUsername(username);
//           if (user != null && user.getPassword().equals(password)) {
//               return user;
//           }
//           return null;
//       }
    public Users verifyUser(String username, String password) {
        Users user = userRepo.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

       
       public void updatedUser(Users user) {
    	    Users existingUser = userRepo.findById(user.getUserid()).orElse(null);
    	    if (existingUser != null) {
    	        existingUser.setUsername(user.getUsername());
    	        existingUser.setRole(user.getRole());

    	        // Only update the password if it's not null or empty
    	        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
    	            existingUser.setPassword(user.getPassword());
    	        }

    	        userRepo.save(existingUser);
    	    }
    	}
     

    
}  
