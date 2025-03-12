package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name ="enquiryupdate_table" )
@NamedQuery(name = "getAllViewDetailsById",query = "select a from UpdatedEnquiryDetailsEntity a where a.id=:getId")
public class UpdatedEnquiryDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id_up;
    private String UserName;
    private String customer_status;
    private  String customer_reason;
    private int id;
    @Column(name = "updated_by")
    private String updatedBy;
    @Column(name = "updated_date")
    private LocalDateTime updatedDate=LocalDateTime.now();
}
