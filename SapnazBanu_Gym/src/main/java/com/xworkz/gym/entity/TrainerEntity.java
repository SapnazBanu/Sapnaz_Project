package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalTime;

@Entity
@Table(name = "trainer_table")
@Data
@NamedQuery(name = "getAllTrainerDetails",query = "select a from TrainerEntity a")
@NamedQuery(name = "deleteTrainerSlotById",query = "DELETE  from TrainerEntity a where a.id=:getId")

public class TrainerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "trainer_name")
    private String trainerName;
    @Column(name = "phone_no")
    private  Long phoneNo;

    @Column(name = "slot_time")
    private String slotTime;
}