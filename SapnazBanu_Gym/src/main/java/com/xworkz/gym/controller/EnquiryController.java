package com.xworkz.gym.controller;

import com.xworkz.gym.dto.EnquiryDTO;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class EnquiryController {

    @Autowired
    private GymService gymService;
    @GetMapping("/enquiry")
    public String enquiry(HttpSession httpSession,Model model){
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("list",entity);

        return "Enquiry";
    }
    @PostMapping("/enquiry")
    public String SubmitEnquiryDetails(EnquiryDTO enquiryDTO, Model model, HttpSession httpSession){
        System.out.println(enquiryDTO);
        AdminEntity adminEntity=(AdminEntity)httpSession.getAttribute("adminEntity");
        System.out.println(adminEntity);
        boolean valid=gymService.validateCustomerEnquiryDetails(enquiryDTO,adminEntity.getName());
        if(valid){
            model.addAttribute("enquiryDTO",enquiryDTO);
            return "DisplayEnquiryDetails";
        }
        model.addAttribute("invalidDetails","Not Submitted Please Enter Valid Details");
        model.addAttribute("list",adminEntity);
        return "Enquiry";
    }



}
