package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Visitor;

@Repository
public interface VisitorRepository extends JpaRepository<Visitor, Integer>
{
	@Query("select v from Visitor v where v.visitor_email=?1 and v.visitor_password=?2 ")
	public Visitor checkvisitorlogin(String visitor_email,String visitor_password);

}
