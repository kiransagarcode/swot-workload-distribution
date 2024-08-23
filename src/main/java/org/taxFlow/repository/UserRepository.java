package org.taxFlow.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.taxFlow.entity.Users;

public interface UserRepository extends JpaRepository<Users, Integer> {
	
    List<Users> findByRole(String role);
    List<Users> findByRoleAndHasskill(String role, boolean hasskill);
    Users findByUsername(String username);// Updated method
    Users findByUsernameAndPassword(String username, String password);
    
}