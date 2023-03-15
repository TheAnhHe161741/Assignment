/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Iterator;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author ADMIN
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

    private float totalPrice;
    private List<CartItem> listItems;

    public Cart(List<CartItem> listItems) {
        this.listItems = listItems;
    }

    public float getTotalMoney() {
        float t = 0;
        for (CartItem item : listItems) {
            t += (item.getQuantity() * item.getProduct().getPrice());
        }
        return t;
    }

    private CartItem getItemById(int id) {
        for (CartItem listItem : listItems) {
            if (listItem.getProduct().getId() == id) {
                return listItem;
            }
        }
        return null;
    }

    public boolean checkExist(int id) {
        for (CartItem listItem : listItems) {
            if (listItem.getProduct().getId() == id) {
                return true;
            }
        }
        return false;
    }

    public void addItem(CartItem cartItem) {
        if (checkExist(cartItem.getProduct().getId())) {
            CartItem oldItem = getItemById(cartItem.getProduct().getId());
            oldItem.setQuantity(oldItem.getQuantity() + cartItem.getQuantity());
        } else {
            listItems.add(cartItem);
        }
    }

    public void removeItem(int id) {
        Iterator<CartItem> iterator = listItems.iterator();
        while (iterator.hasNext()) {
            CartItem item = iterator.next();
            if (item.getProduct().getId() == id) {
                iterator.remove();
                break;
            }
        }
    }

}
