package com.xworkz.gym.restcontroller;

import com.xworkz.gym.constants.ProfileImagePath;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.IOException;
@RestController
@RequestMapping("/")
public class ProfileImageRestController {
    @ResponseBody
    @RequestMapping("/photo/{image}")
    public byte[] testPhoto(@PathVariable String image) throws IOException {
        FileInputStream fis=new FileInputStream(ProfileImagePath.ProfileImagePath.getPath()+image);
        return IOUtils.toByteArray(fis);
    }
}
