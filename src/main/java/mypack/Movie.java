package mypack;

public class Movie implements Comparable<Movie>{
	int id;
	String name;
	String genre;
	float rating;
	String synopsis;
	String releasedate;
	String duration;
	String cast;
	String posteraddress;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getPosteraddress() {
		return posteraddress;
	}
	public void setPosteraddress(String posteraddress) {
		this.posteraddress = posteraddress;
	}
	public int compareTo(Movie m) {
		if(m.rating>rating)return 1;
		else if(m.rating<rating)return -1;
		return 0;
	}

}
