package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import mypack.Movie;
import mypack.Show;

public class MovieDao {
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}
	public Movie getMovieById(int id){  
		 String sql="select * from movie where id="+id;
		 System.out.println(sql);
		 return template.query(sql,new ResultSetExtractor<Movie>(){
			public Movie extractData(ResultSet rs) throws SQLException, DataAccessException {
				rs.next();
				Movie m=new Movie();
				System.out.println(rs.getInt(1));
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setGenre(rs.getString(3));
				m.setCast(rs.getString(4));
				m.setRating(rs.getFloat(5));
				m.setSynopsis(rs.getString(6));
				m.setReleasedate(rs.getString(7));
				m.setDuration(rs.getString(8));
				m.setPosteraddress(rs.getString(9));
				return m;
			}
		 });
	}
	public List<Movie> getAllMovies(){
		String sql = "select * from movie";
		return template.query(sql, new ResultSetExtractor<List<Movie>>() {
			public List<Movie> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<Movie> list = new ArrayList<Movie>();
				while (rs.next()) {
					Movie m=new Movie();
					m.setId(rs.getInt(1));
					m.setName(rs.getString(2));
					m.setGenre(rs.getString(3));
					m.setCast(rs.getString(4));
					m.setRating(rs.getFloat(5));
					m.setSynopsis(rs.getString(6));
					m.setReleasedate(rs.getString(7));
					m.setDuration(rs.getString(8));
					m.setPosteraddress(rs.getString(9));
					list.add(m);
				}
				return list;
			}
		});
	}
	public void updateMovie(Movie m){
		String sql="update movie set name='"+m.getName()+"',genre='"+m.getGenre()+"',cast='"+m.getCast()+"',rating='"+m.getRating()+"',synopsis='"+m.getSynopsis()+"',releasedate='"+m.getReleasedate()+"',duration='"+m.getDuration()+"',posteraddress='"+m.getPosteraddress()+"' where id='"+m.getId()+"'";
		System.out.println(sql);
		template.update(sql);
	}
	public void addMovie(Movie m){
		String sql="insert into movie (id,name,genre,cast,rating,synopsis,releasedate,duration,posteraddress) values ('"+m.getId()+"','"+m.getName()+"','"+m.getGenre()+"','"+m.getCast()+"','"+m.getRating()+"','"+m.getSynopsis()+"','"+m.getReleasedate()+"','"+m.getDuration()+"','"+m.getPosteraddress()+"')";
		template.update(sql);
	}
	public void deleteMovieById(int id){
		String sql="delete from movie where id ="+id;
		template.update(sql);
	}
}
