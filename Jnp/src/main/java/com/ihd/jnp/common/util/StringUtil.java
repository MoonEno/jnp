package com.ihd.jnp.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

/**
 * 문자열 유틸리티
 */
public class StringUtil {

	/**
	 * Object Null 체크
	 * 
	 * @param s
	 * @return boolean null=true
	 */
	public static boolean isNull(Object obj) {
		return obj == null;
	}

	/**
	 * int 형 Null 체크
	 * 
	 * @param i
	 * @return boolean null=true
	 */
	public static boolean isNull(Integer i) {
		return i == null || i.intValue() <= 0;
	}

	/**
	 * Null 체크
	 * 
	 * @param s
	 * @return
	 */
	public static boolean isNull(String s) {
		return s == null || s.equals("");
	}

	/**
	 * <p>
	 * Checks if a String is empty ("") or null.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isEmpty(null)      = true
	 * StringUtils.isEmpty("")        = true
	 * StringUtils.isEmpty(" ")       = false
	 * StringUtils.isEmpty("bob")     = false
	 * StringUtils.isEmpty("  bob  ") = false
	 * </pre>
	 * <p>
	 * NOTE: This method changed in Lang version 2.0. It no longer trims the String. That functionality is available in
	 * isBlank().
	 * </p>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is empty or null
	 */
	public static boolean isEmpty(String s) {
		return StringUtils.isEmpty(s);
	}

	/**
	 * <p>
	 * Checks if a String is not empty ("") and not null.
	 * </p>
	 * 
	 * <pre>
	 * StringUtils.isNotEmpty(null)      = false
	 * StringUtils.isNotEmpty("")        = false
	 * StringUtils.isNotEmpty(" ")       = true
	 * StringUtils.isNotEmpty("bob")     = true
	 * StringUtils.isNotEmpty("  bob  ") = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is not empty and not null
	 */
	public static boolean isNotEmpty(String s) {
		return StringUtils.isNotEmpty(s);
	}
	
	public static boolean isNotEmpty(Object s) {
		if(s != null)
			return StringUtils.isNotEmpty(String.valueOf(s));
		return false;
	}


	/**
	 * 날짜 문자열 출력
	 * 
	 * @param date
	 * @param format
	 * @return String Date String
	 */
	public static String getDateString(Date date, String format) {
		DateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}

	/**
	 * 브라우저가 HTML로 인식하지 않도록 크다 작다의 부등호를 "&lt;" "&gt;" 로 변경한다.
	 * 
	 * @param value
	 *            문자열
	 * @return 브라우저가 HTML로 인식하지 않도록 수정된 문자열
	 */
	public static String getAgainstHtmlString(String value) {
		if (value == null) return value;
		String returns = "";
		returns = returns.replaceAll("<", "&lt;");
		returns = returns.replaceAll(">", "&gt;");
		return returns;
	}

	/**
	 * left padding
	 * 
	 * @param str
	 *            대상문자열
	 * @param size
	 *            길이
	 * @param padStr
	 *            대체문자
	 * @return 문자열
	 */
	public static String lpad(String str, int size, String padStr) {
		return StringUtils.leftPad(str, size, padStr);

	}

	/**
	 * <p>
	 * Right pad a String with a specified String.
	 * </p>
	 * <p>
	 * The String is padded to the size of <code>size</code>.
	 * </p>
	 * 
	 * <pre>
	 * StringUtil.rpad(null, *, *)      = null
	 * StringUtil.rpad("", 3, "z")      = "zzz"
	 * StringUtil.rpad("bat", 3, "yz")  = "bat"
	 * StringUtil.rpad("bat", 5, "yz")  = "batyz"
	 * StringUtil.rpad("bat", 8, "yz")  = "batyzyzy"
	 * StringUtil.rpad("bat", 1, "yz")  = "bat"
	 * StringUtil.rpad("bat", -1, "yz") = "bat"
	 * StringUtil.rpad("bat", 5, null)  = "bat  "
	 * StringUtil.rpad("bat", 5, "")    = "bat  "
	 * </pre>
	 * 
	 * @param str
	 *            the String to pad out, may be null
	 * @param size
	 *            the size to pad to
	 * @param padStr
	 *            the String to pad with, null or empty treated as single space
	 * @return right padded String or original String if no padding is necessary, <code>null</code> if null String input
	 */
	public static String rpad(String str, int size, String padStr) {
		return StringUtils.rightPad(str, size, padStr);

	}

	/**
	 * 휴대폰번호 마스킹(010-11**-22**)
	 * 
	 * @param mdn
	 * @return
	 */
	public static String getMaskMdn(String mdn) {
        if (mdn == null || "".equals(mdn)) {
        	return "";
        }

        Pattern pattern = Pattern.compile("^(\\d{3})-?(\\d{1,2})\\d{2}-?(\\d{1,2})\\d{2}$");
        Matcher matcher = pattern.matcher(mdn);

        if (matcher.find()) {
        	return matcher.replaceAll("$1-$2**-$3**");
        } else {
        	return "***";
        }
    }

}
