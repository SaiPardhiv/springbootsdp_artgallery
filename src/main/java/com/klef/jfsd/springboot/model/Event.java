package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "event_table")
public class Event 
{
	
	@Id // primary key = unique + not null
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int event_id;
	@Column(name = "event_name", nullable = false,length=50)
	private String event_name;
	@Column(name = "event_curator", nullable = false,length=50)
	private String event_curator;
	@Column(name = "event_limit", nullable = false)
	private int event_limit;
	@Column(name = "event_description", nullable = false,length=500)
	private String event_description;
	@Column(name = "event_startdate", nullable = false,length=20)
	private String event_startdate;
	@Column(name = "event_enddate", nullable = false,length=20)
	private String event_enddate;
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_curator() {
		return event_curator;
	}
	public void setEvent_curator(String event_curator) {
		this.event_curator = event_curator;
	}
	public int getEvent_limit() {
		return event_limit;
	}
	public void setEvent_limit(int event_limit) {
		this.event_limit = event_limit;
	}
	public String getEvent_description() {
		return event_description;
	}
	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}
	public String getEvent_startdate() {
		return event_startdate;
	}
	public void setEvent_startdate(String event_startdate) {
		this.event_startdate = event_startdate;
	}
	public String getEvent_enddate() {
		return event_enddate;
	}
	public void setEvent_enddate(String event_enddate) {
		this.event_enddate = event_enddate;
	}
	public Event() {
		super();
		this.event_id = event_id;
		this.event_name = event_name;
		this.event_curator = event_curator;
		this.event_limit = event_limit;
		this.event_description = event_description;
		this.event_startdate = event_startdate;
		this.event_enddate = event_enddate;
	}

}
