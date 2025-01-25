package com.learn.myjob.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.learn.myjob.model.JobPost;
import com.learn.myjob.repository.JobPostJpaRepository;

@Component
public class JobService {

	@Autowired
	JobPostJpaRepository repo;

	public JobService() {
		
	}

	public List<JobPost> fetchAllJobs() {
	
		//List<JobPost> jobs = new ArrayList<>(map.values());
		return repo.findAll();
	}

	public boolean addNewJob(JobPost job) {
		
		boolean out = repo.existsById(job.getPostId());
		repo.save(job);
		return !out;
	}

	public Boolean update(int postId, JobPost job) {
		// TODO Auto-generated method stub
		
		boolean out = repo.existsById(job.getPostId());
		if(out) repo.save(job);
		return out;
	}

	public Boolean deleteJob(int postId) {
		// TODO Auto-generated method stub
		boolean out = repo.existsById(postId);
		repo.deleteById(postId);
		
		return out;
	}

	public JobPost getJob(int postId) {
		// TODO Auto-generated method stub
		return repo.findById(postId).orElse(new JobPost());
	}

}
