/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "root";
            String pass = "123456";
            String url = "jdbc:mysql://localhost:3306/flm?allowPublicKeyRetrieval=true&useSSL=false&allowMultiQueries=true";
            //"jdbc:mysql://localhost:3306/flm_g3";

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {

            Logger.getLogger("lỗi kết nối database classnotfound" + DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger("lỗi kết nối database sqle:" + DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        
    }

    public abstract void insert(T model);

    public abstract void update(T model);

    public abstract void delete(T model);

    public abstract T getStringId(String id);

    public abstract T get(int id);

    public abstract ArrayList<T> list();

}
