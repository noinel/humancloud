package com.cos.IotProjectGit.config.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.cos.IotProjectGit.model.ApplicantResume;
import com.cos.IotProjectGit.model.CompanyResume;
import com.cos.IotProjectGit.model.Notice;
import com.cos.IotProjectGit.model.User;
import com.cos.IotProjectGit.repository.ApplicantResumeRepository;
import com.cos.IotProjectGit.repository.CompanyResumeRepository;
import com.cos.IotProjectGit.repository.NoticeRepository;
import com.cos.IotProjectGit.repository.UserRepository;
import com.cos.IotProjectGit.service.UserCustomerDetail;

@Controller
public class ManagerController {

   @Autowired
   private UserRepository userRepository;
   @Autowired
   private ApplicantResumeRepository applicantResumeRepository;
   @Autowired
   private CompanyResumeRepository companyResumeRepository;
   @Autowired
   private NoticeRepository noticeRepository;
   
   
   @GetMapping("/manager")
   public String manager(Model model,@AuthenticationPrincipal UserCustomerDetail userDetail) {
	   Optional<User> userO= userRepository.findById(userDetail.getUser().getId());
	   User user= userO.get();
	   
	   
      List<Notice> noticelist = noticeRepository.findAll();
      List<User> userlist = userRepository.findAll();
      List<ApplicantResume> userResumelist = applicantResumeRepository.findAll();
      List<CompanyResume> companyResumelist = companyResumeRepository.findAll();
      
      model.addAttribute("user", user);
      model.addAttribute("noticelist", noticelist);
      model.addAttribute("userlist", userlist);
      model.addAttribute("userResumelist", userResumelist);
      model.addAttribute("companyResumelist", companyResumelist);
      
      
      return "/manager/managerpage";
   }
   @GetMapping("/manager/notice")
   public String managernotice(Model model,@AuthenticationPrincipal UserCustomerDetail userDetail) {
	   Optional<User> userO= userRepository.findById(userDetail.getUser().getId());
	   User user= userO.get();
	   
	   
	   return "/manager/managernote";
   }
   @PostMapping("/manager/write")
   public String manager(Notice notice) {
	   noticeRepository.save(notice);
	   return "close";
   }
   @GetMapping("/manager/viewnote/{id}")
   public String mangerviewnote(@PathVariable Integer id, Model model,@AuthenticationPrincipal UserCustomerDetail userDetail) {
	   Optional<Notice> notice = noticeRepository.findById(id);
	   Optional<User> userO= userRepository.findById(userDetail.getUser().getId());
	   User user= userO.get();
	   
	   model.addAttribute("user", user);
	   model.addAttribute("notice", notice.get());
	   return "/manager/mangerviewnote";
   }
   
   
}