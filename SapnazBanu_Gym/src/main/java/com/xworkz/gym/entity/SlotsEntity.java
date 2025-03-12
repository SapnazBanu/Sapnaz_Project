package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "slots")
@Data
@NoArgsConstructor
@NamedQuery(name = "getAllSlotsDetails",query = "select a from SlotsEntity a")
@NamedQuery(name = "deleteSlotById",query = "DELETE  from SlotsEntity a where a.id=:getId")

public class SlotsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String startTime;
    private String endTime;
    private String duration;

}
