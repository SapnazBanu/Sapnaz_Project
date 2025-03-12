package com.xworkz.gym.restcontroller;

import com.xworkz.gym.entity.SlotsEntity;
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
public class CreateSlotRestController {

    @Autowired
    private GymService gymService;

    @GetMapping(value = "/slotName/{slot}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String slot) {
        System.out.println(slot);
        List<SlotsEntity> slotsEntityList=gymService.getAllSlotsDetails();
        for (SlotsEntity entity:slotsEntityList){
            String string=entity.getStartTime()+" - "+entity.getEndTime();
            System.out.println(string);
            if(slot.equals(string)){
                return "The Slot is Already Present";
            }
        }
        return "";

    }
}