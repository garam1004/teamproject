package bookboard;

import java.sql.Date;
import java.util.List;

public class BookVO {

		//변수선언
		private int booknum;
		private String title;
		private String writer;
		private String publisher;
		private String genre;
		private int rentcount;
		private String bookimage;
		private String id;
		private Date rentdate;
		private Date returndate;
		private Date publishdate;
		private Date resdate;
		private boolean check;
		private int good;
		private List<String> goodlist;
		
		//기본 생성자 (ex : memberVO vo = new memberVO(); 같은 생성자 만들려면 아래와 같이 기본 생성자 만들어야함)
		public BookVO() {}
		
		//생성자
		public BookVO(int booknum, String title, String writer, String publisher, String genre, 
				int rentcount, String bookimage, Date publishdate) {
			this.booknum = booknum;
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.genre = genre;
			this.rentcount = rentcount;
			this.bookimage = bookimage;
			this.publishdate = publishdate;
		}
		
		public BookVO(String title, String writer, String publisher, String genre, String bookimage) {
			super();
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.genre = genre;
			this.bookimage = bookimage;
		}

		//생성자
		public BookVO(int booknum, String title, String writer, String publisher, String genre,
				int rentcount, String bookimage, String id, Date publishdate, Date rentdate, Date returndate,
				Date resdate) {
			super();
			this.booknum = booknum;
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.genre = genre;
			this.rentcount = rentcount;
			this.bookimage = bookimage;
			this.id = id;
			this.rentdate = rentdate;
			this.returndate = returndate;
			this.publishdate = publishdate;
			this.resdate = resdate;
		}

		public boolean isCheck() {
			return check;
		}

		public void setCheck(boolean check) {
			this.check = check;
		}
		
		public List<String> getGoodlist() {
			return goodlist;
		}

		public void setGoodlist(List<String> goodlist) {
			this.goodlist = goodlist;
		}

		public int getGood() {
			return good;
		}

		public void setGood(int good) {
			this.good = good;
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

		public int getRentcount() {
			return rentcount;
		}
		public void setRentcount(int rentcount) {
			this.rentcount = rentcount;
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
		public Date getPublishdate() {
			return publishdate;
		}

		public void setPublishdate(Date publishdate) {
			this.publishdate = publishdate;
		}

		public Date getResdate() {
			return resdate;
		}

		public void setResdate(Date resdate) {
			this.resdate = resdate;
		}
		
		

}
