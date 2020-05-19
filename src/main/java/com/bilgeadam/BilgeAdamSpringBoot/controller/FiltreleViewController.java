package com.bilgeadam.BilgeAdamSpringBoot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FiltreleViewController {

	@RequestMapping(value="/allfiltrele", method = RequestMethod.GET)
	public String getFiltrele() {
		return "redirect:/filtrele";
		
	}
	
	@RequestMapping(value="/allfiltreles",method= RequestMethod.GET)
	public ModelAndView getfiltrele2() {
		// jsp sayfasinin cagrildigi yer
		ModelAndView model=new ModelAndView("filtrele");
		//model.addObject("lists",list);
		return model;
	}
}
