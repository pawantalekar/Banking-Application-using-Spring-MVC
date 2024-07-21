package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Account;

import com.service.AccountService;

@Controller
public class AccountController {
	@Autowired
	AccountService accountService;

	@RequestMapping("/")
	public String indexPage(Model model) {
		List<Account> allData = this.accountService.getAll();
		model.addAttribute("allStudentData", allData);
		return "display";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "login";

	}

	@RequestMapping(path = "loginform", method = RequestMethod.POST)
	public String loginSuccess(@ModelAttribute Account student, Model model) {
//		System.out.println("Controller..........");
		this.accountService.saveData(student);

		List<Account> allData = this.accountService.getAll();
		model.addAttribute("allStudentData", allData);

		return "display";
	}

	@RequestMapping("/display")
	public String displayALLData(Model model) {
		List<Account> allData = this.accountService.getAll();
		model.addAttribute("allStudentData", allData);
		return "display";

	}

	@RequestMapping("/delete/{id}")
	public String deleteData(@PathVariable("id") int id, Model model) {
		this.accountService.deleteData(id);
		List<Account> allData = this.accountService.getAll();
		model.addAttribute("allStudentData", allData);

		return "redirect:/";
	}

	@RequestMapping("/update/{id}")
	public String updateStudent(@PathVariable("id") int id, Model model) {
		Account student = this.accountService.getData(id); 

		if (student == null) {
			
			return "error"; 
		}
		model.addAttribute("student", student);
		return "updateform";
	}

	@RequestMapping(path = "/update/updateform", method = RequestMethod.POST)
	public String updateSuccess(@ModelAttribute Account student, Model model) {
		this.accountService.updatedata(student);
		List<Account> allData = this.accountService.getAll();
		model.addAttribute("allStudentData", allData);

		return "redirect:/";
	}
	
//	@RequestMapping("/home")
//	public String home() {
//		return "home";
//	}
//	
//	@RequestMapping("/about")
//	public String about() {
//		return "about";
//	}
//	@RequestMapping("/contactus")
//	public String contact() {
//		return "contactus";
//	}

}
