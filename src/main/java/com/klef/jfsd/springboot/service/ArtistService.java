package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Artist;

public interface ArtistService 
{
	public String ArtistRegistration(Artist artist);
	public Artist CheckArtistLogin(String username,String password);
	public String updateartist(Artist a);
	public String deleteartwork(int artworkId);

	
	public String artupload(ArtWork aw);
	public List<ArtWork> ViewAllArts();
	public ArtWork ViewArtByID(int artid);
}
