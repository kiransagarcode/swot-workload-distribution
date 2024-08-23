package org.taxFlow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.entity.Users;

public interface AssignedWorkRepository extends JpaRepository<AssignedWork, Integer> {
	 AssignedWork findById(int id);
	int countByAssistant(Users assistant);

	
	@Query("SELECT aw FROM AssignedWork aw JOIN FETCH aw.workitem w JOIN FETCH aw.assistant u WHERE u.username = :username")


	    List<AssignedWork> findAssignedWorkByUsername(@Param("username") String username);
	List<AssignedWork> findByWorkitem_Worktype(String workType);
	long countByAssigned(boolean assigned);

    long countByCompleted(boolean completed);
}