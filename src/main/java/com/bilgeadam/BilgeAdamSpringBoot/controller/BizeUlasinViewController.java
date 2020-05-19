package com.bilgeadam.BilgeAdamSpringBoot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BizeUlasinViewController {

	@RequestMapping(value="/allbizeulasin", method = RequestMethod.GET)
	public String getBizeUlasin() {
		return "redirect:/bizeulasin";
		
	}
	
	@RequestMapping(value="/allbizeulasins",method= RequestMethod.GET)
	public ModelAndView getbizeulasin2() {
		// jsp sayfasinin cagrildigi yer
		ModelAndView model=new ModelAndView("bizeulasin");
		//model.addObject("lists",list);
		return model;
	}
}
