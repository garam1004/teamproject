package hopeboard;

import java.util.List;

public class HopeVO {
		
		private int num;
		private String title;
		private String writer;
		private String publisher;
		private String id;
		private int good;
		private List<String> goodlist;
		private boolean check;

		//기본 생성자 (ex : memberVO vo = new memberVO(); 같은 생성자 만들려면 아래와 같이 기본 생성자 만들어야함)
		public HopeVO() {}
		
		public HopeVO(String title, String writer, String publisher, String id) {
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.id = id;
		}
		
		
		//생성자
		public HopeVO(int num, String title, String writer, String publisher, String id) {
			this.num = num;
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
			this.id = id;
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

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public int getGood() {
			return good;
		}

		public void setGood(int good) {
			this.good = good;
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

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		
}