package org.taxFlow.controller;
import org.taxFlow.services.AssignedWorkLoadService;
import org.taxFlow.services.UserService;
import org.taxFlow.services.WorkItemService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.entity.Users;
import org.taxFlow.entity.Workitem;
import org.taxFlow.repository.AssignedWorkRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;

@Controller
public class AdminController {
	
	
	  @Autowired
	    private UserService userService;

	    @Autowired
	    private AssignedWorkLoadService assignedWorkLoadService;

	 
	  @GetMapping("/adduser")
	    public String showAddUserForm(Model model) {
	        model.addAttribute("user", new Users());
	        return "usercreation";
	    }

	    @PostMapping("/adduser")
	    public String addUser(@ModelAttribute Users user , Model m) {
	        userService.saveUser(user);
	        m.addAttribute("message", "Officer added  successfully.");
	        return "redirect:/adduser";
	    }

	    @GetMapping("/viewusers")
	    public String viewUsers(@RequestParam(required = false) String role, Model model) {
	        List<Users> users;
	        if (role != null && !role.isEmpty()) {
	            users = userService.getUsersByRole(role);
	        } else {
	            users = userService.getAllUsers();
	        }
	        model.addAttribute("Users", users);
	        return "viewUsers";
	    }



	    @GetMapping("/deleteUser/{userid}")
	    public String deleteUser(@PathVariable int userid) {
	    	   userService.deleteUserById(userid);
	        return "redirect:/viewusers";
	    }

	    @GetMapping("/editUser/{userid}")
	    public String editUser(@PathVariable int userid, Model model) {
	        Users user = userService.getUserById(userid);
	        if (user == null) {
	            // Handle the case where the user is not found
	            // Log the issue for debugging purposes
	            System.out.println("User not found with ID: " + userid);
	            return "redirect:/userList"; // or another error page
	        }
	        model.addAttribute("user", user);
	        return "editUser"; // Name of the JSP page for editing user
	    }

	    
	    @PostMapping("/updateUser")
	    public String updateUser(Users user) {
	        userService.updateUser(user);
	        return "redirect:/viewusers";
	        
	    }
	    
	    
	        
	    @PostMapping("/addwork")
	    public String addWorkItem(@ModelAttribute Workitem w, Model model) {
	        assignedWorkLoadService.save(w);
	        model.addAttribute("message", "Work item added successfully and assigned to an officer.");
	        return "workprocessing";
	    }
	// for assigned work 
	    @GetMapping("/viewAssignedWork")
	    public String viewAssignedWork(
	            @RequestParam(required = false) String workType,
	            @RequestParam(required = false) String priority,
	            Model model) {
	        // Fetch filtered work items
	        model.addAttribute("assignedWorkItems", assignedWorkLoadService.getFilteredAssignedWork(workType, priority));
	        // Add filter parameters to the model
	        model.addAttribute("workType", workType);
	        model.addAttribute("priority", priority);
	        return "viewAssignedWork";
	    }
	    
	    @GetMapping("/viewmis")
	    public String viewMis(
	        @RequestParam(value = "priority", required = false) String priority,
	        @RequestParam(value = "status", required = false) String status,
	        Model model) {
	        
	        List<AssignedWork> assignedWorkItems = assignedWorkLoadService.getAllAssignedWork();

	        if (priority != null && !priority.isEmpty()) {
	            assignedWorkItems = assignedWorkItems.stream()
	                    .filter(work -> work.getWorkitem().getPriority().equalsIgnoreCase(priority))
	                    .collect(Collectors.toList());
	        }

	        if (status != null && !status.isEmpty()) {
	            boolean isCompleted = status.equalsIgnoreCase("completed");
	            assignedWorkItems = assignedWorkItems.stream()
	                    .filter(work -> work.isCompleted() == isCompleted)
	                    .collect(Collectors.toList());
	        }

	        model.addAttribute("assignedWorkItems", assignedWorkItems);
	        return "viewMis";
	    }
	    
	    @Autowired
	    private AssignedWorkRepository assignedWorkRepo;
	    
	    @GetMapping("/admindash")
	    public String showAdminDashboard(Model model) {
	        // Fetch counts
	        long totalCount = assignedWorkLoadService.getTotalCount();
	        long assignedCount = assignedWorkLoadService.getAssignedCount();
	        long completedCount = assignedWorkLoadService.getCompletedCount();

	        // Add counts to the model
	        model.addAttribute("totalCount", totalCount);
	        model.addAttribute("assignedCount", assignedCount);
	        model.addAttribute("completedCount", completedCount);

	        return "adminDash";
	    }
}
