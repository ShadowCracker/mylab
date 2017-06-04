package org.lq.ssm.system.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.lq.ssm.entity.Anthorty;
import org.lq.ssm.entity.Role;
import org.lq.ssm.entity.Staff;
import org.lq.ssm.system.service.StaffBiz;
import org.lq.ssm.system.service.impl.AnthortyBizImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("staff.do")
public class StaffController {
   @Resource(name="staffBizImpl")
   private StaffBiz staffBiz;
   
   @Resource(name="anthortyBizImpl")
	private AnthortyBizImpl anthortyBiz;
   
   /**
    * 查询全部员工
    * @param m
    * @return
    */
   @RequestMapping(params="findStaff")
   public String findAll(Model m){
	   m.addAttribute("staffList",staffBiz.findAll());
	   return "view/system/staffinfo/staffinfo_list";
   }
   /**
    * 更新员工
    * @param s
    * @param m
    * @return
    */
   @RequestMapping(params="byid")
   public String getbyId(Integer id,Model m){
	   m.addAttribute("staffbyid", staffBiz.findById(id));
	   return "view/system/staffinfo/staffinfo_update";
   }
   @RequestMapping(params="update")
   public String update(Staff s){
	   System.out.println(s);
	   System.out.println(s.getAddress()+s.getSex());
	   if(staffBiz.update(s)>0){
		   return "redirect:staff.do?findStaff";
	   }
	   return "view/system/staffinfo/staffinfo_update";
   }
   
    @RequestMapping(params="login",method=RequestMethod.POST)
   public String login(Staff s,HttpSession session,Model m){
	 
	  
	   Staff staff = staffBiz.findByIdAndPassword(s);
	   if(staff!=null){
		   session.setAttribute("userInfor", staff);
		   Map<Anthorty,List<Anthorty>> map = new HashMap<Anthorty,List<Anthorty>>();
		   
		   List<Anthorty> parent = anthortyBiz.findParentByRId(staff.getRoles().getRid());
		   if(parent!=null&&!"".equals(parent)&&parent.size()>0){
			   for(Anthorty anthorty:parent){
				   List<Anthorty> child = anthortyBiz.findChildren(anthorty.getAid());
				   if(child!=null&&!"".equals(child)&&child.size()>0){
					   List<Anthorty> temp = new ArrayList<Anthorty>();
					   for(Anthorty an:child){
						   temp.add(an);
					   }
					   map.put(anthorty, temp);
				   }
			   }
		   }
		   
		   m.addAttribute("map", map);  
		   return "index";
	   }
	   return "login";
   }
   
   
   /**
    * 保存
    * @param s
    * @return
    */
   @RequestMapping(params="save")
   public String staffSave(Staff s){
	   if(staffBiz.save(s)>0){
		   return "redirect:staff.do?findStaff";
	   }
	   return "view/system/staffinfo/staffinfo_add";
   }
   /**
    * 很据条件查询
    * @param name
    * @param sex
    * @param m
    * @return
    */
   @RequestMapping(params="likefind")
   public String likeName(String sname,String sex,Model m){
	   m.addAttribute("staffList",staffBiz.likename(sname, sex));
	   return "view/system/staffinfo/staffinfo_list";
   }
   /**
    * 删除
    * @param id
    * @return
    */
   @RequestMapping(params="delete")
   public String delete(Integer id){
	   if(staffBiz.delete(id)>0){
		   System.out.println("*****************");
		   return "redirect:staff.do?findStaff";
	   }
	   return "redirect:staff.do?findStaff";
   }
public void setStaffBiz(StaffBiz staffBiz) {
	this.staffBiz = staffBiz;
  }     


@RequestMapping(params="showchart")  
public String showChart( Model model, HttpServletRequest request) {  
   
    //查询数据  
    List<String[]> list = staffBiz.getCHart(); 
    int i = 1;  
    StringBuffer yixiang=new StringBuffer();  
    StringBuffer value=new StringBuffer();  
    yixiang.append("[");  
    value.append("[");  
    for (String[] str : list) {  
    	yixiang.append("'").append(str[0]).append("'");  
    	value.append(str[1]);  
        //若为最后一个则不加逗号  
        if(i<list.size()){  
        	yixiang.append(",");  
        	value.append(",");  
        }  
    }  
    yixiang.append("]");  
    value.append("]");  
   
    model.addAttribute("yixiangArray", yixiang);  
    model.addAttribute("cpuValueArray", value);  
    return   "view/bootm";  
}  





}
