package com.bilgeadam.BilgeAdamSpringBoot.service.impl;

import com.bilgeadam.BilgeAdamSpringBoot.entity.ETicaret_Products;
import com.bilgeadam.BilgeAdamSpringBoot.repository.ETicaret_ProductsRepository;
import com.bilgeadam.BilgeAdamSpringBoot.service.ETicaret_ProductsService;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ETicaret_ProductsServiceImpl implements ETicaret_ProductsService {

    private final ETicaret_ProductsRepository eTicaret_ProductsRepository;
    @SuppressWarnings("unused")
	private final ModelMapper modelMapper;

    public ETicaret_ProductsServiceImpl
    (ETicaret_ProductsRepository eTicaret_ProductsRepository, ModelMapper modelMapper) {
        this.eTicaret_ProductsRepository = eTicaret_ProductsRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public List<ETicaret_Products> getAll() {
        List<ETicaret_Products> data = eTicaret_ProductsRepository.findAll();
        return data;
    }

    @Override
    public ETicaret_Products getById(Long id) {
    	ETicaret_Products p = eTicaret_ProductsRepository.getOne(id);
        return p;
    }

    @Override
    public ETicaret_Products save(ETicaret_Products eTicaret_Products) {
        ETicaret_Products eTicaret_Productsdb = eTicaret_ProductsRepository.save(eTicaret_Products);
        return eTicaret_Productsdb;
      
    }
    @Override
    public ETicaret_Products update(ETicaret_Products eTicaret_Products) {
    	ETicaret_Products projectDb = eTicaret_ProductsRepository.getOne(eTicaret_Products.getProductID());
        if (projectDb == null)
            throw new IllegalArgumentException("Project Does Not Exist ID:" + eTicaret_Products.getProductID());


      // projectDb.setProjectCode(eTicaret_Products.getProjectCode());
      // projectDb.setProjectName(eTicaret_Products.getProjectName());
      // projectDb.setInsertDate(project.);
       ETicaret_Products projectUpd = eTicaret_ProductsRepository.save(projectDb);
       return projectUpd;
    }

    @Override
    public Boolean delete(Long id) {
    	eTicaret_ProductsRepository.deleteById(id);
        return true;
    }


}
