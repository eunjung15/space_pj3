package com.sc.spaceCollection.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import org.springframework.stereotype.Component;

@Component
public class Encryption {
	
	//salt 구하는 메서드
	public String getSalt() {
		String salt = "";
		try {
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			salt = new String(Base64.getEncoder().encode(bytes));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return salt;
	}
	
	//salt랑 pwd를 합쳐서 암호화된 hex를 얻는 메서드
	public String getEncryption(String salt, String pwd) {
		String hex = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			String pwdSum = salt + pwd;
			md.update(pwdSum.getBytes());
			hex = String.format("%064x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return hex;
		
	}
}
