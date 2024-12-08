package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.service.CuratorService;
import com.klef.jfsd.springboot.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CuratorController 
{
	@Autowired
	private CuratorService curatorService;
	
	 @Autowired
	    private EmailService emailService;
	
	 @GetMapping("curatorregistration")
	    public ModelAndView curatorregistration() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorregistration");
	        return mv;
	    }
	 
	 @GetMapping("curatorhome")
	    public ModelAndView curatorhome() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorhome");
	        return mv;
	    }
	 
	 @GetMapping("createevent")
	    public ModelAndView createevent() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("createevent");
	        return mv;
	    }
	 
	 @GetMapping("myevents")
		public ModelAndView myevents()
		{
			
			ModelAndView mv = new ModelAndView("myevents");
		
			List<Event> events = curatorService.viewMyEvents();
			mv.addObject("eventlist", events);
			return mv;
		}
	 
	 @GetMapping("curatorsessionfail")
	    public ModelAndView curatorsessionfail() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorsessionfail");
	        return mv;
	    }
	 
	 @GetMapping("curatornavbar")
	    public ModelAndView curatornavbar() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatornavbar");
	        return mv;
	    }
	 
	 @GetMapping("curatorregsuccess")
	    public ModelAndView curatorregsuccess() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorregsuccess");
	        return mv;
	    }
	 
	 @GetMapping("curatorlogin")
	    public ModelAndView curatorlogin() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorlogin");
	        return mv;
	    }
	 
	 @GetMapping("curatorprofile")
	    public ModelAndView curatorprofile() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorprofile");
	        return mv;
	    }
	 @GetMapping("createeventsuccess")
	    public ModelAndView createeventsuccess() 
	    {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("createeventsuccess");
	        return mv;
	    }
	 
	 @PostMapping("insertcurator")
	    public ModelAndView insertcurator(HttpServletRequest request) 
	    {
	        String curator_fullname = request.getParameter("curator_fullname");
	        String curator_email = request.getParameter("curator_email");
	        String curator_password = request.getParameter("curator_password");
	        String curator__contact = request.getParameter("curator_contact");
	        String curator_company = request.getParameter("curator_company");
	  

	        Curator curator = new Curator();
	        curator.setCurator_fullname(curator_fullname);
	        curator.setCurator_company(curator_company);
	        curator.setCurator_email(curator_email);
	        curator.setCurator_password(curator_password);
	        curator.setContact(curator__contact);

	        String message = curatorService.curatorRegistration(curator);
	        emailService.sendRegistrationEmail(curator_email);

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorregsuccess");
	        mv.addObject("message", message);
	        return mv;
	    }
	 
	 @PostMapping("checkcuratorlogin")
	    public ModelAndView checkcuratorlogin(HttpServletRequest request) 
	    {
	        ModelAndView mv = new ModelAndView();
	        String curator_email = request.getParameter("curator_email");
	        String curator_password = request.getParameter("curator_password");
	        Curator curator = curatorService.checkCuratorLogin(curator_email, curator_password);

	        if(curator != null) 
	        {
	            HttpSession session = request.getSession();
	            session.setAttribute("curator", curator);
	            mv.setViewName("curatorhome"); //login success
	        } 
	        else 
	        {
	            mv.setViewName("curatorlogin");
	            mv.addObject("message", "Login Failed ..!"); // login failure
	        }
	        return mv;
	    }
	 
	 @GetMapping("curatorlogout")
	    public ModelAndView curatorlogout(HttpServletRequest request) 
	    {
	        HttpSession session = request.getSession();
	        session.removeAttribute("curator");
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("curatorlogin");
	        return mv;  
	    }
	 
	 @PostMapping("insertevent")
	    public ModelAndView insertevent(HttpServletRequest request) 
	    {
	        String event_name = request.getParameter("event_name");
	        String event_description = request.getParameter("event_description");
	        String event_curator = request.getParameter("event_curator");
	        String event_limits = request.getParameter("event_limit");
	        int event_limit = Integer.parseInt(event_limits);
	        String event_startdate = request.getParameter("event_startdate");
	        String event_enddate = request.getParameter("event_enddate");
	        
	       
	  

	       Event event = new Event();
	       event.setEvent_curator(event_curator);
	       event.setEvent_name(event_name);
	       event.setEvent_description(event_description);
	       event.setEvent_limit(event_limit);
	       event.setEvent_startdate(event_startdate);
	       event.setEvent_enddate(event_enddate);

	        String message = curatorService.createEvent(event);

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("createeventsuccess");
	        mv.addObject("message", message);
	        return mv;
	    }

}
