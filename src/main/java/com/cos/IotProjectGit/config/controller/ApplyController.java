package com.cos.IotProjectGit.config.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.IotProjectGit.model.ApplicantResume;
import com.cos.IotProjectGit.model.Apply;
import com.cos.IotProjectGit.model.User;
import com.cos.IotProjectGit.repository.ApplicantResumeRepository;
import com.cos.IotProjectGit.repository.ApplyRepository;
import com.cos.IotProjectGit.repository.UserRepository;
import com.cos.IotProjectGit.service.UserCustomerDetail;

@Controller
public class ApplyController {
	@Autowired
	private ApplyRepository applyRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ApplicantResumeRepository applicantResumeRepository;
	
	@PostMapping("/apply/{id}")
	   public @ResponseBody String apply(@PathVariable Integer id, @AuthenticationPrincipal UserCustomerDetail userDetail) {
		System.out.println(id);
	    Apply apply= new Apply();  
		Optional<User> optionalToUser = userRepository.findById(id);
		int asdk = optionalToUser.get().getId();
		System.out.println(asdk);
		System.out.println(userRepository.findById(id));
	      User fromUser = userDetail.getUser();
	      User toUser = optionalToUser.get();
	      apply.setFromUser(fromUser);
	      apply.setToUser(toUser);
	      
	      applyRepository.save(apply);
	      
	      return "1";

	      
	   }
	
	@GetMapping("applicant/apply")
		public  String applicantapplyget(@AuthenticationPrincipal UserCustomerDetail userDetail,Model model) {
	    Apply apply= new Apply();  
	      List<ApplicantResume> applicantresume = new ArrayList<>();
	      int search = userDetail.getUser().getId();
	      System.out.println(userDetail.getUser().getId());
	      System.out.println(search);
	      System.out.println(applyRepository.findBytoUserId(search));
	      List<Apply> applys = applyRepository.findBytoUserId(search);
	      for(Apply i : applys) {
	      int searchresume = i.getFromUser().getId();
	      applicantresume.addAll(applicantResumeRepository.findByUserId(searchresume));
	  
	      }
	      model.addAttribute("applicantresume",applicantresume);
	      return "index";
		}
	
//	 @GetMapping("/view/company/{id}")
//	   public String getview(Model model, @PathVariable Integer id, @AuthenticationPrincipal UserCustomerDetail userDetail) {
//	      Optional<CompanyResume> companyResume = companyResumeRepository.findById(id);
//	      int search = companyResume.get().getUser().getId();
//	      Optional<List<Comment>> commentOs = commentRepository.findByToUserIdOrderByCreateDateDesc(search);
//	      userDetail.getUser().getId();
//	      System.out.println(userDetail.getUser().getId());
//	      System.out.println(companyResume);
//	      List<Comment> comments = new ArrayList<Comment>();
//	      if(commentOs.isPresent()) {
//	      comments=commentOs.get();
//	      }
//	      
//	      /*
//	       * applicantResume.get().getFilePath();//jsp
//	       * applicantResume.get().getZipfilePath();//이것만있으면 jsp에서보낼수있음
//	       * applicantResume.get().getZipmimeType();//확장자
//	       * applicantResume.get().getZipfileName();//파일
//	       */
//	      model.addAttribute("companyResume", companyResume.get());
//	      model.addAttribute("comment", comments);
//	      model.addAttribute("user", userDetail.getUser());
//	      return "/company/view";
//	   }
}

