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
	public String writer(){ // 데이터값을 가져오기위해 Model을 입력
		
		return "writer";
	}
	
	@RequestMapping(value="writer", method=RequestMethod.POST)
	public String writerPost(BoardVO vo){ 
		System.out.println(vo.toString());
		dao.writer(vo);
		return "redirect:main"; // redirect를 사용하지않으면 데이터값을 가져가지못함.
	}
	
	
}
