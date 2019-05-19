package com.rest.VO;

public class ReservationVO {

	private int rm_id;
	private String time;
	private int rm_no;
	private String nickname;
	
	public ReservationVO() {
		super();
	}
	public ReservationVO(int rm_id, String time, int rm_no, String nickname) {
		super();
		this.rm_id = rm_id;
		this.time = time;
		this.rm_no = rm_no;
		this.nickname = nickname;
	}
	public int getRm_id() {
		return rm_id;
	}
	public void setRm_id(int rm_id) {
		this.rm_id = rm_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getRm_no() {
		return rm_no;
	}
	public void setRm_no(int rm_no) {
		this.rm_no = rm_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String toString() {
		return "{" + "id : " + getRm_id() + ", " + getTime() + "}";
	}
	
}
