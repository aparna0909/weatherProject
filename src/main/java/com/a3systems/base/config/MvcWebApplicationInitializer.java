package com.a3systems.base.config;

import javax.servlet.ServletContext;

import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.web.util.WebAppRootListener;

public class MvcWebApplicationInitializer
    extends AbstractAnnotationConfigDispatcherServletInitializer {

  // Load database and spring security configuration
  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class[] {};
  }

  // Load spring web configuration
  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class[] {WebMvcConfig.class};
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] {"/"};
  }

 
  @Override
  protected void registerContextLoaderListener(ServletContext arg0) {
    arg0.addListener(WebAppRootListener.class);
    arg0.addListener(RequestContextListener.class);
    super.registerContextLoaderListener(arg0);
  }
 
}
