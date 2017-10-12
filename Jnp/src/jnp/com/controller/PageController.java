/**
 * (주)오픈잇 | http://www.openit.co.kr
 * Copyright (c)2006-2017, openit Inc.
 * All rights reserved.
 */
package jnp.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 내용 입력
 *
 * @author <a href="mailto:support@openit.co.kr">(주)오픈잇 | openit Inc.</a>
 * @version 
 * @since 
 * @created 2017. 10. 7.
 */

@Controller("page")
public class PageController {

	
	@RequestMapping("/main.do")
	public String mainPage() {
		
		String resUri = "/main";
		return resUri;
		
		
	}
	
}
