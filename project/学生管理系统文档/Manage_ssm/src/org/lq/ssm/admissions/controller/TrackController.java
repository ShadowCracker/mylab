package org.lq.ssm.admissions.controller;

import javax.annotation.Resource;

import org.lq.ssm.admissions.service.TrackBiz;
import org.lq.ssm.entity.Audition;
import org.lq.ssm.entity.Track;
import org.lq.ssm.student.service.StudentBiz;
import org.lq.ssm.util.service.DictionoryBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("track.do")
public class TrackController {
	@Resource(name="trackBizImpl")
	private TrackBiz trackBiz;
	@Resource(name="studentBizImpl")
	private StudentBiz studentBiz;
	@Resource(name="dictionoryBizImpl")
	private DictionoryBiz dictionoryBiz;

//-----------------------------------------------
	@RequestMapping(params="trackAll")
	public String findAll(Model m){
		
		m.addAttribute("dictionoryList",dictionoryBiz.findBytype("intention_type"));
		m.addAttribute("track_List", trackBiz.findAll());
		return "view/recruitstudent/trackrecord/trackrecord_list";
		
	}
	//--------------------------------------------	
	@RequestMapping(params="likeName")
	public String getByName(String Enrollment,Model m){
		m.addAttribute("dictionoryList",dictionoryBiz.findBytype("intention_type"));
	 if("".equals(Enrollment) || Enrollment==null){
			m.addAttribute("track_List",trackBiz.findAll());
		}else if(!"".equals(Enrollment)){
			m.addAttribute("track_List",trackBiz.getByEnrollment(Enrollment));
		}
	 return "view/recruitstudent/trackrecord/trackrecord_list";
		
	}

//----------------------------------------------
	@RequestMapping(params="save")
	public String save(Track t){
		trackBiz.save(t);
			return "redirect:track.do?trackAll";
	}
		
//------------------------------------------------
	@RequestMapping(params="getStudent")
	public String getStudent(Model m){
		m.addAttribute("studentList",studentBiz.findAllNot());
		
		return "view/recruitstudent/trackrecord/trackrecord_add";
	}
//---------------------------------------------------
	@RequestMapping(params="delete")
	public String delete(Integer id){
		trackBiz.delete(id);
		return "redirect:track.do?trackAll";
		}
		
//----------------------------------------------------
	@RequestMapping(params="update")
	public String update(Track t){
		
		trackBiz.update(t);
		return "redirect:track.do?trackAll";
		}
//-----------------------------------------------------
	@RequestMapping(params="getById")
	public String getById(Integer id,Model m){
		m.addAttribute("dictionoryList",dictionoryBiz.findBytype("intention_type"));
		m.addAttribute("studentList",studentBiz.findAllNot());
		m.addAttribute("track",trackBiz.getById(id));
			return "view/recruitstudent/trackrecord/trackrecord_update";
		}
//------------------------------------------
	@RequestMapping(params="getDictionory")
	public String getDictionory(Model m){
		m.addAttribute("dictionoryList",dictionoryBiz.findBytype("intention_type"));
		return "view/recruitstudent/trackrecord/trackrecord_add";
	}
//------------------------------------------
	public TrackBiz getTrackBiz() {
		return trackBiz;
	}

	public void setTrackBiz(TrackBiz trackBiz) {
		this.trackBiz = trackBiz;
	}

	public StudentBiz getStudentBiz() {
		return studentBiz;
	}

	public void setStudentBiz(StudentBiz studentBiz) {
		this.studentBiz = studentBiz;
	}

	public DictionoryBiz getDictionoryBiz() {
		return dictionoryBiz;
	}

	public void setDictionoryBiz(DictionoryBiz dictionoryBiz) {
		this.dictionoryBiz = dictionoryBiz;
	}

}
