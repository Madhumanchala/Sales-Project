package com.comunus.salesCore.config;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.comunus.salesCore.utility.AESUtility;

import lombok.extern.log4j.Log4j2;

@Configuration
@Log4j2
public class JNDIConfiguration {

	@Autowired
	ApplicationContext application;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@EventListener
	public void onApplicationReadyEvent(ApplicationReadyEvent event) throws Exception{
		log.info("event.getApplicationContext().getDisplayName():"+event.getApplicationContext().getDisplayName());
		
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate);
		SqlParameterSource in = new MapSqlParameterSource()
//				.addValue("flag", "F")
				;
		Map<String, Object> out = simpleJdbcCall.withProcedureName("SP_GET_ALL_SCHEMAS").execute(in);
		log.info(out);
		
		
//		if((Integer) out.get("sp_status")==0) {
			
			List<Map<String,Object>> d =   (List<Map<String, Object>>) out.get("#result-set-1"); 
			for (Map<String, Object> map : d) {
				  DriverManagerDataSource customDataSource = new DriverManagerDataSource();
			        customDataSource.setDriverClassName((String)map.get("DB_DRIVER_CLASS_NAME"));
			        customDataSource.setUrl((String)map.get("DB_URL"));
			        customDataSource.setUsername((String)map.get("USER_NAME"));
			        //customDataSource.setPassword((String)map.get("PASSWORD"));
			        customDataSource.setPassword(AESUtility.decrypt((String)map.get("PASSWORD")));
 
			        // Access application context
			        	 ConfigurableApplicationContext applicationContext = (ConfigurableApplicationContext) application;
			 	        BeanDefinitionRegistry registry = (BeanDefinitionRegistry) applicationContext.getBeanFactory();

			 	        // Define a new bean definition for JdbcTemplate
			 	        BeanDefinition beanDefinition = BeanDefinitionBuilder.genericBeanDefinition(JdbcTemplate.class)
			 	                .addConstructorArgValue(customDataSource)
			 	                .getBeanDefinition();

			 	        // Register the bean definition
			 	        registry.registerBeanDefinition((String)map.get("COMPANY_DOMAIN"), beanDefinition);
			}
//		}else {
//			log.info(out.get("sp_status"));
//			log.info(out.get("message"));
//		}
		
		
		
	
		

	 	        
	}
}
