package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;

@Data
@NoArgsConstructor
public class TrainerDTO {

    private String trainer;
    private  Long phoneNo;
    private String trainerDropdown;

}