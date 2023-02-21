package com.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
}
