package com.runnerdave.spring.web.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.runnerdave.spring.web.dao.FormValidationGroup;
import com.runnerdave.spring.web.dao.Message;
import com.runnerdave.spring.web.dao.User;
import com.runnerdave.spring.web.service.UsersService;

@Controller
@EnableWebMvc
public class LoginController {

	private UsersService usersService;

	@Autowired
	public void setUserService(UsersService usersService) {
		this.usersService = usersService;
	}

	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}

	@RequestMapping("/denied")
	public String showDenied() {
		return "denied";
	}
	
	@RequestMapping("/messages")
	public String showMessages() {
		return "messages";
	}

	@RequestMapping("/newaccount")
	public String showNewAccount(Model model) {
		model.addAttribute("user", new User());
		return "newaccount";
	}

	@RequestMapping("/loggedout")
	public String showLoggedOut() {
		return "loggedout";
	}

	@RequestMapping("/admin")
	public String showAdmin(Model model) {

		List<User> users = usersService.getAllUsers();
		model.addAttribute("users", users);

		return "admin";
	}

	@RequestMapping(value = "/createaccount", method = RequestMethod.POST)
	public String createAccount(@Validated(FormValidationGroup.class) User user, BindingResult result) {
		if (result.hasErrors()) {
			return "newaccount";
		}
		user.setEnabled(true);
		user.setAuthority("ROLE_USER");

		if (usersService.exists(user.getUsername())) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "newaccount";
		}

		try {
			usersService.create(user);
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "newaccount";
		}
		return "accountcreated";
	}

	@RequestMapping(value = "/getmessages", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Map<String, Object> getMessages(Principal principal) {
		List<Message> messages = null;
		if (principal == null) {
			messages = new ArrayList<Message>();
		} else {
			String username = principal.getName();
			messages = usersService.getMessagesByUsername(username);
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("messages", messages);
		data.put("number", messages.size());

		return data;
	}
}
