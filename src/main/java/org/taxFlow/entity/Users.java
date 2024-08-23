package org.taxFlow.entity;

import java.util.List;

import jakarta.persistence.Entity;



import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Users {
@Id
@GeneratedValue
private int userid;
private String officername;
private String username;
private String password;
private String role;
private boolean hasskill;

@OneToMany(mappedBy = "assistant")
private List<AssignedWork> assignedWorks;
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public String getOfficername() {
	return officername;
}
public void setOfficername(String officername) {
	this.officername = officername;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public boolean getHasskill() {
	return hasskill;
}
public void setHasskill(boolean hasskill) {
	this.hasskill = hasskill;
}

}