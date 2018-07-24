package com.rajali.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class CustomWebMVC extends WebMvcConfigurerAdapter {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		
		registry.addViewController("/").
				 setViewName("login");
		
		registry.addViewController("/userSignUP").
		 setViewName("userSignUp");
		
		/*registry.addViewController("/logout").
		 setViewName("login");*/
	}

}