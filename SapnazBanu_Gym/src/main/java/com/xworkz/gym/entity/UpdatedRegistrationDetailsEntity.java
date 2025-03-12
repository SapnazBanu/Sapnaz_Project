package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "regupdate_table")
@NamedQuery(name = "getAllRegUpdatedDetailsById",query = "select a from UpdatedRegistrationDetailsEntity a where a.id=:getId")
public class UpdatedRegistrationDetailsEntity  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_update;
    private double amount_paid;
    private double amount_balance;
    private String updated_packagel;
    private String updated_trainer;
    private LocalDateTime updated_date=LocalDateTime.now();
    private String updated_by;
    private int id;
}