package org.taxFlow.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.repository.AssignedWorkRepository;
import org.taxFlow.services.AssignedWorkLoadService;
import org.taxFlow.services.WorkItemService;

import jakarta.servlet.http.HttpSession;


@Controller
public class swotController {

    @GetMapping("/signin")
    public String showSigninPage() {
        return "login";
    }

//    @GetMapping("/admindash")
//    public String adminDash() {
//        return "adminDash";
//    }

    @GetMapping("/addUser")
    public String addUser() {
        return "usercreation";
    }

    @GetMapping("/addwork")
    public String addwork() {
        return "workprocessing";
    }

//    @GetMapping("/viewusers")
//    public String viewusers() {
//        return "viewUsers";
//    }
//    @GetMapping("/viewmis")
//    public String viewmisreport() {
//        return "viewMis";
//        
// }
//        @GetMapping("/editUser")
//    public String edituser() {
//    	return "editUser";
//    }
     @GetMapping("/userhome")
    public String userHome() {
    	
    	return "userhome";
    }

//     @GetMapping("/pullwork")
//     public String pullwork() {
//     	
//     	return "pullwork";
//     }
    @GetMapping("/login")
    public String login() {
    	
    	return "login";
    }
  
   
//   
//   
}

   

    





    




