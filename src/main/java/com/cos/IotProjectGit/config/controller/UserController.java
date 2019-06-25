package com.cos.IotProjectGit.config.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.IotProjectGit.ResponseDto.ResponseDto;
import com.cos.IotProjectGit.model.ApplicantResume;
import com.cos.IotProjectGit.model.Apply;
import com.cos.IotProjectGit.model.CompanyResume;
import com.cos.IotProjectGit.model.Notice;
import com.cos.IotProjectGit.model.User;
import com.cos.IotProjectGit.repository.ApplicantResumeRepository;
import com.cos.IotProjectGit.repository.ApplyRepository;
import com.cos.IotProjectGit.repository.CompanyResumeRepository;
import com.cos.IotProjectGit.repository.NoticeRepository;
import com.cos.IotProjectGit.repository.UserRepository;
import com.cos.IotProjectGit.service.UserCustomService;
import com.cos.IotProjectGit.service.UserCustomerDetail;


//Role, Applicant, Company, Admin 
@Controller
public class UserController {

	private final static String TAG = "UserController : ";
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserCustomService userCustomService;
	
	@Autowired
	private ApplicantResumeRepository applicantResumeRepository;
	
	@Autowired
	private CompanyResumeRepository companyResumeRepository;
	@Autowired
	private NoticeRepository noticeRepository;
	
	@Autowired
	private ApplyRepository applyRepository;




	//메인페이지!! (동적:Applicant, Company)
	@GetMapping("/")
	public String home() {
		return "login";
	}

