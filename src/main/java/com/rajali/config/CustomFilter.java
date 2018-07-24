package com.rajali.config;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoTokenServices;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.web.filter.CompositeFilter;

@Configuration
@EnableOAuth2Client
public class CustomFilter {

	@Autowired
	private OAuth2ClientContext oauth2ClientContext;

	@Bean
	@ConfigurationProperties(prefix = "google.client")
	public AuthorizationCodeResourceDetails google() {
		return new AuthorizationCodeResourceDetails();
	}

	@Bean
	@ConfigurationProperties(prefix="google.resource")
	public ResourceServerProperties googleResource() {
		return new ResourceServerProperties();
	}
	
	@Bean
	@ConfigurationProperties(prefix = "facebook.client")
	public AuthorizationCodeResourceDetails facebook() {
		return new AuthorizationCodeResourceDetails();
	}

	@Bean
	@ConfigurationProperties(prefix="facebook.resource")
	public ResourceServerProperties facebookResource() {
		return new ResourceServerProperties();
	}
	
	@Bean
	@ConfigurationProperties(prefix = "gitHub.client")
	public AuthorizationCodeResourceDetails gitHub() {
		return new AuthorizationCodeResourceDetails();
	}

	@Bean
	@ConfigurationProperties(prefix="gitHub.resource")
	public ResourceServerProperties gitHubResource() {
		return new ResourceServerProperties();
	}

	Filter ssoFilter() {

		List<Filter> filters = new ArrayList<>();
		CompositeFilter filter = new CompositeFilter();
		filters.add(googleFilter());
		filters.add(facebookFilter());
		filters.add(gitHubFilter());
		filter.setFilters(filters);
		return filter;
	}

	private Filter gitHubFilter() {

		OAuth2ClientAuthenticationProcessingFilter gitHubFilter = new OAuth2ClientAuthenticationProcessingFilter("/gitAuth");
		OAuth2RestTemplate gitHubTemplate = new OAuth2RestTemplate(gitHub(), oauth2ClientContext);
		gitHubFilter.setRestTemplate(gitHubTemplate);
		gitHubFilter.setTokenServices(new UserInfoTokenServices(gitHubResource().getUserInfoUri(), google().getClientId()));
		return gitHubFilter;
	}

	private Filter facebookFilter() {
		
		OAuth2ClientAuthenticationProcessingFilter facebookFilter = new OAuth2ClientAuthenticationProcessingFilter("/fAuth");
		OAuth2RestTemplate facebookTemplate = new OAuth2RestTemplate(facebook(), oauth2ClientContext);
		facebookFilter.setRestTemplate(facebookTemplate);
		facebookFilter.setTokenServices(new UserInfoTokenServices(facebookResource().getUserInfoUri(), google().getClientId()));
		return facebookFilter;
	}

	private Filter googleFilter() {
		OAuth2ClientAuthenticationProcessingFilter googleFilter = new OAuth2ClientAuthenticationProcessingFilter("/gAuth");
		OAuth2RestTemplate googleTemplate = new OAuth2RestTemplate(google(), oauth2ClientContext);
		googleFilter.setRestTemplate(googleTemplate);
		googleFilter.setTokenServices(new UserInfoTokenServices(googleResource().getUserInfoUri(), google().getClientId()));
		return googleFilter;
	}

}