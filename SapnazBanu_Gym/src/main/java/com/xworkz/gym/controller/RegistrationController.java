package com.xworkz.gym.controller;

import com.xworkz.gym.constants.GymPackagesEnum;
import com.xworkz.gym.constants.GymTrainersEnum;
import com.xworkz.gym.dto.RegistrationDTO;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")

public class RegistrationController {
    List<GymPackagesEnum> packagesEnumList = new ArrayList<>(Arrays.asList(GymPackagesEnum.values()));
    List<GymTrainersEnum> gymTrainersEnums = new ArrayList<>(Arrays.asList(GymTrainersEnum.values()));

    @Autowired
    private GymService gymService;
    @GetMapping("/register")
    public String getRegisteration(HttpSession httpSession,Model model) {
        model.addAttribute("packagesEnumList", packagesEnumList);
        model.addAttribute("gymTrainersEnums", gymTrainersEnums);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("list",entity);
        return "RegistrationForm";
    }

    @PostMapping("/registeration")
    public String registeration(RegistrationDTO registrationDTO, Model model, HttpSession httpSession) {

        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        String adminName=adminEntity.getName();
        model.addAttribute("packagesEnumList", packagesEnumList);
        model.addAttribute("gymTrainersEnums", gymTrainersEnums);

        boolean saved=gymService.validateAndSaveRegistredDetails(registrationDTO,adminName);
        if(saved){

            model.addAttribute("registerDTO",registrationDTO);
            return "DisplayRegistredDetails";
        }
        else {
            model.addAttribute("notsaved","Not Submitted Please Fill Valid Details");
            return "RegistrationForm";
        }

    }


}
