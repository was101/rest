package com.rest.VO;

public class DisableVO {

	private int rm_no;
	private int used;
	
	public DisableVO() {
		
	}
	
	public DisableVO(int rm_no, int used) {
		this.rm_no = rm_no;
		this.used = used;
	}

	public int getRm_no() {
		return rm_no;
	}

	public void setRm_no(int rm_no) {
		this.rm_no = rm_no;
	}

	public int getTitle() {
		return used;
	}

	public void setTitle(int used) {
		this.used = used;
	}

	@Override
	public String toString() {
		return "DisableVO [rm_no=" + rm_no + ", used=" + used + "]";
	}
	
}
