package ch04.com.dao;

// 로직 전용 자바빈
// JSP는 화면, 자바빈은 로직이라는 단순 분리

public class Person {
	private int id = 20230821;
	private String name = "홍길순";
	public Person() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
