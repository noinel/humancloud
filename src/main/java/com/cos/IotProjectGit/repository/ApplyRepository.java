package com.cos.IotProjectGit.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.IotProjectGit.model.Apply;

public interface ApplyRepository extends JpaRepository<Apply, Integer>{
	
	public List<Apply> findBytoUserId(int toUser);

}
