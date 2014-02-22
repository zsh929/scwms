package com.sclk.scwms.common;

import java.util.ArrayList;
import java.util.regex.Pattern;

import com.sclk.scwms.model.Users;

public class StringUtil {
	
	public static final Integer stringToInteger(String str) {
		
		Pattern pattern = Pattern.compile("[0-9]*"); 
		
		if(str != null && !str.equals("") && pattern.matcher(str).matches()){
			return Integer.parseInt(str);
		}
		return null;
	}
	public static final Short stringToShort(String str) {
		
		Pattern pattern = Pattern.compile("[0-9]*"); 
		
		if(str != null && !str.equals("") && pattern.matcher(str).matches()){
			return Short.parseShort(str);
		}
		return null;
	}
	public static final Float stringToFloat(String str) {
		
		Pattern pattern = Pattern.compile("-?[0-9]*\\.?[0-9]*"); 
		
		if(str != null && !str.equals("") && pattern.matcher(str).matches()){
			return Float.parseFloat(str);
		}
		return null;
	}
	public static final boolean stringToBoolean(String str) {
		
		if(str == null || str.equals("")){
			return false;
			
		}
		
		if(str.equals("t") ||  str.equals("true") || str.equals("1")){
			return true;
		}
		if(str.equals("f") ||  str.equals("false") || str.equals("0")){
			return false;
		}
		return false;
	}
	public static void main(String[] args) {
		
		System.out.println(StringUtil.stringToFloat("73345.56745"));
		ArrayList<Users> list = new ArrayList();
		Users u = new Users();
		u.setAddress("aasdf");
		list.add(u);
		
		Users u1 = new Users();
		u1.setAddress("11111111111");
		
		u = u1;
		
		//list.get(0).setAddress("11234123412341234");
		
		
		
	}
}
