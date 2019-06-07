package util;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	
	private HashMap<String,Cookie> cookieMap
		= new HashMap<>();
	
	// 쿠키 정보 초기화
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(),cookie);
			}
		}
	}
	
	// 해당 Name 값으로 Cookie 존재 유무 확인
	public boolean exists(String id) {
		return cookieMap.get(id) != null;
	}
	
	// key 값으로 Cookie 객체 반환
	public Cookie getCookie(String id) {
		return cookieMap.get(id);
	}
	
	// key 값으로 Cookie객체에 저장된 실제 id값(value) 반환
	public String getValue(String id) {
		return cookieMap.get(id).getValue();				
	}
	
	public static Cookie createCookie(String id, String value, int maxAge) {
		Cookie cookie = new Cookie(id,value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	public void removeCookie(HttpServletResponse response, String id) {
		Cookie cookie = cookieMap.get(id);
		if(cookie != null) {
			cookie.setValue("");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			cookieMap.remove(id);
		}
	}
}
