package egovframework.example.sample.service;

import java.util.Date;

public class BoardVO {

	private int bno;
	private String name;
	private int age;
	private String content;
	private Date regdate;
	public BoardVO() {

	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", name=" + name + ", age=" + age + ", content=" + content + ", regdate="
				+ regdate + ", getBno()=" + getBno() + ", getName()=" + getName() + ", getAge()=" + getAge()
				+ ", getContent()=" + getContent() + ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
