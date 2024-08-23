package org.taxFlow.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.taxFlow.entity.Workitem;


public interface workitemrepository extends JpaRepository<Workitem, Integer> {
	List<Workitem> findByWorktype(String worktype); //
    @Query("SELECT a.workitem FROM AssignedWork a WHERE a.assistant.id = :userId AND a.assigned = true")
    List<Workitem> findAssignedWorkItemsByUserId(@Param("userId") int userId);

	
}
