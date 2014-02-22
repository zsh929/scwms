package com.sclk.scwms.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtil {
	private static final Log log = LogFactory.getLog(DateUtil.class);
    
	public static Date stringToDate(String Patten, String str)
    {
        Date date = null;
        SimpleDateFormat format = null;
        format = new SimpleDateFormat(Patten);
        try{
        	if(str == null || str.equals("")){
        		return null;
        	}
        	date = format.parse(str);
        }
        catch(ParseException e)
        {
            log.warn("strToDateParseException::>>" + e.toString());
        }
        catch(Exception e)
        {
            log.warn("strToDatePException::>>" + e.toString());
        }
        return date;
    }

	public static String dateToString(String Patten, Date date)
    {
        String str = null;
        SimpleDateFormat format = null;
        format = new SimpleDateFormat(Patten);
        try
        {
            str = format.format(date);
        }
        catch(Exception e)
        {
            log.warn("dateToStrPException::>>" + e.toString());
        }
        return str;
    }

    public static String datetimeToStr(Date datetime)
    {
        return dateToString("yyyy-MM-dd hh:mm:ss", datetime);
    }

    public static String dayToString(Date day)
    {
        return dateToString("yyyy-MM-dd", day);
    }

    public static Date stringToDate(String str)
    {
        return stringToDate("yyyy-MM-dd", str);
    }

    public static Date stringToDatetime(String str)
    {
        return stringToDate("yyyy-MM-dd hh:mm:ss", str);
    }

    public static Date stringToDateTime(String Patten, String str)
    {
        return stringToDate(Patten, str);
    }

    public static String datetimeToStr(String Patten, Date date)
    {
        return dateToString(Patten, date);
    }
    public static List<Date> getDateList(Date bDate,Date eDate)
    {
    	List<Date> l = new ArrayList();
    	Calendar b = Calendar.getInstance();
		b.setTime(bDate);
		Calendar e = Calendar.getInstance();
		e.setTime(eDate);
		for(;b.before(e);b.add(Calendar.DAY_OF_MONTH,1)){
			
			l.add(b.getTime());
		}
		
    	
        return l;
    }
    /**   
     *   计算两个日期之间的天数   
     *   @param   date1   开始的日期   
     *   @param   date2   结束的日期   
     *   @return   
     */   
    public static int getDays(Date date1,Date date2){   
       //date2应大于date1   
       int   days   =   0;   
       days   =   (int)((date2.getTime()-  date1.getTime())   /   (24   *   60   *   60   *   1000));   
       return   days;   
   }
    
   public static Date getDayOfMonth(Date date,int day,int month){   
	   
	   Calendar b = Calendar.getInstance();
	   b.setTime(date);
	   if(day > 0){
		   b.set(Calendar.DAY_OF_MONTH,day);
	   }
	   if(month != 0){
		   b.add(Calendar.MONTH, month);
	   }
	   return b.getTime();
   }
   public static Date getDate(Date date,int num){   
	   
	   if(date != null){
	   
		   Calendar b = Calendar.getInstance();
		   b.setTime(date);
		  
		   b.add(Calendar.DATE,num);
		   
		   return b.getTime();
	   }
	   
	   return date;
   }
   
   public static Date getDate(Date date,int calendarType,int num){   
	   
	   Calendar b = Calendar.getInstance();
	   b.setTime(date);
	  
	   b.add(calendarType,num);
	   
	   return b.getTime();
   }
   
   public static void main(String[] args) {
	
		//List<Date> l = DateUtil.getDateList(DateUtil.stringToDate("2010-04-07"), DateUtil.stringToDate("2010-05-07"));
		//for(Date d:l){
		//	System.out.println(d.toString());
			
		//}
	   String date ="2013-02";
	   
	   if(DateUtil.stringToDate(date) == null){
			
			date = date + "-01";
		};
		 System.out.println(date);
	   System.out.println(DateUtil.getDate(new Date(),-11));
	
	}
}
