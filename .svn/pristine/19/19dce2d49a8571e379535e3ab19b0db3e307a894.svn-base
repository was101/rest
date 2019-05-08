package com.rest.controller;

public class Crypt {
	private String AESPassWord = "12345678901234567890123456789012", AESIv = "1234567890123456", en, de, pw = "";

	public String read_AESPassWord() {
		return AESPassWord;
	}

	public String read_AESIv() {
		return AESIv;
	}

	public String read_pw() {
		return pw;
	}

	public String read_en() {
		return en;
	}

	public String read_de() {
		return de;
	}

	public void write_pw(String pw) {
		this.pw = pw;
	}

	public String run_Encrypt(String in) throws Exception {
		en = Encrypt.encrypt(in);
		de = null;
		pw = null;
		return en;
	}

	public String run_decrypt(String in) throws Exception {
		de = Decrypt.decrypt(in);
		en = null;
		pw = null;
		return de;
	}
}
