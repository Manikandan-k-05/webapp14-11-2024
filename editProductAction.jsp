<%-- <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.ProductBean, dao.ProductDAO, java.sql.SQLException"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page import="javax.servlet.http.Part"%>

<%
    // Retrieve text parameters from the form
    String productName = request.getParameter("productName");
    String category = request.getParameter("category");
    String priceStr = request.getParameter("price");
    String stock = request.getParameter("stock");
    String description = request.getParameter("description");
    String productIdStr = request.getParameter("productId");

    // Retrieve file part (for product image)
    Part productImagePart = request.getPart("productImage");
    String fileName = null;

    // Print the text inputs to verify they are being captured correctly
    out.println("Product Name: " + productName + "<br>");
    out.println("Category: " + category + "<br>");
    out.println("Price: " + priceStr + "<br>");
    out.println("Stock: " + stock + "<br>");
    out.println("Description: " + description + "<br>");
    out.println("Product ID: " + productIdStr + "<br>");
    
  
%>
 --%>
 
 
 
 
 
<%--  <%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.*, java.nio.file.*, java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="bean.*" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.*" %>

<%
    String productName = "";
    String category = "";
    double price = 0;
    String stockStatus = "";
    String description = "";
    String fileName = "";
    int productId = 0;

    // Check if the form is multipart (file upload form)
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Parse the request to get form fields and file items
            List<FileItem> formItems = upload.parseRequest(request);

            for (FileItem item : formItems) {
                // Process form fields
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "productName": productName = fieldValue; break;
                        case "category": category = fieldValue; break;
                        case "price": price = Double.parseDouble(fieldValue); break;
                        case "stock": stockStatus = fieldValue; break;
                        case "description": description = fieldValue; break;
                        case "productId": productId = Integer.parseInt(fieldValue); break;
                    }
                } else {
                    // Process the image upload
                    fileName = item.getName();

                    if (fileName != null && !fileName.isEmpty()) {
                        String uploadPath = getServletContext().getRealPath("/") + "uploads/";
                        File uploadDir = new File(uploadPath);

                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs(); // Create the uploads directory if it doesn't exist
                        }

                        String filePath = uploadPath + fileName;
                        item.write(new File(filePath)); // Save the file to the server
                    }
                }
            }

            // Create ProductBean and set all the values
            ProductBean product = new ProductBean();
            product.setProductId(productId);
            product.setProductName(productName);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stockStatus);
            product.setDescription(description);
            product.setProductImage(fileName); // Store the file name (or path)

            // Call DAO to update the product in the database
            ProductDAO productDAO = new ProductDAO();
            boolean isUpdated = productDAO.updateProduct(product); // Update in DB

            // Provide feedback to the user
            if (isUpdated) {
%>
                <script>
                    alert("Product updated successfully!");
                    window.location.href = "productManage.jsp"; // Redirect to the product management page
                </script>
<%
            } else {
%>
                <script>
                    alert("Failed to update product.");
                    window.location.href = "editProduct.jsp?productId=<%= productId %>"; // Redirect back to edit product page
                </script>
<%
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error: " + ex.getMessage());
        }
    }
