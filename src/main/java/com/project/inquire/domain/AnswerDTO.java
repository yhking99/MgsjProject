package com.project.inquire.domain;

/**
 * 
 * @author 김재국, 정원진, 홍준영
 *
 */
public class AnswerDTO {
	/*
		ansNum	int	NO	PRI		auto_increment
		askNum	int	NO			
		ansTitle	varchar(50)	NO			
		ansContent	text	NO			
		ansRegDate	datetime	YES		CURRENT_TIMESTAMP	DEFAULT_GENERATED
	*/
	
	private int ansNum;
	private int askNum;
	private String ansTitle;
	private String ansContent;
	private String ansRegDate;
}
