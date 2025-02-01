package com.xworkz.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
public class RegistrationDTO {

    @Size(min = 3,max = 15,message = "Name must be atleast 3 characters")
    private String name;

    @Email(message = "Email should have @ and .com  ")
    private String email;

    @Pattern(regexp = "^[0-9]{10}$",message = "Provide valid Contact number")
    private String ph;

    private String packages;
    private String trainer;
    private String gymName;
    private String amount;
    private String discount;
    private String balance;
    private String installment;
    private String paidAmount;

}
