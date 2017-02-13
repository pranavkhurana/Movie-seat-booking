package controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import dao.MovieDao;
import dao.ShowDao;
import mypack.Show;

@Controller
public class jsController {

	@Autowired
	ShowDao showdao;
	@Autowired
	MovieDao moviedao;

	/*
	 * @RequestMapping("/hello") public ModelAndView helloWorld() { String
	 * message = "Hello world"; return new ModelAndView("hellopage", "message",
	 * message); }
	 */

	@RequestMapping("/showtimes/{date}")
	public ModelAndView showTimes(@PathVariable String date, HttpSession session) {
		System.out.println(date);
		List<Show> showlist = (List<Show>) session.getAttribute("showlist");
		List<Show> showlist2 = new ArrayList<Show>();
		showlist2.addAll(showlist);
		Iterator<Show> itr = showlist2.iterator();
		while (itr.hasNext()) {
			Show s = itr.next();
			if (!s.getDate().toString().equals(date)) {
				itr.remove();
			}
		}
		session.setAttribute("showlist2", showlist2);
		return new ModelAndView("showtimes");
	}

	@RequestMapping("/showseatstatus/{showid}")
	public ModelAndView showSeatstatus(@PathVariable int showid, HttpSession session) {
		System.out.println(showid);
		List<Show> showlist = (List<Show>) session.getAttribute("showlist");
		Iterator<Show> itr = showlist.iterator();
		Show show = null;
		while (itr.hasNext()) {
			Show s = itr.next();
			if (s.getShowid() == showid) {
				show = s;
				break;
			}
		}
		System.out.println(show.getSeatstatus());
		return new ModelAndView("showseatstatus", "show", show);
	}

}
