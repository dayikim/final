package kh.spring.Exception;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {

	//private static Map<String,String> excepion_log;
    @ExceptionHandler(value = Exception.class)
	String Exception(Exception e,HttpServletRequest request) {
		//excepion_log.put(request.getRequestURI(), e.getMessage());
		//System.out.println(request.getRequestURI().substring(request.getContextPath().length()));
		return "Error";
	}
}
