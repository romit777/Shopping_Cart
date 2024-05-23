package com.jsp.shoppingcart.controller;

import javax.servlet.http.HttpSession;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CartDao;
import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dao.ItemDao;
import com.jsp.shoppingcart.dto.*;

@Controller
public class CartController {
	
	@Autowired
	CartDao dao;
	
	@Autowired
	CustomerDao custdao;
	
	@Autowired
	ItemDao idao;
	
	@RequestMapping("/fetchitemsfromcart")
	public ModelAndView fetchItemsFromCart(HttpSession session) {
		Customer c=(Customer) session.getAttribute("customerinfo");//fetching data from http session
		
		Customer customer=custdao.findCustomerById(c.getId());//again fetching ,because we can get the updated cart.
								//because if the customer has added any more items,the data will not be updated in session.
								//we cant go with session,because it doesnt have updated cart.
		
		Cart cart=customer.getCart();
		List<Item> items=cart.getItems();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("itemslist",items);
		mav.addObject("totalprice",cart.getTotalprice());
		//here we are sending 2 objects to jsp file,item list and total price.
		mav.setViewName("displaycartitemstocustomer");
		return mav;
		
	}
	@RequestMapping("/removeitem")
	public ModelAndView removeItemFromCart(@RequestParam("id")int id,HttpSession session) {
		Customer c=(Customer) session.getAttribute("customerinfo");
		Customer customer=custdao.findCustomerById(c.getId());
		
		Cart cart=customer.getCart();
		int cartid=cart.getId();
		int itemid=id;
		
		dao.removeItemFromCart(cartid, itemid);
		idao.deleteItemById(itemid);
		//cart.setItems(updatedcart.getItems());
		
		//idao.updateItem(updatedcart.getItems());
		
		dao.updateCart(cart);
		custdao.updateCustomer(customer);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("displaycartitemstocustomer");
		return mav;
	}
	
}
