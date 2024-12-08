package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.ArtWork;
import com.klef.jfsd.springboot.model.Artist;
import com.klef.jfsd.springboot.service.ArtistService;
import com.klef.jfsd.springboot.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ArtistController 
{
	
	 @Autowired
	    private ArtistService artistService;
	 
	 @Autowired
	    private EmailService emailService;
	 
	@GetMapping("artistreg")
    public ModelAndView artistreg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("artistreg");
        return mv;
    }
	
	@GetMapping("artistprofile")
    public ModelAndView artistprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("artistprofile");
        return mv;
    }
	@GetMapping("updateartist")
    public ModelAndView updateartist() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updateartist");
        return mv;
    }
	
	
@GetMapping("artistlogin")
    
    public ModelAndView artistlogin()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("artistlogin");
    	return mv;
    }
@GetMapping("artisthome")

public ModelAndView artisthome()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("artisthome");
	return mv;
}

@GetMapping("artistsessionfail")

public ModelAndView artistsessionfail()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("artistsessionfail");
	return mv;
}

@GetMapping("artistlogout")
public ModelAndView artistlogout(HttpServletRequest request) 
{
    HttpSession session = request.getSession();
    session.removeAttribute("artist");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("artistlogin");
    return mv;  
}

@GetMapping("artistloginfail")

public ModelAndView artistloginfail()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("artistloginfail");
	return mv;
}

@GetMapping("updatesuccess")

public ModelAndView updatesuccess()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("updatesuccess");
	return mv;
}
@GetMapping("artworkmsg")

public ModelAndView artworkmsg()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("artworkmsg");
	return mv;
}

@GetMapping("artworkerror")

public ModelAndView artworkerror()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("artworkerror");
	return mv;
}

@GetMapping("insertart")

public ModelAndView insertart()
{
	ModelAndView mv=new ModelAndView();
	mv.setViewName("insertart");
	return mv;
}
	
	 @PostMapping("/insertartist")
	    public ModelAndView insertartist(HttpServletRequest request) {
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String contact = request.getParameter("contact");
	        int age = Integer.parseInt(request.getParameter("age"));
	        String gender = request.getParameter("gender");
	        int experience = Integer.parseInt(request.getParameter("experience"));
	        String status = "Registered";

	        Artist artist = new Artist();
	        artist.setUsername(username);
	        artist.setEmail(email);
	        artist.setPassword(password);
	        artist.setContact(contact);
	        artist.setAge(age);
	        artist.setGender(gender);
	        artist.setExperience(experience);
	        artist.setStatus(status);

	        String msg = artistService.ArtistRegistration(artist);
	        emailService.sendRegistrationEmail(email);

	        ModelAndView mv = new ModelAndView("artistregsuccess");
	        mv.addObject("message", msg);

	        return mv;
	    }
	 
	 @PostMapping("checkartistlogin")
		public ModelAndView checkartistlogin(HttpServletRequest request)
		{
			
			ModelAndView mv = new ModelAndView();
			String ausername = request.getParameter("ausername");
			String apwd = request.getParameter("apwd");
			Artist artist = artistService.CheckArtistLogin(ausername, apwd);
			if(artist!=null)
			  {
			   HttpSession session = request.getSession();
			   
			   session.setAttribute("artist", artist);
			   
			   
			   mv.setViewName("artisthome");
			  }
			  else {
			   mv.setViewName("artistloginfail");
			   mv.addObject("message", "Login Failed");
			  }
			return mv;
		}
	 
	 @PostMapping("artistupdate")
	    public ModelAndView update(HttpServletRequest request) {
	        String username = request.getParameter("username");
	        String contact = request.getParameter("contact");
	        int age = Integer.parseInt(request.getParameter("age"));
	        int experience = Integer.parseInt(request.getParameter("experience"));
	        String password = request.getParameter("password");
	        String status = request.getParameter("status");


	        Artist artist = new Artist();
	        artist.setUsername(username);
	        artist.setContact(contact);
	        artist.setAge(age);
	        artist.setExperience(experience);
	        artist.setPassword(password);
	        artist.setStatus(status);


	        String updateMessage = artistService.updateartist(artist);

	  
	        ModelAndView modelAndView = new ModelAndView("updatesuccess");
	        modelAndView.addObject("message", updateMessage);
	        return modelAndView;
	    }

	 
	 @PostMapping("/insertart")
	    public ModelAndView insertArt(HttpServletRequest request, @RequestParam("artimage") MultipartFile file) throws Exception {
	        String msg = null;
	        ModelAndView mv = new ModelAndView();

	        try {
	            String title = request.getParameter("title");
	            String artist = request.getParameter("artist");
	            int yearCreated = Integer.parseInt(request.getParameter("yearCreated"));
	            String dimensions = request.getParameter("dimensions");
	            double price = Double.parseDouble(request.getParameter("price"));
	            String status = request.getParameter("status");

	            byte[] bytes = file.getBytes();
	            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	            ArtWork art = new ArtWork();
	            art.setTitle(title);
	            art.setArtist(artist);
	            art.setYearCreated(yearCreated);
	            art.setDimensions(dimensions);
	            art.setPrice(price);
	            art.setStatus(status);
	            art.setImage(blob);
	            // Assuming you have a method to set the image blob in ArtWork class
	            // art.setImage(blob);

	            msg = artistService.artupload(art);
	            System.out.println(msg);
	            mv.setViewName("artworkmsg");
	            mv.addObject("message",msg);
	        } catch(Exception e) {
	            msg = e.getMessage();
	            System.out.println(msg);
	            mv.setViewName("artworkerror");
	            mv.addObject("message",msg);
	        }
	        return mv;
	    }
	 
	 
	 @GetMapping("viewallarts")
	    public ModelAndView viewallarts()
	    {
	 	   List<ArtWork> artlist = artistService.ViewAllArts();
	 	   
	 	   ModelAndView mv = new ModelAndView("viewallarts");
	 	   
	 	   mv.addObject("artlist", artlist);
	 	   
	 	   return mv;
	    }
	   
	    @GetMapping("displayartimage")
	    public ResponseEntity<byte[]> displayartimagedemo(@RequestParam("id") int artwork_id) throws Exception
	    {
	      ArtWork artwork = artistService.ViewArtByID(artwork_id);
	      byte [] imageBytes = null;
	      imageBytes = artwork.getArtImage().getBytes(1,(int) artwork.getArtImage().length());

	      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

	    }
	    
	    @GetMapping("deleteart")
		public String deleteArt(@RequestParam("artworkId") int artworkId) {
			artistService.deleteartwork(artworkId);
			return "redirect:/viewallarts";
		}
	    
	 
	 
}
