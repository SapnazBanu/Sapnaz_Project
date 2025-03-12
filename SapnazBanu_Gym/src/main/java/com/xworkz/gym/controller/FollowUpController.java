package com.xworkz.gym.controller;

import com.xworkz.gym.constants.GymPackagesEnum;
import com.xworkz.gym.constants.GymTrainersEnum;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.UpdatedEnquiryDetailsEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping("/")
public class FollowUpController {
    @Autowired
    private GymService gymService;

    List<GymPackagesEnum> packagesEnumList = new ArrayList<>(Arrays.asList(GymPackagesEnum.values()));
    List<GymTrainersEnum> gymTrainersEnums = new ArrayList<>(Arrays.asList(GymTrainersEnum.values()));

    @GetMapping("/followup")
    public String onFollowUp(Model model,HttpSession httpSession) {
        List<EnquiryEntity> enquiryEntity = gymService.getAllEnquiryUsersDetails();
        System.out.println(enquiryEntity);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("list",entity);
        if (!enquiryEntity.isEmpty()) {
            model.addAttribute("list", enquiryEntity);
            model.addAttribute("listimg",entity);
            return "FollowUp";
        }
        return "FollowUp";
    }

    @RequestMapping("/followupoperation")
    public String filterByStatus(String status, Model model,HttpSession httpSession) {
        System.out.println(status);
        List<EnquiryEntity> enquiryEntity = gymService.getAllUserDetailsByStatus(status);
        System.out.println(enquiryEntity);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
        if (!enquiryEntity.isEmpty()) {
            model.addAttribute("list", enquiryEntity);

            model.addAttribute("listimg",entity);
            return "FollowUp";
        }
        model.addAttribute("listimg",entity);
        model.addAttribute("failure", "No enquiry records found on '" + status + "' status");
        return "FollowUp";
    }

    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
    public String updateStatus(@RequestParam("enquiryId") int enquiryId, @RequestParam("enquiryName") String enquiryName, @RequestParam("status") String status, @RequestParam("reason") String reason, @RequestParam("email") String email, @RequestParam("phoneNo") String phoneNo, Model model, HttpSession session) {
        AdminEntity adminEntity = (AdminEntity) session.getAttribute("adminEntity");
        String adminName = adminEntity.getName();
        int updatedValue = gymService.updateUserEnquiryDetails(enquiryId, status, reason, adminName,enquiryName);
        if (updatedValue > 0) {
            if (status.equals("Registration")) {
                model.addAttribute("enquiryName", enquiryName);
                model.addAttribute("id", enquiryId);
                model.addAttribute("email", email);
                model.addAttribute("phoneNo", phoneNo);
                model.addAttribute("gymTrainersEnums", gymTrainersEnums);
                model.addAttribute("packagesEnumList", packagesEnumList);

                model.addAttribute("list", adminEntity);
                return "RegistrationForm";
            }
        }
        List<EnquiryEntity> enquiryEntity = gymService.getAllEnquiryUsersDetails();


        if (!enquiryEntity.isEmpty()) {
            model.addAttribute("list", enquiryEntity);
            model.addAttribute("listimg",adminEntity);
            model.addAttribute("enquiryName", "Successfully Updated Details Of " + enquiryName);
            return "FollowUp";
        } else {

            model.addAttribute("list", enquiryEntity);
            model.addAttribute("listimg",adminEntity);

            model.addAttribute("notupdated", "Failed to Update Details of " + enquiryName);
            return "FollowUp";
        }

    }


//    @GetMapping("/onView/{id}")
//    public String onView(@PathVariable("id") int id,Model model){
//        System.out.println(id);
//        List<UpdatedEnquiryDetailsEntity> enquiryDetailsEntities=gymService.getAllViewDetails(id);
//
//    model.addAttribute("list",enquiryDetailsEntities);
//        return "ViewEnquiryDetails";
    //   }

    @GetMapping("/onView")
    public String onView(@RequestParam int id, Model model,HttpSession httpSession) {
        System.out.println(id);
        List<UpdatedEnquiryDetailsEntity> enquiryDetailsEntities = gymService.getAllViewDetails(id);
        System.out.println(enquiryDetailsEntities);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",entity);
        //model.addAttribute("name",name);

        model.addAttribute("list",enquiryDetailsEntities);
        return "ViewEnquiryDetails";

    }
}
