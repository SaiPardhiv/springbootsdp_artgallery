package com.klef.jfsd.springboot.service;



import java.util.List;


import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;

public interface VisitorService 
{
	public String visitorRegistration(Visitor visitor);
	public Visitor checkVisitorLogin(String visitor_email,String visitor_password);
	public String updateVisitor(Visitor visitor);
	public List<Event> viewAllEvents();
	public List<ArtWork> ViewAllArt();
	public ArtWork ViewArt(int artid);

	
	
	

}
