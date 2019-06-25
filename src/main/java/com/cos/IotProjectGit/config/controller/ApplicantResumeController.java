package com.cos.IotProjectGit.config.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.management.loading.MLet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.IotProjectGit.model.ApplicantResume;
import com.cos.IotProjectGit.model.CompanyResume;
import com.cos.IotProjectGit.model.User;
import com.cos.IotProjectGit.model.code.Education;
import com.cos.IotProjectGit.repository.ApplicantResumeRepository;
import com.cos.IotProjectGit.repository.CompanyResumeRepository;
import com.cos.IotProjectGit.repository.UserRepository;
import com.cos.IotProjectGit.service.ResumeService;
import com.cos.IotProjectGit.service.UserCustomService;
import com.cos.IotProjectGit.service.UserCustomerDetail;
import com.cos.IotProjectGit.util.UserUtil;

@Controller
public class ApplicantResumeController {
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserCustomService userCustomService;
	
	@Autowired
	private ApplicantResumeRepository applicantResumeRepository;
	
	@Autowired
	private CompanyResumeRepository companyResumeRepository;
	
	@Autowired
	private ResumeService applicantResumeService;
	
	@PostMapping("/api/applicant/age")
	public @ResponseBody Optional<List<ApplicantResume>> apiage(String age, @AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<List<ApplicantResume>> applicantResume = applicantResumeRepository.findByage(age);
		System.out.println("applicantResume");
		return applicantResume;
		
	}
	

	
	@PostMapping("/search/applicant/wishaddress")
	public String Searchwishaddress(String city,String gu, @AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO = userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		String wishaddress = gu;
		System.out.println(gu);
		List<ApplicantResume> applicantResumeo = applicantResumeRepository.findBywishaddress(wishaddress);
		
		
		
		model.addAttribute("applicantResumeO", applicantResumeo);
		model.addAttribute("user", user);
		
		return "resumesearch";
	}
	
	
	
	@PostMapping("/search/applicant/job")
	public String SearchJob(String job,@AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO = userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		List<ApplicantResume> applicantResumeO = applicantResumeRepository.findByjob(job);
		
		model.addAttribute("applicantResumeO", applicantResumeO);
		model.addAttribute("user", user);
		return "resumesearch";
	}
	
	@PostMapping("/search/applicant/age")
	public String Searchage(String age, @AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO = userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		Optional<List<ApplicantResume>> applicantResumeO = applicantResumeRepository.findByage(age);
		Optional<List<CompanyResume>> companyResumeO = companyResumeRepository.findByage(age);
		model.addAttribute("applicantResumeO", applicantResumeO.get());
		model.addAttribute("companyResumeO", companyResumeO.get());
		model.addAttribute("user", user);
		System.out.println(age);
		System.out.println(applicantResumeO);
		return "resumesearch";
	}
	
	@GetMapping("applicant/same/job")
	public @ResponseBody ApplicantResume SameJob(@AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO= userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		//Optional<List<CompanyResume>> companyResumeO = companyResumeRepository.findByjob(job);
		//Optional<List<ApplicantResume>> applicantResumeO = applicantResumeRepository.findByjob(job);
		
		//model.addAttribute("applicantResume", applicantResumeO.get());
		//model.addAttribute("companyResumeO", companyResumeO.get());
		//model.addAttribute("user", user);
		
		
		return null;
	}

}
