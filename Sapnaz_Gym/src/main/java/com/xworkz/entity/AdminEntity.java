package com.xworkz.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "gym_admin")
@NoArgsConstructor
@NamedQuery(name = "getAllbyEmail" , query = "SELECT ae FROM AdminEntity ae WHERE ae.email = :email")
public class AdminEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

}
