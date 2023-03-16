/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import PasswordEncryption.PasswordEncryption;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author admin
 */
public class AccountDBContext extends DBContext<Account> {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT a.userName,a.image,a.phone,a.address,a.gender,a.birthday, a.fullname, a.gmail, a.roleid\n"
                    + ",r.roleName, rf.featureid\n"
                    + ", f.featurename, f.url\n"
                    + "FROM Account as a\n"
                    + "LEFT JOIN Role as r ON a.roleid = r.roleid\n"
                    + "LEFT JOIN Role_Feature as rf on r.roleid=rf.roleid\n"
                    + "LEFT JOIN Feature as f ON rf.featureid = f.featureid\n"
                    + "WHERE a.userName = ? and a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            PasswordEncryption encrypt = new PasswordEncryption();
            String passwordnew = encrypt.PasswordEncode(password);
            stm.setString(2, passwordnew);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            while (rs.next()) {
                if (account == null) {
                    account = new Account();
                    account.setPassword(passwordnew);
                    account.setUsername(rs.getString("userName"));
                    account.setAvatar(rs.getString("image"));
                    account.setPhone(rs.getLong("phone"));
                    account.setAddress(rs.getString("address"));
                    account.setGender(rs.getBoolean("gender"));
                    account.setDob(rs.getDate("birthday"));
                    account.setFullname(rs.getString("fullname"));
                    account.setGmail(rs.getString("gmail"));
                    Role role = new Role();
                    role.setRoleid(rs.getInt("roleid"));
                    role.setRolename(rs.getString("rolename"));
                    account.setRole(role);
                }
                int featureid = rs.getInt("featureid");
                if (featureid != 0) {
                    Feature feature = new Feature();
                    feature.setFeatureid(rs.getInt("featureid"));
                    feature.setFeaturename(rs.getString("featurename"));
                    feature.setUrl(rs.getString("url"));
                    account.getRole().getFeatures().add(feature);
                }
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateAccount(String username, boolean active) {
        try {

            if (active == true) {
                String sql = "UPDATE account\n"
                        + "   SET active = 0\n"
                        + " WHERE userName = ?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, username);
                stm.executeUpdate();
            } else {
                String sql = "UPDATE account\n"
                        + "   SET active = 1\n"
                        + " WHERE userName = ?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, username);
                stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Account> accounts(String userSearch, int index) {
        try {
            String sql = "SELECT userName,image,phone, address, gender, gmail,  fullname, birthday, a.roleId, r.roleName,  active FROM Account as a\n"
                    + "INNER JOIN Role as r ON a.roleId = r.roleId "
                    + "WHERE userName LIKE '%" + userSearch + "%'"
                    + " ORDER BY active DESC LIMIT ?,6";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, index * 6);
            ResultSet rs = stm.executeQuery();
            ArrayList<Account> accounts = new ArrayList<>();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("userName"));
                a.setAvatar(rs.getString("image"));
                a.setPhone(rs.getLong("phone"));
                a.setAddress(rs.getString("address"));
                a.setGender(rs.getBoolean("gender"));
                a.setGmail(rs.getString("gmail"));
                a.setFullname(rs.getString("fullname"));
                a.setDob(rs.getDate("birthday"));

                Role r = new Role();
                r.setRoleid(rs.getInt("roleId"));
                r.setRolename(rs.getString("roleName"));
                a.setRole(r);

                a.setActive(rs.getBoolean("active"));
                accounts.add(a);
            }
            return accounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public int getNumPages(String userSearch) {
        try {
            String sql = "SELECT COUNT(*) as number FROM flm.account \n"
                    + "WHERE userName LIKE '%" + userSearch + "%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int pages = 0;
            while (rs.next()) {
                pages = rs.getInt("number");
            }
            return pages;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Account> getNext6accounts(int amount, String userSearch) {
        try {
            String sql = "SELECT userName,image,phone, address, gender, gmail,  fullname, birthday, a.roleId, r.roleName,  active FROM Account as a\n"
                    + "                   INNER JOIN Role as r ON a.roleId = r.roleId \n"
                    + "WHERE userName LIKE '%" + userSearch + "%'"
                    + "				   ORDER BY active DESC\n"
                    + "				   LIMIT ?, 3 \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, amount);
            ResultSet rs = stm.executeQuery();
            ArrayList<Account> accounts = new ArrayList<>();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("userName"));
                a.setAvatar(rs.getString("image"));
                a.setPhone(rs.getLong("phone"));
                a.setAddress(rs.getString("address"));
                a.setGender(rs.getBoolean("gender"));
                a.setGmail(rs.getString("gmail"));
                a.setFullname(rs.getString("fullname"));
                a.setDob(rs.getDate("birthday"));

                Role r = new Role();
                r.setRoleid(rs.getInt("roleId"));
                r.setRolename(rs.getString("roleName"));
                a.setRole(r);

                a.setActive(rs.getBoolean("active"));
                accounts.add(a);
            }
            return accounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void guest(String username, String password, String gmail, long phone, String fullname) {
        try {
            String sql = "INSERT INTO `flm`.`account`\n"
                    + "(`userName`,\n"
                    + "`password`,\n"
                    + "`phone`,\n"
                    + "`gmail`,\n"
                    + "`fullname`,\n"
                    + "`roleId`,\n"
                    + "`active`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "0,\n"
                    + "1);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setLong(3, phone);
            stm.setString(4, gmail);
            stm.setString(5, fullname);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isExistUsername(String username) {
        try {
            String sql = "SELECT COUNT(userName) as number\n"
                    + "FROM Account\n"
                    + "WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int usernum = rs.getInt("number");
                if (usernum != 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean isExistEmail(String email) {
        try {
            String sql = "SELECT COUNT(gmail) as number\n"
                    + "FROM Account\n"
                    + "WHERE gmail = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int emailnum = rs.getInt("number");
                if (emailnum != 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkPass(String gmail, String pass) {
        try {
            String sql = "SELECT *\n"
                    + "FROM Account\n"
                    + "WHERE gmail = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gmail);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int usernum = rs.getInt("number");
                if (usernum != 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public String GetEmailByUsername(String username) {
        try {
            String sql = "SELECT *\n"
                    + "FROM Account\n"
                    + "WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString("gmail");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updatePasswordByUsername(String gmail, String pass) {
        try {
            String sql = "UPDATE Account\n"
                    + "SET Account.password = ?\n"
                    + "WHERE Account.gmail =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setString(2, gmail);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
