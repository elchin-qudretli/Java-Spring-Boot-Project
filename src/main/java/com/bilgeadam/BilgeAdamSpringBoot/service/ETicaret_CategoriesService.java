package com.bilgeadam.BilgeAdamSpringBoot.service;
import java.util.List;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Categories;
import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Products;


public interface ETicaret_CategoriesService {
	

	List<ETicaret_Categories> getParentCategory();
	
	List<ETicaret_Categories> getCategory(long id);
	
	ETicaret_Categories getById(Long id);
	
	
	
	

}