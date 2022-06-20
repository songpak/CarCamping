package com.ezen.carCamping.dto;

public class RentalLogDTO {
	private int rental_num;
	private ProductCartDTO productCartDTO;
	private String rental_from;
	private String rental_to;
	private int rental_return;
	private int rental_extend;
	private int rental_notReturn;
	private int rental_price;
	private int rental_usePoint;
	private int rental_extendPrice;
	private int rental_notReturnPrice;
	
	public int getRental_num() {
		return rental_num;
	}
	public void setRental_num(int rental_num) {
		this.rental_num = rental_num;
	}
	public ProductCartDTO getProductCartDTO() {
		return productCartDTO;
	}
	public void setProductCartDTO(ProductCartDTO productCartDTO) {
		this.productCartDTO = productCartDTO;
	}
	public String getRental_from() {
		return rental_from;
	}
	public void setRental_from(String rental_from) {
		this.rental_from = rental_from;
	}
	public String getRental_to() {
		return rental_to;
	}
	public void setRental_to(String rental_to) {
		this.rental_to = rental_to;
	}
	public int getRental_return() {
		return rental_return;
	}
	public void setRental_return(int rental_return) {
		this.rental_return = rental_return;
	}
	public int getRental_extend() {
		return rental_extend;
	}
	public void setRental_extend(int rental_extend) {
		this.rental_extend = rental_extend;
	}
	public int getRental_notReturn() {
		return rental_notReturn;
	}
	public void setRental_notReturn(int rental_notReturn) {
		this.rental_notReturn = rental_notReturn;
	}
	public int getRental_price() {
		return rental_price;
	}
	public void setRental_price(int rental_price) {
		this.rental_price = rental_price;
	}
	public int getRental_usePoint() {
		return rental_usePoint;
	}
	public void setRental_usePoint(int rental_usePoint) {
		this.rental_usePoint = rental_usePoint;
	}
	public int getRental_extendPrice() {
		return rental_extendPrice;
	}
	public void setRental_extendPrice(int rental_extendPrice) {
		this.rental_extendPrice = rental_extendPrice;
	}
	public int getRental_notReturnPrice() {
		return rental_notReturnPrice;
	}
	public void setRental_notReturnPrice(int rental_notReturnPrice) {
		this.rental_notReturnPrice = rental_notReturnPrice;
	}
}
