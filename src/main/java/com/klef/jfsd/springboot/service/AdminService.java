package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;

public interface AdminService 
{

	public List<Visitor> viewAllVisitors();
	public Admin checkAdminLogin(String admin_username,String admin_password);
	public long visitorcount();
	public String deletevisitor(int visitor_id);
	public List<Event> viewEvents();
}