	@GetMapping("/user/login")
	public String userLogin() {

		return "login";
	}
	
	
	   @GetMapping("/user/main")
	   public String userLoginproc(@AuthenticationPrincipal UserCustomerDetail userDetail,Model model) {
	      Optional<User> userO= userRepository.findById(userDetail.getUser().getId());
	      User user= userO.get();
	      System.out.println(user.getRole());
	      
	   
	      List<ApplicantResume> applicantResume = applicantResumeRepository.findByApplicanDesc();
	      List<CompanyResume> companyResume = companyResumeRepository.findByCompanyDesc();
	      
	      List<Notice> notice = noticeRepository.findAll();
	      
	      List<ApplicantResume> applicantResumelist = applicantResumeRepository.findByUserId(user.getId());
	      List<CompanyResume> companyResumelist = companyResumeRepository.findByUserId(user.getId());
	      
	      
	      List<CompanyResume> newsamecompany = new ArrayList<>();
	      List<ApplicantResume> newsameapplicant = new ArrayList<>();
	      List<CompanyResume> careersamecompany = new ArrayList<>();
	      List<ApplicantResume> careersameapplicant = new ArrayList<>();
	      
	      Apply apply= new Apply();  
	      List<ApplicantResume> applicantresume = new ArrayList<>();
	      int search = userDetail.getUser().getId();
	      System.out.println(userDetail.getUser().getId());
	      System.out.println(search);
	      System.out.println(applyRepository.findBytoUserId(search));
	      List<Apply> applys = applyRepository.findBytoUserId(search);
	      for(Apply i : applys) {
	      int searchresume = i.getFromUser().getId();
	      applicantresume = applicantResumeRepository.findByUserId(searchresume);
	      System.out.println("니미시발"+applicantresume);
	     
	      model.addAttribute("applicantresume",applicantresume);
	      }
	      
	      
	      
	      
	      if(user.getRole().equals("applicant")) {
	         for(CompanyResume c :companyResume) {
	         int check = 0;   
	            for( ApplicantResume r: applicantResumelist) {
	               check = 0;
	               if(c.getExperience().equals("경력")) {
	                  if(r.getSalary() == c.getSalary()){
	                     check = check + 1;
	                  }
	                  if(r.getJob().equals(c.getJob())) {
	                     check = check + 1;
	                  }
	                  if(r.getWishAddress().equals(c.getWishAddress())) {
	                     check = check + 1;
	                  }
	                  int value = 0;
	                  value = r.getAge() - c.getAge();
	                  value = Math.abs(value);
	                  if(value < 10) {
	                     check = check + 1;
	                  }
	                  if(r.getEducation().equals(c.getEducation())) {
	                     check = check +1;
	                  }
	                  System.out.println(check);
	                  if(check >= 3) {
	                     System.out.println("경력"+check);
	                     careersamecompany.add(c);
	                     break;
	                  }
	               }else if(c.getExperience().equals("신입")) {
	                  if(r.getSalary() == c.getSalary()){
	                     check = check + 1;
	                  }
	                  if(r.getJob().equals(c.getJob())) {
	                     check = check + 1;
	                  }
	                  if(r.getWishAddress().equals(c.getWishAddress())) {
	                     check = check + 1;
	                  }
	                  int value = 0;
	                  value = r.getAge() - c.getAge();
	                  value = Math.abs(value);
	                  if(value < 10) {
	                     check = check + 1;
	                  }
	                  if(r.getEducation().equals(c.getEducation())) {
	                     check = check +1;
	                  }
	                  System.out.println(check);
	                  if(check >= 3) {
	                     System.out.println("신입"+check);
	                     newsamecompany.add(c);
	                     break;
	                  }
	               }
	            }
	            
	         }
	      }else if(user.getRole().equals("company")){
	         for(ApplicantResume a :applicantResume) {
	            int check = 0;   
	               for( CompanyResume c: companyResumelist) {
	                  check = 0;
	                  if(a.getExperience().equals("경력")) {
	                     if(a.getSalary() == c.getSalary()){
	                        check = check + 1;
	                     }
	                     if(a.getJob().equals(c.getJob())) {
	                        check = check + 1;
	                     }
	                     if(a.getWishAddress().equals(c.getWishAddress())) {
	                        check = check + 1;
	                     }
	                     int value = 0;
	                     value = a.getAge() - c.getAge();
	                     value = Math.abs(value);
	                     if(value < 10) {
	                        check = check + 1;
	                     }
	                     if(a.getEducation().equals(c.getEducation())) {
	                        check = check +1;
	                     }
	                     
	                     if(check >= 3) {
	                        System.out.println("회사 경력"+check);
	                        careersameapplicant.add(a);
	                        break;
	                     }
	                  }else if(a.getExperience().equals("신입")) {
	                     if(a.getSalary() == c.getSalary()){
	                        check = check + 1;
	                     }
	                     if(a.getJob().equals(c.getJob())) {
	                        check = check + 1;
	                     }
	                     if(a.getWishAddress().equals(c.getWishAddress())) {
	                        check = check + 1;
	                     }
	                     int value = 0;
	                     value = a.getAge() - c.getAge();
	                     value = Math.abs(value);
	                     if(value < 10) {
	                        check = check + 1;
	                     }
	                     if(a.getEducation().equals(c.getEducation())) {
	                        check = check +1;
	                     }
	                     System.out.println(check);
	                     if(check >= 3) {
	                        System.out.println("회사 신입"+check);
	                        newsameapplicant.add(a);
	                        break;
	                     }
	                  }
	               }
	               
	            }
	      }
	      // @formatter:on
	      
	   
	      model.addAttribute("notice", notice);
	      model.addAttribute("newsamecompany", newsamecompany);
	      model.addAttribute("newsameapplicant", newsameapplicant);
	      model.addAttribute("careersamecompany", careersamecompany);
	      model.addAttribute("careersameapplicant", careersameapplicant);
	      model.addAttribute("applicantResumelist", applicantResumelist);
	      model.addAttribute("applicantResume", applicantResume);      
	      model.addAttribute("companyResume",companyResume);
	      model.addAttribute("companyResumelist",companyResumelist);         
	      model.addAttribute("user", user);
	   
	      return "index";
	   }

	@GetMapping("/user/applicant/join")
	public String userApplicantJoin() {
		return "user/join";
	}
	
