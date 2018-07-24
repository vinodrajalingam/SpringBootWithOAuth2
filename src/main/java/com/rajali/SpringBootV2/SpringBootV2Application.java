package com.rajali.SpringBootV2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com"} )
public class SpringBootV2Application
{
		
	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootV2Application.class, args);
	}
}
