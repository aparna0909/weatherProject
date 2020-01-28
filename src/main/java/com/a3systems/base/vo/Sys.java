package com.a3systems.base.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Sys {

	private Double type;
	private Long id;
	private String country;
	private Long sunrise;
	private Long sunset;

	public Double getType() {
		return type;
	}

	public void setType(Double type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Long getSunrise() {
		return sunrise;
	}

	public void setSunrise(Long sunrise) {
		this.sunrise = sunrise;
	}

	public Long getSunset() {
		return sunset;
	}

	public void setSunset(Long sunset) {
		this.sunset = sunset;
	}

	public String getSunriseStr() {
		DateFormat df = new SimpleDateFormat("dd MMM, yyyy hh:mm");
		return df.format(new Date(sunrise * 1000));
	}

	public String getSunsetStr() {
		DateFormat df = new SimpleDateFormat("dd MMM, yyyy hh:mm");
		return df.format(new Date(sunset * 1000));
	}

}
