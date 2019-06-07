package util;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class Cookies {

	private HashMap<String, Cookie> cookieMap = new HashMap<>();

	public void setCookieMap(Cookie[] cookies) {
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
	}

	public void createCookie(String name, String value, int maxAge, HttpServletResponse response) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookieMap.put(name, cookie);
		response.addCookie(cookie);
	}

	public void removeCookie(String name, HttpServletResponse response) {
		Cookie cookie = cookieMap.get(name);
		if (cookie != null) {
			cookie.setMaxAge(0);
			cookie.setValue("");
			response.addCookie(cookie);
			cookieMap.remove(name);
		}
	}

}
