package com.jsp.shoppingcart.controller;
import com.jsp.shoppingcart.dto.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CustomerDao;

@Controller
public class CustomerController {

	@Autowired
	CustomerDao dao;
	
	@RequestMapping("/createaccount")
	public ModelAndView addcustomer() {
		Customer c=new Customer();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("customerobj", c);
		mav.setViewName("customerform");
		return mav;
	}
	@RequestMapping("/savecustomer")
	public ModelAndView saveCustomer(@ModelAttribute ("customerobj") Customer c) {
		dao.saveCustomer(c);
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg","Data Saved Successfully.."); 
		mav.setViewName("customerloginform");
		return mav;
	}
	
	@RequestMapping("/customerloginvalidation")
	public ModelAndView loginValidation(ServletRequest req,HttpSession session) {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		Customer c=dao.login(email, password);
		ModelAndView mav=new ModelAndView();
		if(c!=null) {			
			mav.addObject("mesg","Successfully LoggedInn..!!");
			mav.setViewName("customeroptions");
			session.setAttribute("customerinfo",c);
			return mav;
		}
		else {
			mav.addObject("mesg","Invalid Credentials...");
			mav.setViewName("customerloginform");
			return mav;
		}
		
	}
}
