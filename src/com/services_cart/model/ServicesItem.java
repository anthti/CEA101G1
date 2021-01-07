package com.services_cart.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class ServicesItem implements Serializable{
	private static final long serialVersionUID = 1L;

	public ServicesItem() {
		servicesNo = "";
		price = 0;
		quantity = 0;
		location = "";
		servTime = null;
	}

	private String servicesNo;
	private LocalDateTime servTime;
	private Integer price;
	private Integer quantity;
	private String location;
	
	public String getServicesNo() {
		return servicesNo;
	}
	public void setServicesNo(String servicesNo) {
		this.servicesNo = servicesNo;
	}
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public LocalDateTime getServTime() {
		return servTime;
	}
	public void setServTime(LocalDateTime servTime) {
		this.servTime = servTime;
	}	

}
