/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.myproject.servelets;

import com.learn.myproject.dao.CategoryDao;
import com.learn.myproject.dao.ProductDao;
import com.learn.myproject.entities.Category;
import com.learn.myproject.entities.Product;
import com.learn.myproject.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author navan
 */
@MultipartConfig
public class ProductOperationServelet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Servelet 1
//fetching category data



//servelet:2
            //add category
            //add product
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category
                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryDescription(description);
                category.setCategoryTitle(title);

                //Category Database Saver
       CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                out.println("Category Saved");
                HttpSession session = request.getSession();
                session.setAttribute("message", "category added successfully:" + catId);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                //add product
               String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));

                Part part = request.getPart("pPic");
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
//get category by Id
CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);
                p.setCategory(category);

                //product Save
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);
                //pic upload
//find the path to upload the photo
                String directoryPath = "C:\\Users\\navan\\OneDrive\\Documents\\NetBeansProjects\\myproject\\src\\main\\webapp\\img\\products";

                try {
                    // Ensure the directory exists, create it if it doesn't
                    File directory = new File(directoryPath);
                    if (!directory.exists()) {
                    }

                    // Construct the complete path to save the file
                    String fileName = part.getSubmittedFileName();
                    String filePath = directoryPath + File.separator + fileName;

                    // Debugging: Print the path to check if it's correct
                   System.out.println("File will be saved to: " + filePath);

                    // Uploading code
                    try (FileOutputStream fos = new FileOutputStream(filePath); InputStream is = part.getInputStream()) {

                        // Reading data
                        byte[] data = new byte[is.available()];
                        is.read(data);

                        // Writing the data
                        fos.write(data);
                    }
                } catch (IOException ex) {
                    ex.printStackTrace();
                }

/*
                @SuppressWarnings("deprecation")
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                //uploading code

                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    //reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    //writing the data
                    fos.write(data);
                    fos.close();
                    is.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

*/

                out.println("product save success");
                HttpSession session = request.getSession();
                session.setAttribute("message", "Product is  added successfully:" + catId);
                response.sendRedirect("admin.jsp");
                return;


            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
