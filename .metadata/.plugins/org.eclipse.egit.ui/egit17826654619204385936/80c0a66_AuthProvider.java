package com.comunus.sales.config;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.comunus.sales.model.LoginRequest;
import com.comunus.sales.model.UrlMaster;
import com.comunus.sales.model.UserDetails;
import com.comunus.sales.model.UserPrincipal;
import com.comunus.sales.utility.AESUtility;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class AuthProvider implements AuthenticationProvider {

	@Autowired
	Configs configs;

	
	@Autowired
	HttpServletRequest httpServletRequest;
	
//	@Autowired
//	private JwtTokenUtil jwtTokenUtil;
	
	

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		UsernamePasswordAuthenticationToken authenticatedToken = null;

		List<String> roles = new ArrayList<>();
		ServletRequestAttributes request = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		log.info(request.getRequest().getHeader("host"));

		LoginRequest loginRequest = new LoginRequest();
		loginRequest.setUsername(username);
		//loginRequest.setPassword(password);
		try {
			loginRequest.setPassword(AESUtility.encrypt(password));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		UrlMaster urlDetails = Configs.urls.get("Login");

		UserDetails userDetails = new UserDetails();

		WebClient webClient = WebClient.create();

		HttpHeaders headers = new HttpHeaders();
//	        headers.add("Content-Type", "application/json");
		headers.add("domainName", request.getRequest().getHeader("host").split(":")[0]);
		BodyInserters.fromValue(loginRequest);
		try {
			ResponseEntity<String> s = webClient.post().uri(urlDetails.getUrl()).headers(h -> h.addAll(headers))
					.bodyValue(loginRequest).retrieve().toEntity(String.class).block();

			log.info(s.getStatusCode());
			log.info(s.getStatusCodeValue());

			JSONObject obj = new JSONObject(s.getBody());
			log.info(obj);
			log.info(obj.getJSONObject("data").getString("token"));

			UserPrincipal userPrincipal = new JwtTokenUtil ().getJWT(obj.getJSONObject("data").getString("token"));
			userPrincipal.setAuthorities(userPrincipal.getRoleList().stream().map(x -> new SimpleGrantedAuthority("ROLE_" + x)).collect(Collectors.toList()));
			authenticatedToken = new UsernamePasswordAuthenticationToken(
					UserPrincipal.create(userPrincipal, authentication.getDetails()), password,
					userPrincipal.getRoleList().stream().map(x -> new SimpleGrantedAuthority("ROLE_" + x)).collect(Collectors.toList()));

			
			// Store the access and refresh token in the session
			SecurityContextHolder.getContext().setAuthentication(authenticatedToken);
			
			
			HttpSession session = request.getRequest().getSession(true);
			session.setAttribute("token", "Bearer "+obj.getJSONObject("data").getString("token"));
			session.setAttribute("userId", obj.getJSONObject("data").getInt("id"));
			UserPrincipal u = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			log.info(u);
		} catch (WebClientResponseException e) {
			log.info(e.getStatusCode());
			log.info(e.getMessage());
			log.info(e.getResponseBodyAsString());
			 throw new AuthenticationException("Invalid Credentials, Please try with Correct Credentials") {};
			
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new AuthenticationException("Invalid Credentials, Please try with Correct Credentials") {};
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new AuthenticationException("Invalid Credentials, Please try with Correct Credentials") {};
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new AuthenticationException("Invalid Credentials, Please try with Correct Credentials") {};
		}

		return authenticatedToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
