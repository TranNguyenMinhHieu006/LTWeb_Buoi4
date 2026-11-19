package murach.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private ArrayList<LineItem> items;

    public Cart(){
        this.items = new ArrayList<>();
    }

    public void addItem(LineItem item){
        for (LineItem existingItem : items) {
            if (existingItem.getProduct().getID()
                    .equals(item.getProduct().getID())) {
                existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(LineItem item) {
        items.removeIf(existingItem ->
                existingItem.getProduct().getID()
                        .equals(item.getProduct().getID()));
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<LineItem> items) {
        this.items = items;
    }
}
