package com.xworkz.gym.controller;

import com.xworkz.gym.constants.GymPackagesEnum;
import com.xworkz.gym.constants.GymTrainersEnum;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.entity.UpdatedEnquiryDetailsEntity;
import com.xworkz.gym.entity.UpdatedRegistrationDetailsEntity;
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
public class UpdateRegistredDetails {

    List<GymPackagesEnum> packagesEnumList = new ArrayList<>(Arrays.asList(GymPackagesEnum.values()));
    List<GymTrainersEnum> gymTrainersEnums = new ArrayList<>(Arrays.asList(GymTrainersEnum.values()));

    @Autowired
    private GymService gymService;

    @GetMapping("/registrationUpdate")
    public String onUpdate(HttpSession httpSession,Model model){
        List<RegistrationEntity> registrationEntityList=gymService.getAllRegistredUsersDetails();
        model.addAttribute("list",registrationEntityList);
        System.out.println(registrationEntityList);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("listimg",entity);
        if(registrationEntityList.isEmpty()){
            model.addAttribute("listEmpty","No One Registred Yet. Please Register!");

            model.addAttribute("listimg",entity);
            return "RegistredUsersSearch";
        }
        return "RegistredUsersSearch";
    }

    @RequestMapping("/searchDetails")
    public String onSearch(String searchName,Long searchPhoneNo,Model model,HttpSession httpSession){
        List<RegistrationEntity> registrationEntityList=gymService.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName,searchPhoneNo);
        System.out.println(registrationEntityList);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("listimg",entity);
        if(registrationEntityList.isEmpty()){
            model.addAttribute("listimg",entity);

            model.addAttribute("notFound","No One Registred With This Name And Phone Number. Please Check Name And Phone Number");
            return "RegistredUsersSearch";
        }
        model.addAttribute("list",registrationEntityList);
        return "RegistredUsersSearch";
    }

    @RequestMapping(value = "/updatebutton", method = RequestMethod.POST)
    public String onupdatebutton(@RequestParam("id") int id,@RequestParam("name") String name, @RequestParam("phoneNumber") long phoneNumber, @RequestParam("gympackage") String gympackage, @RequestParam("trainer") String trainer,@RequestParam("balanceAmount") String balanceAmount,@RequestParam("totalAmount") String totalAmount ,HttpSession httpSession,Model model) {

        System.out.println(trainer+gympackage);
        model.addAttribute("id",id);
        model.addAttribute("name",name);
        model.addAttribute("phoneNumber",phoneNumber);
        model.addAttribute("packag",gympackage);
        model.addAttribute("trainer",trainer);
        model.addAttribute("totalAmount",totalAmount);
        model.addAttribute("balanceAmount",balanceAmount);
        model.addAttribute("packagesEnumList", packagesEnumList);
        model.addAttribute("gymTrainersEnums", gymTrainersEnums);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("listimg",entity);

        return "UpdateRegistredDetails";
    }

    @PostMapping("/updateRegister")
    public String onRegistredDetailsUpdate(int id, String gympackage, String trainer, double amountPaid, double balanceAmount, double totalAmount, String name, String phoneNo, Model model, HttpSession session){
        System.out.println(totalAmount);
        AdminEntity adminEntity= (AdminEntity)session.getAttribute("adminEntity");
        String adminName=adminEntity.getName();
        int updatedVlaue=gymService.upadteRegistredUsersDetails(id,gympackage,trainer,amountPaid,balanceAmount,totalAmount,adminName);
        if(updatedVlaue>0){
            model.addAttribute("name",name);
            model.addAttribute("no",phoneNo);
            model.addAttribute("gympackage",gympackage);
            model.addAttribute("trainer",trainer);
            model.addAttribute("balanceAmount",balanceAmount);
            model.addAttribute("paid",amountPaid);
            model.addAttribute("totalAmount",totalAmount);


            model.addAttribute("listimg",adminEntity);
            return "DisplayUpdatedRegistredDetails";
        }

        return "UpdateRegistredDetails";
    }

    @GetMapping("/view")
    public String onView(@RequestParam int id,Model model ,HttpSession httpSession){
        System.out.println(id);
        List<UpdatedRegistrationDetailsEntity> list= gymService.getAllRegistredUsersUpdatedDetails(id);

        System.out.println(list);
        model.addAttribute("list",list);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("listimg",entity);

        return "ViewRegistrationUpdatedDetials";
    }

}