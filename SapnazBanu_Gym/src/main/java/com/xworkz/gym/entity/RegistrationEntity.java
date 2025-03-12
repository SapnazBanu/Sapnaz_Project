package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="registration_table")
@Data

@NamedQuery(name = "getAllRegistredUsersDetails", query = "select a from RegistrationEntity a")
@NamedQuery(name = "updateRegistredUserDetails", query = "UPDATE RegistrationEntity a SET a.totalAmountPaid=a.totalAmountPaid + :getAmountPaid,a.gympackage=:getPackage,a.trainer=:getTrainer,a.balanceAmount=:getBalanceAmount,a.amount=:getAmount where a.id=:getId")
@NamedQuery(name = "getAllRegistredUsersDetailsByNameAndPhoneNo", query = "select a from RegistrationEntity a where a.name=:getName and a.phoneNumber=:getPhoneNo")
@NamedQuery(name = "getAllRegDetailsById",query = "select a from RegistrationEntity a where a.id=:getId")
@NamedQuery(name = "updateUserNewPassword", query = "UPDATE RegistrationEntity a SET a.password=:getPassword , a.lockCount=:getLockCount where a.id=:getId")
@NamedQuery(name = "getCountOfRegistredUserEmail", query = "select count(a.email) from RegistrationEntity a where a.email=:getEmail")
@NamedQuery(name = "getAllByuserEmail", query = "select a from RegistrationEntity a where a.email=:getEmail")
@NamedQuery(name = "updateLockCount", query = "UPDATE RegistrationEntity a SET a.lockCount=:getCount where a.email=:getEmail")
@NamedQuery(name = "updateLockTime", query = "UPDATE RegistrationEntity a SET a.lockTime=:getLockTime where a.email=:getEmail")

@NamedQuery(name = "getAllRegistredUsersDetailsById",query = "select a from RegistrationEntity a where a.id=:getId")
@NamedQuery(name = "updateUserProfile", query = "UPDATE RegistrationEntity a SET a.profileImage=:getprofileImage ,a.name=:getName,a.email=:getEmail,a.phoneNumber=:getPhoneNo,a.age=:getAge,a.weight=:getWeight,a.height=:getHeight,a.chestSize=:getChestSize where a.id=:getId")
@NamedQuery(name = "getCountOfRegEmail", query = "select count(a.email) from AdminEntity a where a.email=:getEmail")

public class RegistrationEntity extends AbstractAuditEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "customer_name")
    private String name;
    @Column(name = "customer_email")
    private String email;
    @Column(name = "customer_password")
    private String password;
    @Column(name = "customer_phoneNumber")
    private long phoneNumber;
    @Column(name = "package")
    private String gympackage;
    @Column(name = "customer_trainer")
    private String trainer;
    @Column(name = "discount")
    private double discount;
    @Column(name = "amount")
    private double amount;
    @Column(name = "amountPaid")
    private double amountPaid;
    @Column(name = "balanceAmount")
    private double balanceAmount;
    @Column(name = "total_paidAmount")
    private double totalAmountPaid;
    @Column(name = "lock_count")
    private int lockCount;
    @Column(name = "lock_time")
    private LocalDateTime lockTime;
    @Column(name = "profile_image")
    private String profileImage;
    private int age;
    private double weight;
    private double height;
    private double chestSize;


}