package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "UsersAssignedToTrainer")
@Data
@NoArgsConstructor
@NamedQuery(name = "getTrainerAndSlotByUserName",query = "select a from UsersAssignedToTrainerEntity a where a.userName=:getUserName")
@NamedQuery(name = "getUsersAssignedToTrainerByTrainerName",query = "select a from UsersAssignedToTrainerEntity a where a.trainerName=:getTrainerName")
@NamedQuery(name = "deleteUserAssignedToTrainer",query = "DELETE  from UsersAssignedToTrainerEntity a where a.trainerName=:getTrainerName")

public class UsersAssignedToTrainerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String trainerName;
    private String userName;
    private String slot;

    public UsersAssignedToTrainerEntity(String trainerName, String userName, String slot) {
        this.trainerName = trainerName;
        this.userName = userName;
        this.slot=slot;
    }

}