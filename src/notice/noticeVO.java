package notice;

import java.sql.Timestamp;

public class noticeVO {
	private String id;
	private Timestamp insertdate;
	private String comment;

	public noticeVO() {}
	
	public noticeVO(String id, Timestamp insertdate, String comment) {
		this.id = id;
		this.insertdate = insertdate;
		this.comment = comment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(Timestamp insertdate) {
		this.insertdate = insertdate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
