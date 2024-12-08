package com.klef.jfsd.springboot.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.repository.ArtWorkrepository;

import com.klef.jfsd.springboot.repository.EventRepository;
import com.klef.jfsd.springboot.repository.VisitorRepository;


@Service
public class VisitorServiceImpl implements VisitorService
{

	@Autowired
	private VisitorRepository visitorRepository;
	
	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private ArtWorkrepository artWorkrepository;
	
	
	
	@Override
	public String visitorRegistration(Visitor visitor) {
		
		visitorRepository.save(visitor);
		return "Visitor Registered Successfully";
	}


	@Override
	public Visitor checkVisitorLogin(String visitor_email, String visitor_password) {
		return visitorRepository.checkvisitorlogin(visitor_email, visitor_password);
		
	}


	@Override
	public String updateVisitor(Visitor visitor) {
		
		Visitor v = visitorRepository.findById(visitor.getVisitor_id()).get();
		v.setVisitor_fullname(visitor.getVisitor_fullname());
		v.setVisitor_email(visitor.getVisitor_email());
		v.setVisitor_password(visitor.getVisitor_password());
		v.setVisitor_gender(visitor.getVisitor_gender());
		v.setVisitor_contact(visitor.getVisitor_contact());
		v.setVisitor_age(visitor.getVisitor_age());
		
		visitorRepository.save(v);
		return "Visitor Updated Succesfully";
	}


	@Override
	public List<Event> viewAllEvents() {
		return eventRepository.findAll();
	}


	@Override
	public List<ArtWork> ViewAllArt() {
		return (List<ArtWork>) artWorkrepository.findAll();
	}


	@Override
	public ArtWork ViewArt(int artid) {
		return artWorkrepository.findById(artid).get();
	}


	


	


	


	
	
	

	}
