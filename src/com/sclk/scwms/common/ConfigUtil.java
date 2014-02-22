package com.sclk.scwms.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ConfigUtil {
	
	public static final String sDate = "2010-01-01";
    
	public static final Date dDate = ConfigUtil.stringToDate("yyyy-MM-dd",sDate);
    
	public static List<String[]> getMonthList(){
		
		List<String[]> monthList = new ArrayList<String[]>();
		
		Date d = new Date();
		
		Calendar sMonth = Calendar.getInstance();
		
		sMonth.setTime(stringToDate("yyyy-MM-dd",sDate));
		
		Calendar eMonth = Calendar.getInstance();
		
		eMonth.setTime(d);
		if(eMonth.get(Calendar.DAY_OF_MONTH) > 20){
			eMonth.add(Calendar.MONTH, 1);
		}
		
		for(;sMonth.before(eMonth);sMonth.add(Calendar.MONTH, 1)){
			
			monthList.add(new String[]{dateToString("yyyyMM",sMonth.getTime()),dateToString("yyyyÄêMMÔÂ",sMonth.getTime())});
			
		}
		
        return monthList;
    }
    
	private static String dateToString(String Patten, Date date){
        String str = null;
        SimpleDateFormat format = null;
        format = new SimpleDateFormat(Patten);
        try{
            str = format.format(date);
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        return str;
    }
	public static Date stringToDate(String Patten, String str)
    {
        Date date = null;
        SimpleDateFormat format = null;
        format = new SimpleDateFormat(Patten);
        try{
        	date = format.parse(str);
        } catch(Exception e){
        	e.printStackTrace();
        }
        return date;
    }
	
	public static void main(String[] args) {
		System.out.println(ConfigUtil.getMonthList());
	}
}
