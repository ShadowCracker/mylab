package org.lq.ssm.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.lq.ssm.entity.Anthoies;
import org.lq.ssm.entity.Anthorty;
import org.lq.ssm.system.service.RoleBiz;
import org.lq.ssm.system.service.impl.AnthortyBizImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("anthorty.do")
public class AnthortyController {
	
    @Resource(name="anthortyBizImpl")
	private AnthortyBizImpl anthortyBiz;
    @Resource(name="roleBizImpl")
    private RoleBiz roleBiz;
   
	/**
     * 返回Json数组
     * @return
     */
    @RequestMapping(params="findparent")
  
    public String findParent(HttpServletResponse response){
    	response.setContentType("text/html;charset=utf-8");
    	String data=anthortyBiz.getParentJson();
    	System.out.println(data);
    	try {
			response.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;
    }
    /**
     * 查询全部
     * @param m
     * @return
     */
    @RequestMapping(params="all")
    public String findAll(Model m){
    	List<Anthorty> list = anthortyBiz.findAll();
    	int a = list.size();
    	List<Anthorty> allParent = anthortyBiz.findParent();
    	m.addAttribute("allList",list);
    	m.addAttribute("allParent", allParent);
    	return "view/system/anthorty/anthorty_show";
    }
    /**
     * 保存
     * @param a
     * @param m
     * @return
     */
    @RequestMapping(params="save")
    public String saveAnthorty(Anthorty a){
    	if(anthortyBiz.save(a)>0){
    		return "redirect:view/system/anthorty/anthorty_list";
    	}
    	return "view/system/anthorty/anthorty_add";
    }
    /**
     * 查询全部父级(完成)
     * @param m
     * @return
     */
    @RequestMapping(params="findPre")
    public String findparent(Model m){
    	m.addAttribute("ParentList",anthortyBiz.findParent());
    	return "view/system/anthorty/anthorty_add";
    }
    
    @RequestMapping(params="saveone")
    public String saveOne(Anthorty a){
    	a.setUrl("无");
    	Anthorty par = new Anthorty();
    	par.setAid(0);
    	a.setParent(par);
    	if(anthortyBiz.save(a)>0){
    		return "redirect:anthorty.do?all";
    	}
    	return "view/system/anthorty/anthorty_addone";
    }
    
    @RequestMapping(params="savetwo")
    public String savetwo(Anthorty a){
    	if(anthortyBiz.save(a)>0){
    		return "redirect:anthorty.do?all";
    	}
    	return "view/system/anthorty/anthorty_addtwo";
    }
    
    
    
    /**
     * 查询全部子级
     * @param m
     * @return
     */
    @RequestMapping(params="findchild")
    public String  findChildren(Model m){
    //	m.addAttribute("findChildren", anthortyBiz.findChildren());
   	    return "";
    }
	
    
    @RequestMapping(params="byname")
    public String  findChildrenByName(Integer paid,Model m){
    	List<Anthorty> allParent = anthortyBiz.findParent();
    	List<Anthorty> child = anthortyBiz.findChildren(paid);
    	m.addAttribute("allList",child);
    	m.addAttribute("allParent", allParent);
    	return "view/system/anthorty/anthorty_show";
    }
    
    
    
    
    
	/**
	 * 根据Id查询
	 * @param id
	 * @param m
	 * @return
	 */
    @RequestMapping(params="byid")
	public String findById(Integer id,Model m){
    	m.addAttribute("byidList", anthortyBiz.findById(id));
		return "view/system/anthorty/anthorty_show";
	}
    
    @RequestMapping(params="updat")
   	public String updat(Anthorty anthorty){
    	anthortyBiz.update(anthorty);
   		return "redirect:anthorty.do?all";
   	}
    
    @RequestMapping(params="update")
   	public String update(Integer id,@RequestParam("quanxian") Integer[]quanxian){
    	
    	List<Anthorty> child = anthortyBiz.findChildren(id);
    	for(Anthorty temp:child){
    		Anthorty par = new Anthorty();
    		par.setAid(0);
    		temp.setParent(par);
    		anthortyBiz.update(temp);
    	}
    	
    	if(quanxian!=null&&quanxian.length>0){
    		Anthorty parent = anthortyBiz.findById(id);
    		for(Integer temp:quanxian){
    			Anthorty anthorty = anthortyBiz.findById(temp);
    			anthorty.setParent(parent);
    			anthortyBiz.save(anthorty);
    		}
    	}
    	
   		return "redirect:anthorty.do?all";
   	}
    
    
    @RequestMapping(params="getParent")
	public String getParent(Model m){
    	m.addAttribute("allParent", anthortyBiz.findParent());
		return "view/system/anthorty/anthorty_addtwo";
	}
    
    @RequestMapping(params="judege")
   	public String judege(Integer id,Model m){
    	Anthorty temp = anthortyBiz.findById(id);
    	List<Anthorty> child = anthortyBiz.findChildren(id);
    	List<Anthorty> allChild = anthortyBiz.findAllChild();
       	m.addAttribute("byidList", temp);
       	if((child!=null&&child.size()>0)||"无".equals(temp.getUrl())){
       		
       		List<Anthoies> list = new ArrayList<Anthoies>();
       		for(Anthorty anthorty:child){
       			list.add(new Anthoies(anthorty.getAid(), anthorty.getName(), true));
       		}
       		for(Anthorty anthorty:allChild){
       			boolean flag = false;
       			for(Anthorty an:child){
       				if(an.getAid()==anthorty.getAid()){
       					flag = true;
       				}
       			}
       			if(!flag){
       				list.add(new Anthoies(anthorty.getAid(), anthorty.getName(), false));
       			}
       		}
       		m.addAttribute("list", list);
       		
       		
       		/*m.addAttribute("childList", child);
       		m.addAttribute("allChild", allChild);*/
       		return "view/system/anthorty/anthorty_change";
       	}else{
       		
       		List<Anthorty> allParent = anthortyBiz.findParent();
       		Anthorty parent = anthortyBiz.findParentById(id);
       		m.addAttribute("allParent", allParent);
       		m.addAttribute("parent", parent);
       		
       		return "view/system/anthorty/anthorty_change_child";//二级页面
       	}
      
   		
   	}
    
    
	/**
	 * 根据Id修改权限
	 * @param id
	 * @param m
	 * @return
	 */
    @RequestMapping(params="byidup")
	public String findByIds(Integer id,Model m){
//    	System.out.println(id+"**********************");
    	m.addAttribute("byidListup", anthortyBiz.findById(id));
    	m.addAttribute("ParentList",anthortyBiz.findParent());
		return "view/system/anthorty/anthorty_add";
	}
    /**
     * 根据Id删除
     * @param id
     * @return
     */
    @RequestMapping(params="delete")
    public String delete(Integer id){
    	
    	List<Anthorty> child = anthortyBiz.findChildren(id);
    	if(child!=null&&!"".equals(child)&&child.size()>0){//删除一级权限
    		for(Anthorty temp:child){
    			anthortyBiz.delete(temp.getAid());
    		}
    		anthortyBiz.delete(id);
    	}else{
    		anthortyBiz.delete(id);
    	}
    	return "redirect:anthorty.do?all";
    }

    /**
     * 修改
     * @param a
     * @return
     */
//    @RequestMapping(params="update")
//    public String update(Anthorty a){
//    	System.out.println(a+"******************");
//    	if(anthortyBiz.update(a)>0){
//    		System.out.println("+++++++++++++++++");
//    		return "view/system/anthorty/anthorty_list";
//    	}
//    	return null;
//    }


   
    /**
     * 根据name查询角色
     * @param name
     * @param m
     * @return
     */
    @RequestMapping(params="findRoleByName")
    public String findRoleByName(String name,Model m){
    	m.addAttribute("roleList", roleBiz.likename(name));
    	return "view/system/anthotychange/anthorty_changelist";
    }
    
    /**
     * 查询角色
     * @param m
     * @return
     */
    @RequestMapping(params="findRole")
    public String findRole(Model m){
    	m.addAttribute("roleList",roleBiz.findAll());
		return "view/system/anthotychange/anthorty_changelist";	
    }
    
    public void setAnthortyBiz(AnthortyBizImpl anthortyBiz) {
		this.anthortyBiz = anthortyBiz;
	}
	public void setRoleBiz(RoleBiz roleBiz) {
		this.roleBiz = roleBiz;
	}
    
    
}
