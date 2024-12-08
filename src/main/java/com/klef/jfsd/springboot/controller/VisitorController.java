package com.klef.jfsd.springboot.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.service.EmailService;
import com.klef.jfsd.springboot.service.VisitorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class VisitorController 
{
    @Autowired
    private VisitorService visitorService;
    
    @Autowired
    private EmailService emailService;

    @GetMapping("/")
    public ModelAndView home() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }
    
    @GetMapping("payment")
    public ModelAndView payment() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("payment");
        return mv;
    }
    
    @GetMapping("success")
    public ModelAndView success() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("success");
        return mv;
    }

    @GetMapping("visitorreg")
    public ModelAndView visitorreg() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorreg");
        return mv;
    }

    @GetMapping("about")
    public ModelAndView about() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("about");
        return mv;
    }

    @GetMapping("browsearts1")
    public ModelAndView browsearts1() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("browsearts1");
        return mv;
    }

    @GetMapping("footer")
    public ModelAndView footer() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("footer");
        return mv;
    }

    @GetMapping("uploadart")
    public ModelAndView uploadart() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("uploadart");
        return mv;
    }

    @PostMapping("insertvisitor")
    public ModelAndView insertvisitor(HttpServletRequest request) 
    {
        String visitor_fullname = request.getParameter("vfullname");
        String visitor_email = request.getParameter("vemail");
        String visitor_password = request.getParameter("vpassword");
        String visitor_contact = request.getParameter("vcontact");
        String visitor_gender = request.getParameter("vgender");
        String visitor_age_string = request.getParameter("vage");
        int visitor_age = Integer.parseInt(visitor_age_string);

        Visitor visitor = new Visitor();
        visitor.setVisitor_fullname(visitor_fullname);
        visitor.setVisitor_email(visitor_email);
        visitor.setVisitor_password(visitor_password);
        visitor.setVisitor_contact(visitor_contact);
        visitor.setVisitor_gender(visitor_gender);
        visitor.setVisitor_age(visitor_age);

        String message = visitorService.visitorRegistration(visitor);
        emailService.sendRegistrationEmail(visitor_email);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("regsuccess");
        mv.addObject("message", message);
        return mv;
    }

    @GetMapping("visitorlogin")
    public ModelAndView visitorlogin() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorlogin");
        return mv;
    }

    @GetMapping("visitorhome")
    public ModelAndView visitorhome() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorhome");
        return mv;
    }

    @GetMapping("visitorprofile")
    public ModelAndView visitorprofile() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorprofile");
        return mv;
    }

    @PostMapping("checkvisitorlogin")
    public ModelAndView checkvisitorlogin(HttpServletRequest request) 
    {
        ModelAndView mv = new ModelAndView();
        String visitor_email = request.getParameter("vemail");
        String visitor_password = request.getParameter("vpassword");
        Visitor visitor = visitorService.checkVisitorLogin(visitor_email, visitor_password);

        if(visitor != null) 
        {
            HttpSession session = request.getSession();
            session.setAttribute("visitor", visitor);
            mv.setViewName("visitorhome"); //login success
        } 
        else 
        {
            mv.setViewName("visitorlogin");
            mv.addObject("message", "Login Failed ..!"); // login failure
        }
        return mv;
    }

    @GetMapping("updatevisitor")
    public ModelAndView updatevisitor() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatevisitor");
        return mv;  
    }

    

    @PostMapping("update")
    public ModelAndView update(HttpServletRequest request) 
    {
        int id = Integer.parseInt(request.getParameter("visitor_id"));
        String name = request.getParameter("visitor_fullname");
        String gender = request.getParameter("visitor_gender");
        int age = Integer.parseInt(request.getParameter("visitor_age"));
        String email = request.getParameter("visitor_email");
        String password = request.getParameter("visitor_password");
        String contact = request.getParameter("visitor_contact");

        Visitor v = new Visitor();
        v.setVisitor_id(id);
        v.setVisitor_fullname(name);
        v.setVisitor_email(email);
        v.setVisitor_password(password);
        v.setVisitor_gender(gender);
        v.setVisitor_age(age);
        v.setVisitor_contact(contact);

        String msg = visitorService.updateVisitor(v);

        ModelAndView mv = new ModelAndView("visitorupdatesuccess");
        mv.addObject("message", msg);

        return mv;
    }

    @GetMapping("visitorlogout")
    public ModelAndView visitorlogout(HttpServletRequest request) 
    {
        HttpSession session = request.getSession();
        session.removeAttribute("visitor");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorlogin");
        return mv;  
    }

    @GetMapping("visitorsessionfail")
    public ModelAndView visitorsessionfail() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorsessionfail");
        return mv;  
    }
//    
//    @GetMapping("browsearts")
//    public ModelAndView browsearts() 
//    {
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("browsearts");
//        return mv;  
//    }

    @GetMapping("visitorupdatesuccess")
    public ModelAndView visitorupdatesuccess() 
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitorupdatesuccess");
        return mv; 
    }
    

	 @GetMapping("viewallevents")
		public ModelAndView viewallevents()
		{
			
			ModelAndView mv = new ModelAndView("viewallevents");
		
			List<Event> events = visitorService.viewAllEvents();
			mv.addObject("eventlist", events);
			return mv;
		}
	 
	 @GetMapping("browsearts")
	    public ModelAndView browsearts()
	    {
	 	   List<ArtWork> artlist = visitorService.ViewAllArt();
	 	   
	 	   ModelAndView mv = new ModelAndView("browsearts");
	 	   
	 	   mv.addObject("artlist", artlist);
	 	   
	 	   return mv;
	    }
	   
	    @GetMapping("displayartimages")
	    public ResponseEntity<byte[]> displayartimagedemo(@RequestParam("id") int artwork_id) throws Exception
	    {
	      ArtWork artwork = visitorService.ViewArt(artwork_id);
	      byte [] imageBytes = null;
	      imageBytes = artwork.getArtImage().getBytes(1,(int) artwork.getArtImage().length());

	      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

	    }
}
