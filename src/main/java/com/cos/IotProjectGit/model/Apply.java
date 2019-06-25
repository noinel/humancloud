package com.cos.IotProjectGit.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.cos.IotProjectGit.model.ApplicantResume.ApplicantResumeBuilder;
import com.cos.IotProjectGit.model.code.Education;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Apply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="fromUser")
	private User fromUser;
	
	@ManyToOne
	@JoinColumn(name="toUser")
	private User toUser;
	
	@CreationTimestamp
	private LocalDate createDate;
	@CreationTimestamp
	private LocalDate updateDate;

}
