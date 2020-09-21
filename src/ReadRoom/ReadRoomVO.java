package ReadRoom;

public class ReadRoomVO {
	private String id;
	private int year;
	private int month;
	private int day;
	private int roomnumber;
	private int reservation;
	public ReadRoomVO() {}
	public ReadRoomVO(String id, int year, int month, int day, int roomnumber, int reservation) {
		super();
		this.id = id;
		this.year = year;
		this.month = month;
		this.day = day;
		this.roomnumber = roomnumber;
		this.reservation = reservation;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getRoomnumber() {
		return roomnumber;
	}
	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
	}
	public int getReservation() {
		return reservation;
	}
	public void setReservation(int reservation) {
		this.reservation = reservation;
	}
}
