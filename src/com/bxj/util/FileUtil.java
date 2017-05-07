package com.bxj.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

public class FileUtil {

	public static void SaveFile(InputStream stream, String path, String filename) throws IOException {
		FileOutputStream fs = null;

		try {
			fs = new FileOutputStream(path + "/" + filename);
			byte[] buffer = new byte[1024 * 1024];
			// int bytesum = 0;
			int byteread = 0;
			while ((byteread = stream.read(buffer)) != -1) {
				// bytesum+=byteread;
				fs.write(buffer, 0, byteread);
				fs.flush();
			}
		} catch (Exception ex) {

		} finally {
			if (fs != null)
				fs.close();
			if (stream != null)
				stream.close();
		}
	}

	public static String encrypt(String str) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = str.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		
		String res = hexValue.toString();
		
		if(hexValue!=null && hexValue.length()>=24){
			res = res.substring(8, 24);
		}
		
		return res;
	}
	
	
	public static String getImgSuffix(String contentType){
		String suffix = "png";
		if(contentType.endsWith("jpeg")){
			suffix = "jpg";
		}else if(contentType.endsWith("png")){
			suffix = "png";
		}else if(contentType.endsWith("gif")){
			suffix = "gif";
		}
		
		return suffix;
	}

}
