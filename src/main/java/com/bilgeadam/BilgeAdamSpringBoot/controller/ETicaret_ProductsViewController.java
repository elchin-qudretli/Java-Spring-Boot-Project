package com.bilgeadam.BilgeAdamSpringBoot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Categories;
import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Products;
import com.bilgeadam.BilgeAdamSpringBoot.service.ETicaret_CategoriesService;
import com.bilgeadam.BilgeAdamSpringBoot.service.ETicaret_ProductsService;


@Controller
public class ETicaret_ProductsViewController {
	
	private final ETicaret_ProductsService eTicaret_ProductsServiceImpl;
	private final ETicaret_CategoriesService eTicaret_CategoriesServiceImpl;
	
	
	
	//Constructer Dependency Injection
	public ETicaret_ProductsViewController(ETicaret_ProductsService eTicaret_ProductsServiceImpl,ETicaret_CategoriesService eTicaret_CategoriesServiceImpl)
	{
		this.eTicaret_ProductsServiceImpl = eTicaret_ProductsServiceImpl;
		this.eTicaret_CategoriesServiceImpl = eTicaret_CategoriesServiceImpl;
	}
	
	@RequestMapping("/newticaret_products")
	public ModelAndView showform() {
		return new ModelAndView("newticaret_products","command",new ETicaret_Products());
	}
	
	
	@RequestMapping(value="/addNewETicaret_Products", method = RequestMethod.POST)
	public ModelAndView submiteticaret_products (@ModelAttribute("eticaret_products")
	ETicaret_Products eticaret_products, BindingResult result, ModelMap model){
		Date date = new Date();
		eTicaret_ProductsServiceImpl.save(eticaret_products);
		return new ModelAndView("redirect:/alleticaret_products");
	}
	
	@RequestMapping(value="/editeticaret_products/{id}")
	public String editeticaret_products(@PathVariable Long id,Model m) {
		ETicaret_Products eTicaret_Products = eTicaret_ProductsServiceImpl.getById(id);
		m.addAttribute("command",eTicaret_Products);
		return "editeticaret_products";
	}
	
	@RequestMapping(value="/editsaveeticaret_products",method= RequestMethod.POST)
	public String editsaveeticaret_products(@ModelAttribute("eticaret_products") ETicaret_Products eTicaret_Products) {
		eTicaret_ProductsServiceImpl.update(eTicaret_Products);
		return "redirect:/alleticaret_products";
		
	}
	
	@RequestMapping(value="deleteeticaret_products/{id}",method=RequestMethod.GET)
	public String deleteeticaret_products(@PathVariable Long id) {
		eTicaret_ProductsServiceImpl.delete(id);
		return "redirect:/alleticaret_products";
	}
	/*
    @RequestMapping(value = "/alleticaret_products", method = RequestMethod.GET)
    public ModelAndView getdataETicaret_Products() {
        List<ETicaret_Products> list = eTicaret_ProductsServiceImpl.getAll();
        ModelAndView model = new ModelAndView("alleticaret_products");
        model.addObject("lists", list);
        return model;
    }
   */
	
	@RequestMapping(value="/alleticaret_products",method = RequestMethod.GET)
	public ModelAndView getdataETicaret_Products() {
		List<ArrayList<ETicaret_Categories>> listoflist = new ArrayList<ArrayList<ETicaret_Categories>>();
		List<ETicaret_Products> list = eTicaret_ProductsServiceImpl.getAll();
		///////
		List<ETicaret_Categories> newlist = eTicaret_CategoriesServiceImpl.getParentCategory();
		for(int i = 0; i < newlist.size(); i++) {
			ETicaret_Categories category = new ETicaret_Categories();
			category = newlist.get(i);
			long id = category.getCategoryid();			
			
			listoflist.add((ArrayList<ETicaret_Categories>) eTicaret_CategoriesServiceImpl.getCategory(id));
			
		}		
		
		ModelAndView model = new ModelAndView("alleticaret_products");
		model.addObject("lists",list);
		model.addObject("newlists", newlist);
		model.addObject("newlists2",listoflist);	
		
		
		
		return model;
	}

}
   



