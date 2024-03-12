package service;


import helper.DBHelper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FiliereService {

    public boolean findFiliereByLibelle(String libelle) throws SQLException {
        try {
            DBHelper db =  DBHelper.getInstance();
            String sql = "select * from filiere where libelle = ?";
            Object[] par = {libelle};
            ResultSet rs = db.executeSelect(sql, par);
            if (rs.next()){
                rs.close();
                return true;
            }
            rs.close();
            return false;
        } catch (SQLException e) {
            throw e;
        }
    }

    public void addFiliere(String libelle) throws SQLException{
        try {
            DBHelper db =  DBHelper.getInstance();
            String sql = "INSERT INTO filiere VALUES(null, ?)";
            Object[] par = {libelle};
            db.executeMaj(sql, par);
        } catch (SQLException e) {
            throw e;
        }
    }

    public void updateFiliere(int id, String libelle) throws SQLException {
        try {
            DBHelper db = DBHelper.getInstance();
            String sql = "UPDATE filiere SET libelle = ? WHERE id = ?";
            Object[] par = {libelle, id};
            db.executeMaj(sql, par);
        } catch (SQLException e) {
            throw e;
        }
    }
    public void deleteFiliere(int id) throws SQLException {
        try {
            DBHelper db = DBHelper.getInstance();
            String sql = "DELETE FROM filiere WHERE id = ?";
            Object[] par = {id};
            db.executeMaj(sql, par);
        } catch (SQLException e) {
            throw e;
        }
    }
}