%>
 --%> 
	<%-- <%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, bean.ProductBean, dao.ProductDAO" %>
	
	<%
	    String productName = "";
	    String category = "";
	    double price = 0;
	    String stockStatus = "";
	    String description = "";
	    String fileName = "";
	    int productId = 0;
	
	    // Check if the form is multipart (file upload form)
	    if (ServletFileUpload.isMultipartContent(request)) {
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(factory);
	
	        try {
	            List<FileItem> formItems = upload.parseRequest(request);
	            ProductDAO productDAO = new ProductDAO();
	
	            for (FileItem item : formItems) {
	                if (item.isFormField()) {
	                    // Process regular form fields
	                    String fieldName = item.getFieldName();
	                    String fieldValue = item.getString();
	
	                    switch (fieldName) {
	                        case "productName":
	                            productName = fieldValue;
	                            break;
	                        case "category":
	                            category = fieldValue;
	                            break;
	                        case "price":
	                            price = Double.parseDouble(fieldValue);
	                            break;
	                        case "stock":
	                            stockStatus = fieldValue;
	                            break;
	                        case "description":
	                            description = fieldValue;
	                            break;
	                        case "productId":
	                            productId = Integer.parseInt(fieldValue);
	                            break;
	                    }
	                } else {
	                    // Process image file upload
	                    if (item.getName() != null && !item.getName().isEmpty()) {
	                        fileName = item.getName();
	                        String uploadPath = getServletContext().getRealPath("/") + "uploads/";
	                        File uploadDir = new File(uploadPath);
	
	                        if (!uploadDir.exists()) {
	                            uploadDir.mkdirs();  // Create the uploads directory if it doesn't exist
	                        }
	
	                        String filePath = uploadPath + fileName;
	                        item.write(new File(filePath));  // Save the file to the server
	                    } else {
	                        // If no new file was uploaded, retain the old file name
	                        ProductBean product = productDAO.getProductsById(productId);
	                        if (product != null) {
	                            fileName = product.getProductImage();
	                        } else {
	                            // If no product is found, you can either return an error or set a default image
	                            fileName = ; // You can set a default image if the product is not found
	                        }
	                    }
	                }
	            }
	
	            // Fetch product from database
	            ProductBean product = productDAO.getProductsById(productId);
	            if (product == null) {
	                out.println("Error: Product not found.");
	                return;
	            }
	
	            // Create the ProductBean object
	            product.setProductId(productId);
	            product.setProductName(productName);
	            product.setCategory(category);
	            product.setPrice(price);
	            product.setStock(stockStatus);
	            product.setDescription(description);
	            product.setProductImage(fileName);  // Store the file name (or path)
	
	            // Call DAO to update the product in the database
	            boolean isUpdated = productDAO.updateProduct(product);
	
	            if (isUpdated) {
	%>
	                <script>
	                    alert("Product updated successfully!");
	                    window.location.href = "productManage.jsp";  // Redirect to the product management page
	                </script>
	<%
	            } else {
	%>
	                <script>
	                    alert("Failed to update product.");
	                    window.location.href = "editProduct.jsp?productId=<%= productId %>";  // Redirect back to edit page
	                </script>
	<%
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            out.println("Error: " + ex.getMessage());
	        }
	    }
	%>
  --%>
  
   <%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, bean.ProductBean, dao.ProductDAO" %>

<%-- <%
    String productName = "";
    String category = "";
    double price = 0;
    String stockStatus = "";
    String description = "";
    String fileName = ""; // Default image name will be empty here
    int productId = 0;

    // Check if the form is multipart (file upload form)
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> formItems = upload.parseRequest(request);
            ProductDAO productDAO = new ProductDAO();

            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    // Process regular form fields
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "productName":
                            productName = fieldValue;
                            break;
                        case "category":
                            category = fieldValue;
                            break;
                        case "price":
                            price = Double.parseDouble(fieldValue);
                            break;
                        case "stock":
                            stockStatus = fieldValue;
                            break;
                        case "description":
                            description = fieldValue;
                            break;
                        case "productId":
                            productId = Integer.parseInt(fieldValue);
                            break;
                    }
                } else {
                    // Process image file upload
                    if (item.getName() != null && !item.getName().isEmpty()) {
                        // New image is uploaded
                        fileName = item.getName();
                        String uploadPath = getServletContext().getRealPath("/") + "uploads/";
                        File uploadDir = new File(uploadPath);

                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();  // Create the uploads directory if it doesn't exist
                        }

                        String filePath = uploadPath + fileName;
                        item.write(new File(filePath));  // Save the new file to the server
                    } else {
                        // No new image, keep the current image
                        ProductBean product = productDAO.getProductsById(productId);
                        if (product != null) {
                            fileName = product.getProductImage(); // Use the existing image
                        }
                    }
                }
            }

            // Fetch product from database
            ProductBean product = productDAO.getProductsById(productId);
            if (product == null) {
                out.println("Error: Product not found.");
                return;
            }

            // Create the ProductBean object and update its values
            product.setProductId(productId);
            product.setProductName(productName);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stockStatus);
            product.setDescription(description);
            product.setProductImage(fileName);  // Store the file name (or path)

            // Call DAO to update the product in the database
            boolean isUpdated = productDAO.updateProduct(product);

            if (isUpdated) {
%>
                <script>
                    alert("Product updated successfully!");
                    window.location.href = "productManage.jsp";  // Redirect to the product management page
                </script>
<%
            } else {
%>
                <script>
                    alert("Failed to update product.");
                    window.location.href = "editProduct.jsp?productId=<%= productId %>";  // Redirect back to edit page
                </script>
<%
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error: " + ex.getMessage());
        }
    }
