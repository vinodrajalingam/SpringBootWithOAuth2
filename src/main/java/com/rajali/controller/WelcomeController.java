package com.rajali.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class WelcomeController {
	
	private final Log logger = LogFactory.getLog(WelcomeController.class);

	@GetMapping("/home")
	@ResponseBody
	public String welcome() {
		return "Welcome to Secured Spring Boot App!!!!!!";
	}

	@GetMapping({"/user","/me"})
	public Principal user(Principal principal) {
		return principal;
	}
	
	@RequestMapping("/lAuth")
	public Principal lAuth(Principal principal) {
		logger.info("principal from linked in : "+principal);
		return principal;
	}
	
	@PostMapping(value = "/inputLogin")
	public ModelAndView userLogin(User user) {
		
		return new ModelAndView("userSignUp");
	}
	
	@RequestMapping("/exit")
    public void exit(HttpServletRequest request, HttpServletResponse response) {
        // token can be revoked here if needed
        new SecurityContextLogoutHandler().logout(request, null, null);
        try {
            //sending back to client app
            response.sendRedirect(request.getHeader("referer"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	@PostMapping(value = "/logout")
	public ModelAndView logoutPage() {
		
		logger.info("Logout user");

		return new ModelAndView("login");
	}
	
	@GetMapping(value = "/login*")
	public ModelAndView loginLogoutPage() {
		
		logger.info("Login Logout user");

		return new ModelAndView("login");
	}
}