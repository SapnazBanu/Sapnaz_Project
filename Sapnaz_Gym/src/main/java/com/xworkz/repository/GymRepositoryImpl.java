package com.xworkz.repository;

import com.xworkz.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Repository
public class GymRepositoryImpl implements GymRepository {

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public GymRepositoryImpl() {
        System.out.println("created GymRepositoryImpl");
    }


    @Override
    public AdminEntity getData(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getAllbyEmail");
            query.setParameter("email", email);
            return (AdminEntity) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean save(EnquiryEntity enquiryEntity) {
        if (enquiryEntity == null) {
            throw new IllegalArgumentException("EnquiryEntity cannot be null");
        }

        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(enquiryEntity);
            transaction.commit();
            return true;
        } catch (Exception pe) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            pe.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }


    @Override
    public boolean saveRegistration(RegistrationEntity registrationEntity) {
        if (registrationEntity == null) {
            throw new IllegalArgumentException("RegistrationEntity cannot be null");
        }
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.persist(registrationEntity);
            transaction.commit();
            return true;
        } catch (Exception pe) {
            transaction.rollback();
            pe.getMessage();

        } finally {
            entityManager.close();

        }
        return false;

    }


    @Override
    public EnquiryEntity getEnquireEntity(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getValue");
            query.setParameter("email", email);
            return (EnquiryEntity) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public Long getCountOfPhone(String phone) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery("getCountOfPhone");
        query.setParameter("setPh", phone);
        Long count = (Long) query.getSingleResult();
        entityManager.close();
        return count;
    }


    @Override
    public Long getCountOfEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery("getCountOfEmail");
        query.setParameter("setEmail", email);
        Long count = (Long) query.getSingleResult();
        entityManager.close();
        return count;
    }

    @Override
    public List<EnquiryEntity> getAllEnquiries() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getAllEnquiries");
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public RegistrationEntity getAllEnquiriesRegistration(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getAllEnquiriesRegistration");
            query.setParameter("email", email);
            return (RegistrationEntity) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean updateDetailsByenquiryId(EnquiryEntity enquiryEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            Query query = entityManager.createNamedQuery("updateDetailsByenquiryId");
            query.setParameter("enquiry_id", enquiryEntity.getEnquiry_id());
            query.setParameter("status", enquiryEntity.getStatus());
            query.setParameter("description", enquiryEntity.getDescription());
            int updatedRows = query.executeUpdate();

            int lastViewDetailsId = getLastViewDetailsId(enquiryEntity.getEnquiry_id());
            int nextViewDetailsId = lastViewDetailsId + 1;

            System.out.println(nextViewDetailsId);
            ViewDetailsEntity viewDetails = new ViewDetailsEntity();
            viewDetails.setViewdetails_id(nextViewDetailsId);
            viewDetails.setEnquiryId(enquiryEntity.getEnquiry_id());
            viewDetails.setStatus(enquiryEntity.getStatus());
            viewDetails.setDescription(enquiryEntity.getDescription());
            viewDetails.setUpdatedDateAndTime(LocalDateTime.now());

            entityManager.merge(viewDetails);

            transaction.commit();
            return updatedRows > 0;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public int getLastViewDetailsId(int enquiryId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createQuery("SELECT MAX(v.viewdetails_id) FROM ViewDetailsEntity v WHERE v.enquiryId = :enquiryId");
            query.setParameter("enquiryId", enquiryId);
            Integer lastId = (Integer) query.getSingleResult();
            return lastId != null ? lastId : enquiryId * 10+1;
        } catch (Exception e) {
            e.printStackTrace();
            return enquiryId * 10;
        } finally {
            entityManager.close();
        }
    }


    @Override
    public boolean updateDetailsByregId(RegistrationEntity registrationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("updateDetailsByRegId");
            query.setParameter("reg_id",registrationEntity.getReg_id());
            query.setParameter("package", registrationEntity.getPackages());
            query.setParameter("trainer", registrationEntity.getTrainer());
            query.setParameter("amount", registrationEntity.getAmount());
            query.setParameter("paidAmount", registrationEntity.getPaidAmount());
            query.setParameter("balance", registrationEntity.getBalance());

            int updatedRows = query.executeUpdate();

            RegUpdateEntity regUpdate = new RegUpdateEntity();
            regUpdate.setReg_id(registrationEntity.getReg_id());
            regUpdate.setName(registrationEntity.getName());
            regUpdate.setPaidAmount(registrationEntity.getPaidAmount());
            regUpdate.setBalance(registrationEntity.getBalance());
            regUpdate.setUpdatedDateAndTime(LocalDateTime.now());

            entityManager.merge(regUpdate);


            transaction.commit();
            return updatedRows > 0;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<ViewDetailsEntity> findEnquiryById(int enquiryId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getViewDetailsById");
            query.setParameter("enquiryId", enquiryId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<RegUpdateEntity> getPaymentDetailsById(int reg_id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getPaymentDetailsById");
            query.setParameter("reg_id", reg_id);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean updateUserPassword(RegistrationEntity registrationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("updateUserPasswordByEmail");
            query.setParameter("email", registrationEntity.getEmail());
            query.setParameter("password", registrationEntity.getPassword());
            query.setParameter("userLoginCount",registrationEntity.getUserLoginCount());

            int updatedRows = query.executeUpdate();
            transaction.commit();
            return updatedRows > 0;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }


    @Override
    public boolean updateUserProfile(RegistrationEntity registrationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("updateUserProfileById");
            query.setParameter("reg_id", registrationEntity.getReg_id());
            query.setParameter("name", registrationEntity.getName());
            query.setParameter("email", registrationEntity.getEmail());
            query.setParameter("ph",registrationEntity.getPh());
            query.setParameter("age",registrationEntity.getAge());
            query.setParameter("weight",registrationEntity.getWeight());
            query.setParameter("height",registrationEntity.getHeight());
            query.setParameter("plan",registrationEntity.getPlan());

            int updatedRows = query.executeUpdate();
            transaction.commit();
            return updatedRows > 0;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }



}
