package com.project.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.product.domain.ProductDTO;
import com.project.product.service.ProductService;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	// 수정 삭제는 상품등록자만 가능하게(비지니스 로직)
	
	// 상품 게시글 작성폼
	@RequestMapping(value = "/product/productWriteForm", method = RequestMethod.GET)
	public String productWriteForm() throws Exception {
		
		logger.info("상품 게시글 작성폼 productWriteForm -  Controller");
		
		return "/product/productWriteForm";
	}
	
	// 상품 게시글 등록하기
	@RequestMapping(value = "/product/productWrite", method = RequestMethod.POST)
	public String productWrite(ProductDTO productDTO) throws Exception {
		
		logger.info("상품 게시글 등록하기 productWrite - Controller ");
		
		productService.productWrite(productDTO);
		
		return "redirect:/product/main";
		
	}
	
	// 상품 게시글 수정
	@RequestMapping(value = "/product/productUpdate", method = RequestMethod.POST)
	public String productUpdate(ProductDTO productDTO) throws Exception {
		
		logger.info("상품 게시글 수정 productUpdate - Controller");
		
		productService.productUpdate(productDTO);
		
		return "";
	}
	
	
	// 상품 게시글 삭제
	@RequestMapping(value = "/product/productDelete", method = RequestMethod.POST)
	public String productDelete(int pno) throws Exception {
		
		logger.info("상품 게시글 삭제 productDelete - Controller");
		
		productService.productDelete(pno);
		
		return "redirect:/product/main";
	}
	
	// 상품 게시글 상세조회
	@RequestMapping(value = "/product/productDetail", method = RequestMethod.POST)
	public String productDetail(int pno) throws Exception {
		
		logger.info("상품 게시글 상세 조회 productDetail - Controller");
		
		productService.productDetail(pno);
		
		return "redirect:/product/main";
	}
	// 상품 게시글 목록 
	@RequestMapping(value = "/product/productList", method = RequestMethod.GET)
	public void ProductList(Model model) throws Exception {
		 
		logger.info("상품 게시글 목록 조회 ProductList - Controller");
		
		List<ProductDTO> productList = productService.productList();
		
		logger.info("상품 게시글 목록 ==> " + productList);
		
		model.addAttribute("productList", productList);
	}
	
}























