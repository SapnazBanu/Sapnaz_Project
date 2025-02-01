package com.xworkz.controller;

import com.xworkz.entity.RegistrationEntity;
import com.xworkz.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserGymController {

    @Autowired
    GymService gymService;

    public UserGymController(){
        System.out.println("created UserGymController");
    }

    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam("email") String email, @RequestParam("password") String password , Model model) {

        boolean valid = gymService.validateUserLogin(email,password);
        if (valid){

            RegistrationEntity registrationEntity = gymService.getAllEnquiriesRegistration(email);
            if (registrationEntity.getUserLoginCount()==-1){
                return "UpdateUserPassword.jsp";
            }else if (registrationEntity.getUserLoginCount()==0){
                model.addAttribute("registrationEntity",registrationEntity);
                return "UserHome.jsp";
            }
        }
        return "index.jsp";
    }

    @PostMapping("/updateUserPassword")
    public String updateUserPassword(@RequestParam("email") String email , @RequestParam("newPassword") String newPassword){

        boolean valid =gymService.updateUserPassword(email,newPassword);
        if (valid) {
            return "Success.jsp";
        }
        return "UpdateUserPassword.jsp";
    }

    @PostMapping("/userUpdate")
    public String updateUserDetails(@RequestParam("email") String email , Model model){

        RegistrationEntity registrationEntity =gymService.getAllEnquiriesRegistration(email);
        if (registrationEntity!=null){
            model.addAttribute("registrationEntity",registrationEntity);
            return "UserDetailsUpdate.jsp";
        }
        return "UpdateHome.jsp";
    }

    @PostMapping("/updateUserProfile")
    public String updateUserProfile(@RequestParam("reg_id") int reg_id , @RequestParam("name") String name , @RequestParam("email") String email ,@RequestParam("ph") String ph , @RequestParam("age") String age , @RequestParam("weight") String weight, @RequestParam("height") String height ,@RequestParam("plan") String plan){

        boolean valid = gymService.updateUserProfile(reg_id,name,email,ph , age , weight , height , plan);

        if (valid){
            return "UserHome.jsp";
        }
        return "UserDetailsUpdate.jsp";
    }

}