	@GetMapping("/user/company/join")
	public String userCompanyJoin() {
		return "company/join";
	}

	@PostMapping("/user/create")
	public String userCreate(User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		userRepository.save(user);
		return "login";
	}
	
	@PostMapping("/api/user/create")
	public void apiUserCreate(User user) {
		System.out.println(user);
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		
		user.setPassword(encPassword);
		userRepository.save(user);
	}
	
	@PostMapping("/api/user/update")
	public void apiUserUpdate(@AuthenticationPrincipal UserCustomerDetail userDetail,Model model,User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(userDetail.getUser().getRole());
		user.setUpdateDate(LocalDate.now());
		user.setCreateDate(userDetail.getUser().getCreateDate());
		userRepository.save(user);
	}
	
	@PostMapping("/user/update")
	public String userUpdate(@AuthenticationPrincipal UserCustomerDetail userDetail,Model model,User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole(userDetail.getUser().getRole());
		user.setUpdateDate(LocalDate.now());
		user.setCreateDate(userDetail.getUser().getCreateDate());
		userRepository.save(user);
		return "close";
	}
	
	
	
	@GetMapping("/api/user/login")
	public @ResponseBody User login(String username,String password, HttpServletRequest request) {
		User user = userRepository.findByUsername(username); 
		
		Map<String, String> map = new HashMap<>();
		
//		Map<String, User>
		
		map.put("aaa", "로그인한 사용자객체");
		
//		map.put("aaa", "bbb");
		
		Set<String> keySet = map.keySet();
		if (keySet.contains("aaa")) {
			
		} else {
			
		}
		
		map.get("aaa");
		
	
		ResponseDto Login = new ResponseDto(); 
		if(user !=null) {
			System.out.println("유저이름"+user.getName());
			System.out.println("유저비번"+user.getUsername());
			Boolean psCheck = passwordEncoder.matches(password,user.getPassword());
			System.out.println(psCheck);
			System.out.println(user);
			
			HttpSession session = request.getSession();
			System.out.println("session입니다"+session);
			session.setAttribute("userApp", user);
			session.getAttribute("userApp");
			System.out.println("sessionget"+session.getAttribute("userApp"));
			
			return user;
		}else {
			return null;
		}
	}
//	@GetMapping("api/loginProcess")
//	  public @ResponseBody LoginState apiLoginProc(String username, String password) {
//	    Users findUser = userService.apiLoginFind(username);
//	    LoginState ls = new LoginState();
//	    if(findUser!=null) {
//	      System.out.println("로그인 유저 정보:"+findUser);
//	      System.out.println("로그인한 유저 원시패스워드:"+password);
//	      System.out.println("DB 엔코드 패스워드 :"+findUser.getPassword());
//	      Boolean passCheck = passwordEncoder.matches(password, findUser.getPassword());
//	      System.out.println("매칭 확인:"+passCheck);
//	      if(passCheck) {
//	        ls.setResult("user login success");
//	      }else{
//	        ls.setResult("user login false");
//	      }
//	    }else {
//	      ls.setResult("user not found");
//	    }
//	    return ls;
//	  }
//	
	//Role만 확인하면 됨!!
	@GetMapping("/user/{id}")
	public String userDetail(@PathVariable int id, @AuthenticationPrincipal UserCustomerDetail userDetail, Model model) {
		Optional<User> temp = userCustomService.userDetail(id);
		// 숙제 널처리하기(Optional)
		// ispresent()

		if (temp.isPresent()) {
			User user = temp.get();
			model.addAttribute("user", user);
			return "detail";
		} else {
			return "error";
		}

	}
	@PostMapping("/checkid/{username}")
	   public void nameCheck(@PathVariable String username, HttpServletResponse response) 
	         throws IOException {
	      System.out.println(username);
	      PrintWriter out = response.getWriter();
	      User findUsername = userRepository.findByUsername(username);
	      if(findUsername != null) {
	         out.print(-1);
	      }else {
	         out.print(1);
	      }
	   }

}
