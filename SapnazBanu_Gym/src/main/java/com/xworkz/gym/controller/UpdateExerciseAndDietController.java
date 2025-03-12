package com.xworkz.gym.controller;

import com.xworkz.gym.constants.ProfileImagePath;
import com.xworkz.gym.dto.RegistrationDTO;
import com.xworkz.gym.dto.UserExerciseAndDietDTO;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.entity.UserExerciseAndDietEntity;
import com.xworkz.gym.entity.UserUpdatedExerciseAndDietEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/")
public class UpdateExerciseAndDietController {

    @Autowired
    private GymService gymService;


    @GetMapping("/UpdateExerciseAndDiet")
    public String onupdate(HttpSession httpSession, Model model){
        List<RegistrationEntity> list=gymService.getAllRegistredUsersDetails();
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",adminEntity);
        model.addAttribute("list",list);

        return "UpdateUserExerciseAndDiet";
    }

    @RequestMapping("/searchUser")
    public String onSearch(String searchName,Long searchPhoneNo,Model model,HttpSession httpSession){
        List<RegistrationEntity> registrationEntityList=gymService.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName,searchPhoneNo);
        System.out.println(registrationEntityList);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");

        model.addAttribute("listimg",entity);
        if(registrationEntityList.isEmpty()){
            model.addAttribute("listimg",entity);

            model.addAttribute("notFound","No One Registred With This Name And Phone Number. Please Check Name And Phone Number");
            return "UpdateUserExerciseAndDiet";
        }
        model.addAttribute("list",registrationEntityList);
        return "UpdateUserExerciseAndDiet";
    }

    @GetMapping("/updateDiet")
    public String onupdateDiet(@RequestParam("id") int id ,HttpSession httpSession,Model model){
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity") ;
        model.addAttribute("list",adminEntity);
        System.out.println(id);
        model.addAttribute("Userid",id);

        return "ExerciseAndDiet";
    }


    @PostMapping("/exercisediet")
    public String onupdate(@RequestParam("dietImage") MultipartFile multipartFile, @RequestParam int id, UserExerciseAndDietDTO userExerciseAndDietDTO ,Model model,HttpSession httpSession) throws IOException{
        System.out.println(id);
        System.out.println(userExerciseAndDietDTO);
        String filePath;

        if (multipartFile.isEmpty()) {
            return "ExerciseAndDiet";
        } else {
            System.out.println(multipartFile);
            System.out.println(multipartFile.getOriginalFilename());
            byte[] bytes = multipartFile.getBytes();
            Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
            Files.write(path, bytes);
            filePath = path.getFileName().toString();
        }
        System.out.println(filePath);

        gymService.saveUserDietAndExercise(id,filePath,userExerciseAndDietDTO);

        List<RegistrationEntity> list=gymService.getAllRegistredUsersDetails();
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",adminEntity);
        model.addAttribute("list",list);
        model.addAttribute("success", "Successfully Updated Exercise and Diet Plan");
        return "UpdateUserExerciseAndDiet";
    }
    @GetMapping("/viewUserExercise")
    public String onupdate(@RequestParam int id, HttpSession httpSession, Model model){
        System.out.println(id);
        List<UserUpdatedExerciseAndDietEntity> userExerciseAndDietEntities =gymService.getAlluserExerciseAndDietEntitiesById(id);
        System.out.println(userExerciseAndDietEntities);
        List<UserExerciseAndDietEntity> userMonthlyImages =gymService.getuserMonthlyImages(id);
        model.addAttribute("viewUserExercise",userExerciseAndDietEntities);
        model.addAttribute("monthlyImages",userMonthlyImages);
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",adminEntity);
        return "ViewExerciseAndDiet";
    }
}
