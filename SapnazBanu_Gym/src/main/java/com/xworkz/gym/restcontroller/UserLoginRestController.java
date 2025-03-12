package com.xworkz.gym.restcontroller;

import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/")
public class UserLoginRestController {

    @Autowired
    private GymService gymService;

    @GetMapping(value = "/name/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        Long count = gymService.getCountOfRegisteredUserEmail(email);

        if (count > 0) {
            return "";
        } else
            return "Email invalid";
    }
}
