package com.bilgeadam.BilgeAdamSpringBoot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HakkinizdaViewController {
	@RequestMapping(value="/allhakkinizda", method = RequestMethod.GET)
	public String getHakkinizda() {
		return "redirect:/hakkinizda";
		
	}
	
	@RequestMapping(value="/allhakkinizdas",method= RequestMethod.GET)
	public ModelAndView gethakkinizda2() {
		// jsp sayfasinin cagrildigi yer
		ModelAndView model=new ModelAndView("hakkinizda");
		//model.addObject("lists",list);
		return model;
	}
}
