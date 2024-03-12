package controller;

import model.Classe;
import service.ClasseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "classe", urlPatterns = "/classe")
public class ClasseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClasseService classeService = new ClasseService();
        try {
            List<Classe> classes = classeService.findAllClasses();
            request.setAttribute("data", classes);
            request.getRequestDispatcher("/WEB-INF/classejstl.jsp").forward(request , response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
