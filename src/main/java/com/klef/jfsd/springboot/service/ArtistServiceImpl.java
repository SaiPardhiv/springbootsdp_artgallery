package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Artist;
import com.klef.jfsd.springboot.repository.ArtWorkrepository;
import com.klef.jfsd.springboot.repository.ArtistRepository;

@Service
public class ArtistServiceImpl implements ArtistService{
	
	@Autowired
    private ArtistRepository artistRepository;
	
	@Autowired
	private ArtWorkrepository artWorkrepository;

	@Override
	public String ArtistRegistration(Artist artist) {
		artistRepository.save(artist);
        return "Artist Registered Successfully";
	}

	@Override
	public Artist CheckArtistLogin(String username, String password) {
		return artistRepository.CheckArtistLogin(username, password);
	}

	@Override
	public String updateartist(Artist a) {
		Artist at = artistRepository.findById(a.getUsername()).get();
		at.setContact(a.getContact());
		at.setAge(a.getAge());
		at.setExperience(a.getExperience());
		at.setPassword(a.getPassword());
		at.setStatus(a.getStatus());
		
		artistRepository.save(at);
		return "Artist Updated Succefully";
	}


	@Override
	public String artupload(ArtWork aw) {
		artWorkrepository.save(aw);
		return "Art Uploaded Successfully";
	}

	@Override
	public List<ArtWork> ViewAllArts() {
		return (List<ArtWork>) artWorkrepository.findAll();
	}

	@Override
	public ArtWork ViewArtByID(int artid) {
		return artWorkrepository.findById(artid).get();
	}

	@Override
	public String deleteartwork(int artworkId) {
		artWorkrepository.deleteById(artworkId);
		return "Artwork Deleted Successfully";
	}

}
