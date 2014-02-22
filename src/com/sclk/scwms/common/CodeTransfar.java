package com.sclk.scwms.common;

import java.io.UnsupportedEncodingException;

public class CodeTransfar {

	/**
	 * 默认是utf-8
	 * @param str
	 * @param charset
	 * @param codeName
	 * @return
	 */
	public static String testCharset(String str, String charset,String codeName){
		byte[] bytes = null;
		String str1 = null;
		System.out.print("字符串'"+str+"'的unicode码：");
		for(char a : str.toCharArray()){
			System.out.print("\\u"+Integer.toHexString((int)a));
		}	
		System.out.println("\n");
		try {
			if("".equals(charset)){
				bytes = str.getBytes();
			}else{
				bytes = str.getBytes(charset);
			}	
			System.out.print("字符串'"+str+"'的'"+charset+"'码：");
			for(byte b : bytes){				
				System.out.print(" "+Integer.toHexString(b&0xff));
			}
			System.out.println("\n");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		try {
			if("".equals(codeName)){
				str1 = new String(bytes);
			}else{
				str1 = new String(bytes,codeName);
			}			
			System.out.println("str1:"+str1);
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		return str1;
	}

	public static void main(String[] args) {
		String str = testCharset("十二","unicode","");
		System.out.println(str);
	}}