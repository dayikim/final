package kh.spring.config;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component
public class ChatRegx {

	public String findNaverRegx(String string) {
         Pattern pattern = Pattern.compile("#([0-9a-zA-Z가-힣])*");
         Matcher matcher = pattern.matcher(string);
         if(matcher.find()) {
        	 return matcher.group();
         }
         return null;
	}
	
	public String findlocationRegx(String string) {
        Pattern pattern = Pattern.compile("@@([0-9a-zA-Z가-힣])*");
        Matcher matcher = pattern.matcher(string);
        if(matcher.find()) {
       	 return matcher.group();
        }
        return null;
	}
}
