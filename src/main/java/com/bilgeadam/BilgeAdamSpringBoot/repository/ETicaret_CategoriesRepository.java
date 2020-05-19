package com.bilgeadam.BilgeAdamSpringBoot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Categories;

public interface ETicaret_CategoriesRepository extends JpaRepository<ETicaret_Categories,Long>  {
	
	@Query(
			  value = "SELECT * FROM eticaret_category u WHERE u.ParentCategoryId = 0", 
			  nativeQuery = true)
	List<ETicaret_Categories> getParentCategory();
	
	@Query(
			  value = "SELECT * FROM eticaret_category u WHERE u.ParentCategoryId = ?1", 
			  nativeQuery = true)
	List<ETicaret_Categories> getCategory(long id);
	

}
