package com.ex.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ex.domain.BoardVO;
import com.ex.persistence.BoardDAO;


@Controller
public class BoardController {
	
	@Inject
	BoardDAO dao;
	
	@RequestMapping("main")
	public String list()throws Exception{
		
		return "mainpage";
	}
	
	@RequestMapping("writer")
	public String writer(){ // �����Ͱ��� ������������ Model�� �Է�
		
		return "writer";
	}
	
	@RequestMapping(value="writer", method=RequestMethod.POST)
	public String writerPost(BoardVO vo){ 
		System.out.println(vo.toString());
		dao.writer(vo);
		return "redirect:main"; // redirect�� ������������� �����Ͱ��� ������������.
	}
	
	
}
