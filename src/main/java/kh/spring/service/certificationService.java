package kh.spring.service;

import java.util.HashMap;
import java.util.Map;


import org.json.simple.JSONObject;

import com.google.inject.spi.Message;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

public class certificationService {
	
	public static void certifiedPhoneNumber(String phone, String cerNum) {

        String api_key = "NCSSK9LZK7F5BA6M";
        String api_secret = "JT9VDTEVHQKPAFYCAIFTQLHH5CVADTXH";
        kh.spring.config.Coolsms coolsms = new kh.spring.config.Coolsms(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phone);    // 수신전화번호
        params.put("from", "01054545421");
        params.put("type", "SMS");
        params.put("text", "휴대폰인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = coolsms.send(params);
            System.out.println(obj.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
           
        }

    }

}
