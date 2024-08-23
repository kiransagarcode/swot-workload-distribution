package org.taxFlow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.entity.Users;
import org.taxFlow.entity.Workitem;
import org.taxFlow.services.AssignedWorkLoadService;
import org.taxFlow.services.UserService;
import org.taxFlow.services.WorkItemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	 @Autowired
	    private WorkItemService workItem;
	@Autowired
	private UserService UserService;
	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
	    Users user = UserService.verifyUser(username, password);
	    if (user != null) {
	        session.setAttribute("username", username); // Store username in session
	        model.addAttribute("user", user);
	        System.out.println("User role: " + user.getRole()); // Debug statement to check role
	        switch (user.getRole()) {
	            case "admin":
	                return "redirect:/admindash";
	            case "assistant":
	                return "redirect:/userhome";
	            case "commisionor":
	                return "redirect:/contentmanagerhome";
	            case "joint-comissioner":
	                return "redirect:/subjectmatterexperthome";
	            default:
	                return "redirect:/login?error";
	        }
	    } else {
	        model.addAttribute("error", "Invalid username or password");
	        return "login";
	    }
	}

	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        // Invalidate the session
	        session.invalidate();
	        System.out.println("User logged out successfully.");
	        // Redirect to login page or home page
	        return "redirect:/login";
	    }
	 
//	

	 @Autowired
	    private AssignedWorkLoadService assignedWorkService;
	 @GetMapping("/pullwork")
	 public String getAssignedWork(Model model, HttpSession session) {
	     String username = (String) session.getAttribute("username");
	     System.out.println("Logged in username: " + username); // Debug statement

	     // Fetch user details
	     Users user = UserService.getUserByUsername(username);
	     if (user != null) {
	         System.out.println("User found: " + user.getUsername()); // Should print the username
	         model.addAttribute("user", user);
	     } else {
	         System.out.println("User not found for username: " + username);
	     }

	     List<AssignedWork> assignedWorkList = assignedWorkService.getAssignedWorkByUsername(username);

	     model.addAttribute("AssignedWork", assignedWorkList);
	     return "/pullwork";
	 }

	 }



