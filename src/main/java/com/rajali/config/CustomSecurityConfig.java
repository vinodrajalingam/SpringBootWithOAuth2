package com.rajali.config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

@Configuration
public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {

	private static final Log logger = LogFactory.getLog(CustomSecurityConfig.class);

	@Autowired
	CustomFilter customFilter;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		logger.info("Inside CustomSecurityConfig -> Config");

		http
        	.logout()
            .logoutUrl("/j_spring_security_logout")
            .logoutSuccessUrl("/exit")
            .deleteCookies("BootV2Cookie")
            .invalidateHttpSession(true)
            .and()
            .authorizeRequests()
            .antMatchers(
                    "/",
                    "/login",
                    "/logout"
            ).permitAll()
            .antMatchers("/gAuth","/fAuth","/gitAuth")
            .hasRole("USER")
            .and()
            .addFilterAfter(customFilter.ssoFilter(), BasicAuthenticationFilter.class).csrf().disable();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.inMemoryAuthentication().withUser("user").password("password").roles("ADMIN");

		/*
		 * auth.ldapAuthentication() .contextSource()
		 * .url("ldap://172.25.10.101:10389/").managerDn("uid=admin,ou=system")
		 * .managerPassword("secret") .and()
		 * .userSearchBase("ou=ActiveMQ,ou=system").userSearchFilter("(uid={0})")
		 * //.contextSource().ldif("MyLatestLdif.ldif") ;
		 */
	}
}