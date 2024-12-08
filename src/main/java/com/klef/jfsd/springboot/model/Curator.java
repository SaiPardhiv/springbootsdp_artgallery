package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "curator_table")
public class Curator 
{
	@Id // primary key = unique + not null
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int curator_id;
	@Column(name = "curator_fullname", nullable = false,length=50)
	private String curator_fullname;
	@Column(name = "curator_company", nullable = false,length=50)
	private String curator_company;
	@Column(name = "curator_email", unique = true, nullable = false,length=50)
	private String curator_email;
	@Column(name = "curator_password", nullable = false,length=20)
	private String curator_password;
	@Column(name = "curator_contact",unique = true, nullable = false,length=20)
	private String contact;
	public int getCurator_id() {
		return curator_id;
	}
	public void setCurator_id(int curator_id) {
		this.curator_id = curator_id;
	}
	public String getCurator_fullname() {
		return curator_fullname;
	}
	public void setCurator_fullname(String curator_fullname) {
		this.curator_fullname = curator_fullname;
	}
	public String getCurator_company() {
		return curator_company;
	}
	public void setCurator_company(String curator_company) {
		this.curator_company = curator_company;
	}
	public String getCurator_email() {
		return curator_email;
	}
	public void setCurator_email(String curator_email) {
		this.curator_email = curator_email;
	}
	public String getCurator_password() {
		return curator_password;
	}
	public void setCurator_password(String curator_password) {
		this.curator_password = curator_password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Curator() {
		super();
		this.curator_id = curator_id;
		this.curator_fullname = curator_fullname;
		this.curator_company = curator_company;
		this.curator_email = curator_email;
		this.curator_password = curator_password;
		this.contact = contact;
	}
	

}
