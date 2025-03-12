package com.xworkz.gym.service;

import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;
import com.xworkz.gym.repository.GymRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;
import java.util.Random;

@Service
public class GymServiceImpl implements GymService{

    @Autowired
    private GymRepository gymRepository;
    private  final BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();



    @Override
    public boolean validateAdminUser(AdminLoginDTO adminLoginDTO) {
        AdminEntity adminEntity=gymRepository.validateUser(adminLoginDTO);
        System.out.println(adminEntity);
        if(adminEntity!=null && bCryptPasswordEncoder.matches(adminLoginDTO.getPassword(),adminEntity.getPassword())){
            return  true;
        }
        return false;
    }
    @Override
    public Long getCountOfAdminUserName(String email) {
        long count= gymRepository.getCountOfAdminUserName(email);
        return count;
    }

    @Override
    public void validAndSaveNewPassword(AdminLoginDTO adminLoginDTO) {
        if(adminLoginDTO.getPassword()!=null){
            String encodedPassword=bCryptPasswordEncoder.encode(adminLoginDTO.getPassword());
            AdminEntity adminEntity=gymRepository.validateUser(adminLoginDTO);
            adminEntity.setPassword(encodedPassword);
            adminEntity.setLogin_count(0);
            gymRepository.updateAdminPasswordAndCount(adminEntity);
        }
    }


    @Override
    public AdminEntity getAdminDetails(AdminLoginDTO adminLoginDTO) {

        return gymRepository.validateUser(adminLoginDTO);
    }



