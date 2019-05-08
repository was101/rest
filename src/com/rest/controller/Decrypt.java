package com.rest.controller;

import org.apache.tomcat.util.codec.binary.Base64;
import javax.crypto.*;
import javax.crypto.spec.*;

public class Decrypt {
	public static String decrypt(String in) throws Exception {
		Crypt crypt = new Crypt();
		System.out.println("in :" + in); // test용
		// 256bit = 32byte ----------AES
		SecretKey clsKey = new SecretKeySpec(crypt.read_AESPassWord().getBytes(), "AES");
		IvParameterSpec clsIV = new IvParameterSpec(crypt.read_AESIv().getBytes());
		Cipher clsCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		// AES end
		clsCipher.init(Cipher.DECRYPT_MODE, clsKey, clsIV);
		byte[] aes_Dec = clsCipher.doFinal(Base64.decodeBase64(in.getBytes("UTF-8"))); // base64 복호화 후 AES256 복호화

		System.out.println("base_Dec :" + new String(Base64.decodeBase64(in.getBytes("UTF-8")))); // test용
		System.out.println("aes_Dec :" + new String(aes_Dec, "UTF-8")); // test용
//		a.write_de(new String(aes_Dec, "UTF-8"));

		return new String(aes_Dec, "UTF-8");
	}
}
