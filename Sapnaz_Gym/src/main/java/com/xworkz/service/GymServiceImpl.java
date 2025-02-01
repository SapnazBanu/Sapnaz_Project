package com.xworkz.service;

import com.xworkz.constants.StatusEnum;
import com.xworkz.dto.AdminDTO;
import com.xworkz.dto.EnquiryDTO;
import com.xworkz.dto.RegistrationDTO;
import com.xworkz.entity.*;
import com.xworkz.repository.GymRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import static java.lang.System.out;

@Service
public class GymServiceImpl implements GymService {

    public GymServiceImpl() {
        out.println("created GymServiceImpl");
    }

    @Autowired
    GymRepositoryImpl gymRepository;

    EnquiryEntity enquiryEntity = new EnquiryEntity();
    RegistrationEntity registrationEntity = new RegistrationEntity();
    BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public boolean validateAdmin(AdminDTO adminDTO) throws NoSuchAlgorithmException {
        AdminEntity adminEntity = gymRepository.getData(adminDTO.getEmail());
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");//Creates a hashing instance.
        byte[] hashedBytes = messageDigest.digest(adminDTO.getPassword().getBytes());//Converts the password into hashed bytes.
        String encodedHash = Base64.getEncoder().encodeToString(hashedBytes);// Converts the hashed bytes into a string for comparison.
        if (adminEntity != null && encodedHash.equals(adminEntity.getPassword())) {
            return true;
        }
        return false;
    }


    @Override
    public boolean validateAndSaveForEnquiry(EnquiryDTO enquiryDTO) {

        if (enquiryDTO != null) {

            enquiryEntity.setName(enquiryDTO.getName());
            enquiryEntity.setArea(enquiryDTO.getArea());
            enquiryEntity.setPh(enquiryDTO.getPh());
            enquiryEntity.setDistance(enquiryDTO.getDistance());
            enquiryEntity.setAge(enquiryDTO.getAge());
            enquiryEntity.setStatus(String.valueOf(StatusEnum.Enquired));
            enquiryEntity.setDescription("This Client's Enquiry has been successfully completed");
            gymRepository.save(enquiryEntity);
                        return true;
        } else {
            return false;
        }

    }

    @Override
    public Long getCountofPhone(String phone) {
        return gymRepository.getCountOfPhone(phone);
    }


    @Override
    public Long getCountofEmail(String email) {
        return gymRepository.getCountOfEmail(email);
    }

    @Override
    public boolean validateAndSaveForRegistration(RegistrationDTO registrationDTO) {

        if (registrationDTO != null) {
            String password = generatePassword();

            registrationEntity.setName(registrationDTO.getName());
            registrationEntity.setEmail(registrationDTO.getEmail());
            registrationEntity.setPh(registrationDTO.getPh());
            registrationEntity.setPassword(bCryptPasswordEncoder.encode(password));
            registrationEntity.setPackages(registrationDTO.getPackages());
            registrationEntity.setTrainer(registrationDTO.getTrainer());
            registrationEntity.setGymName(registrationDTO.getGymName());
            registrationEntity.setAmount(registrationDTO.getAmount());
            registrationEntity.setDiscount(registrationDTO.getDiscount());
            registrationEntity.setBalance(registrationDTO.getBalance());
            registrationEntity.setInstallment(registrationDTO.getInstallment());
            registrationEntity.setPaidAmount(registrationDTO.getPaidAmount());
            registrationEntity.setUserLoginCount(-1);
            out.println(password);

            boolean saved = gymRepository.saveRegistration(registrationEntity);
            if (saved) {
                return saveEmail(registrationDTO.getEmail(), password);
            }
        }


        return false;
    }

    @Override
    public String generatePassword() {
        int passwordLength = 8;
        String characterPool = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < passwordLength; i++) {
            int index = random.nextInt(characterPool.length());
            password.append(characterPool.charAt(index));
        }
        return password.toString();
    }


    @Override
    public boolean saveEmail(String email, String password) {

        final String username = "sapnazbanu@gmail.com";
        final String userPassword = "btlw qavi xork qwqd";


        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.debug", "true");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, userPassword);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Your password");
            message.setText("your password" + password);
            Transport.send(message);
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return true;
    }


    @Override
    public List<EnquiryEntity> getAllEnquiries() {
        List<EnquiryEntity> enquiries = gymRepository.getAllEnquiries();
        return enquiries;
    }

    @Override
    public EnquiryEntity updateEnquiry(int enquiryId, String status, String description) {
        enquiryEntity.setEnquiry_id(enquiryId);
        enquiryEntity.setStatus(status);
        enquiryEntity.setDescription(description);

        boolean updated = gymRepository.updateDetailsByenquiryId(enquiryEntity);
        if (updated) {
            System.out.println("Enquiry updated and ViewDetails inserted.");
        } else {
            System.out.println("Failed to update Enquiry or insert ViewDetails.");
        }

        return null;
    }


    @Override
    public boolean updateRegistration(int reg_id,String name, String packages, String trainer, String amount, String paidAmount, String balance) {

        if (reg_id!=0) {
            registrationEntity.setReg_id(reg_id);
            registrationEntity.setName(name);
            registrationEntity.setPackages(packages);
            registrationEntity.setTrainer(trainer);
            registrationEntity.setAmount(amount);
            registrationEntity.setPaidAmount(paidAmount);
            registrationEntity.setBalance(balance);
            gymRepository.updateDetailsByregId(registrationEntity);
            return true;
        }
        return false;
    }

    @Override
    public RegistrationEntity getAllEnquiriesRegistration(String email){

        if (email!=null){
            return gymRepository.getAllEnquiriesRegistration(email);
        }
        return null;
    }

    @Override
    public List<ViewDetailsEntity> getEnquiryById(int enquiryId) {
        if (enquiryId!=0){
            return gymRepository.findEnquiryById(enquiryId);
        }
        return null;
    }

    @Override
    public List<RegUpdateEntity> getPaymentDetailsById(int reg_id){
        if (reg_id!=0){
            return gymRepository.getPaymentDetailsById(reg_id);
        }
        return null;
    }

    @Override
    public boolean validateUserLogin(String email, String password){
        RegistrationEntity registrationEntity1 = gymRepository.getAllEnquiriesRegistration(email);

        if (registrationEntity1 == null) {
            System.out.println("User not found for email: " + email);
            return false; // Handle the null case safely
        }

        if (bCryptPasswordEncoder.matches(password, registrationEntity1.getPassword())) {
            return true;
        }

        return false;
    }


    @Override
    public boolean updateUserPassword(String email, String newPassword){

        if (email!=null) {
            registrationEntity.setEmail(email);
            registrationEntity.setPassword(bCryptPasswordEncoder.encode(newPassword));
            registrationEntity.setUserLoginCount(0);
            gymRepository.updateUserPassword(registrationEntity);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateUserProfile(int reg_id , String name , String email , String ph , String age , String weight , String height , String plan) {

        if (reg_id!=0){
            registrationEntity.setReg_id(reg_id);
            registrationEntity.setName(name);
            registrationEntity.setEmail(email);
            registrationEntity.setPh(ph);
            registrationEntity.setAge(age);
            registrationEntity.setWeight(weight);
            registrationEntity.setHeight(height);
            registrationEntity.setPlan(plan);
            gymRepository.updateUserProfile(registrationEntity);
            return true;
        }
        return false;
    }
}

