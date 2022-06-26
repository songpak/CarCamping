package com.ezen.carCamping.dto;

public class RentalLogDTO {
	private int rental_num;
	private int mem_num;
	private int prod_num;
	private int agency_num;
	private MemberDTO memberDTO;
	private ProductDTO productDTO;
	private AgencyDTO agencyDTO;
	private int rental_productCount;
	private String rental_from;
	private String rental_to;
	private int rental_return;
	private int rental_extend;
	private int rental_notReturn;
	private int rental_price;
	private int rental_usePoint;
	private int rental_extendPrice;
	private int rental_notReturnPrice;
	
	private int cart_prodCount;
	private String cart_from;
	private String cart_to;
	
	public int getCart_prodCount() {
		return cart_prodCount;
	}
	public void setCart_prodCount(int cart_prodCount) {
		this.cart_prodCount = cart_prodCount;
	}
	public String getCart_from() {
		return cart_from;
	}
	public void setCart_from(String cart_from) {
		this.cart_from = cart_from;
	}
	public String getCart_to() {
		return cart_to;
	}
	public void setCart_to(String cart_to) {
		this.cart_to = cart_to;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getAgency_num() {
		return agency_num;
	}
	public void setAgency_num(int agency_num) {
		this.agency_num = agency_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getRental_num() {
		return rental_num;
	}
	public void setRental_num(int rental_num) {
		this.rental_num = rental_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public AgencyDTO getAgencyDTO() {
		return agencyDTO;
	}
	public void setAgencyDTO(AgencyDTO agencyDTO) {
		this.agencyDTO = agencyDTO;
	}
	public int getRental_productCount() {
		return rental_productCount;
	}
	public void setRental_productCount(int rental_productCount) {
		this.rental_productCount = rental_productCount;
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
