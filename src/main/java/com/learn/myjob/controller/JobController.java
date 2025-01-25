package com.learn.myjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.learn.myjob.model.JobPost;
import com.learn.myjob.service.JobService;

@Controller
public class JobController {
	
	@Autowired
	JobService jobService;
	
	Logger log = Logger.getLogger("JobController");
	
	
	@GetMapping({"/","home"})
	public String home() {
		
		System.out.println("In Home-->>");
		return "home.jsp";
	}
	
	//view all jobs
//	@GetMapping("/viewalljobs")
//	public String viewAllJobs() {
//		log.info("Fetching ALL Available jobs");
//		return "viewalljobs.jsp";	
//	}
	
	
	@GetMapping("/viewalljobs")
	public String viewJobs(Model model) {

		List<JobPost> jobPosts = jobService.fetchAllJobs();
		model.addAttribute("jobPosts", jobPosts);
		
//		boolean deleteSuccess = false;
	    
	    // Add delete success flag to model
//	    model.addAttribute("deleteSuccess", deleteSuccess);
		return "viewalljobs.jsp";
	}
	
	//Add new Job
//	@PostMapping("/addjob")
//	public JobPost addJob(@Validated @RequestBody JobPost job) {
//		log.info("Adding a new Job "+job);
//		jobService.addNewJob(job);
//		return job;//"Job Added Successfuly";
//	}
	
	
	@RequestMapping("/addjob")
	public String addJob() {
		return "addjob.jsp";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "home.jsp";
	}
	
	
	
	@PostMapping("/handleForm")
	public String handleAddJobForm(JobPost jobPost,Model model) {
		
		boolean flag =jobService.addNewJob(jobPost);
		if(flag) model.addAttribute("jobPostMessage", "Added new Job Successfully");
		else model.addAttribute("jobPostMessage", "Post ID was already present, updated existing job");
			
//			model.addAttribute("jobPost", null);
		
		 
		System.out.println(flag);
		return "success.jsp";
		
	}
		
	//update job //pass ID and update values
	@PutMapping("/update/{postId}")
	public Boolean updateJob(@PathVariable int postId, @RequestBody JobPost job) {
		return jobService.update(postId,job);	
	}
	
//	//delete job by ID
//	@RequestMapping("/delete/{postId}")
//	public String deletJobById(@PathVariable int postId) {
//		log.info("Deleting a PostId "+postId);
//		 jobService.deleteJob(postId);
//		
//		return "viewalljobs.jsp";
//	}
	
	
	
//	@RequestMapping("/delete/{postId}")
//	public String deleteJobPost(@PathVariable int postId, Model model) {
//	    // Delete logic
//	    boolean deleteSuccess = jobService.deleteJob(postId);
//	    
//	    // Add delete success flag to model
//	    model.addAttribute("deleteSuccess", deleteSuccess);
//	    
//	    // Redirect to the same page or home page
//	    return "redirect:/viewalljobs.jsp";  // Or wherever you want to go after deletion
//	}

	
	@RequestMapping("/delete/{postId}")
	@ResponseBody
	public Map<String, Object> deleteJobPost(@PathVariable("postId") Integer postId) {
	    boolean deleteSuccess = jobService.deleteJob(postId); // Perform the delete operation

	    Map<String, Object> response = new HashMap<>();
	    if (deleteSuccess) {
	        response.put("success", true);
	    } else {
	        response.put("success", false);
	    }

	    return response;
	}
	
	@GetMapping("/jobDetails")
    public String viewJobDetails(@RequestParam("postId") Integer postId, Model model) {
        // Retrieve the job post by ID
        JobPost jobPost = jobService.getJob(postId);

        model.addAttribute("jobPostMessage", "Job Details ");

        // Add jobPost to model to pass to JSP
        model.addAttribute("jobPost", jobPost);
        
        model.addAttribute("candidates", "Candidates Applied:");

        // Return the JSP page for job details
        return "success.jsp";  // This should correspond to jobDetails.jsp
    }
	
	
	@GetMapping("/applyjob")
    public String applyjob(@RequestParam("postId") Integer postId, Model model) {
        // Retrieve the job post by ID
		
		System.out.println("Applying for Job");
        JobPost jobPost = jobService.getJob(postId);

        model.addAttribute("jobPostMessage", "Job Details ");

        // Add jobPost to model to pass to JSP
        model.addAttribute("jobPost", jobPost);
        
        model.addAttribute("candidates", "Candidates:");

        // Return the JSP page for job details
        return "applyjob.jsp";  // This should correspond to jobDetails.jsp
    }
	
	
	//view job by ID
	@GetMapping("/get/{postId}")
	public JobPost getJobByID(@PathVariable int postId) {
		log.info("Fetching a job with postId " +postId );
		return jobService.getJob(postId);
	 	
	}
	
	@PostMapping("/applyForm")
	public String applyJobForm(Integer postId, String candidate, Model model) {
		
		System.out.println(postId);
		
		System.out.println(candidate);
		
		JobPost job = jobService.getJob(postId);
		job.addCandidate(candidate);
		
		jobService.update(postId, job);
		
		System.out.println(job.getCandidates());
		
		System.out.println(job.getPostTechStack());
		
//		boolean flag =jobService.addNewJob(jobPost);
//		if(flag) model.addAttribute("jobPostMessage", "Added new Job Successfully");
//		else model.addAttribute("jobPostMessage", "Post ID was already present, updated existing job");
			
			model.addAttribute("jobPost", job);
		
		 
//		System.out.println(flag);
		
		
		return "success.jsp";
		
	}

}
