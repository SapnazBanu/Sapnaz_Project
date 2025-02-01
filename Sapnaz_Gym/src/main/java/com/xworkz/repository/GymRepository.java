package com.xworkz.repository;

import com.xworkz.entity.*;

import java.util.List;

public interface GymRepository {

    AdminEntity getData(String email);
    boolean save(EnquiryEntity enquiryEntity);
    EnquiryEntity getEnquireEntity(String email);
    Long getCountOfPhone(String phone);
    boolean saveRegistration(RegistrationEntity registrationEntity);
    Long getCountOfEmail(String email);
    List<EnquiryEntity> getAllEnquiries();
    boolean updateDetailsByenquiryId(EnquiryEntity enquiryEntity);
    boolean updateDetailsByregId(RegistrationEntity registrationEntity);
    RegistrationEntity getAllEnquiriesRegistration(String email);
    int getLastViewDetailsId(int enquiryId);
    List<ViewDetailsEntity> findEnquiryById(int enquiryId);

    List<RegUpdateEntity> getPaymentDetailsById(int reg_id);

    boolean updateUserPassword(RegistrationEntity registrationEntity);

    boolean updateUserProfile(RegistrationEntity registrationEntity);
}
