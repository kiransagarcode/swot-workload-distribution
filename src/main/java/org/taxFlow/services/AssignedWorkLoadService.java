package org.taxFlow.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.entity.Users;
import org.taxFlow.entity.Workitem;
import org.taxFlow.repository.AssignedWorkRepository;
import org.taxFlow.repository.UserRepository;
import org.taxFlow.repository.workitemrepository;

@Service
public class AssignedWorkLoadService {

    @Autowired
    private workitemrepository workRepo;

    @Autowired
    private UserRepository usersRepo;

    @Autowired
    private AssignedWorkRepository assignedWorkRepo;

    public Workitem save(Workitem w) {
        Workitem savedWorkitem = workRepo.save(w);
        assignWorkToAssistant(savedWorkitem);
        return savedWorkitem;
    }

    public List<Workitem> getAll() {
        return workRepo.findAll();
    }

    public Optional<Workitem> getById(int id) {
        return workRepo.findById(id);
    }

    public void deleteById(int id) {
        workRepo.deleteById(id);
    }

    public Optional<Workitem> editById(int id, Workitem w) {
        if (workRepo.findById(id).isPresent()) {
            w.setWorkid(id); // Ensure the ID is set for the update
            return Optional.of(workRepo.save(w));
        } else {
            return Optional.empty();
        }
    }

    private void assignWorkToAssistant(Workitem w) {
        List<Users> availableAssistants;

        if (w.isSkill()) {
            availableAssistants = usersRepo.findByRoleAndHasskill("assistant", true);
        } else {
            availableAssistants = usersRepo.findByRole("assistant");
        }

        // Find the assistant with the least assigned work
        Users assistant = availableAssistants.stream()
            .sorted((o1, o2) -> {
                int o1WorkLoad = assignedWorkRepo.countByAssistant(o1);
                int o2WorkLoad = assignedWorkRepo.countByAssistant(o2);
                return Integer.compare(o1WorkLoad, o2WorkLoad);
            })
            .findFirst()
            .orElseThrow(() -> new IllegalStateException("No assistants available"));

        AssignedWork assignedWork = new AssignedWork();
        assignedWork.setWorkitem(w);
        assignedWork.setAssistant(assistant); // Set the assistant to the AssignedWork entity
        assignedWork.setAssigned(true); // Assuming the work is now assigned

        assignedWorkRepo.save(assignedWork);
    }

    public List<AssignedWork> getAllAssignedWork() {
        return assignedWorkRepo.findAll();
    }

    // New method to get filtered assigned work
    public List<AssignedWork> getFilteredAssignedWork(String workType, String priority) {
        List<AssignedWork> assignedWorkList = assignedWorkRepo.findAll();

        if (workType != null && !workType.isEmpty()) {
            assignedWorkList = assignedWorkList.stream()
                .filter(aw -> aw.getWorkitem().getWorktype().equalsIgnoreCase(workType))
                .collect(Collectors.toList());
        }

        if (priority != null && !priority.isEmpty()) {
            assignedWorkList = assignedWorkList.stream()
                .filter(aw -> aw.getWorkitem().getPriority().equalsIgnoreCase(priority))
                .collect(Collectors.toList());
        }

        return assignedWorkList;
    }
    
    public List<AssignedWork> getAssignedWorkByUsername(String username) {
        return assignedWorkRepo.findAssignedWorkByUsername(username);
    }    public void completeWork(int assignedWorkId) {        AssignedWork assignedWork = assignedWorkRepo.findById(assignedWorkId);        assignedWork.markAsComplete();
       assignedWorkRepo.save(assignedWork);
   }  
    
    public List<AssignedWork> getAllAssignedWorkItems() {
        List<AssignedWork> workItems = assignedWorkRepo.findAll();
        System.out.println("Number of assigned work items: " + workItems.size());
        for (AssignedWork workItem : workItems) {
            System.out.println(workItem);  // Ensure toString() is properly implemented in AssignedWork
        }
        return workItems;
    }
    
    public long getTotalCount() {
        return assignedWorkRepo.count();
    }

    public long getAssignedCount() {
        return assignedWorkRepo.countByAssigned(true);
    }

    public long getCompletedCount() {
        return assignedWorkRepo.countByCompleted(true);
    }
}
 








