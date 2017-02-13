package controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.MovieDao;
import dao.ShowDao;
import mypack.Movie;
import mypack.Show;
import mypack.ShowPlusMoviename;
import mypack.ShowsPlusMovies;

@Controller
public class AdminController {

	@Autowired
	ShowDao showdao;
	@Autowired
	MovieDao moviedao;

	/*@RequestMapping("/hello")
	public ModelAndView helloWorld() {
		String message = "Hello world";
		return new ModelAndView("admin", "message", message);
	}*/
	@RequestMapping("/admin")
	public ModelAndView adminHome() {
		String message = "Hello world";
		return new ModelAndView("admin-home", "message", message);
	}
	@RequestMapping("/admin/movies")
	public ModelAndView adminMovies() {
		List<Movie> movielist = moviedao.getAllMovies();
		return new ModelAndView("admin-movies","movielist",movielist);
	}
	@RequestMapping("/admin/shows")
	public ModelAndView adminShows() {
		List<ShowPlusMoviename> showlist = showdao.getAllShowsPlusMovienameSorted();
		return new ModelAndView("admin-shows","showlist",showlist);
	}
	@RequestMapping("/admin/shows/edit")
	public String adminShowsEdit(@ModelAttribute Show s,HttpServletRequest request) {
		String timestring=request.getParameter("timestring");
		Time time=toSqlTime(timestring);
		s.setTime(time);
		showdao.updateShow(s);
		return "redirect:/admin/shows";
	}
	@RequestMapping("/admin/shows/add")
	public String adminShowsAdd(@ModelAttribute Show s,HttpServletRequest request) {
		
		//code to convert html time into sql time
		String timestring=request.getParameter("timestring");
		Time time=toSqlTime(timestring);
		s.setTime(time);
		showdao.addShow(s);
		return "redirect:/admin/shows";
	}
	@RequestMapping("/admin/shows/delete/{showid}")
	public String adminShowsEdit(@PathVariable int showid){
		showdao.deleteShowByShowid(showid);
		return "redirect:/admin/shows";
	}
	@RequestMapping("/admin/movies/edit")
	public String adminMoviesEdit(@ModelAttribute Movie m,HttpServletRequest request) {
		moviedao.updateMovie(m);
		return "redirect:/admin/movies";
	}
	@RequestMapping("/admin/movies/add")
	public String adminMoviesAdd(@ModelAttribute Movie m) {		
		moviedao.addMovie(m);
		return "redirect:/admin/movies";
	}
	@RequestMapping("/admin/movies/delete/{id}")
	public String adminMoviesEdit(@PathVariable int id) {
		moviedao.deleteMovieById(id);
		return "redirect:/admin/movies";
	}
	@RequestMapping(value="/admin/savefile",method=RequestMethod.POST)  
	public ModelAndView upload(@RequestParam CommonsMultipartFile file,HttpSession session){  
	        String path=session.getServletContext().getRealPath("/");  
	        String filename=file.getOriginalFilename();  
	          
	        System.out.println(path+"resources\\Images\\   "+filename);  
	        try{  
	        byte barr[]=file.getBytes();  
	          
	        BufferedOutputStream bout=new BufferedOutputStream(  
	                 new FileOutputStream(path+"resources\\images\\"+filename));  
	        bout.write(barr);  
	        bout.flush();  
	        bout.close();  
	          
	        }catch(Exception e){System.out.println(e);}  
	        return new ModelAndView("upload-success","filename",path+"resources\\images\\"+filename);  
	}  
	
	Time toSqlTime(String timestring){
		Time time=null;
		try {
		    //SimpleDateFormat format = new SimpleDateFormat("hh:mm a"); //if 24 hour format
		    // or
		    SimpleDateFormat format = new SimpleDateFormat("HH:mm"); // 12 hour format
		    java.util.Date d1 =(java.util.Date)format.parse(timestring);
		    time = new java.sql.Time(d1.getTime()); 
		    
		}catch(Exception e) {
			System.out.println(e);
		}
		return time;
	}
	
}