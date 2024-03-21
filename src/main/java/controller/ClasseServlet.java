package controller;

import model.Classe;
import model.Filiere;
import org.json.JSONObject;
import service.ClasseService;
import service.FiliereService;

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
    ClasseService classeService;
    FiliereService filiereService;
    @Override
    public void init() throws ServletException {
       classeService = new ClasseService();
       filiereService = new FiliereService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "add" :
                case "update":
                    try {
                        String code = request.getParameter("code");
                        String libelle = request.getParameter("libelle");
                        if (classeService.findClasseByLibelleOrCode(libelle, code) != null) {
                            request.setAttribute("message", "Une Classe existe deja avec ce libelle ou ce code" );
                            getServletContext().getRequestDispatcher("/WEB-INF/addClasse.jsp").forward(request , response);
                        }else{
                            int frais_inscription =Integer.parseInt(request.getParameter("frais_inscription"));
                            int mensualite =Integer.parseInt(request.getParameter("mensualite"));
                            int autres_frais =Integer.parseInt(request.getParameter("autres_frais"));
                            int filiereId =Integer.parseInt(request.getParameter("idfiliere"));
                            Classe classe = new Classe(0, libelle,code,frais_inscription,mensualite, autres_frais);
                            Filiere f = new Filiere(filiereId, null);
                            classe.setFiliere(f);
                            if (action.equals("add")) {
                                classeService.addClasse(classe);
                            }else{
                                classe.setId(Integer.parseInt(request.getParameter("classeId")));
                                classeService.updateClasse(classe);
                            }

                            response.sendRedirect("classe?action=list");
                            return;
                        }


                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case "delete":
                    try {
                        String classeId = request.getParameter("id");
                        classeService.deleteClasse(Integer.parseInt(classeId));
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    response.sendRedirect("classe?action=list");
                    return;

                default:
                    //fill(request , response);
                    response.sendRedirect("classe?action=list");
            }
        }
        else{
            response.sendRedirect("classe?action=list");
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "list":
                    fill(request , response);
                    break;
                case "add":
                    try {
                        List<Filiere> filieres = filiereService.allFiliere();
                        request.setAttribute("data", filieres);
                        getServletContext().getRequestDispatcher("/WEB-INF/addClasse.jsp").forward(request , response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case "edit":
                    try {
                        List<Filiere> filieres = filiereService.allFiliere();
                        int id = Integer.parseInt(request.getParameter("id"));
                        request.setAttribute("selectedClasse", classeService.findClasseById(id));
                        request.setAttribute("data", filieres);
                        getServletContext().getRequestDispatcher("/WEB-INF/addClasse.jsp").forward(request , response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case "delete":
                    try {
                        Classe c = classeService.findClasseById(Integer.parseInt(request.getParameter("id")));
                        response.setContentType("application/json");
                        response.setCharacterEncoding("utf-8");
                        PrintWriter out = response.getWriter();
                        JSONObject json = new JSONObject(new Classe());
                        if(c != null ){
                             json = new JSONObject(c);
                        }




                        // finally output the json string
                        out.print(json.toString());
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                default:
                    //fill(request , response);
                    response.sendRedirect("classe?action=list");
            }
        }
        else{
            response.sendRedirect("classe?action=list");
        }

    }

    private void fill(HttpServletRequest request, HttpServletResponse response){
        try {
            List<Classe> classes = classeService.findAllClasses();
            request.setAttribute("data", classes);
            getServletContext().getRequestDispatcher("/WEB-INF/classejstl.jsp").forward(request , response);
        } catch (SQLException | ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
