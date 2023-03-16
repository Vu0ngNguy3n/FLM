/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GoogleLoginController;

import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class GoogleUtils {

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String clientId = "64099437985-l7qps8tjvpskj7suksghlv5m2u20hm0g.apps.googleusercontent.com";
        String sec = "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";
        String uri = "https://accounts.google.com/o/oauth2/token?code=" + code + "&client_id="+clientId+"&client_secret="+sec+"&redirect_uri="
                + "http://localhost:8080/FPT_Learning_Online/FLM/googlelogin&grant_type=authorization_code";
        String response = Request.Post(uri).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
        return googlePojo;
    }
}
 