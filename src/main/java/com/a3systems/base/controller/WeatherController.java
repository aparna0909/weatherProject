package com.a3systems.base.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a3systems.base.vo.Report;
import com.google.gson.Gson;


/**
 * The Class AdminController.
 */
@ControllerAdvice
@Controller
@Aspect
public class WeatherController {

	/** The log. */
	private Logger log = Logger.getLogger(WeatherController.class);

	/**
	 * Home.
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping("/")
	public String home(Model model) {
		log.info("Enter Inside home method");
		return "index";
	}

	/**
	 * Fetch weather report.
	 *
	 * @param cityName the city name
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping("/fetchWeatherReport")
	public String fetchWeatherReport(@RequestParam String cityName, Model model) {
		log.info("Enter inside fetchWeatherReport method city name -  " + cityName);
		try {
			Report res = new Gson().fromJson(getWeatherResponse(cityName), Report.class);
			model.addAttribute("response", res);
		} catch (Exception e) {
			log.error("Exception occurred city name -" + cityName , e);
		}
		log.info("Returning from fetchWeatherReport method city name -  " + cityName);
		return "report";
	}

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
	
}
