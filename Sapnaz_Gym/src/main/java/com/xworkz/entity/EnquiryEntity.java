package com.xworkz.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "enquiry_table")
@NamedQuery(name = "getCountOfPhone", query = "SELECT COUNT(cme) FROM EnquiryEntity cme WHERE cme.ph = :setPh")
@NamedQuery(name = "getAllEnquiries", query = "SELECT e FROM EnquiryEntity e")
@NamedQuery(name = "updateDetailsByenquiryId", query = "UPDATE EnquiryEntity cme SET cme.status = :status, cme.description = :description  WHERE cme.enquiry_id = :enquiry_id")

public class EnquiryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int enquiry_id;

    @Column(name = "name")
    private String name;

    @Column(name = "area")
    private String area;

    @Column(name = "ph")
    private String ph;

    @Column(name = "distance")
    private int distance;

    @Column(name = "age")
    private int age;

    @Column(name = "status")
    private String status;

    @Column(name = "description")
    private String description;

}
