package controllers;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import dao.MovieDao;
import dao.ShowDao;
import mypack.Booking;
import mypack.Movie;
import mypack.Show;

@Controller
public class FirstController {

	@Autowired
	ShowDao showdao;
	@Autowired
	MovieDao moviedao;

	/*
	 * @RequestMapping("/hello") public ModelAndView helloWorld() { String
	 * message = "Hello world"; return new ModelAndView("hellopage", "message",
	 * message); }
	 */
	@RequestMapping("/")
	public ModelAndView index() {
		List<Movie> list = moviedao.getAllMovies();
		return new ModelAndView("index", "list", list);
	}

	@RequestMapping("/choose-slot/{id}")
	public ModelAndView chooseSlot(@PathVariable int id, HttpSession session) {
		List<Show> showlist = showdao.getShowsByMovieid(id);
		session.setAttribute("showlist", showlist);
		return new ModelAndView("choose-slot");
	}

	@RequestMapping("/payment")
	public ModelAndView bookSeats(HttpServletRequest request) {

		String[] seats = request.getParameterValues("seat");
		String showid = request.getParameter("showid");

		Show show = showdao.getShowByShowid(showid);
		int movieid = show.getMovieid();
		Movie movie = moviedao.getMovieById(movieid);

		Booking booking = new Booking();
		booking.setSeats(seats);
		booking.setShow(show);
		booking.setMovie(movie);
		return new ModelAndView("payment-page", "booking", booking);
	}

	@RequestMapping("/print")
	public ModelAndView printTicket(HttpServletRequest request, HttpSession session) {
		Booking b = (Booking) session.getAttribute("booking");
		session.invalidate();
		showdao.changeSeatStatus(b.getShow(), b.getSeats());
		return new ModelAndView("print-ticket", "booking", b);
	}
}