package com.xworkz.service;

import com.xworkz.dto.AdminDTO;
import com.xworkz.dto.EnquiryDTO;
import com.xworkz.dto.RegistrationDTO;
import com.xworkz.entity.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface GymService {

    boolean validateAdmin(AdminDTO adminDTO) throws NoSuchAlgorithmException;
    boolean validateAndSaveForEnquiry(EnquiryDTO enquiryDTO);
    Long getCountofPhone(String phone);
    Long getCountofEmail(String email);
    boolean validateAndSaveForRegistration(RegistrationDTO registrationDTO);
    String generatePassword();
    boolean saveEmail(String email, String password);
    List<EnquiryEntity> getAllEnquiries();
    EnquiryEntity updateEnquiry(int enquiryId, String status, String description);
    boolean updateRegistration(int reg_id,String name,String packages, String trainer, String amount ,String paidAmount , String balance);
    RegistrationEntity getAllEnquiriesRegistration(String email);
    List<ViewDetailsEntity> getEnquiryById(int enquiryId);

    List<RegUpdateEntity> getPaymentDetailsById(int reg_id);

    boolean validateUserLogin(String email, String password);

    boolean updateUserPassword(String email, String newPassword);

    boolean updateUserProfile(int reg_id, String name, String email, String ph , String age , String weight , String height , String plan);
}
