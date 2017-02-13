package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import mypack.Show;
import mypack.ShowPlusMoviename;

public class ShowDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	public boolean changeSeatStatus(Show show,String seats[]){
		boolean x=false;
		int showid=show.getShowid();
		
		String seatstatus=show.getSeatstatus();
		StringBuffer sb=new StringBuffer(seatstatus);
		for(int i=0;i<seats.length;i++){
			int index=Integer.parseInt(seats[i]);
			sb.replace(index,index+1,"0");
		}
		String sql="UPDATE shows SET seatstatus='" +sb+ "' WHERE showid="+showid;
		System.out.println(sql);
		if(template.update(sql)>0) return true;
		return x;
	}
	public Show getShowByShowid(String showid){
		String sql="select * from shows where showid="+showid;
		System.out.println(sql);
		return template.query(sql,new ResultSetExtractor<Show>(){
			public Show extractData(ResultSet rs) throws SQLException, DataAccessException {
				rs.next();
				Show s=new Show();
				s.setMovieid(rs.getInt(1));
				s.setDate(rs.getDate(2));
				s.setTime(rs.getTime(3));
				s.setPrice(rs.getInt(4));
				s.setSeatstatus(rs.getString(5));
				s.setShowid(rs.getInt(6));
				return s;
			}
		 });
	}
	public List<Show> getShowsByMovieid(int id) {
		String sql = "select * from shows where movieid ="+id;
		System.out.println(sql);
		return template.query(sql, new ResultSetExtractor<List<Show>>() {
			public List<Show> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<Show> list = new ArrayList<Show>();
				while (rs.next()) {
					Show s = new Show();
					
					s.setMovieid(rs.getInt(1));
					s.setDate(rs.getDate(2));
					s.setTime(rs.getTime(3));
					s.setPrice(rs.getInt(4));
					s.setSeatstatus(rs.getString(5));
					s.setShowid(rs.getInt(6));
					list.add(s);
				}
				return list;
			}
		});
	}
	public List<ShowPlusMoviename> getAllShowsPlusMovienameSorted(){
		String sql="select movieid,date,time,price,seatstatus,showid,name from shows,movie where shows.movieid=movie.id order by movieid,date,time";
		return template.query(sql, new ResultSetExtractor<List<ShowPlusMoviename>>(){
			public List<ShowPlusMoviename> extractData(ResultSet rs) throws SQLException,DataAccessException{
				List<ShowPlusMoviename> list = new ArrayList<ShowPlusMoviename>();
				while (rs.next()) {
					ShowPlusMoviename s = new ShowPlusMoviename();
					s.setMovieid(rs.getInt(1));
					s.setDate(rs.getDate(2));
					s.setTime(rs.getTime(3));
					s.setPrice(rs.getInt(4));
					s.setSeatstatus(rs.getString(5));
					s.setShowid(rs.getInt(6));
					s.setMoviename(rs.getString(7));
					list.add(s);
				}
				return list;
			}
		});
	}
	public void updateShow(Show s){
		String sql="update shows set movieid='"+s.getMovieid()+"',date='"+s.getDate()+"',time='"+s.getTime()+"',price='"+s.getPrice()+"',seatstatus='"+s.getSeatstatus()+"' where showid='"+s.getShowid()+"'";
		template.update(sql);
	}
	public void addShow(Show s){
		String sql="insert into shows (movieid,date,time,price,seatstatus) values ('"+s.getMovieid()+"','"+s.getDate()+"','"+s.getTime()+"','"+s.getPrice()+"','11111111111111111111111111111111111111111111111111111111111111111111111111')";
		template.update(sql);
	}
	public void deleteShowByShowid(int showid){
		String sql="delete from shows where showid ="+showid;
		template.update(sql);
	}
}