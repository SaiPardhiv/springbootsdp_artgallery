package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;



public interface CuratorService 
{
	public String curatorRegistration(Curator curator);
	public Curator checkCuratorLogin(String curator_email,String curator_password);
	public String createEvent(Event event);
	public List<Event> viewMyEvents();
	

}
