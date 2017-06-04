package org.lq.ssm.classinfo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.lq.ssm.classinfo.service.ScheduleBiz;
import org.lq.ssm.classinfo.service.SubjectBiz;
import org.lq.ssm.entity.Schedule;
import org.lq.ssm.entity.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("schedule.do")
public class ScheduleController {
	
	@Resource(name="scheduleAction")
	private ScheduleBiz scheduleBiz;
	
	@Resource(name="subjectAction")
	private SubjectBiz subjectBiz;
	
	
	@RequestMapping(params="findAll")
	public String findAll(Model m,HttpSession session){
		m.addAttribute("schedule_list", scheduleBiz.findAll());
		session.setAttribute("subject_list", subjectBiz.findAll());
		
		return "view/classinfo/syllabusinfo/syllabusinfo_list";
	}
	
	@RequestMapping(params="byName")
	public String findByName(String name,Model m){
		m.addAttribute("schedule_list",scheduleBiz.findByName(name));
		
		return "view/classinfo/syllabusinfo/syllabusinfo_list";
	}
	
	@RequestMapping(params="byId")
	public String findById(int id,Model m){
		Schedule sch = scheduleBiz.findById(id);
		m.addAttribute("schedule_list",sch );
		
		return "view/classinfo/syllabusinfo/syllabusinfo_update";
	}
	
	@RequestMapping(params="save")
	public String save(Schedule s){
		if (scheduleBiz.save(s)>0) {
			return "redirect:schedule.do?findAll";
		}
		
		return "view/classinfo/syllabusinfo/disciplineinfo_add";
	}
	
	@RequestMapping(params="update")
	public String update(Schedule s){
		if (scheduleBiz.update(s)>0) {
			return "redirect:schedule.do?findAll";
		}
		
		return "view/classinfo/syllabusinfo/disciplineinfo_update";
	}
	
	
	@RequestMapping(params="delete")
	public String delete(int id){
		if (scheduleBiz.delete(id)>0) {
			return "redirect:schedule.do?findAll";
		}
		return "view/classinfo/syllabusinfo/syllabusinfo_list";
		
	}
	
	public SubjectBiz getSubjectBiz() {
		return subjectBiz;
	}

	public void setSubjectBiz(SubjectBiz subjectBiz) {
		this.subjectBiz = subjectBiz;
	}

	public ScheduleBiz getScheduleBiz() {
		return scheduleBiz;
	}

	public void setScheduleBiz(ScheduleBiz scheduleBiz) {
		this.scheduleBiz = scheduleBiz;
	}
	
}
