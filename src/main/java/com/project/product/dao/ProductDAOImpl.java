package com.project.product.dao;

import java.util.List;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.product.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.productMapper";
	
	// 상품 게시글 등록하기
	@Override
	public void productWrite(ProductDTO productDTO) throws Exception {
		
		logger.info("상품 게시글 등록하기 productWrite - productDAO");
		
		sqlSession.insert(NAME_SPACE + ".productWrite", productDTO);
	}
	
	// 상품 게시글 삭제하기
	@Override
	public void productDelete(int pno) throws Exception {
		
		logger.info("상품 게시글 삭제하기 productDelete - productDAO");
		
		sqlSession.delete(NAME_SPACE + ".productDelete", pno);
	}
	
	// 상품 게시글 수정하기
	@Override
	public void productUpdate(ProductDTO productDTO) throws Exception {
		
		logger.info("상품 게시글 수정하기 productUpdate - productDAO");
		
		sqlSession.update(NAME_SPACE + ".productUpdate", productDTO);
	}
	
	// 상품 게시글 상세조회
	@Override
	public ProductDTO productDetail(int pno) throws Exception {
		
		logger.info("상품 게시글 상세조회 productDetail - productDAO");
		
		return sqlSession.selectOne(NAME_SPACE + ".productDetail", pno);
	}
	
	// 상품 게시글 목록
	@Override
	public List<ProductDTO> productList() throws Exception {
		
		logger.info("상품 게시글 목록 productList - productDAO");
		
		return sqlSession.selectList(NAME_SPACE + ".productList");
	}
}
