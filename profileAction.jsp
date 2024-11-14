<%@ page import="dao.UserRegistrationDAO" %>
<%@ page import="java.sql.SQLException" %>

<%
    String email = request.getParameter("email");
    String newPhone = request.getParameter("contactNumber");

    if (email != null && newPhone != null) {
        UserRegistrationDAO userDao = new UserRegistrationDAO();
        
        try {
            boolean updateSuccessful = userDao.updatePhoneNumber(email, newPhone);
            
            if (updateSuccessful) {
                out.println("<div class='alert alert-success'>Phone number updated successfully!</div>");
            } else {
                out.println("<div class='alert alert-danger'>Error updating phone number.</div>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    } else {
        out.println("<div class='alert alert-danger'>Email and contact number are required.</div>");
    }
%>
