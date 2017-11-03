package com.ihd.jnp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "intro/ci/download")
public class DownloadController {

	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public void downloadFiles(HttpServletRequest request, HttpServletResponse response) {

		ServletContext context = request.getServletContext();

		File downloadFile = new File("C:/Users/user/git/jnp/Jnp/src/main/webapp/resources/img/jjcnpLogo.png");
		FileInputStream inputStream = null;
		OutputStream outStream = null;

		try {
			inputStream = new FileInputStream(downloadFile);

			response.setContentLength((int) downloadFile.length());
			response.setContentType(
					context.getMimeType("C:/Users/user/git/jnp/Jnp/src/main/webapp/resources/img/jjcnpLogo.png"));

			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			outStream = response.getOutputStream();
			IOUtils.copy(inputStream, outStream);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != inputStream)
					inputStream.close();
				if (null != inputStream)
					outStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}