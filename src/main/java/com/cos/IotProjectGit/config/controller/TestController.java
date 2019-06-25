package com.cos.IotProjectGit.config.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/jusoPopup")
	private String jusoPopup() {
		return "jusoPopup";
	}
	
	@GetMapping("/sample")
	private String sample() {
		return "sample";
	}
}
