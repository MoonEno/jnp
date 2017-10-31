package com.ihd.jnp.common.util;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.ihd.jnp.common.util.DateUtil;
import com.ihd.jnp.common.util.StringUtil;

public class LoginUtil {
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginUtil.class);

	/**
	 * 인증번호 생성
	 * @return 인증번호(4자리)
	 * @throws Exception
	 */
	public String authNoGenerator() throws Exception{
		String authNo="";

		Random ram = new Random();
		try{
			authNo = String.valueOf( ram.nextInt(9999) );
		} catch ( NumberFormatException e ) {
			e.printStackTrace();
			logger.error("[authNoGenerator]"+e);
		}
		
		if( authNo.length() < 4 ){
			for(int i = authNo.length() ; i < 4 ; i ++) { 
				authNo = "0"+authNo;
			}
		}
		return authNo;
	}
	
	/**
	 * 랜덤밸류 생성 ( for 보안 )
	 * 16자리
	 * @return
	 * @throws Exception
	 */
	public String ranValueGenerator() throws Exception{
		String randomValue = "";
		
		String randomPool[] =  {"1","2","3","4","5","6","7","8","9","0",
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
		int tmpIndex = 0;
		
		for(int i=0 ; i < 16; i++){
			tmpIndex = (int) ((Math.random() * randomPool.length) + 0);
			randomValue = randomValue+randomPool[tmpIndex];
		}
		
		return randomValue;
	}

	/**
	 * 랜덤밸류 생성 (생성하고자 하는 size를 파라미터로 받아서 생성)
	 * @param size
	 * @return
	 * @throws Exception
	 */
	public static String ranValueGenerator(int size) throws Exception{
		String randomValue = "";
		
		String randomPool[] =  {"1","2","3","4","5","6","7","8","9","0",
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
		int tmpIndex = 0;
		
		for(int i=0 ; i < size ; i++){
			tmpIndex = (int) ((Math.random() * randomPool.length) + 0);
			randomValue = randomValue+randomPool[tmpIndex];
		}
		
		return randomValue;
	}
	
	/**
	 * 생년월일 및 주민번호 뒷자리 중 맨 앞자리를 받아서 나이 유형 return
	 * @param birthDt
	 * @param genderFlag
	 * @return
	 */
	public String ageCheck(String birthDt, String genderFlag){
		String ageType = "";
		String today = DateUtil.getToday();
		if(birthDt.length()==6){
			if(genderFlag.equals("1")||genderFlag.equals("2")||genderFlag.equals("5")||genderFlag.equals("6")){	//1900년대 출생자
				birthDt = "19"+birthDt;
			}else if( genderFlag.equals("3")||genderFlag.equals("4")||genderFlag.equals("7")||genderFlag.equals("8") ){	//2000년대 출생자
				birthDt = "20"+birthDt;			
			}else if( genderFlag.equals("9")||genderFlag.equals("0")){	//1800년대 출생자
				birthDt = "18"+birthDt;			
			}
			
		}
		
		double age = (Integer.parseInt(today) - Integer.parseInt(birthDt))/10000;
		
		if( age < 19 ) 			ageType = "0x19";
		else if( age < 25)		ageType = "1924";
		else if( age > 65 ) 	ageType = "0x65";
		else 					ageType = "0x00";
		
		return ageType;
		
	}
	
	public String getSexType(String genderFlag){
		//홀수이면 남자(M) 짝수이면 여자(F)
		
		if( Integer.parseInt(genderFlag) % 2 != 0) 	
			return "M";
		else 										
			return "F";
	}

	public  String getGaAgeType (String birthDt, String genderFlag){

		String ageType = "";
		String today = DateUtil.getToday();

		if(birthDt.length()==6){
			//csp에서는 birthday가 8자리로 오므로, length check 하여 판단
			if(genderFlag.equals("1")||genderFlag.equals("2")||genderFlag.equals("5")||genderFlag.equals("6")){	//1900년대 출생자
				birthDt = "19"+birthDt;
			}else if( genderFlag.equals("3")||genderFlag.equals("4")||genderFlag.equals("7")||genderFlag.equals("8") ){	//2000년대 출생자
				birthDt = "20"+birthDt;			
			}else if( genderFlag.equals("9")||genderFlag.equals("0")){	//1800년대 출생자
				birthDt = "18"+birthDt;			
			}
		}
		
		double age = (Integer.parseInt(today) - Integer.parseInt(birthDt))/10000;
		
		if( age < 20 ) 			ageType = "10대";
		else if( age < 30)		ageType = "20대";
		else if( age < 40)		ageType = "30대";
		else if( age < 50)		ageType = "40대";
		else if( age < 60)		ageType = "50대";
		else 					    ageType = "60대";
		
		return ageType;
		
	}

	public  String getGaSexType (String genderFlag){

		if(Integer.parseInt(genderFlag)%2==1){
			return "남성";
		}else{
			return "여성";
		}
	}
}
