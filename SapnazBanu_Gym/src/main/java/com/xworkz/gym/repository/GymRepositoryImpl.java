package com.xworkz.gym.repository;

import com.xworkz.gym.dto.AdminLoginDTO;
import com.xworkz.gym.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import java.time.LocalDateTime;
import java.util.List;
@Repository
public class GymRepositoryImpl implements GymRepository{

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    @Override
    public AdminEntity validateUser(AdminLoginDTO adminLoginDTO) {

        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        AdminEntity adminEntity=null;
        try {
            et.begin();
            List<AdminEntity> list=em.createNamedQuery("getAllByEmail", AdminEntity.class).setParameter("getEmail",adminLoginDTO.getEmail()).getResultList();

            if(!list.isEmpty()){
                adminEntity=list.get(0);
            }

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return adminEntity;
    }

    @Override
    public long getCountOfAdminUserName(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object=em.createNamedQuery("getCountOfAdminUserNameByEmail").setParameter("getEmail",email).getSingleResult();
        System.out.println(object);
        Long count =(Long)object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }


    @Override
    public void updateAdminPasswordAndCount(AdminEntity adminEntity) {

        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(adminEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }



    @Override
    public void saveCustomerEnquiryDetails(EnquiryEntity enquiryEntity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(enquiryEntity);
            System.out.println("from repo  "+enquiryEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }



    @Override
    public List<EnquiryEntity> getAllEnquiryUsersDetails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<EnquiryEntity> list= em.createNamedQuery("getAllUserDetails",EnquiryEntity.class).getResultList();


        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }


    @Override
    public int updateUserEnquiryDetails(int enquiryId, String status, String reason, String adminName, LocalDateTime date) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value=0;
        try {
            et.begin();
            value=em.createNamedQuery("updateUserEnquiryDetailsById").setParameter("getStatus",status).setParameter("getReason",reason).setParameter("getUpdatedName",adminName).setParameter("getUpdatedDate",date).setParameter("getId",enquiryId).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;
    }

    @Override
    public List<EnquiryEntity> getAllUserDetailsByStatus(String status) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<EnquiryEntity> list= em.createNamedQuery("getAllUserDetailsByStatus",EnquiryEntity.class).setParameter("getStatus",status).getResultList();


        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public void saveRegistredDetails(RegistrationEntity registrationEntity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(registrationEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUsersDetails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<RegistrationEntity> list= em.createNamedQuery("getAllRegistredUsersDetails",RegistrationEntity.class).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public int upadteRegistredUsersDetails(int id, String gympackage, String trainer, double amountPaid, double balanceAmount,double totalAmount) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int updatedValue=0;
        try {
            et.begin();
            updatedValue=em.createNamedQuery("updateRegistredUserDetails").setParameter("getPackage",gympackage).setParameter("getTrainer",trainer).setParameter("getAmountPaid",amountPaid).setParameter("getBalanceAmount",balanceAmount).setParameter("getAmount",totalAmount).setParameter("getId",id).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return updatedValue;
    }

    @Override
    public void saveUserUpdatedEnquiryDetails(UpdatedEnquiryDetailsEntity entity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public void saveUpadteRegistredUsersDetails(UpdatedRegistrationDetailsEntity details) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(details);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<UpdatedEnquiryDetailsEntity> getAllViewDetails(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<UpdatedEnquiryDetailsEntity> list = em.createNamedQuery("getAllViewDetailsById", UpdatedEnquiryDetailsEntity.class).setParameter("getId",id).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list ;
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegistrationEntity> list=em.createNamedQuery("getAllRegistredUsersDetailsByNameAndPhoneNo").setParameter("getName",searchName).setParameter("getPhoneNo",searchPhoneNo).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return list;
    }

    @Override
    public List<UpdatedRegistrationDetailsEntity> getAllRegistredUsersUpdatedDetails(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<UpdatedRegistrationDetailsEntity> list=em.createNamedQuery("getAllRegUpdatedDetailsById",UpdatedRegistrationDetailsEntity.class).setParameter("getId",id).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list ;
    }

    @Override
    public List<RegistrationEntity> getAllRegistredUserDetailsById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegistrationEntity> list=em.createNamedQuery("getAllRegDetailsById",RegistrationEntity.class).setParameter("getId",id).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        System.out.println(list);
        return list;
    }

    @Override
    public Long getCountOfRegisteredUserEmail(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();


        Object object=em.createNamedQuery("getCountOfRegistredUserEmail").setParameter("getEmail",email).getSingleResult();
        Long count =(Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;

    }

    @Override
    public RegistrationEntity getAllByEmail(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegistrationEntity registrationEntity=null;
        List<RegistrationEntity> list=em.createNamedQuery("getAllByuserEmail").setParameter("getEmail",email).getResultList();

        if (!list.isEmpty()){
            registrationEntity=list.get(0);
        }
        System.out.println(registrationEntity);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return registrationEntity ;
    }

    @Override
    public void updateLockCount(String email,int count) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            int value= em.createNamedQuery("updateLockCount").setParameter("getEmail",email).setParameter("getCount",count).executeUpdate();
            System.out.println("updateLockCount "+value);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }


    }

    @Override
    public void updateLockTime(String email, LocalDateTime localDateTime) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            int value= em.createNamedQuery("updateLockTime").setParameter("getEmail",email).setParameter("getLockTime",localDateTime).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }


    }


    @Override
    public int validateAndupdateNewPassword(int id, String password, String confirmpassword) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value=0;
        try {
            et.begin();
            value=em.createNamedQuery("updateUserNewPassword").setParameter("getPassword",password).setParameter("getLockCount",0).setParameter("getId",id).executeUpdate();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return value;
    }

    @Override
    public RegistrationEntity getAllRegistredUsersDetailsById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegistrationEntity registrationEntity=null;
        try {
            et.begin();
            List<RegistrationEntity> list =em.createNamedQuery("getAllRegistredUsersDetailsById").setParameter("getId",id).getResultList();
            if(!list.isEmpty()){
                registrationEntity=list.get(0);
            }
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return registrationEntity;
    }

    @Override
    public int updateUserProfile(RegistrationEntity entity, String filePath,int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value=0;
        try {
            et.begin();
            value=em.createNamedQuery("updateUserProfile").setParameter("getprofileImage",filePath).setParameter("getName",entity.getName()).setParameter("getEmail",entity.getEmail()).setParameter("getPhoneNo",entity.getPhoneNumber()).setParameter("getAge",entity.getAge()).setParameter("getWeight",entity.getWeight()).setParameter("getHeight",entity.getHeight()).setParameter("getChestSize",entity.getChestSize()).setParameter("getId",id).executeUpdate();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;
    }

    @Override
    public Long getCountOfEmail(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object=em.createNamedQuery("getCountOfEnquiryEmail").setParameter("getEmail",email).getSingleResult();
        Long aLong=(Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return aLong;
    }

    @Override
    public long getCountOfRegEmail(String email) {

        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object=em.createNamedQuery("getCountOfRegistredUserEmail").setParameter("getEmail",email).getSingleResult();
        Long aLong=(Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return aLong;
    }

    @Override
    public void saveTrainerDetails(TrainerEntity trainerEntity) {

        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(trainerEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

    }

    @Override
    public void saveslots(SlotsEntity entity) {

        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<SlotsEntity> getAllSlotsDetails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<SlotsEntity> slotsEntityList=em.createNamedQuery("getAllSlotsDetails", SlotsEntity.class).getResultList();
        System.out.println(slotsEntityList);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return slotsEntityList;
    }

    @Override
    public List<TrainerEntity> getAllTrainerDetails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<TrainerEntity> trainerEntities=em.createNamedQuery("getAllTrainerDetails", TrainerEntity.class).getResultList();
        System.out.println(trainerEntities);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return trainerEntities;
    }

    @Override
    public int deleteSlotById(int idForDelete) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteSlotById").setParameter("getId",idForDelete).executeUpdate();
            System.out.println(val);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public void saveAssignUsersToTrainer(UsersAssignedToTrainerEntity trainerUser) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(trainerUser);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public int deleteTrainerSlot(int trainerId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteTrainerSlotById").setParameter("getId",trainerId).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public UsersAssignedToTrainerEntity getTrainerAndSlotByUserName(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        UsersAssignedToTrainerEntity entity= null;

        try {
            et.begin();
            List<UsersAssignedToTrainerEntity> trainerEntities=em.createNamedQuery("getTrainerAndSlotByUserName",UsersAssignedToTrainerEntity.class).setParameter("getUserName",name).getResultList();
            if(!trainerEntities.isEmpty()){
                entity=trainerEntities.get(0);
            }
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return entity;
    }

    @Override
    public List<UsersAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<UsersAssignedToTrainerEntity> trainerEntities=em.createNamedQuery("getUsersAssignedToTrainerByTrainerName",UsersAssignedToTrainerEntity.class).setParameter("getTrainerName",trainerName).getResultList();
        System.out.println(trainerEntities);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        return trainerEntities;
    }

    @Override
    public int deleteUserAssignedToTrainer(String trainerName) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteUserAssignedToTrainer").setParameter("getTrainerName",trainerName).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public void saveUserDietAndExercise(UserExerciseAndDietEntity entity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
    }



    @Override
    public void saveUserUpdatedDietAndExercise(UserUpdatedExerciseAndDietEntity entity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
    }


    @Override
    public List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserUpdatedExerciseAndDietEntity> list= em.createNamedQuery("getAlluserExerciseAndDietEntitiesById",UserUpdatedExerciseAndDietEntity.class).setParameter("getId",id).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }


    @Override
    public List<UserExerciseAndDietEntity> getuserMonthlyImages(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserExerciseAndDietEntity> list= em.createNamedQuery("getuserMonthlyImages",UserExerciseAndDietEntity.class).setParameter("getId",id).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }

}
