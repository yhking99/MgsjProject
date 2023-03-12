package com.project.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.order.service.PaymentService;

@Controller
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private PaymentService paymentSerivce;
	
	//결제 페이지
	@RequestMapping(value = "/payment/paymentPage", method = RequestMethod.GET)
	public String paymentPage() throws Exception {
		
		logger.info("결제 페이지 paymentPage - Controller");
		
		return "/payment/paymentPage";
	}
}
