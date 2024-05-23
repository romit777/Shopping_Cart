package com.jsp.shoppingcart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import com.jsp.shoppingcart.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.MerchantDao;
import com.jsp.shoppingcart.dao.ProductDao;

@Controller
public class ProductController {

	@Autowired
	ProductDao dao;
	@Autowired
	MerchantDao mdao;
	
	@RequestMapping("/addproduct")
	public ModelAndView addProduct() {
		Product p=new Product();
		ModelAndView mav=new ModelAndView();
		mav.addObject("productobj",p);
		mav.setViewName("productform");
		return mav;
	}
	
	@RequestMapping("/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute("producttobj") Product p,HttpSession session) {
		Merchant merchant=(Merchant)session.getAttribute("merchantinfo");
		List<Product> products=merchant.getProducts();
		if(products.size()>0) {
			products.add(p);
		}else {
			List<Product> productlist=new ArrayList<Product>();
			productlist.add(p);
			merchant.setProducts(productlist);
		}
		
		dao.saveProduct(p);
		mdao.updateMerchant(merchant);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "Product Added Successfully...!!");
		mav.setViewName("merchantoptions");
		return mav;
	}
	@RequestMapping("/updateproduct")
	public ModelAndView updateProduct(@RequestParam("id")int id) {
		Product p=dao.findProductById(id);//to display the old properties
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("updateobj", p);
		mav.setViewName("updateproductform");
		return mav;
	}
	@RequestMapping("/updateandsave")
	public ModelAndView updateSave(ServletRequest req,HttpSession session) {
		int id=Integer.parseInt(req.getParameter("id"));
		String brand=req.getParameter("brand");
		String category=req.getParameter("category");
		String model=req.getParameter("model");
		double price=Double.parseDouble(req.getParameter("price"));
		int stock=Integer.parseInt(req.getParameter("stock"));
		
		
		Merchant m=(Merchant) session.getAttribute("merchantinfo");
		List<Product> products= m.getProducts();
		Product p=null;
		
		for(Product pr:products) {
			if(pr.getId()==id)p=pr;
		}
		
		//Product p=new Product();
		p.setId(id);
		p.setBrand(brand);
		p.setCategory(category);
		p.setModel(model);
		p.setPrice(price);
		p.setStock(stock);
		
		dao.updateProduct(p);
		
		mdao.updateMerchant(m);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("mesg", "Product Updated Successfully...!");
		mav.setViewName("viewallproducts");
		return mav;
	}
	
	@RequestMapping("/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam("id")int id,HttpSession session) {
		Merchant merchant=(Merchant)session.getAttribute("merchantinfo");
		
		Merchant m=mdao.deleteProductFromMerchant(merchant.getId(), id);
		mdao.updateMerchant(m);
		dao.deleteProductById(id);
		
		session.setAttribute("merchantinfo", m);
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("viewallproducts");
		return mav;
	}
	@RequestMapping("/displayallproducts")
	public ModelAndView displayProducts() {
		List<Product> products=dao.fetchAllProducts();
		ModelAndView mav=new ModelAndView();
		mav.addObject("productslist",products);
		mav.setViewName("customerviewallproducts");
		return mav;
		
	}
	@RequestMapping("/displayproductsbybrand")
	public ModelAndView readBrand() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readbrandfromcustomer");
		return mav;
	}
	
	@RequestMapping("/displaybybrand")
	public ModelAndView displayByBrand(ServletRequest req) {
		String brand=req.getParameter("brand");
		
		List<Product> products=dao.fetchProductByBrand(brand);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("productslist",products);
		mav.setViewName("customerviewallproducts");
		return mav;
	}
	
	@RequestMapping("/displayproductsbycategory")
	public ModelAndView readCategory() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readcategoryfromcustomer");
		return mav;
	}
	
	@RequestMapping("/readcategory")
	public ModelAndView displayByCategory(ServletRequest req) {
		String category=req.getParameter("category");
		
		List<Product> products=dao.fetchProductByCategory(category);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("productslist",products);
		mav.setViewName("customerviewallproducts");
		return mav;
	}
	
	@RequestMapping("/displaybetweenrange")
	public ModelAndView readRange() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readrangefromcustomer");
		return mav;
	}
	
	@RequestMapping("/readrange")
	public ModelAndView displayByRange(ServletRequest req) {
		double lrange=Integer.parseInt(req.getParameter("lrange"));
		double urange=Integer.parseInt(req.getParameter("urange"));

		
		List<Product> products=dao.fetchProductByRange(lrange,urange);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("productslist",products);
		mav.setViewName("customerviewallproducts");
		return mav;
	}
	
}
