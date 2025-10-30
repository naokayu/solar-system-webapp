package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PlanetDAO;
import model.Planet;

@WebServlet("/planets")
public class PlanetListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PlanetDAO dao = new PlanetDAO();
        List<Planet> planetList = dao.findAll();

        request.setAttribute("planetList", planetList);

        request.getRequestDispatcher("/planetList.jsp").forward(request, response);
    }
}
