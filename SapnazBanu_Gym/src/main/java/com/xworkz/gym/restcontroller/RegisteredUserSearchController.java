package com.xworkz.gym.restcontroller;

import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
public class RegisteredUserSearchController {
    @Autowired
    private GymService gymService;

    @GetMapping("/search")
    public String search(@RequestParam String searchName,@RequestParam Long searchPhoneNo) {

        List<RegistrationEntity> registrationEntityList=gymService.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName,searchPhoneNo);

        if(registrationEntityList.isEmpty()){

            return "No User Registred With this Name and Phone Number";
        }
        return "";
    }

    @GetMapping(value = "/regEmail/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        System.out.println(email);

        long count = gymService.getCountOfRegEmail(email);
        System.out.println(count);
        if (count > 0) {
            System.out.println("enquiry Email exists");
            return "Email already exists";
        } else {
            System.out.println("enquiry Email doesn't exists");
            return "";
        }
    }
}