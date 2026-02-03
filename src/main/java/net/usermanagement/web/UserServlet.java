package net.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.usermanagement.dao.UserDAO;
import net.usermanagement.model.User;

/**
 * Servlet implementation class UserServlet
 */
//@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUsr_no = 1L;
	private UserDAO userdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
    	this.userdao = new UserDAO();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
		String action = request.getServletPath();
		
		switch(action) {
			
			case "/new":
				showNewForm(request,response);
				break;
				
			case "/insert":
			try {
				insertUser(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} 
				break;
				
			case "/delete":
				try {
					deleteUser(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				break;
				
			case "/edit":
				try {
					showEditForm(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				
				break;
			case "/update":
				try {
					updateUser(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				break;
				
			default:
				try {
					listUser(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			break;
		
		}
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		RequestDispatcher rdp = request.getRequestDispatcher("user-form.jsp");
		rdp.forward(request,response);
		
	}
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String country = request.getParameter("country");
	    String state = request.getParameter("state");
	    String city = request.getParameter("city");
	    String gender = request.getParameter("gender");
	    User newUser = new User(name, email, country, state, city, gender);
	    userdao.insertUser(newUser);
	    response.sendRedirect("list");
	}

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int sr_no = Integer.parseInt(request.getParameter("sr_no"));
        userdao.deleteUser(sr_no);  // This should now call the updated method
        response.sendRedirect("list");
    }
    private void showEditForm(HttpServletRequest  request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int sr_no = Integer.parseInt(request.getParameter("sr_no"));
        User existingUser = userdao.selectUser(sr_no);
        request.setAttribute("user", existingUser);
        RequestDispatcher rdp = request.getRequestDispatcher("user-form.jsp");
        rdp.forward(request, response);
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int sr_no = Integer.parseInt(request.getParameter("sr_no"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String gender = request.getParameter("gender"); // Capture the gender field

        User updatedUser = new User(sr_no, name, email, country, state, city, gender);
        userdao.updateUser(updatedUser);
        response.sendRedirect("list");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<User> listuser = userdao.selectallusers();
        System.out.println("Number of users: " + listuser.size()); // Debugging line
        request.setAttribute("listuser", listuser);
        RequestDispatcher rdp = request.getRequestDispatcher("user-list.jsp");
        rdp.forward(request, response);
    }

}