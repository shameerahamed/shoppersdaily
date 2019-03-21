package com;

public class cart {
	int prod_id;
	String prod_name;
	String prod_brand;
	int quant_req;
	float price;
	float total;
	
	public cart() {
	}
	
	public cart(cart c) {	
		this.prod_id = c.prod_id;
		this.prod_name=c.prod_name;
		this.prod_brand=c.prod_brand;
		this.quant_req=c.quant_req;
		this.price = c.price;
	}
	
	public cart(int prod_id,String prod_name, String prod_brand, int quant_req,float price) {
		this.prod_id = prod_id;
		this.prod_name=prod_name;
		this.prod_brand=prod_brand;
		this.quant_req=quant_req;
		this.price = price;		
	}
	
	public String[] getDetails() {
		String[] proddet = new String[6];		
		proddet[0] = (new Integer(prod_id)).toString();
		proddet[1] = prod_name;
		proddet[2] = prod_brand;
		proddet[3] = (new Integer(quant_req)).toString();
		proddet[4] = (new Float(price)).toString();
		proddet[5] = (new Float(quant_req*price)).toString();
		return proddet;
	}
	
	
}
