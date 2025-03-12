package com.xworkz.gym.restcontroller;

import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class EnquiryRestController {

    @Autowired
    private GymService gymService;
    @GetMapping(value = "/emailid/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        System.out.println(email);

        Long count = gymService.getCountOfEmail(email);

        if (count > 0) {
            System.out.println("enquiry Email exists");
            return "email already exists";
        } else {
            System.out.println("enquiry Email doesn't exists");
            return "";
        }
    }

}
