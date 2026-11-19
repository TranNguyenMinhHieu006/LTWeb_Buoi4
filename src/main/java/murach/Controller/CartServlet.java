package murach.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import murach.model.Cart;
import murach.model.LineItem;
import murach.model.Product;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final Map<String, Product> PRODUCTS = new HashMap<>();

    @Override
    public void init() {
        PRODUCTS.put("86", new Product("86",
                "86 (the band) - True Life Songs and Pictures", 14.95));
        PRODUCTS.put("paddle1", new Product("paddle1",
                "Paddlefoot - The first CD", 12.95));
        PRODUCTS.put("paddle2", new Product("paddle2",
                "Paddlefoot - The second CD", 14.95));
        PRODUCTS.put("jr01", new Product("jr01",
                "Joe Rut - Genuine Wood Grained Finish", 14.95));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            Product product = PRODUCTS.get(request.getParameter("productCode"));
            if (product != null) {
                cart.addItem(new LineItem(product, 1));
            }
        } else if ("update".equals(action)) {
            String productCode = request.getParameter("productCode");
            int quantity = 1;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (NumberFormatException ignored) {
                quantity = 1;
            }
            if (quantity < 1) {
                quantity = 1;
            }
            for (LineItem item : cart.getItems()) {
                if (item.getProduct().getID().equals(productCode)) {
                    item.setQuantity(quantity);
                    break;
                }
            }
        } else if ("remove".equals(action)) {
            String productCode = request.getParameter("productCode");
            cart.getItems().removeIf(item ->
                    item.getProduct().getID().equals(productCode));
        }

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }
}
