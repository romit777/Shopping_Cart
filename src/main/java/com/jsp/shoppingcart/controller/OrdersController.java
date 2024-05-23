package com.jsp.shoppingcart.controller;
import com.jsp.shoppingcart.dao.*;
import com.jsp.shoppingcart.dto.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrdersController {

	@Autowired
	OrdersDao dao;
	
	@Autowired
	CustomerDao custdao;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	CartDao cdao;
	
	
	@RequestMapping("/addorder")
	public ModelAndView getDetails(@RequestParam double tp) {
		Orders o=new Orders();			
		o.setTotal_price(tp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("ordersobj",o);
		mav.setViewName("ordersform");
		return mav;
	}
	
	
	
	@RequestMapping("/saveorder")
	public ModelAndView placeOrder(@ModelAttribute("ordersobj")Orders o,HttpSession session) {
		Customer c=(Customer) session.getAttribute("customerinfo");//from session we are getting customer
		Customer customer=custdao.findCustomerById(c.getId());//here we are fetching customer again because,we can get updated  cart.
		
		Cart cart=customer.getCart();
		List<Item> items=cart.getItems();
		
		//o.setItems(items);
		//o.setTotal_price(cart.getTotalprice());
		
		List<Item> itemslist=new ArrayList();
		List<Item> itemswithGreaterQuantity=new ArrayList();//here we will store out of stock orders/items.
		
		for(Item i:items) {
			Product p=pdao.findProductById(i.getP_id());//fetching product to get the stock of the product
			if(i.getQuantity()< p.getStock()) {
				itemslist.add(i);
				p.setStock(p.getStock()-i.getQuantity());//reducing the stock from product table
				pdao.updateProduct(p);//updating the product with new 				
			}else {
				itemswithGreaterQuantity.add(i);
			}
		}
		o.setItems(itemslist);
		double totalpriceoforder=0;
		for(Item i:itemslist) {
			totalpriceoforder+=i.getPrice();
		}
		o.setTotal_price(totalpriceoforder);
		
		//Cart updatedcart=cdao.removeAllItemsFromCart(cart.getId());
		cart.setItems(itemswithGreaterQuantity);
		//cart.setTotalprice(itemswithGreaterQuantity.stream().map(i->i.getPrice()).toArray());
		double totalprice=0;
		for(Item i:itemswithGreaterQuantity) {
			totalprice+=i.getPrice();
		}
		cart.setTotalprice(totalprice);
		
		List<Orders> orders=customer.getOrders();
		if(orders.size()>0) {
			orders.add(o);
			customer.setOrders(orders);
		}
		else {
			List<Orders> orders1=new ArrayList();
			orders1.add(o);
			customer.setOrders(orders1);			
		}
		
		customer.setCart(cart);
		cdao.updateCart(cart);
		dao.saveOrders(o);
		
		custdao.updateCustomer(customer);
				
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg","Order Placed Successfully...!!");
		mav.addObject("orderdetails", o);
		mav.setViewName("customerbill");
		return mav;
	}
}
