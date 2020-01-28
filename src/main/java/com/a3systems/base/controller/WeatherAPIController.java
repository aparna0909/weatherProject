package com.a3systems.base.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.a3systems.base.vo.Report;
import com.google.gson.Gson;

/**
 * The Class AdminController.
 */
@ControllerAdvice
@RestController
@Aspect
public class WeatherAPIController {

	/** The log. */
	private Logger log = Logger.getLogger(WeatherAPIController.class);

	/**
	 * Gets the weather response.
	 *
	 * @param cityName the city name
	 * @return the weather response
	 * @throws Exception the exception
	 */
	private String getWeatherResponse(String cityName) throws Exception {
		URL url = new URL("https://api.openweathermap.org/data/2.5/weather?q=" + cityName
				+ "&appid=e9ff165060ff2f43dff32789decbcd1a");
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setConnectTimeout(20000);
		con.setReadTimeout(300000);
		BufferedReader rb = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String str = "";
		StringBuilder response = new StringBuilder();
		while ((str = rb.readLine()) != null) {
			response.append(str);

		}
		con.disconnect();
		rb.close();
		log.info("Response: " + response.toString());
		return response.toString();
	}

	@RequestMapping(value = "/api/weather", method = RequestMethod.GET)
	public List<Report> weatherReport(@RequestParam String q) {
		log.info("Enter inside weatherReport method city name -  " + q);
		String cityArray[] = q.split(",");
		List<Report> list = new ArrayList<>();
		for (String name : cityArray) {
			try {

				Report res = new Gson().fromJson(getWeatherResponse(name), Report.class);
				list.add(res);

			} catch (Exception e) {
				log.error("Exception occurred city name -" + q, e);
			}
		}
		log.info("Returning from weatherReport method city name -  " + q);
		return list;
	}

}
