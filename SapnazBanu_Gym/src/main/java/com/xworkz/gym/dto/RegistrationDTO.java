package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RegistrationDTO {

    private String name;
    private String email;
    private long phoneNo;
    private String gympackage;
    private String trainer;
    private double discount;
    private double amount;
    private double amountPaid;
    private double balanceAmount;

    private int age;
    private double weight;
    private double height;
    private double chestSize;


}
