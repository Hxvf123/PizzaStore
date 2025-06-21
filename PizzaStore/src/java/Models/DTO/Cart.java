/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DTO;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class Cart implements Serializable {
    private Map<String, Product> items = new HashMap<>();

    public Map<String, Product> getItems() {
        return items;
    }

    public boolean addItem(Product product) {
        if (items.containsKey(product.getProductID())) {
            int currentQuantity = items.get(product.getProductID()).getQuantity();
            items.get(product.getProductID()).setQuantity(currentQuantity + product.getQuantity());
        } else {
            items.put(product.getProductID(), product);
        }
        return true;
    }

    public boolean changeItem(String productID, Product product) {
        boolean check = false;
        try {
            if (this.items != null) {
                if (this.items.containsKey(productID)) {
                    this.items.replace(productID, product);
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean removeItem(String productID) {
        if (items.containsKey(productID)) {
            items.remove(productID);
            return true;
        }
        return false;
    }

    public double getTotal() {
        double total = 0;
        for (Product product : items.values()) {
            total += product.getUnitPrice() * product.getQuantity();
        }
        return total;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public void clear() {
        items.clear();
    }
}
