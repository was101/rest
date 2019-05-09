package com.rest.controller;

import org.apache.tomcat.util.codec.binary.Base64;
import javax.crypto.*;
import javax.crypto.spec.*;

public class Encrypt 
{
	public static String encrypt(String in, String AESPassWord, String AESIv ) throws Exception
	{
		Crypt start = new Crypt();
		start.write_pw(in);
		// 256bit = 32byte  ----------AES
		SecretKey clsKey = new SecretKeySpec( AESPassWord.getBytes(), "AES" );
		IvParameterSpec clsIV = new IvParameterSpec( AESIv.getBytes() );
		Cipher clsCipher = Cipher.getInstance( "AES/CBC/PKCS5Padding" );
		//AES end
		clsCipher.init( Cipher.ENCRYPT_MODE, clsKey, clsIV );
		byte[] aes_Enc = clsCipher.doFinal(start.read_pw().getBytes("UTF-8"));	//AES256 암호화

		return new String(Base64.encodeBase64(aes_Enc), "UTF-8");	//base64 암호화 후 리턴
	}
}
