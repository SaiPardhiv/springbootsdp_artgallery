package com.klef.jfsd.springboot.model;


import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="visitor_table")
public class Visitor 
{
	@Id // primary key = unique + not null
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int visitor_id; // Automatically generated identity

    
    @Column(name = "visitor_fullname", nullable = false,length=50)
    private String visitor_fullname; // Full name of the visitor, required field

   
    
    @Column(name = "visitor_email", unique = true, nullable = false,length=50)
    private String visitor_email; // Email of the visitor, required field

    
   
    @Column(name = "visitor_password", nullable = false,length=20)
    private String visitor_password; // Password with at least 8 characters, required field

   
    @Column(name = "visitor_contact",unique = true, nullable = false,length=20)
    private String visitor_contact; // 10 digit contact number, required field

    
    @Column(name = "visitor_gender", nullable = false,length=20)
    private String visitor_gender; // Gender of the visitor, required field

   
    @Column(name = "visitor_age", nullable = false)
    private int visitor_age; // Age of the visitor, required field

   

    @ElementCollection
    @Column(name = "visitor_purchases")
    private List<String> visitor_purchases; // List of purchased paintings, optional field

    @ElementCollection
    @Column(name = "visitor_wishlist")
    private List<String> visitor_wishlist; // List of wish-list items, optional field

    @ElementCollection
    @Column(name = "visitor_participation")
    private List<String> visitor_participation; // List of events participated, optional field

    // Constructor
    public Visitor() {
        this.visitor_purchases = null;        // Set to null by default
        this.visitor_wishlist = null;         // Set to null by default
        this.visitor_participation = null;    // Set to null by default
    }

	public int getVisitor_id() {
		return visitor_id;
	}

	public void setVisitor_id(int visitor_id) {
		this.visitor_id = visitor_id;
	}

	public String getVisitor_fullname() {
		return visitor_fullname;
	}

	public void setVisitor_fullname(String visitor_fullname) {
		this.visitor_fullname = visitor_fullname;
	}

	public String getVisitor_email() {
		return visitor_email;
	}

	public void setVisitor_email(String visitor_email) {
		this.visitor_email = visitor_email;
	}

	public String getVisitor_password() {
		return visitor_password;
	}

	public void setVisitor_password(String visitor_password) {
		this.visitor_password = visitor_password;
	}

	public String getVisitor_contact() {
		return visitor_contact;
	}

	public void setVisitor_contact(String visitor_contact) {
		this.visitor_contact = visitor_contact;
	}

	public String getVisitor_gender() {
		return visitor_gender;
	}

	public void setVisitor_gender(String visitor_gender) {
		this.visitor_gender = visitor_gender;
	}

	public Integer getVisitor_age() {
		return visitor_age;
	}

	public void setVisitor_age(Integer visitor_age) {
		this.visitor_age = visitor_age;
	}

	

	public List<String> getVisitor_purchases() {
		return visitor_purchases;
	}

	public void setVisitor_purchases(List<String> visitor_purchases) {
		this.visitor_purchases = visitor_purchases;
	}

	public List<String> getVisitor_wishlist() {
		return visitor_wishlist;
	}

	public void setVisitor_wishlist(List<String> visitor_wishlist) {
		this.visitor_wishlist = visitor_wishlist;
	}

	public List<String> getVisitor_participation() {
		return visitor_participation;
	}

	public void setVisitor_participation(List<String> visitor_participation) {
		this.visitor_participation = visitor_participation;
	}

	@Override
	public String toString() {
		return "Visitor [visitor_id=" + visitor_id + ", visitor_fullname=" + visitor_fullname + ", visitor_email="
				+ visitor_email + ", visitor_password=" + visitor_password + ", visitor_contact=" + visitor_contact
				+ ", visitor_gender=" + visitor_gender + ", visitor_age=" + visitor_age + ", visitor_purchases=" + visitor_purchases + ", visitor_wishlist="
				+ visitor_wishlist + ", visitor_participation=" + visitor_participation + "]";
	}

	public Visitor(int visitor_id, String visitor_fullname, String visitor_email, String visitor_password,
			String visitor_contact, String visitor_gender, Integer visitor_age,
			List<String> visitor_purchases, List<String> visitor_wishlist, List<String> visitor_participation) {
		super();
		this.visitor_id = visitor_id;
		this.visitor_fullname = visitor_fullname;
		this.visitor_email = visitor_email;
		this.visitor_password = visitor_password;
		this.visitor_contact = visitor_contact;
		this.visitor_gender = visitor_gender;
		this.visitor_age = visitor_age;
		this.visitor_purchases = visitor_purchases;
		this.visitor_wishlist = visitor_wishlist;
		this.visitor_participation = visitor_participation;
	}

}
