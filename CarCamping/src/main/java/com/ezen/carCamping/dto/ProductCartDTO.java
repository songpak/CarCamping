package com.ezen.carCamping.dto;

public class ProductCartDTO {
	private int prod_num;
	private int mem_num;
	private int cart_num;
	private MemberDTO memberDTO;
	private ProductDTO productDTO;
	private AgencyDTO agencyDTO;
	private int cart_prodCount;
	private String cart_from;
	private String cart_to;
	private String prod_viewImage1;
	private String prod_viewImage2;
	private String prod_viewImage3;
	private String prod_viewImage4;
	private String prod_viewImage5;
	private String prod_name;
	private int prod_price;
	private String agency_name;
	private int agency_num;
	
	
	public int getAgency_num() {
		return agency_num;
	}
	public void setAgency_num(int agency_num) {
		this.agency_num = agency_num;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agency_name) {
		this.agency_name = agency_name;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getProd_viewImage1() {
		return prod_viewImage1;
	}
	public void setProd_viewImage1(String prod_viewImage1) {
		this.prod_viewImage1 = prod_viewImage1;
	}
	public String getProd_viewImage2() {
		return prod_viewImage2;
	}
	public void setProd_viewImage2(String prod_viewImage2) {
		this.prod_viewImage2 = prod_viewImage2;
	}
	public String getProd_viewImage3() {
		return prod_viewImage3;
	}
	public void setProd_viewImage3(String prod_viewImage3) {
		this.prod_viewImage3 = prod_viewImage3;
	}
	public String getProd_viewImage4() {
		return prod_viewImage4;
	}
	public void setProd_viewImage4(String prod_viewImage4) {
		this.prod_viewImage4 = prod_viewImage4;
	}
	public String getProd_viewImage5() {
		return prod_viewImage5;
	}
	public void setProd_viewImage5(String prod_viewImage5) {
		this.prod_viewImage5 = prod_viewImage5;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
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
	
}
