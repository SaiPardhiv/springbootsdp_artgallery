package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.model.Event;
import com.klef.jfsd.springboot.model.Visitor;
import com.klef.jfsd.springboot.repository.CuratorRepository;
import com.klef.jfsd.springboot.repository.EventRepository;

@Service
public class CuratorServiceImpl implements CuratorService
{
	@Autowired
	private CuratorRepository curatorRepository;
	
	@Autowired
	private EventRepository eventRepository;

	@Override
	public String curatorRegistration(Curator curator) {
		curatorRepository.save(curator);
		return "Curator Registered Successfully";
	}

	@Override
	public Curator checkCuratorLogin(String curator_email, String curator_password) {
		return curatorRepository.checkcuratorlogin(curator_email, curator_password);
	}

	@Override
	public String createEvent(Event event) {
		eventRepository.save(event);
		return "Event Created Successfully";
	}

	

	@Override
	public List<Event> viewMyEvents() {
		// TODO Auto-generated method stub
		return eventRepository.findAll();
	}
	

}
