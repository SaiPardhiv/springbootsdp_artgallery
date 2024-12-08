package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Curator;


@Repository
public interface CuratorRepository extends JpaRepository<Curator, Integer>
{
	
	@Query("select c from Curator c where c.curator_email=?1 and c.curator_password=?2 ")
	public Curator checkcuratorlogin(String curator_email,String curator_password);

}
