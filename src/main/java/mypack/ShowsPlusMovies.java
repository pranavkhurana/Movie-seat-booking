package mypack;

import java.util.ArrayList;
import java.util.List;

public class ShowsPlusMovies {
	List<Show> showlist;
	List<Movie> movielist;
	public ShowsPlusMovies(List<Show> showlist,List<Movie> movielist){
		this.showlist=showlist;
		this.movielist=movielist;
	}
	public List<Show> getShowlist() {
		return showlist;
	}
	public void setShowlist(List<Show> showlist) {
		this.showlist = showlist;
	}
	public List<Movie> getMovielist() {
		return movielist;
	}
	public void setMovielist(List<Movie> movielist) {
		this.movielist = movielist;
	}
	
}
