package com.xworkz.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "view_details")
@NamedQuery(name = "getViewDetailsById", query = "SELECT cme FROM ViewDetailsEntity cme WHERE cme.enquiryId = :enquiryId")

public class ViewDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int viewdetails_id;

    @Column(name = "enquiry_id")
    private int enquiryId;

    @Column(name = "status")
    private String status;

    @Column(name = "description")
    private String description;

    @Column(name = "updated_date_and_time")
    private LocalDateTime updatedDateAndTime;

}
