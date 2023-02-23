package com.project.product.service;

import java.util.List;

import com.project.product.domain.ProductDTO;

public interface ProductService {

	// 상품 게시글 등록하기
	public void productWrite(ProductDTO productDTO) throws Exception;
	
	// 상품 게시글 수정
	public void productUpdate(ProductDTO productDTO) throws Exception;
	
	// 상품 게시글 삭제
	public void productDelete(int pno) throws Exception;
	
	// 상품 게시글 목록
	public List<ProductDTO> productList() throws Exception;
	
	// 상품 게시글 상세조회
	public ProductDTO productDetail(int pno) throws Exception;
}
