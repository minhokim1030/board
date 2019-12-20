package com.ex.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ex.domain.UserVO;
import com.ex.persistence.UserDAO;


@Controller
public class UserController {
	
	@Inject
	UserDAO dao;
	
	

	@RequestMapping("loginPost")
	public String loginPost(UserVO vo, Model model)throws Exception{
		model.addAttribute("user",dao.loginPost(vo));
		
		return "redirect:main";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request)throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("uemail");
		
		return "redirect:main";
	}
	
	
	
}
