package com.sclk.scwms.common;

import java.io.UnsupportedEncodingException;

public class CodeTransfar {

	/**
	 * Ĭ����utf-8
	 * @param str
	 * @param charset
	 * @param codeName
	 * @return
	 */
	public static String testCharset(String str, String charset,String codeName){
		byte[] bytes = null;
		String str1 = null;
		System.out.print("�ַ���'"+str+"'��unicode�룺");
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
			System.out.print("�ַ���'"+str+"'��'"+charset+"'�룺");
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
		String str = testCharset("ʮ��","unicode","");
		System.out.println(str);
	}}