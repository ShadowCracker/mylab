package org.lq.ssm.util.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.lq.ssm.entity.Dictionory;
import org.lq.ssm.util.service.DictionoryBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dictionory.do")
public class DictionoryController {
	
	@Resource(name="dictionoryBizImpl")
	private DictionoryBiz dictionoryBiz;
	
	
	@RequestMapping(params="findAll")
	public String findAll(Model m){
		m.addAttribute("dic_list", dictionoryBiz.findAll());
		return "view/system/datadictionary/datadictionary_list";
	}
	
	@RequestMapping(params="delete")
	public String delete(Integer id){
		if(dictionoryBiz.delete(id)>0){
			return "redirect:dictionory.do?findAll";
		}
		return "view/system/datadictionary/datadictionary_list";
	}
	
	@RequestMapping(params="byid")
	public String findById(Integer id,Model m){
		
		m.addAttribute("dict", dictionoryBiz.findById(id));
		return "view/system/datadictionary/datadictionary_update";
	}
	
	@RequestMapping(params="update")
	public String update(Dictionory dictionory,Model m){
		if(dictionoryBiz.update(dictionory)>0){
			return "redirect:dictionory.do?findAll";
		}
		return "view/system/datadictionary/datadictionary_list";
	}
	
	@RequestMapping(params="save")
	public String save(Dictionory dictionory){
		int temp = dictionoryBiz.save(dictionory);
		if(temp>0){
			return "redirect:dictionory.do?findAll";
		}
		return "view/system/datadictionary/datadictionary_list";
	}
	
	@RequestMapping(params="findBytype")
	public String findBytype(String type,Model m){
		if(type==null || "".equals(type)){
			return "redirect:dictionory.do?findAll";
		}
		m.addAttribute("dic_list", dictionoryBiz.findBytype(type));
		return "view/system/datadictionary/datadictionary_list";
	}
	
	
	
}
