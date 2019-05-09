package com.rest.controller;

public class Crypt
{
	private String AESPassWord, AESIv, en, en2, de, de2, pw;
	public String read_AESPassWord()
	{
		return AESPassWord;
	}
	public String read_AESIv()
	{
		return AESIv;
	}
	public String read_pw()
	{
		return pw;
	}
	public String read_en()
	{
		return en;
	}
	public String read_en2()
	{
		return en2;
	}
	public String read_de()
	{
		return de;
	}
	public String read_de2()
	{
		return de2;
	}
	public void write_pw(String pw)
	{
		this.pw = pw;
	}

	public String run_Encrypt(String in) 
	{
		try
		{
			en = Encrypt.encrypt(in,"12345678901234567890123456789012", "1234567890123456");
			de = null;
			de2 = null;
			pw = null;
			en2 = Encrypt.encrypt(en, "98798798798789789799789798789798", "8784516546549949");
			en = null;
			de = null;
			de2 = null;
			pw = null;
		} catch (Exception e)
		{
			System.out.println("Security error");
		}
		return en2;
	}
	
	public String run_decrypt(String in)
	{
		try
		{
			de = Decrypt.decrypt(in, "98798798798789789799789798789798", "8784516546549949");
			en = null;
			en2 = null;
			pw = null;
			de2 = Decrypt.decrypt(de, "12345678901234567890123456789012", "1234567890123456");
			en = null;
			en2 = null;
			pw = null;
			de = null;
		} catch (Exception e)
		{
			System.out.println("Security error");
		}
		return de2;
	}
}
