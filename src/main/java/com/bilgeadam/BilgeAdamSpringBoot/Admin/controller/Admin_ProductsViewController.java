package com.bilgeadam.BilgeAdamSpringBoot.Admin.controller;



import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Products;
import com.bilgeadam.BilgeAdamSpringBoot.service.impl.ETicaret_ProductsServiceImpl;


@Controller
public class Admin_ProductsViewController {
	private final ETicaret_ProductsServiceImpl eTicaret_ProductsServiceImpl;

	public Admin_ProductsViewController(ETicaret_ProductsServiceImpl eTicaret_ProductsServiceImpl) {
		this.eTicaret_ProductsServiceImpl = eTicaret_ProductsServiceImpl;
	}
	   @RequestMapping(value = "/admin_products", method = RequestMethod.GET)
	    public ModelAndView getdataETicaret_Products() {
	        List<ETicaret_Products> list = eTicaret_ProductsServiceImpl.getAll();
	        ModelAndView model = new ModelAndView("admin_products");
	        model.addObject("lists", list);
	        return model;
	    }
}
