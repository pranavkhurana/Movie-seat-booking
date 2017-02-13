package mypack;

import java.sql.Date;
import java.sql.Time;

public class Show implements Comparable<Show>{
	int showid;
	int movieid;
	Date date;
	Time time;
	int price;
	String seatstatus;
	
	public int getShowid() {
		return showid;
	}
	public void setShowid(int showid) {
		this.showid = showid;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public int getMovieid() {
		return movieid;
	}
	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeatstatus() {
		return seatstatus;
	}
	public void setSeatstatus(String seatstatus) {
		this.seatstatus = seatstatus;
	}
	public int compareTo(Show s) {
		if(s.getDate().after(date))return -1;
		else if(s.getDate().before(date))return 1;
		return 0;
	}

}
