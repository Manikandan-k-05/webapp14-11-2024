package bean;

public class ProductBean {
	private int productId;
	private String productName;
	private String category;
	private double price;
	private String stock;
	private String description;
	private String productImage;
	
	public ProductBean() {
		super();
	}
	public ProductBean(String productName, String category, double price, String stock, String description, String productImage) {
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.productImage = productImage;
    }
	public ProductBean(int productId, String productName, String category, double price, String stock,
			String description, String productImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.description = description;
		this.productImage = productImage;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "ProductBean [productId=" + productId + ", productName=" + productName + ", category=" + category
				+ ", price=" + price + ", stock=" + stock + ", description=" + description + ", productImage="
				+ productImage + "]";
	}
	

}
