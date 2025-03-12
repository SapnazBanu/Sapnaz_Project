package com.xworkz.gym.restcontroller;

import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class AdminLoginRestController {
    @Autowired
    private GymService gymService;

    @GetMapping(value = "/placeName/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        System.out.println(email);

        Long count = gymService.getCountOfAdminUserName(email);

        if (count > 0) {
            System.out.println("name  exists");
            return "";
        } else {
            System.out.println("UserName doesn't exists");
            return "UserName doesn't exists";
        }
    }

}