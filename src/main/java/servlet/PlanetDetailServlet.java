package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PlanetDAO;
import model.Planet;

@WebServlet("/planetDetail")
public class PlanetDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("planets"); // idが無ければ一覧に戻す
            return;
        }

        int id = Integer.parseInt(idStr);

        PlanetDAO dao = new PlanetDAO();
        Planet planet = dao.findById(id);

        if (planet == null) {
            response.sendRedirect("planets"); // 存在しないIDなら一覧へ
            return;
        }

        request.setAttribute("planet", planet);
        request.getRequestDispatcher("/planetDetail.jsp").forward(request, response);
    }
}
