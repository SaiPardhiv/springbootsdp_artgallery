package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.EventRepository;
import com.klef.jfsd.springboot.repository.VisitorRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private VisitorRepository visitorRepository;
	@Autowired
	private EventRepository eventRepository;

	@Override
	public List<Visitor> viewAllVisitors() {
		return visitorRepository.findAll();
	}

	@Override
	public Admin checkAdminLogin(String admin_username, String admin_password) {
		return adminRepository.checkAdminLogin(admin_username, admin_password);
	}

	@Override
	public long visitorcount() {
		return visitorRepository.count();
	}

	@Override
	public String deletevisitor(int visitor_id) {
		visitorRepository.deleteById(visitor_id);
		return "Visitor Deleted Successfully";
	}

	@Override
	public List<Event> viewEvents() {
		return eventRepository.findAll();
	}

}
