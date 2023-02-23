package com.project.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.product.dao.ProductDAO;
import com.project.product.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	
	@Autowired
	private ProductDAO productDAO;

	//상품 게시글 등록하기
	@Override
	public void productWrite(ProductDTO productDTO) throws Exception {

		logger.info("상품 게시글 등록하기 productWrite - Service");
		
		productDAO.productWrite(productDTO);
	}
	//상품 게시글 삭제하기
	@Override
	public void productDelete(int pno) throws Exception {

		logger.info("상품 게시글 삭제하기 productDelete - Service");
		
		productDAO.productDelete(pno);
	}
	
	//상품 게시글 수정하기
	@Override
	public void productUpdate(ProductDTO productDTO) throws Exception {

		logger.info("상품 게시글 수정하기 productUpdate - Service");
		
		productDAO.productUpdate(productDTO);
	}
	
	//상품 게시글 상세 조회
	@Override
	public ProductDTO productDetail(int pno) throws Exception {

		logger.info("상품 게시글 상세조회 productDetail - Service");
		
		return productDAO.productDetail(pno);
	}
	
	//상품 게시글 목록
	@Override
	public List<ProductDTO> productList() throws Exception {

		logger.info("상품 게시글 목록 조회 productList - Service");
		
		return productDAO.productList();
	}
}
