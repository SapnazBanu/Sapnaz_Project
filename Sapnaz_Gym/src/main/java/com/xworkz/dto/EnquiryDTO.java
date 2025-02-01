package com.xworkz.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
public class EnquiryDTO {

    @Size(min = 3,max = 15,message = "Name must be atleast 3 characters")
    private String name;

    @Size(min =5,max = 100,message = "Area must be atleast 10 characters")
    private String area;

    @Pattern(regexp = "^[0-9]{10}$",message = "Provide valid Contact number")
    private String ph;

    @Pattern(regexp = "^[1-9][0-9]{0,3}$", message = "Provide a valid distance between 1 and 9999")
    private int distance;

    @Pattern(regexp = "^(1[0-1][0-9]|[1-9][0-9]?|120)$", message = "Provide a valid age between 1 and 120")
    private int age;

}
