package com.rest.controller;

import org.apache.tomcat.util.codec.binary.Base64;
import javax.crypto.*;
import javax.crypto.spec.*;

public class Encrypt extends Crypt {
//	String pw, String PassWord, String Iv
	public static String encrypt(String in) throws Exception {
		Crypt crypt = new Crypt();
		crypt.write_pw(in);
		System.out.println("in :" + in); // test용
		// 256bit = 32byte ----------AES
		SecretKey clsKey = new SecretKeySpec(crypt.read_AESPassWord().getBytes(), "AES");
		IvParameterSpec clsIV = new IvParameterSpec(crypt.read_AESIv().getBytes());
		Cipher clsCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		// AES end
		clsCipher.init(Cipher.ENCRYPT_MODE, clsKey, clsIV);
		byte[] aes_Enc = clsCipher.doFinal(crypt.read_pw().getBytes("UTF-8")); // AES256 암호화

		System.out.println("aes_Enc :" + new String(aes_Enc, "UTF-8")); // test용
		System.out.println("base_Enc :" + new String(Base64.encodeBase64(aes_Enc), "UTF-8")); // test용
//		a.write_en(new String(Base64.encodeBase64(aes_Enc), "UTF-8"));

		return new String(Base64.encodeBase64(aes_Enc), "UTF-8"); // base64 암호화 후 리턴
	}
}
