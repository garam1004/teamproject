package myownlibrary;

import java.sql.Date;

public class myownlibraryVO {
	
	//book 컬럼
	private int booknum;
	private String title;
	private String writer;
	private String publisher;
	private String genre;
	private String bookimage;

	// 내서재 컬럼
	private String id;
	private Date rentdate;
	private Date returndate;
	private Date r_returndate;
	private Date resdate;
	private int extension;
	
	
	
	public myownlibraryVO(int booknum, String title, String writer, String publisher, String genre, String bookimage,
			String id, Date rentdate, Date returndate, Date r_returndate, int extension) {
		super();
		this.booknum = booknum;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.genre = genre;
		this.bookimage = bookimage;
		this.id = id;
		this.rentdate = rentdate;
		this.returndate = returndate;
		this.r_returndate = r_returndate;
		this.extension = extension;
	}
	
	
	public myownlibraryVO(String id, int booknum,Date rentdate, Date r_returndate, Date returndate, String title, String writer, String publisher, String genre, String bookimage) {
		super();
		this.booknum = booknum;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.genre = genre;
		this.bookimage = bookimage;
		this.id = id;
		this.rentdate = rentdate;
		this.returndate = returndate;
		this.r_returndate = r_returndate;
		this.resdate = resdate;
	}
	
	
	public myownlibraryVO() {

	}


	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getBookimage() {
		return bookimage;
	}
	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRentdate() {
		return rentdate;
	}
	public void setRentdate(Date rentdate) {
		this.rentdate = rentdate;
	}
	public Date getReturndate() {
		return returndate;
	}
	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}
	public Date getR_returndate() {
		return r_returndate;
	}
	public void setR_returndate(Date r_returndate) {
		this.r_returndate = r_returndate;
	}
	public Date getResdate() {
		return resdate;
	}
	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}	
	public int getExtension() {
		return extension;
	}
	public void setExtension(int extension) {
		this.extension = extension;
	}
	
	

}
