package bean;
public class CategoryBean {
    private int categoryId;
    private String categoryName;

    public CategoryBean(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }
    public CategoryBean( String categoryName) {
        this.categoryName = categoryName;
    }
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
	public CategoryBean() {
		super();
	}
    
}
