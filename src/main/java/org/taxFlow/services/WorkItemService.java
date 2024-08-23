package org.taxFlow.services;

import java.util.List;
import java.util.Optional;

import org.taxFlow.entity.AssignedWork;
import org.taxFlow.entity.Workitem;
import org.taxFlow.repository.AssignedWorkRepository;
import org.taxFlow.repository.workitemrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkItemService {

    @Autowired
    private workitemrepository workRepo;

    public Workitem save(Workitem w) {
        return workRepo.save(w);
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
 

    public List<Workitem> getWorkItemsByType(String worktype) {
        return workRepo.findByWorktype(worktype);
    }

    public List<Workitem> getAllWorkItems() {
        return workRepo.findAll();
    }
  

	}

    

