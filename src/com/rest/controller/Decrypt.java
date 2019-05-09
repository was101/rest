package com.rest.controller;

import org.apache.tomcat.util.codec.binary.Base64;
import javax.crypto.*;
import javax.crypto.spec.*;

public class Decrypt {
	public static String decrypt(String in, String AESPassWord, String AESIv) throws Exception
	{
		// 256bit = 32byte  ----------AES
		SecretKey clsKey = new SecretKeySpec( AESPassWord.getBytes(), "AES" );
		IvParameterSpec clsIV = new IvParameterSpec( AESIv.getBytes() );
		Cipher clsCipher = Cipher.getInstance( "AES/CBC/PKCS5Padding" );
		//AES end
		clsCipher.init( Cipher.DECRYPT_MODE, clsKey, clsIV );
		byte[] aes_Dec = clsCipher.doFinal(Base64.decodeBase64(in.getBytes("UTF-8")));	//base64 복호화 후 AES256 복호화
		
		return new String(aes_Dec, "UTF-8"); 
	}
}
