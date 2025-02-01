package com.xworkz.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@NoArgsConstructor
@Table(name = "payment_details_table")
@NamedQuery(name = "getPaymentDetailsById", query = "SELECT cme FROM RegUpdateEntity cme WHERE cme.reg_id = :reg_id")

public class RegUpdateEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reg_update_id")
    private int regUpdateId;

    @Column(name = "reg_id")
    private int reg_id;

    @Column(name = "paid_amount")
    private String paidAmount;

    @Column(name = "balance")
    private String balance;

    @Column(name = "name")
    private String name;

    @Column(name = "updated_date_time")
    private LocalDateTime updatedDateAndTime;
}
