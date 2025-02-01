package com.xworkz.controller;

import com.xworkz.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/")
public class RegistrationRestController {

    @Autowired
    GymService gymService;

    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE )
    public String onEmail(@PathVariable String email) {
        Long count = gymService.getCountofEmail(email);
        if (count > 0) {
            return "Email Already exists";

        }
        return "";
    }


}