    @Override
    public boolean validateCustomerEnquiryDetails(EnquiryDTO enquiryDTO,String createdName) {
        boolean valid=true;
        String name=enquiryDTO.getName();
        if(name!=null && name.length()>1 && name.length()<30){
            System.out.println("name is valid");
        }
        else {
            valid=false;
            System.out.println("name is in valid");
        }
        String email=enquiryDTO.getEmail();
        if(email!=null && (email.contains("@gmail.com")||email.contains(".in"))){
            System.out.println("email valid");
        }
        else {
            valid=false;
            System.out.println("email Invalid");
        }
        String phoneNo= String.valueOf(enquiryDTO.getPhoneNumber());
        if(phoneNo!=null && phoneNo.length()==10){
            System.out.println("phoneNo valid");
        }
        else {
            valid=false;
            System.out.println("phoneNo Invalid");
        }
        int age=enquiryDTO.getAge();
        if(age>=12 && age<=60){
            System.out.println("age valid");
        }
        else {
            valid=false;
            System.out.println("age Invalid");
        }

        if(valid){
            EnquiryEntity enquiryEntity=new EnquiryEntity();
            enquiryEntity.setName(enquiryDTO.getName());
            enquiryEntity.setEmail(enquiryDTO.getEmail());
            enquiryEntity.setPhoneNumber(enquiryDTO.getPhoneNumber());
            enquiryEntity.setAge(enquiryDTO.getAge());
            enquiryEntity.setGender(enquiryDTO.getGender());
            enquiryEntity.setAddress(enquiryDTO.getAddress());
            enquiryEntity.setStatus("Enquiry");
            enquiryEntity.setAreaName(enquiryDTO.getAreaName());
            enquiryEntity.setCreatedBy(createdName);

            gymRepository.saveCustomerEnquiryDetails(enquiryEntity);


            final String username = "fittnessgym6@gmail.com";
            final String userPassword = "dfxi ijpe mliy povj";

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true"); //TLS

            Session session = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, userPassword);
                        }
                    });
            try {
                String emailContent = String.format(
                        "Dear %s,\n\n" +
                                "Thank you for reaching out to us! We have successfully received your enquiry with the following details:\n\n" +
                                "Name: %s\n" +
                                "Email: %s\n" +
                                "Phone Number: %s\n" +
                                "Age: %d\n" +
                                "Gender: %s\n" +
                                "Address: %s\n" +
                                "Area Name: %s\n" +
                                "Status: %s\n\n" +
                                "Our team will review your enquiry and get back to you shortly. If you have any additional questions or require further assistance, feel free to contact us.\n\n" +
                                "Best regards,\n" +
                                "%s",
                        enquiryEntity.getName(),
                        enquiryEntity.getName(),
                        enquiryEntity.getEmail(),
                        enquiryEntity.getPhoneNumber(),
                        enquiryEntity.getAge(),
                        enquiryEntity.getGender(),
                        enquiryEntity.getAddress(),
                        enquiryEntity.getAreaName(),
                        enquiryEntity.getStatus(),
                        "Fittnes Gym"
                );


                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(enquiryEntity.getEmail())
                );
                message.setSubject("Enquiry Submission Confirmation");
                message.setText(emailContent);

                Transport.send(message);

                System.out.println("Email sent successfully!");

            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
        return valid;
    }

    @Override
    public List<EnquiryEntity> getAllEnquiryUsersDetails() {
        List<EnquiryEntity> enquiryEntity= gymRepository.getAllEnquiryUsersDetails();
        return enquiryEntity;
    }

    @Override
    public int updateUserEnquiryDetails(int enquiryId, String status, String reason, String adminName, String enquiryName) {

        LocalDateTime  localDateTime=LocalDateTime.now();
        int updatedValue=gymRepository.updateUserEnquiryDetails(enquiryId,status,reason,adminName,localDateTime);
        UpdatedEnquiryDetailsEntity updatedEnquiryDetails=new UpdatedEnquiryDetailsEntity();
        updatedEnquiryDetails.setId(enquiryId);
        updatedEnquiryDetails.setCustomer_status(status);
        updatedEnquiryDetails.setCustomer_reason(reason);
        updatedEnquiryDetails.setUpdatedBy(adminName);
        updatedEnquiryDetails.setUpdatedDate(localDateTime);
        updatedEnquiryDetails.setUserName(enquiryName);
        gymRepository.saveUserUpdatedEnquiryDetails(updatedEnquiryDetails);
        return updatedValue;
    }

    @Override
    public List<EnquiryEntity> getAllUserDetailsByStatus(String status) {

        return gymRepository.getAllUserDetailsByStatus(status);
    }

    public String passwordGenerate() {
        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String Small_chars = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";


        String values = Capital_chars + Small_chars + numbers;

        Random rndm = new Random();

        StringBuilder password = new StringBuilder();

        for (int i = 0; i < 6; i++) {

            password.append(values.charAt(rndm.nextInt(values.length())));

        }
        return password.toString();
    }
    @Override
    public boolean validateAndSaveRegistredDetails(RegistrationDTO registrationDTO,String adminName) {
        boolean valid=true;
        String name=registrationDTO.getName();
        if(name!=null && name.length()>1 && name.length()<30 &&  name.matches("^[A-Za-z]+(?: [A-Za-z]+)*$")){
            System.out.println("name is valid");
        }
        else {
            valid=false;
            System.out.println("name is in valid");
        }
        String email=registrationDTO.getEmail();
        if(email!=null && email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")){
            System.out.println("email valid");
        }
        else {
            valid=false;
            System.out.println("email Invalid");
        }
        String phoneNo= String.valueOf(registrationDTO.getPhoneNo());
        if(phoneNo!=null && phoneNo.matches("^[0-9]{10}$")){
            System.out.println("phoneNo valid");
        }
        else {
            valid=false;
            System.out.println("phoneNo Invalid");
        }




        if(valid) {

            String generatedPassword=passwordGenerate();
            RegistrationEntity registrationEntity = new RegistrationEntity();
            registrationEntity.setName(registrationDTO.getName());
            registrationEntity.setEmail(registrationDTO.getEmail());
            registrationEntity.setPassword(generatedPassword);
            registrationEntity.setPhoneNumber(registrationDTO.getPhoneNo());
            registrationEntity.setGympackage(registrationDTO.getGympackage());
            registrationEntity.setTrainer(registrationDTO.getTrainer());
            registrationEntity.setDiscount(registrationDTO.getDiscount());
            registrationEntity.setAmount(registrationDTO.getAmount());
            registrationEntity.setAmountPaid(registrationDTO.getAmountPaid());
            registrationEntity.setBalanceAmount(registrationDTO.getBalanceAmount());
            registrationEntity.setTotalAmountPaid(registrationDTO.getAmountPaid());
            registrationEntity.setLockCount(-1);
            registrationEntity.setCreatedBy(adminName);
            gymRepository.saveRegistredDetails(registrationEntity);


            final String username = "fittnessgym6@gmail.com";
            final String userPassword = "dfxi ijpe mliy povj";

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true"); //TLS

            Session session = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, userPassword);
                        }
                    });
            try {
                String emailContent = String.format(
                        "Subject: Registration Confirmation\n\n" +
                                "Dear %s,\n\n" +
                                "Thank you for registering with us! Here are your registration details:\n\n" +
                                "Name: %s\n" +
                                "Email: %s\n" +
                                "Password: %s\n" +
                                "Phone Number: %s\n" +
                                "Gym Package: %s\n" +
                                "Trainer Name: %s\n" +
                                "Discount: %s%%\n" +
                                "Total Amount: %.2f\n" +
                                "Amount Paid: %.2f\n" +
                                "Balance Amount: %.2f\n" +
                                "Total Amount Paid: %.2f\n\n" +
                                "We recommend keeping your password secure and not sharing it with anyone.\n\n" +
                                "We’re excited to have you on board and look forward to helping you achieve your fitness goals. If you have any questions or need further assistance, please feel free to contact us.\n\n" +
                                "Best regards,\n" +
                                "Fittness Gym",
                        registrationEntity.getName(),
                        registrationEntity.getName(),
                        registrationEntity.getEmail(),
                        registrationEntity.getPassword(),
                        registrationEntity.getPhoneNumber(),
                        registrationEntity.getGympackage(),
                        registrationEntity.getTrainer(),
                        registrationEntity.getDiscount(),
                        registrationEntity.getAmount(),
                        registrationEntity.getAmountPaid(),
                        registrationEntity.getBalanceAmount(),
                        registrationEntity.getTotalAmountPaid()

                );


                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(registrationEntity.getEmail())
                );
                message.setSubject("Registration Confirmation");
                message.setText(emailContent);

                Transport.send(message);

                System.out.println("Registration email sent successfully!");

            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
        return valid;
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUsersDetails() {
        return gymRepository.getAllRegistredUsersDetails();
    }

    @Override
    public int upadteRegistredUsersDetails(int id, String gympackage, String trainer, double amountPaid, double balanceAmount, double totalAmount,String adminName) {

        int value=gymRepository.upadteRegistredUsersDetails(id,gympackage,trainer,amountPaid,balanceAmount,totalAmount);
        UpdatedRegistrationDetailsEntity details=new UpdatedRegistrationDetailsEntity();
        details.setId(id);
        details.setAmount_paid(amountPaid);
        details.setAmount_balance(balanceAmount);
        details.setUpdated_packagel(gympackage);
        details.setUpdated_trainer(trainer);
        details.setUpdated_by(adminName);

        gymRepository.saveUpadteRegistredUsersDetails(details);
        return value;

    }

    @Override
    public List<UpdatedEnquiryDetailsEntity> getAllViewDetails(int id) {

        List<UpdatedEnquiryDetailsEntity> list=gymRepository.getAllViewDetails(id);
        return list;
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo) {


        return gymRepository.getAllRegistredUsersDetailsByNameAndPhoneNo( searchName, searchPhoneNo);
    }

    @Override
    public List<UpdatedRegistrationDetailsEntity> getAllRegistredUsersUpdatedDetails(int id) {
        return gymRepository.getAllRegistredUsersUpdatedDetails(id);
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUserDetailsById(int id) {

        return gymRepository.getAllRegistredUserDetailsById(id);
    }

    @Override
    public Long getCountOfRegisteredUserEmail(String email) {
        return gymRepository.getCountOfRegisteredUserEmail(email);
    }

    @Override
    public int validteUserPasswordByEmail(String email, String password) {

        RegistrationEntity list=gymRepository.getAllByEmail(email);

        if(list!=null && password.equals(list.getPassword()) && list.getLockCount()==-1){
            System.out.println("set New Password");
            return 1;
        }

        else if (list!=null && password.equals(list.getPassword()) && list.getLockCount()>=0 &&list.getLockCount()<3 ) {
            int count=0;
            gymRepository.updateLockCount(email,count);
            return 2;
        } else if (list!=null && !password.equals(list.getPassword()) && (list.getLockCount()>=0 ||list.getLockCount()==-1 )) {

            gymRepository.updateLockCount(email,list.getLockCount()+1);
            System.out.println("incorrect password increase count by 1");

            if(list.getLockCount()==3){
                System.out.println("locked");
                LocalDateTime localDateTime = LocalDateTime.now();
                System.out.println(localDateTime);
                gymRepository.updateLockTime(email, localDateTime);
                return 4;
            }
            return 3;
        } else if (list!=null && password.equals(list.getPassword()) && list.getLockCount()>3) {
            LocalDateTime a = list.getLockTime();
            LocalDateTime b = a.plusMinutes(3);
            LocalDateTime time = LocalDateTime.now();
            if (time.isAfter(b)) {
                System.out.println("successfully signined");
                gymRepository.updateLockCount(email, 0);
                return 2;
            } else {
                System.out.println("try after 2 min");
                return 5;
            }

        }

        return 0;
    }

    @Override
    public int validateAndupdateNewPassword(int id,String password, String confirmpassword) {
        if(password.equals(confirmpassword)){

            return gymRepository.validateAndupdateNewPassword(id,password,confirmpassword);

        }

        return 0;
    }

    @Override
    public RegistrationEntity getAllRegistredUsersDetailsByEmail(String useremail) {

        return gymRepository.getAllByEmail(useremail);
    }

    @Override
    public RegistrationEntity getAllRegistredUsersDetailsById(int id) {


        return gymRepository.getAllRegistredUsersDetailsById(id);
    }

    @Override
    public int updateUserProfile(RegistrationDTO registrationDTO, String filePath,int id) {
        RegistrationEntity entity=new RegistrationEntity();
        entity.setName(registrationDTO.getName());
        entity.setEmail(registrationDTO.getEmail());
        entity.setPhoneNumber(registrationDTO.getPhoneNo());
        entity.setAge(registrationDTO.getAge());
        entity.setWeight(registrationDTO.getWeight());
        entity.setHeight(registrationDTO.getHeight());
        entity.setChestSize(registrationDTO.getChestSize());

        return gymRepository.updateUserProfile(entity,filePath,id);
    }

    @Override
    public Long getCountOfEmail(String email) {


        return gymRepository.getCountOfEmail(email);
    }

    @Override
    public long getCountOfRegEmail(String email) {
        return gymRepository.getCountOfRegEmail(email);
    }

    @Override
    public int saveTrainerDetails(TrainerDTO trainerDTO) {
        boolean valid=true;
        String name=trainerDTO.getTrainer();
        if(name!=null && name.length()>1 && name.length()<30){
            System.out.println("name is valid");
        }
        else {
            valid=false;
            System.out.println("name is in valid");
        }
        String phoneNo=String.valueOf(trainerDTO.getPhoneNo());
        if(phoneNo!=null && phoneNo.length()==10){
            System.out.println("phoneNo valid");
        }
        else {
            valid=false;
            System.out.println("phoneNo Invalid");
        }
        if(valid) {
            TrainerEntity trainerEntity = new TrainerEntity();
            trainerEntity.setTrainerName(trainerDTO.getTrainer());
            trainerEntity.setPhoneNo(trainerDTO.getPhoneNo());
            trainerEntity.setSlotTime(trainerDTO.getTrainerDropdown());
            System.out.println(trainerEntity);

            gymRepository.saveTrainerDetails(trainerEntity);
            return 1;
        }
        return 0;
    }

    @Override
    public void saveslots(String startTime, String endTime, String duration) {
        SlotsEntity entity =new SlotsEntity();
        entity.setStartTime(startTime);
        entity.setEndTime(endTime);
        entity.setDuration(duration);
        gymRepository.saveslots(entity);
    }

    @Override
    public List<SlotsEntity> getAllSlotsDetails() {

        return gymRepository.getAllSlotsDetails();
    }

    @Override
    public List<TrainerEntity> getAllTrainerDetails() {

        return gymRepository.getAllTrainerDetails();
    }

    @Override
    public int deleteSlotById(int idForDelete) {
        return gymRepository.deleteSlotById(idForDelete);
    }

    @Override
    public void assignUsersToTrainer(String trainerName, List<String> userNames,String slot) {
        for (String username : userNames) {
            UsersAssignedToTrainerEntity trainerUser = new UsersAssignedToTrainerEntity(trainerName, username,slot);
            gymRepository.saveAssignUsersToTrainer(trainerUser);
        }
    }

    @Override
    public int deleteTrainerSlot(int trainerId) {
        return gymRepository.deleteTrainerSlot(trainerId);
    }

    @Override
    public UsersAssignedToTrainerEntity getTrainerAndSlotByUserName(String name) {
        return  gymRepository.getTrainerAndSlotByUserName(name);
    }

    @Override
    public List<UsersAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName) {
        return  gymRepository.getUsersAssignedToTrainerByTrainerName(trainerName);
    }

    @Override
    public int deleteUserAssignedToTrainer(String trainerName) {
        return gymRepository.deleteUserAssignedToTrainer(trainerName);
    }

    @Override
    public void saveUserDietAndExercise(int id, String filePath, UserExerciseAndDietDTO userExerciseAndDietDTO) {
        UserExerciseAndDietEntity entity=new UserExerciseAndDietEntity();
        entity.setId(id);
        entity.setMonday(userExerciseAndDietDTO.getMonday());
        entity.setTuesday(userExerciseAndDietDTO.getTuesday());
        entity.setWednesday(userExerciseAndDietDTO.getWednesday());
        entity.setThursday(userExerciseAndDietDTO.getThursday());
        entity.setFriday(userExerciseAndDietDTO.getFriday());
        entity.setSaturday(userExerciseAndDietDTO.getSaturday());
        entity.setSunday(userExerciseAndDietDTO.getSunday());
        entity.setMonth(userExerciseAndDietDTO.getMonth());
        entity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        entity.setUsermonthlyImage(filePath);
        gymRepository.saveUserDietAndExercise(entity);
        UserUpdatedExerciseAndDietEntity userUpdatedExerciseAndDietEntity=new UserUpdatedExerciseAndDietEntity();
        userUpdatedExerciseAndDietEntity.setId(id);
        userUpdatedExerciseAndDietEntity.setMonday(userExerciseAndDietDTO.getMonday());
        userUpdatedExerciseAndDietEntity.setTuesday(userExerciseAndDietDTO.getTuesday());
        userUpdatedExerciseAndDietEntity.setWednesday(userExerciseAndDietDTO.getWednesday());
        userUpdatedExerciseAndDietEntity.setThursday(userExerciseAndDietDTO.getThursday());
        userUpdatedExerciseAndDietEntity.setFriday(userExerciseAndDietDTO.getFriday());
        userUpdatedExerciseAndDietEntity.setSaturday(userExerciseAndDietDTO.getSaturday());
        userUpdatedExerciseAndDietEntity.setSunday(userExerciseAndDietDTO.getSunday());
        userUpdatedExerciseAndDietEntity.setMonth(userExerciseAndDietDTO.getMonth());
        userUpdatedExerciseAndDietEntity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        userUpdatedExerciseAndDietEntity.setUsermonthlyImage(filePath);
        gymRepository.saveUserUpdatedDietAndExercise(userUpdatedExerciseAndDietEntity);
    }

    @Override
    public List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        return gymRepository.getAlluserExerciseAndDietEntitiesById(id);
    }

    @Override
    public List<UserExerciseAndDietEntity> getuserMonthlyImages(int id) {
        return gymRepository.getuserMonthlyImages(id);
    }

}