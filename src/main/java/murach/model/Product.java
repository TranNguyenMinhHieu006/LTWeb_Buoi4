package murach.model;

public class Product {
    private String ID;
    private String description;
    private double price;

    public Product() {}

    public Product(String ID, String description, double price) {
        this.ID = ID;
        this.description = description;
        this.price = price;
    }

    public String getID() { return ID; }
    public void setID(String ID) { this.ID = ID; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
