package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "UserUpdatedExercise_table")
@Data
@NamedQuery(name = "getAlluserExerciseAndDietEntitiesById",query ="select a from UserUpdatedExerciseAndDietEntity a where a.id=:getId")
public class UserUpdatedExerciseAndDietEntity {


    @Column(name = "monday_exe")
    private String monday;
    @Column(name = "tuesday_exe")
    private String tuesday;
    @Column(name = "wednesday_exe")
    private String wednesday;
    @Column(name = "thursday_exe")
    private String thursday;
    @Column(name = "friday_exe")
    private String friday;
    @Column(name ="saturday_exe")
    private String saturday;
    @Column(name = "sunday")
    private String sunday;
    @Column(name = "month")
    private String month;
    @Column(name = "diet_plan")
    private String dietPlan;
    @Column(name = "monthly_image")
    private String usermonthlyImage;
    @Id
    private int id;

}
