package com.bilgeadam.BilgeAdamSpringBoot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FavorilerViewController {

	@RequestMapping(value="/allfavoriler", method = RequestMethod.GET)
	public String getFavorile() {
		return "redirect:/favoriler";
		
	}
	
	@RequestMapping(value="/allfavorilers",method= RequestMethod.GET)
	public ModelAndView getfavorile2() {
		// jsp sayfasinin cagrildigi yer
		ModelAndView model=new ModelAndView("favoriler");
		//model.addObject("lists",list);
		return model;
	}
}
