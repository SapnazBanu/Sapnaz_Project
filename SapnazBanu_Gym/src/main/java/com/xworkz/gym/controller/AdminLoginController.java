package com.xworkz.gym.controller;

import com.xworkz.gym.dto.AdminLoginDTO;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class AdminLoginController {

    @Autowired
    private GymService gymService;

    public AdminLoginController(){
        System.out.println("created AdminLoginController");
    }

    @GetMapping("/homePage")
    public String onHome(HttpSession httpSession,Model model){
        AdminEntity adminEntity=(AdminEntity)httpSession.getAttribute("adminEntity");
        model.addAttribute("list",adminEntity);
        return "AdminPage";
    }
    @PostMapping("/adminLogin")
    public String onLigin(AdminLoginDTO adminLoginDTO, Model model,HttpSession httpSession){
        System.out.println(adminLoginDTO);
        boolean valid=gymService.validateAdminUser(adminLoginDTO);
        if(valid) {
            AdminEntity adminEntity=gymService.getAdminDetails(adminLoginDTO);
            if(adminEntity.getLogin_count()==-1){
                return "SetNewPassword";
            }
            httpSession.setAttribute("adminEntity",adminEntity);
            AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

            model.addAttribute("list",entity);
            return "AdminPage";
        }
        model.addAttribute("failure","email or password is invalid");
        return "AdminLogin";
    }

    @RequestMapping("/setNewPassword")
    public String onSetNewPassword(AdminLoginDTO adminLoginDTO){
        gymService.validAndSaveNewPassword(adminLoginDTO);
        return "AdminLogin";
    }


}
