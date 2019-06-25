package com.cos.IotProjectGit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.IotProjectGit.model.Notice;
import com.cos.IotProjectGit.model.Skill;

public interface NoticeRepository extends JpaRepository<Notice, Integer>{

}
