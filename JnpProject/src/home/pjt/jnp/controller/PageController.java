package home.pjt.jnp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller(value="page")
public class PageController {

	@RequestMapping(value="/mainPage")
	public String welcomePage() {
		
		String resUrl = "main";
		System.out.println("test123");
		return resUrl;
	}
}
