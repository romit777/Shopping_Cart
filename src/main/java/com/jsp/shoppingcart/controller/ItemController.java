package com.jsp.shoppingcart.controller;

import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CartDao;
import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dao.ItemDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.*;

@Controller
public class ItemController {

	@Autowired
	ItemDao dao;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	CartDao cdao;
	
	@Autowired
	CustomerDao custdao;
	
	@RequestMapping("/additem")
	public ModelAndView addItem(@RequestParam("id")int id) {
		
		Product p=pdao.findProductById(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("prodobj",p);
		mav.setViewName("itemform");
		return mav;		
	}
	
	@RequestMapping("/additemtocart")
	public ModelAndView AddItemToCart(ServletRequest req,HttpSession session) {
		int pid=Integer.parseInt(req.getParameter("id"));
		String brand=req.getParameter("brand");
		String category=req.getParameter("category");
		String model=req.getParameter("model");
		double price=Double.parseDouble(req.getParameter("price"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		
		Item item=new Item();
		
		item.setBrand(brand);
		item.setCategory(category);
		item.setModel(model);
		item.setQuantity(quantity);
		item.setP_id(pid);
		item.setPrice(price*quantity);
		
		 Customer customer=(Customer) session.getAttribute("customerinfo");
		Cart c=customer.getCart();
		
		if(c==null) {
			int totalprice=0;
			Cart cart=new Cart();
			
			List<Item> items=new ArrayList<Item>();
			items.add(item);
			
			cart.setItems(items);
			cart.setName(customer.getName());
			
			for(Item i:items) {
				totalprice+=i.getPrice();
			}
			cart.setTotalprice(totalprice);
			
			customer.setCart(cart);
			dao.saveItem(item);
			cdao.saveCart(cart);
			
			custdao.updateCustomer(customer);
			
		}
		else {
			List<Item> items = c.getItems();
			if(items.size()>0) {
				items.add(item);
				c.setItems(items);
				double totalprice=0;
				for(Item i:items) {
					totalprice+=i.getPrice();
				}
				c.setTotalprice(totalprice);
				customer.setCart(c);
				dao.saveItem(item);
				cdao.updateCart(c);
				custdao.updateCustomer(customer);
				
			}
			else {
				List<Item> itemslist=new ArrayList();
				itemslist.add(item);
				c.setItems(itemslist);
				c.setTotalprice(item.getPrice());//here we are adding item form 1st time..(but the cart is already created so update cart)
				dao.saveItem(item);
				cdao.updateCart(c);
				custdao.updateCustomer(customer);
				
			}		
		}		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect://displayallproducts");
		return mav;
	}
	
	
	
	
	
}
