package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        String bidParam = req.getParameter("bid");
	        String uidParam = req.getParameter("uid");
			/*
			 * System.out.println("bidParam: " + bidParam); System.out.println("uidParam: "
			 * + uidParam);
			 */
	        int bid = 0;
	        int uid = 0;
	        String uidParam1 = req.getParameter("uid");
	        int uid1 = 0;

	        if (uidParam1 != null && !uidParam1.isEmpty()) {
	            uid1 = Integer.parseInt(uidParam1);
	        } else {
	            // If uidParam is null or empty, set a default value for uid
	            uid1 = 1; // or any other default value that is appropriate for your use case
	        }

	        if (bidParam != null && !bidParam.isEmpty()) {
	            bid = Integer.parseInt(bidParam);
	        }
	        if (uidParam1 != null && !uidParam1.isEmpty()) {
	            uid1 = Integer.parseInt(uidParam1);
	        }
	        if (bid == 0 || uid1 == 0) {
	            System.out.println("Invalid bid or uid parameter");
	            HttpSession session = req.getSession();
	            session.setAttribute("failed", "Invalid bid or uid parameter");
	            resp.sendRedirect("all_new_book.jsp");
	            return;
	        }

	        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	        BookDtls b = dao.getBookById(bid);
	        Cart c = new Cart();
	        c.setBid(bid);
	        c.setUserId(uid1);
	        c.setBookName(b.getBookName());
	        c.setAuthor(b.getAuthor());

	        c.setPrice(Double.parseDouble(b.getPrice()));
	        c.setTotalPrice(Double.parseDouble(b.getPrice()));

	        CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConnection());
	        boolean f = dao2.addCart(c);

	        HttpSession session = req.getSession();

	        if (f) {
	            System.out.println("Add cart Success");
	            session.setAttribute("addCart", "Book Added to cart");
	            resp.sendRedirect("all_new_book.jsp");

	        } else {
	            System.out.println("Not add to cart");
	            session.setAttribute("failed", "Something Wrong On Server");
	            resp.sendRedirect("all_new_book.jsp");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	}