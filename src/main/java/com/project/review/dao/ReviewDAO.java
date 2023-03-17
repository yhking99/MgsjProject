package com.project.review.dao;

import java.util.List;

import com.project.review.domain.ReviewBoardDTO;

public interface ReviewDAO {

	//리뷰 등록
	public void reviewWrite(ReviewBoardDTO reviewBoardDTO) throws Exception;	
	 
	//리뷰 조회
	public ReviewBoardDTO reviewView(int rvno) throws Exception;
	
	//리뷰 수정
	public void reviewUpdate(ReviewBoardDTO reviewBoardDTO) throws Exception;
	
	//리뷰 삭제
	public void reviewDelete(int rvno) throws Exception;
	
	//리뷰 목록
	public List<ReviewBoardDTO> reviewList(int pno) throws Exception;
	
}
