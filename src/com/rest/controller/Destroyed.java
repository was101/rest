package com.rest.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.rest.DAO.ReservationDAO;
public class Destroyed implements ServletContextListener {
	
	public void contextDestroyed(ServletContextEvent sce) {
		ReservationDAO dao = new ReservationDAO();
		dao.deleteAll();
	}
}
