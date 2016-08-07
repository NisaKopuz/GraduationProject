package com.huia.servlets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener

public class ContextListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent e) {

		System.out.println("Olusturuldu.");

	}

	public void contextDestroyed(ServletContextEvent e) {
		System.out.println("Sonlandırıldı.");

	}
}
