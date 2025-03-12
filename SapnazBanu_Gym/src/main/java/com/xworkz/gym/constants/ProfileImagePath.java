package com.xworkz.gym.constants;

import lombok.Getter;

@Getter
public enum ProfileImagePath {
    ProfileImagePath("D:\\img\\");

    private String path;

    ProfileImagePath(String path){
        this.path=path;
    }
}
