package com.bilgeadam.BilgeAdamSpringBoot.service;

import java.util.List;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Products;

public interface ETicaret_ProductsService {
	
	List<ETicaret_Products> getAll();
	ETicaret_Products getById(Long id);
	ETicaret_Products save(ETicaret_Products eTicaret_Products);
	ETicaret_Products update(ETicaret_Products eTicaret_Products);
	Boolean delete(Long id);

}
