package com.a3systems.base.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.CommonAnnotationBeanPostProcessor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.xml.SourceHttpMessageConverter;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableAspectJAutoProxy
@ComponentScans(value = {@ComponentScan("com.a3systems.base.controller")})
public class WebMvcConfig extends WebMvcConfigurationSupport {

  private static final Logger LOG = LoggerFactory.getLogger(WebMvcConfig.class);

  public WebMvcConfig() {
    LOG.info("Initilize WebMvcConfig");
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
	  LOG.info("Inside addResourceHandlers ...");
	    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	    registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
  }

  @Bean
  public InternalResourceViewResolver viewResolver() {
    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
    viewResolver.setViewClass(JstlView.class);
    viewResolver.setPrefix("/WEB-INF/views/");
    viewResolver.setSuffix(".jsp");
    viewResolver.setRedirectHttp10Compatible(false);
    return viewResolver;
  }

  @Bean
  public ResourceBundleMessageSource resourceBundleMessageSource() {
    ResourceBundleMessageSource resourceBundleMessageSource = new ResourceBundleMessageSource();
    resourceBundleMessageSource.setBasename("applicationResources");
    return resourceBundleMessageSource;
  }


  @Bean
  public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {
    RequestMappingHandlerAdapter handlerAdapter = super.requestMappingHandlerAdapter();
    handlerAdapter.setWebBindingInitializer(new ConfigurableWebBindingInitializer());
    handlerAdapter.getMessageConverters().add(new ByteArrayHttpMessageConverter());
    handlerAdapter.getMessageConverters().add(new StringHttpMessageConverter());
    handlerAdapter.getMessageConverters().add(new FormHttpMessageConverter());
    handlerAdapter.getMessageConverters().add(new SourceHttpMessageConverter<>());
    return handlerAdapter;
  }

  
  @Bean
  public AutowiredAnnotationBeanPostProcessor autowiredAnnotationBeanPostProcessor() {
    return new AutowiredAnnotationBeanPostProcessor();
  }

  @Bean
  public CommonAnnotationBeanPostProcessor commonAnnotationBeanPostProcessor() {
    return new CommonAnnotationBeanPostProcessor();
  }

}
