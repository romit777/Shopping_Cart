 package com.jsp.shoppingcart.controller;

import com.jsp.shoppingcart.dao.MerchantDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.*;

import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MerchantController {

	@Autowired
	MerchantDao dao;
	@Autowired
	ProductDao pdao;
	
	@RequestMapping("/addmerchant")
	public ModelAndView addMerchant() {
		Merchant m=new Merchant();
		ModelAndView mav=new ModelAndView();
		mav.addObject("merchantobj",m);
		mav.setViewName("merchantform");
		return mav;
	}
	@RequestMapping("/savemerchant")
	public ModelAndView saveMerchant(@ModelAttribute("merchantobj") Merchant m) {
		dao.saveMerchant(m);
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg","Data Saved Successfully.."); 
		mav.setViewName("menu");
		return mav;
	}
	@RequestMapping("/loginvalidation") 
	public ModelAndView loginValidation(ServletRequest request,HttpSession session) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Merchant m=dao.login(email, password);
		ModelAndView mav=new ModelAndView();

		if(m!=null) {
			
			session.setAttribute("merchantinfo",m);
			mav.addObject("mesg","Successfully LoggedInn..!!");
			mav.setViewName("merchantoptions");
			return mav;
		}
		else {
			mav.addObject("mesg","Invalid Credentials...");
			mav.setViewName("merchantloginform");
			return mav;
		}
		}
	@RequestMapping("/updatemerchant")
	public ModelAndView updateMerchant(@RequestParam("id")int id) {
		Merchant m=dao.findMerchantById(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("merchantobj", m);
		mav.setViewName("merchantupdateform");
		return mav;
	}
	
	@RequestMapping("/updateandsavemerchant")
	public ModelAndView updateAndSaveMerchant(ServletRequest req) {
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String mobile=req.getParameter("mobilenumber");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String cpassword=req.getParameter("cpassword");
		
		Merchant m=new Merchant();
		ModelAndView mav=new ModelAndView();
		if(password.equals(cpassword)) {
			m.setId(id);
			m.setName(name);
			m.setMobilenumber(mobile);
			m.setEmail(email);
			m.setPassword(password);
			
			dao.updateMerchant(m);
			
			mav.addObject("massage","Data Updated Successfully");
			mav.setViewName("merchantoptions");
			return mav;
		}
		else {
			mav.addObject("massage","Password Mismatched..!! Please try again..!!");
			mav.setViewName("merchantoptions");
			return mav;
			
		}
	}
	
	@RequestMapping("/deleteaccount")
	public ModelAndView deleteMerchant(@RequestParam("id")int id) {
		Merchant m=dao.findMerchantById(id);
		List<Product> products=m.getProducts();
		
		if(products.size()>0) {
		for(Product p:products) {
			dao.deleteProductFromMerchant(id, p.getId());
			pdao.deleteProductById(p.getId());
		}
		}
		dao.updateMerchant(m);
		dao.deleteMerchantById(id);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("deletemsg","Account Deleted...!!");
		mav.setViewName("home");
		return mav;
	}
	
	
	}
