package Refrigerator2;

public class Shohin {
	private String name;
	private String manufacturer;
	private int price;

	private int numStock;
	
	public Shohin() {}
	
	public Shohin(String name, String manufacturer, int price, int numStock) {
		this.name = name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.numStock = numStock;
	}
	
	public String getName() {
		return name;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public int getPrice() {
		return price;
	}

	public int getNumStock() {
		return numStock;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setNumStock(int numStock) {
		this.numStock = numStock;
	}
}
