package util;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	
	private HashMap<String,Cookie> cookieMap = new HashMap<>();
	
	/**
	 * 쿠키 정보 초기화
	 * @param request
	 */
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
	}
	
	/**
	 * 쿠키생성
	 * @param name
	 * @param value
	 * @param maxAge
	 * @return
	 */
	public static Cookie createCookie(String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	/**
	 * 쿠키삭제
	 * @param name
	 * @param request
	 * @param response
	 */
	public void removeCookie(String name, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies = cookieMap.get(name);
		if (cookies != null) {
			Cookie cookie = new Cookie(name, "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			cookieMap.remove(name);
		}
	}
	
	/**
	 * 해당 Name 값으로 Cookie 존재 유무 확인
	 * @param name
	 * @return
	 */
	public boolean exists(String name) { return cookieMap.get(name) != null; }
	
	/**
	 * key 값으로 Cookie 객체 반환
	 * @param name
	 * @return
	 */
	public Cookie getCookie(String name) { return cookieMap.get(name); }
	
	/**
	 * key 값으로 Cookie객체에 저장된 실제 id값(value) 반환
	 * @param name
	 * @return
	 */
	public String getValue(String name) { return cookieMap.get(name).getValue(); }
	
}
