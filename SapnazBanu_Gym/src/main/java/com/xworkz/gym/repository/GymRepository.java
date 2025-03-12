package com.xworkz.gym.repository;

import com.xworkz.gym.dto.AdminLoginDTO;
import com.xworkz.gym.entity.*;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface GymRepository {
    AdminEntity validateUser(AdminLoginDTO adminLoginDTO);

    void saveCustomerEnquiryDetails(EnquiryEntity enquiryEntity);

    void updateAdminPasswordAndCount(AdminEntity adminEntity);

    List<EnquiryEntity> getAllEnquiryUsersDetails();

    long getCountOfAdminUserName(String email);

    int updateUserEnquiryDetails(int enquiryId, String status, String reason, String adminName, LocalDateTime date);

    List<EnquiryEntity> getAllUserDetailsByStatus(String status);

    void saveRegistredDetails(RegistrationEntity registrationEntity);

    List<RegistrationEntity> getAllRegistredUsersDetails();

    int upadteRegistredUsersDetails(int id, String gympackage, String trainer, double amountPaid, double balanceAmount,double totalAmount);

    void saveUserUpdatedEnquiryDetails(UpdatedEnquiryDetailsEntity updatedEnquiryDetails);

    void saveUpadteRegistredUsersDetails(UpdatedRegistrationDetailsEntity details);

    List<UpdatedEnquiryDetailsEntity> getAllViewDetails(int id);

    List<RegistrationEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo);

    List<UpdatedRegistrationDetailsEntity> getAllRegistredUsersUpdatedDetails(int id);

    List<RegistrationEntity> getAllRegistredUserDetailsById(int id);

    Long getCountOfRegisteredUserEmail(String email);

    RegistrationEntity getAllByEmail(String email);

    void updateLockCount(String email,int count);

    void updateLockTime(String email, LocalDateTime localDateTime);


    int validateAndupdateNewPassword(int id, String password, String confirmpassword);

    RegistrationEntity getAllRegistredUsersDetailsById(int id);

    int updateUserProfile(RegistrationEntity entity, String filePath,int id);

    Long getCountOfEmail(String email);

    long getCountOfRegEmail(String email);

    void saveTrainerDetails(TrainerEntity trainerEntity);

    void saveslots(SlotsEntity entity);

    List<SlotsEntity> getAllSlotsDetails();

    List<TrainerEntity> getAllTrainerDetails();

    int deleteSlotById(int idForDelete);

    void saveAssignUsersToTrainer(UsersAssignedToTrainerEntity trainerUser);

    int deleteTrainerSlot(int trainerId);

    UsersAssignedToTrainerEntity getTrainerAndSlotByUserName(String name);

    List<UsersAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName);

    int deleteUserAssignedToTrainer(String trainerName);

    void saveUserDietAndExercise(UserExerciseAndDietEntity entity);

    List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id);

    void saveUserUpdatedDietAndExercise(UserUpdatedExerciseAndDietEntity entity);

    List<UserExerciseAndDietEntity> getuserMonthlyImages(int id);
}