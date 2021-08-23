package kh.spring.API;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class NaverApi {
	private static String clientId = "2HFs7dbsd4zRLycDtPnY";
	private static String clientSecret = "GqQoPpq6Vm";
	
		public  String returnImageJson(String search) throws Exception {
			String transfer_utf8 = URLEncoder.encode(search, "UTF-8");
			String image_apiURL = "https://openapi.naver.com/v1/search/image?query="+transfer_utf8;
			Map<String, String> image_requestHeaders = new HashMap<>();
			image_requestHeaders.put("X-Naver-Client-Id", clientId);
		    image_requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		    return get(image_apiURL,image_requestHeaders);
		}
	
		public String returnBlogJson(String search) throws Exception {
			String transfer_utf8 = URLEncoder.encode(search, "UTF-8");
			String blog_apiURL = "https://openapi.naver.com/v1/search/blog?query="+transfer_utf8;
			Map<String, String> blog_requestHeaders = new HashMap<>();
			blog_requestHeaders.put("X-Naver-Client-Id", clientId);
		    blog_requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		    return get(blog_apiURL,blog_requestHeaders);
		}

	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
}
