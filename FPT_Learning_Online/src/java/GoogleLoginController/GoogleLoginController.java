/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GoogleLoginController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountGoogleDBContext;
import jakarta.security.auth.message.callback.PrivateKeyCallback;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author HP
 */
public class GoogleLoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public GoogleLoginController() {
        super();
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = req.getRequestDispatcher("login");
            dis.forward(req, resp);
        } else {
            String access_token = getToken(code);
            UserGoogleDto user = getUserInfo(access_token);
            req.getSession().setAttribute("user", user);
            AccountGoogleDBContext accountGoogle = new AccountGoogleDBContext();
            accountGoogle.addGoogleLogin(user.getId(), user.getEmail());
            RequestDispatcher dis = req.getRequestDispatcher("/FLM/home?login=true");
            dis.forward(req, resp);
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request
                .Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
