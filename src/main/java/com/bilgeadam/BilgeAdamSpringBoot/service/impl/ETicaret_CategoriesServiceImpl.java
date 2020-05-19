package com.bilgeadam.BilgeAdamSpringBoot.service.impl;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Categories;
import com.bilgeadam.BilgeAdamSpringBoot.repository.ETicaret_CategoriesRepository;
import com.bilgeadam.BilgeAdamSpringBoot.service.ETicaret_CategoriesService;


import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import java.util.List; 

@Service
public class ETicaret_CategoriesServiceImpl implements ETicaret_CategoriesService {
	
	 private final ETicaret_CategoriesRepository eTicaret_CategoriesRepository;
	 @SuppressWarnings("unused")
	 private final ModelMapper modelMapper2;
	   
	   public ETicaret_CategoriesServiceImpl
	    (ETicaret_CategoriesRepository eTicaret_CategoriesRepository, ModelMapper modelMapper2) {
	        this.eTicaret_CategoriesRepository = eTicaret_CategoriesRepository;
	        this.modelMapper2 = modelMapper2;
	    }  
	   
	    public List<ETicaret_Categories> getParentCategory() {
	    	List<ETicaret_Categories> data = eTicaret_CategoriesRepository.getParentCategory();
	    	return data;
	    }
	    
	    public List<ETicaret_Categories> getCategory(long id) {
	    	List<ETicaret_Categories> data = eTicaret_CategoriesRepository.getCategory(id);
	    	return data;
	    }
	    
	    @Override
	    public ETicaret_Categories getById(Long id) {
	    	ETicaret_Categories p = eTicaret_CategoriesRepository.getOne(id);
	        return p;
	    }
	    
	    

	 
	
	

}
