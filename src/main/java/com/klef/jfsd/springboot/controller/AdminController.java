package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@GetMapping("viewevents")
	public ModelAndView viewevents()
	{
		
		ModelAndView mv = new ModelAndView("viewevents");
	
		List<Event> events = adminService.viewEvents();
		mv.addObject("eventlist", events);
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		String admin_username = request.getParameter("ausername");
		String admin_password = request.getParameter("apassword");
		Admin admin = adminService.checkAdminLogin(admin_username, admin_password);
		
		if(admin != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			mv.setViewName("adminhome");//login success
			
		}
		else
		{
			mv.setViewName("adminloginfail"); // login failed
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;  
	}
	
	@GetMapping("adminsessionfail")
	public ModelAndView adminsessionfail()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionfail");
		return mv;  
	}
	
	@GetMapping("viewallvisitors")
	public ModelAndView viewallvisitors()
	{
		
		ModelAndView mv = new ModelAndView("viewallvisitors");
		long count = adminService.visitorcount();
		mv.addObject("count", count);
		List<Visitor> visitors = adminService.viewAllVisitors();
		mv.addObject("visitorlist", visitors);
		return mv;
	}
	
	@GetMapping("deletevisitor")
	  public ModelAndView deletevisitor() 
	  {
	    ModelAndView mv = new ModelAndView();
	    List<Visitor> visitorlist = adminService.viewAllVisitors();
	    mv.setViewName("deletevisitor");
	    mv.addObject("visitorlist", visitorlist);
	
	    
	    return mv;
	  }
	
	@GetMapping("delete")
	public String deleteVisitor(@RequestParam("visitor_id") int visitor_id) {
		adminService.deletevisitor(visitor_id);
		return "redirect:/deletevisitor";
	}

}
