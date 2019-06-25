package com.cos.IotProjectGit.config.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cos.IotProjectGit.model.CompanyResume;
import com.cos.IotProjectGit.model.User;
import com.cos.IotProjectGit.model.code.Education;
import com.cos.IotProjectGit.repository.CompanyResumeRepository;
import com.cos.IotProjectGit.repository.UserRepository;
import com.cos.IotProjectGit.service.CompanyResumeService;
import com.cos.IotProjectGit.service.UserCustomService;
import com.cos.IotProjectGit.service.UserCustomerDetail;
import com.cos.IotProjectGit.util.UserUtil;

@Controller
public class CompanyResumeController {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserCustomService userCustomService;
	
	@Autowired
	private CompanyResumeRepository companyResumeRepository;
	
	@Autowired
	private CompanyResumeService companyResumeService;
	
	@GetMapping("/resume/company/list")
	public String findAll(Model model) {
		model.addAttribute("companyresumes", companyResumeService.findAll());// 현재는 자바객체
		return "companyResume";
	}
	
	@PostMapping("/companyresume/create")
	public String resumeCreate(@AuthenticationPrincipal UserCustomerDetail userDetail,
			@RequestParam("file") MultipartFile file, String title, Education education , String wishAddress, 
			String job,int age, int salary, String experience, String gugun
		) throws IOException {
		UUID uuid = UUID.randomUUID();
		String uuidFileName = uuid + "_"+file.getOriginalFilename();
		Path filePath = Paths.get(UserUtil.getResouecePath() + uuidFileName);
		
		System.out.println(file.getBytes());
		Files.write(filePath,file.getBytes());
						
		User user = userDetail.getUser();
		
		System.out.println(education);
		
		CompanyResume companyResume = CompanyResume.builder().
				title(title).
				user(user).
				job(job).
				age(age).
				salary(salary).
				education(education).
				experience(experience).
				wishAddress(wishAddress+" "+gugun).
				mimeType(file.getContentType()).
				fileName(uuidFileName).
				filePath("http://192.168.0.42:8000/image/"+uuidFileName).						
				build();		
		companyResumeRepository.save(companyResume);
		
		return "close"; 
	}
	
	@GetMapping("/companyresume/{id}")
	public String detail(@PathVariable int id, Model model, @AuthenticationPrincipal UserCustomerDetail userDetail) {
		User user = userDetail.getUser();
		Optional<CompanyResume> resume = companyResumeService.detail(id);
		if(resume.isPresent()) {
		CompanyResume companyresume = resume.get();
		
		model.addAttribute("companyresume", companyresume);
		model.addAttribute("user", user);
		return "detail";
	}else {
		System.out.println("error");
		return "error";
	}
}
	@PostMapping("/search/company/wishaddress")
	public String Searchwishaddress(String city,String gu, @AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO = userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		String wishaddress = gu;
		
		List<CompanyResume> companyResumeO = companyResumeRepository.findBywishaddress(wishaddress);
		
		model.addAttribute("companyResumeO", companyResumeO);
		model.addAttribute("user", user);
		
		return "resumesearch";
	}
	
	@PostMapping("/search/company/job")
	public String SearchJob(String job, @AuthenticationPrincipal UserCustomerDetail userDetail ,Model model) {
		Optional<User> userO = userRepository.findById(userDetail.getUser().getId());
		User user = userO.get();
		List<CompanyResume> companyResumeO = companyResumeRepository.findByJob(job);
		System.out.println("companyResumeO");
		if(companyResumeO != null) {
			model.addAttribute("companyResumeO", companyResumeO);
		}
		
		model.addAttribute("user", user);
		return "resumesearch";
	}
}
