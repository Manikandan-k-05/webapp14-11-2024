<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.*, java.nio.file.*, java.sql.*" %>
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
            product.setProductName(productName);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stockStatus);
            product.setDescription(description);
            product.setProductImage(fileName); // Store the file name (or path)

            // Call DAO to insert the product into the database
            ProductDAO productDAO = new ProductDAO();
            boolean isSaved = productDAO.insertProducts(product); // Insert into DB

            // Provide feedback to the user
            if (isSaved) {
%>
                <script>
                    alert("Product added successfully!");
                    window.location.href = "productManage.jsp"; // Redirect to the product management page
                </script>
<%
            } else {
%>
                <script>
                    alert("Failed to add product.");
                    window.location.href = "addProduct.jsp"; // Redirect back to add product page
                </script>
<%
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error: " + ex.getMessage());
        }
    }
%>
