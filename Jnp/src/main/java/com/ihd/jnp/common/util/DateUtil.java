package com.ihd.jnp.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * 날짜 관련 Utility
 */
public class DateUtil {

	/**
	 * 해당 String형식의 날짜를 형식에 맞춰 date형으로 리턴한다.
	 * 
	 * @param dateStr
	 * @param format
	 * @return Date
	 */
	public static Date getDate(String dateStr, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			date = null;
		}

		return date;
	}

	public static String getDateString(String dateStr, String srcFormat, String destFormat) {
		return getDate(getDate(dateStr, srcFormat), destFormat);
	}

	public static String getDate(String format, long lastModified) {
		return getDate(new Date(lastModified), format);
	}

	/**
	 * String형 날짜로 몇일후의 날짜를 리턴.
	 * 
	 * @param dateStr
	 *            yyyyMMdd
	 * @param days
	 *            +5 or -5 로 가능
	 * @param format
	 *            yyyyMMdd
	 * @return
	 */
	public static String getPlusMinusDate(String dateStr, int days, String format) {
		if (dateStr == null || dateStr.length() == 0) { return ""; }

		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(dateStr.substring(0, 4)),
		        Integer.parseInt(dateStr.substring(4, 6)) - 1,
		        Integer.parseInt(dateStr.substring(6, 8)));

		return getPlusMinusDate(cal.getTime(), days, format);
	}

	/**
	 * 날짜의 몇일후의 날짜를 리턴.
	 * default format은 yyyyMMdd
	 * 
	 * @param Date
	 *            date
	 * @param int days +5 or -5 로 가능
	 * @return String
	 */
	public static String getPlusMinusDate(Date date, int days) {
		return getPlusMinusDate(date, days, "yyyyMMdd");
	}

	/**
	 * 날짜의 몇일후의 날짜를 리턴.
	 * 
	 * @param Date
	 *            date
	 * @param int days +5 or -5 로 가능
	 * @param String
	 *            format
	 * @return String
	 */
	public static String getPlusMinusDate(Date date, int days, String pFormat) {
		String format = pFormat;
		Calendar calen = Calendar.getInstance(Locale.KOREAN);
		calen.setTime(date);
		calen.setTimeInMillis(calen.getTimeInMillis() + (60L * 60 * 24 * 1000 * days));
		if (format == null || format.length() == 0) {
			format = "yyyyMMdd";
		}

		return getDate(calen.getTime(), format);
	}

	/**
	 * 두 Date사이의 날짜 차이
	 * 
	 * @param startDate
	 * @param endDate
	 * @return long
	 */
	public static long dayDayTerm(Date startDate, Date endDate) {
		long dayToday = 0;
		dayToday = (endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24);
		return dayToday;
	}

	public static Locale getLocale() {
		return Locale.getDefault();
	}

	public static String getDateFormat() {
	    
		// get the date format from the locale, format it to be 4 digit year
		DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, getLocale());
		String pattern = ((SimpleDateFormat) df).toPattern();
		// some locales (Romanian, Hungarian) have 4 digit years already in their locale, if so, don't do a replacement
		// or we'll end up with way too many y's
		if (pattern.indexOf("yyyy") == -1)
		    pattern = pattern.replaceAll("yy", "yyyy");

		return pattern;
	}

	public static Date getShortDate(String dt) {
		return getDate(dt, getDateFormat());
	}

	public static String getShortDateStr(String dt) {
		return getDate(getDate(dt, getDateFormat()), getDateFormat());
	}

	public static String getShortDate() {
		return getDate(new Date(), getDateFormat());
	}

	public static String getShortDateStr() {
		return getDate(getDateFormat());
	}

	/**
	 * 현재 날짜를 format에 따라
	 * 
	 * @param String
	 *            format
	 * @return String
	 */
	public static String getDate(String format) {
		return getDate((new Date()), format);
	}

	/**
	 * 인자로 넘어온 date를 format에 따라.
	 * 
	 * @param Date
	 *            date
	 * @param String
	 *            format
	 * @return String
	 */
	public static String getDate(Date date, String format) {

		if (date == null)
		    return "";
		return (new SimpleDateFormat(format, getLocale())).format(date);
	}

	/**
	 * weekday 1(일) 2(월) 3(화) 4(수) 5(목) 6(금) 0(토)
	 * 해당 년월의 일자별 요일을 가져온다.
	 * 
	 * @param dateStr
	 *            ex)200511
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String, Comparable> weekDays(String dateStr) {

		Map<String, Comparable> map = new HashMap<String, Comparable>();
		if ((dateStr == null || dateStr.length() == 0) || dateStr.length() < 6) { return map; }

		String yearStr = dateStr.substring(0, 4);
		String monthStr = dateStr.substring(4, 6);

		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, (month - 1), 1);

		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weekday = calendar.get(Calendar.DAY_OF_WEEK);

		for (int i = 1;i <= lastDay;i++) {
			map.put(String.valueOf(i), String.valueOf(weekday % 7));
			weekday++;
		}
		map.put("lastDay", lastDay);

		return map;
	}

	/**
	 * 지정된 날짜가 해당 월의 몇번째 주차에 해당하는지 조회하고 그 값을 반환한다.
	 * 
	 * @param sDate
	 *            날짜 (예: 20040315)
	 * @return 주차에 해당하는 값(1: 1주, 2: 2주, 3: 3주, 4:4주, 5:5주)
	 */
	public static int getWeekth(String sDate) {

		if (sDate == null || sDate.length() != 8)
		    return -1;

		Calendar c = Calendar.getInstance(Locale.KOREA);
		c.set(Integer.parseInt(sDate.substring(0, 4)), Integer.parseInt(sDate.substring(4, 6)) - 1,
		        Integer.parseInt(sDate.substring(6)));

		GregorianCalendar gc = new GregorianCalendar(Locale.KOREA);
		gc.setTime(c.getTime());

		return c.get(Calendar.WEEK_OF_MONTH);
	}

	/**
	 * 해당 년월의 마지막 일자
	 * 
	 * @param yearMonth
	 * @return
	 */
	public static int getLastDay(int year, int month) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, (month - 1), 1);

		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		return lastDay;
	}


	/**
	 * 해당 년월의 마지막 일자 (return String)
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getLastDayStr(int year, int month) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, (month - 1), 1);

		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		String strLastDay = "";

		if(lastDay<10){
			strLastDay = "0"+Integer.toString(lastDay);			
		}else{
			strLastDay = Integer.toString(lastDay);			
		}
		
		return strLastDay;
	}

	/**
	 * YYYYMMDD형식의 날짜를 div 구분자로 나눠서 리턴
	 * 
	 * @param dateTime
	 *            20060704
	 * @param div
	 *            -
	 * @return
	 */
	@SuppressWarnings("unused")
	public static String getParseDateString(String dateTime, String div) {

		if (dateTime == null || dateTime.length() < 8)
		    return dateTime;
		if (dateTime != null) {
			String year = dateTime.substring(0, 4);
			String month = dateTime.substring(4, 6);
			String day = dateTime.substring(6, 8);

			return year + div + month + div + day;
		} else {
			return "";
		}
	}

	@SuppressWarnings("unused")
	public static String getParseDateString(String dateTime) {

		if (dateTime == null || dateTime.length() < 8)
		    return dateTime;
		if (dateTime != null) {
			String year = dateTime.substring(0, 4);
			String month = dateTime.substring(4, 6);
			String day = dateTime.substring(6, 8);

			return year + "/" + month + "/" + day + "";
		} else {
			return "";
		}
	}

	/**
	 * 구분자로 나누어진 date(스트링포맷) 값을 구분자를 제거하여 리턴
	 * @param dateTime
	 * @return yyyyMMdd
	 */
	@SuppressWarnings("unused")
	public static String getDateStrRmvParse(String dateTime){

		if (dateTime == null || dateTime.length() < 10)
		    return dateTime;
		if (dateTime != null) {
			String year = dateTime.substring(0, 4);
			String month = dateTime.substring(5, 7);
			String day = dateTime.substring(8, 10);

			return year + month +day + "";
		} else {
			return "";
		}
		
	}
	
	public static long getDayDistance(String startDate, String endDate) throws Exception {
		return getDayDistance(startDate, endDate, null);
	}

	public static long getDayDistance(String startDate, String endDate, String pFormat)
	        throws Exception {
		String format = pFormat;
		if (format == null)
		    format = "yyyyMMdd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		long day2day = 0L;
		try {
			Date sDate = sdf.parse(startDate);
			Date eDate = sdf.parse(endDate);
			day2day = (eDate.getTime() - sDate.getTime()) / 0x5265c00L;
		} catch (Exception e) {
			throw new Exception("wrong format string");
		}
		return Math.abs(day2day);
	}

	/**
	 * 오늘날짜 리턴
	 * @return (String)yyyyMMdd
	 */
	public static String getToday(){
		
		Date currDate = Calendar.getInstance().getTime();	
		String strDate = DateUtil.getDate(currDate, "yyyyMMdd");
		
		return strDate;
	}
	
	public static boolean isYoonNyun(String strYear){
		int year = Integer.parseInt(strYear);
		
		if( (year % 4 == 0  &&  year % 100 != 0) || year % 400 == 0){
			return true;
		}else return false;
				
	}
}
