package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ucla.cs.cs144.AuctionSearchClient;

public class ItemServlet extends HttpServlet implements Servlet {
       
    public ItemServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("id");
        
        String xml = AuctionSearchClient.getXMLDataForItemId(id);
        
        request.setAttribute("results", xml);
        request.getRequestDispatcher("item.jsp").forward(request, response);     
    }
}
