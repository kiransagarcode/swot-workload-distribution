package org.taxFlow.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Workitem {
    @Id
    @GeneratedValue
    private int workid;

    private String itemname; // Matches the form field "itemname"
    private String worktype; // Matches the form field "worktype"
    private int numoftrans;
    private int numofware;
    private boolean skill;
    private String priority; 
   
	public int getWorkid() {
		return workid;
	}
	public void setWorkid(int workid) {
		this.workid = workid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getWorktype() {
		return worktype;
	}
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	public int getNumoftrans() {
		return numoftrans;
	}
	public void setNumoftrans(int numoftrans) {
		this.numoftrans = numoftrans;
	}
	public int getNumofware() {
		return numofware;
	}
	public void setNumofware(int numofware) {
		this.numofware = numofware;
	}
	public boolean isSkill() {
		return skill;
	}
	public void setSkill(boolean skill) {
		this.skill = skill;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
}
