package com.example.speed.api.model;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Order {
	private int id;
	private int dmStaffId;
	private BigDecimal totalPrice;
	private int userId;
	private String status;
	private Date createdDatetime;
	private List<FoodOrder> items;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDmStaffId() {
		return dmStaffId;
	}

	public void setDmStaffId(int dmStaffId) {
		this.dmStaffId = dmStaffId;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedDatetime() {
		return createdDatetime;
	}

	public void setCreatedDatetime(Date createdDatetime) {
		this.createdDatetime = createdDatetime;
	}

	public List<FoodOrder> getItems() {
		return items;
	}

	public void setItems(List<FoodOrder> items) {
		this.items = items;
	}

}

