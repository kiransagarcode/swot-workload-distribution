package org.taxFlow.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.taxFlow.entity.AssignedWork;
import org.taxFlow.services.*;

import java.util.Date;

@Controller
public class AssignedWorkController {

    @Autowired
    private AssignedWorkLoadService assignedWorkService;

    @PostMapping("/completeWork")
    public String completeWork(@RequestParam("assignedWorkId") int assignedWorkId) {
        assignedWorkService.completeWork(assignedWorkId);
        return "redirect:/pullwork";
    }

}
