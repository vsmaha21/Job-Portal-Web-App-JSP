package com.learn.myjob.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.learn.myjob.model.JobPost;

@Repository
public interface JobPostJpaRepository extends JpaRepository<JobPost,Integer>{

}
