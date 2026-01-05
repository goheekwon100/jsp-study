package ch04.com.dao;

// 로직 전용 자바빈
// JSP는 화면, 자바빈은 로직이라는 단순 분리

public class GuGuDan {
	public String process(int dan) {
		String result = "";
		for (int i = 0; i <= 9; i++) {
			result += dan + " * " + i + " = " + dan * i + "<br>";
		}
		return result;
	}
}
