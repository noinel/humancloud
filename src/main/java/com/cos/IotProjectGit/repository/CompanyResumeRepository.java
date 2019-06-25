package com.cos.IotProjectGit.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.IotProjectGit.model.CompanyResume;

public interface CompanyResumeRepository extends JpaRepository<CompanyResume, Integer>{

	@Query(value ="select * from companyresume order by id desc",nativeQuery = true)
	public List<CompanyResume> findByCompanyDesc();
	
	public List<CompanyResume> findByUserId(int userId);
	
	@Query(value ="select * from companyresume where age > ?1",nativeQuery = true)
	public Optional<List<CompanyResume>> findByage(String age );
	
	@Query(value = "select * from companyresume where wishaddress like %?1%",nativeQuery = true)
	public List<CompanyResume> findBywishaddress(String wishaddress);
	
	@Query(value = "select * from companyresume where job = ?1",nativeQuery =true)
	public List<CompanyResume> findByjob(String job);
	
	public List<CompanyResume> findByJob(String job);
}
