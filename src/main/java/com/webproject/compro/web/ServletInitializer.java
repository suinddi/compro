package com.webproject.compro.web;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ComproApplication.class);
	}

//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//		super.onStartup(servletContext);
//		servletContext.addFilter("httpMethodFilter", HiddenHttpMethodFilter.class).addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), false, "/**");
//	}
}
