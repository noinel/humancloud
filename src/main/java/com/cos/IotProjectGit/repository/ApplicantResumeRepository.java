package com.cos.IotProjectGit.repository;

import java.util.List;
import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.IotProjectGit.model.ApplicantResume;
import com.cos.IotProjectGit.model.CompanyResume;

public interface ApplicantResumeRepository extends JpaRepository<ApplicantResume, Integer>{
	
	@Query(value ="select * from applicantresume order by id desc",nativeQuery = true)
	public List<ApplicantResume> findByApplicanDesc();
	
	public List<ApplicantResume> findByUserId(int userId);
	
	public Optional<ApplicantResume> findById(int id);
	
//	public Optional<List<ApplicantResume>> findByAll();
//	
	@Query(value ="select * from applicantresume where age > ?1",nativeQuery = true)
	public Optional<List<ApplicantResume>> findByage(String age );
	
	@Query(value = "select * from applicantresume where wishaddress like %?1%",nativeQuery = true)
	public List<ApplicantResume> findBywishaddress(String wishaddress);
	
	@Query(value = "select * from applicantresume where job = ?1",nativeQuery =true)
	public List<ApplicantResume> findByjob(String job);

}