%>
   --%>
   

<%
    String productName = "";
    String category = "";
    double price = 0;
    String stockStatus = "";
    String description = "";
    String fileName = "";
    int productId = 0;

    // Check if the form is multipart (file upload form)
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> formItems = upload.parseRequest(request);
            ProductDAO productDAO = new ProductDAO();

            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    // Process regular form fields
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "productName":
                            productName = fieldValue;
                            break;
                        case "category":
                            category = fieldValue;
                            break;
                        case "price":
                            price = Double.parseDouble(fieldValue);
                            break;
                        case "stock":
                            stockStatus = fieldValue;
                            break;
                        case "description":
                            description = fieldValue;
                            break;
                        case "productId":
                            productId = Integer.parseInt(fieldValue);
                            break;
                    }
                } else {
                   
                	/* 
                	// Process image file upload
                	if (item.getName() != null && !item.getName().isEmpty()) {
                		
                		
                	    // If a new file is uploaded
                	    fileName = item.getName();
                	    String uploadPath = getServletContext().getRealPath("/") + "uploads/";
                	    File uploadDir = new File(uploadPath);

                	    // Create the uploads directory if it doesn't exist
                	    if (!uploadDir.exists()) {
                	        uploadDir.mkdirs();
                	    }

                	    // Get the full file path and save the file
                	    String filePath = uploadPath + fileName;
                	    item.write(new File(filePath));  // Save the uploaded file to the server
                	} else {
                		String currentImage = request.getParameter("currentProductImage");
                	    // If no new file was uploaded, retain the old file name
                	    ProductBean product = productDAO.getProductsById(productId);
                	    if (product != null && product.getProductImage() != null && !product.getProductImage().isEmpty()) {
                	        // Retain the old product image if it exists
                	        fileName = product.getProductImage();
                	    } else {
                	        // No product found or no product image, leave fileName as null or empty
                	        fileName = currentImage; // No default image
                	    }
                	} */
                	
                	// Process image file upload
                	String fileNameImage = request.getParameter("currentProductImage");
                	if (item.getName() != null && !item.getName().isEmpty()) {
                	    // If a new file is uploaded
                	    fileName = System.currentTimeMillis() + "_" + item.getName();  // Add a timestamp to ensure uniqueness
                	    String uploadPath = getServletContext().getRealPath("/") + "uploads/";
                	    File uploadDir = new File(uploadPath);

                	    // Create the uploads directory if it doesn't exist
                	    if (!uploadDir.exists()) {
                	        uploadDir.mkdirs();
                	    }

                	    // Get the full file path and save the file
                	    String filePath = uploadPath + fileName;
                	    item.write(new File(filePath));  // Save the uploaded file to the server
                	} else {
                	    // If no new file was uploaded, use the existing image name from the hidden field
                	    fileName = request.getParameter("currentProductImage");
                	    
                	    // If no file was uploaded and no current image is available, set a default image if necessary
                	     if (fileName == null || fileName.isEmpty()) {
                	        fileName = "default.png";  // Optional: Assign a default image if there's no existing image
                	    } 
                	}


                }
            }

            // Fetch product from database
            ProductBean product = productDAO.getProductsById(productId);
            if (product == null) {
                out.println("Error: Product not found.");
                return;
            }

            // Create the ProductBean object
            product.setProductId(productId);
            product.setProductName(productName);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stockStatus);
            product.setDescription(description);
            product.setProductImage(fileName);  // Store the file name (or path)

            // Call DAO to update the product in the database
            boolean isUpdated = productDAO.updateProduct(product);

            if (isUpdated) {
%>
                <script>
                    alert("Product updated successfully!");
                    window.location.href = "productManage.jsp";  // Redirect to the product management page
                </script>
<%
            } else {
%>
                <script>
                    alert("Failed to update product.");
                    window.location.href = "editProduct.jsp?productId=<%= productId %>";  // Redirect back to edit page
                </script>
<%
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error: " + ex.getMessage());
        }
    }
%>