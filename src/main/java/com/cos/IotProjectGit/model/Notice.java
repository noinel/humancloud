package com.cos.IotProjectGit.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
public class Notice {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //기본키설정
	private int id;
	
	private String title;
	private String content;
	
	@CreationTimestamp
	private LocalDate createDate;
	@CreationTimestamp
	private LocalDate updateDate;
}
