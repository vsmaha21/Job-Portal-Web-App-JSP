package com.learn.myjob.model;

import java.util.List;
import java.util.Map;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
@Entity
public class JobPost {
	
	@Id
	private Integer postId;
	private String postProfile; 
	private String postDesc;
	private Integer reqExperience;
	private List<String> postTechStack;
	private List<String> candidates;
	
	
	
	
	public JobPost(Integer postId, String postProfile, String postDesc, Integer reqExperience,
			List<String> postTechStack) {
		super();
		this.postId = postId;
		this.postProfile = postProfile;
		this.postDesc = postDesc;
		this.reqExperience = reqExperience;
		this.postTechStack = postTechStack;
	}
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public String getPostProfile() {
		return postProfile;
	}
	public void setPostProfile(String postProfile) {
		this.postProfile = postProfile;
	}
	public String getPostDesc() {
		return postDesc;
	}
	public void setPostDesc(String postDesc) {
		this.postDesc = postDesc;
	}
	public Integer getReqExperience() {
		return reqExperience;
	}
	public void setReqExperience(Integer reqExperience) {
		this.reqExperience = reqExperience;
	}
	public List<String> getPostTechStack() {
		return postTechStack;
	}
	public void setPostTechStack(List<String> postTechStack) {
		this.postTechStack = postTechStack;
	}

	public List<String> getCandidates() {
		return candidates;
	}
	public void setCandidates(List<String> candidates) {
		this.candidates = candidates;
	}
	public JobPost() {
		super();
	}
	
	
	
	

}
