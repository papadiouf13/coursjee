package service;


import helper.DBHelper;
import model.Classe;
import model.Filiere;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClasseService {
    public Classe findClasseByLibelle(String libelle) throws SQLException {
        try {
            DBHelper db =  DBHelper.getInstance();
            String sql = "select c.*, f.id id_filiere,f.libelle libelle_filiere from classe c,filiere f where c.filiere_id = f.id and libelle = ?";
            Object[] par = {libelle};
            ResultSet rs = db.executeSelect(sql, par);
            if (rs.next()){
                Classe c = new Classe(rs.getInt("id"),rs.getString("libelle"),
                        rs.getString("code"),rs.getInt("frais_inscription"),
                        rs.getInt("mensualite"),rs.getInt("autres_frais"));
                Filiere f = new Filiere(rs.getInt("id_filiere"),
                        rs.getString("libelle_filiere"));
                c.setFiliere(f);
                rs.close();
                return c;
            }
            rs.close();
            return null;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List<Classe> findAllClasses() throws SQLException {
        List<Classe> classes = new ArrayList<>();
        try {
            DBHelper db =  DBHelper.getInstance();
            String sql = "select c.*, f.id id_filiere,f.libelle libelle_filiere from classe c,filiere f where c.filiere_id = f.id";
            ResultSet rs = db.executeSelect(sql, null);
            while (rs.next()){
                Classe c = new Classe(rs.getInt("id"),rs.getString("libelle"),
                        rs.getString("code"),rs.getInt("frais_inscription"),
                        rs.getInt("mensualite"),rs.getInt("autres_frais"));
                Filiere f = new Filiere(rs.getInt("id_filiere"),
                        rs.getString("libelle_filiere"));
                c.setFiliere(f);
                classes.add(c);
            }
            rs.close();
            return classes;
        } catch (SQLException e) {
            throw e;
        }
    }

    public void addClasse(Classe classe) throws SQLException{
        try {
            DBHelper db =  DBHelper.getInstance();
            String sql = "INSERT INTO classe VALUES(null,?,?,?,?,?,?)";
            Object[] par = {classe.getLibelle(),classe.getCode(),classe.getFrais_inscription(),
                    classe.getMensualite(),classe.getAutres_frais(),classe.getFiliere().getId()};
            db.executeMaj(sql, par);
        } catch (SQLException e) {
            throw e;
        }

    }
}
