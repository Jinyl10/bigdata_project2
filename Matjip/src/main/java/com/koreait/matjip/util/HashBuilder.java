package com.koreait.matjip.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashBuilder {
	
	public String convertStringToHash(String password) {
		//알고리즘 선택; SHA-256 -64길이
		StringBuffer sb = new StringBuffer();
		
		try {
			MessageDigest digest=MessageDigest.getInstance("SHA-256");
			byte[] hash=digest.digest(password.getBytes("UTF-8")); 
			
			for(int i=0;i<hash.length;i++) {
				String hex = Integer.toHexString(0xff&hash[i]);
				if(hex.length()==1) {
					sb.append("0");
				}
				sb.append(hex);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return sb.toString();
		
	}

}
