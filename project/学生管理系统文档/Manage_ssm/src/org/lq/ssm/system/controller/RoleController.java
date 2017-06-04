package org.lq.ssm.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.lq.ssm.entity.Anthoies;
import org.lq.ssm.entity.Anthorty;
import org.lq.ssm.entity.NameAndAnthory;
import org.lq.ssm.entity.Role;
import org.lq.ssm.entity.RoleAnthorty;
import org.lq.ssm.entity.Staff;
import org.lq.ssm.system.service.AnthortyBiz;
import org.lq.ssm.system.service.RoleAnthortyBiz;
import org.lq.ssm.system.service.RoleBiz;
import org.lq.ssm.system.service.StaffBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("role.do")
public class RoleController {
	@Resource(name = "roleBizImpl")
	private RoleBiz roleBiz;
	@Resource(name = "staffBizImpl")
	private StaffBiz staffBiz;
	@Resource(name = "anthortyBizImpl")
	private AnthortyBiz anthortyBiz;
	@Resource(name = "roleAnthoryBizImpl")
	private RoleAnthortyBiz roleAnthortyBiz;

	/**
	 * 查询全部
	 * 
	 * @return
	 */
	@RequestMapping(params = "roleFind")
	public String rolefind(Model m) {
		m.addAttribute("roleList", this.findNameAndAnthory());
		return "view/system/roleinfo/roleinfo_list";
	}

	/**
	 * 根据姓名查询
	 */
	@RequestMapping(params = "like")
	public String likename(String sname, Model m) {
		if (StringUtils.isEmptyOrWhitespaceOnly(sname)) {
			return "redirect:role.do?roleFind";
		}
		List<NameAndAnthory> roleList = null;
		List<Role> list = roleBiz.likename(sname);
		if (list != null && !"".equals(list) && list.size() > 0) {
			roleList = new ArrayList<NameAndAnthory>();
			NameAndAnthory nameAndAnthory = findNameAndAnthoryById(list.get(0)
					.getRid());
			nameAndAnthory.setRoleName(list.get(0).getName());
			roleList.add(nameAndAnthory);
		}

		m.addAttribute("roleList", roleList);
		return "view/system/roleinfo/roleinfo_list";
	}

	/**
	 * 保存
	 * 
	 * @param r
	 * @return
	 */
	@RequestMapping(params = "save")
	public String saverole(String rname, String desc,
			@RequestParam("quanxian") String[] quanxian) {

		Role role = new Role();
		role.setName(rname);
		role.setDesc(desc);
		roleBiz.save(role);
		List<Role> list = roleBiz.likename(rname);
		if (list != null && !"".equals(list) && list.size() > 0) {
			if (quanxian != null && !"".equals(quanxian) && quanxian.length > 0) {
				for (String str : quanxian) {
					Anthorty anthorty = anthortyBiz.findByName(str);
					roleAnthortyBiz.save(new RoleAnthorty(list.get(0).getRid(),
							anthorty.getAid()));
				}
			}
		}
		return "redirect:role.do?roleFind";

	}

	@RequestMapping(params = "savebefore")
	public String savebefore(Model m) {

		List<Anthorty> alist = anthortyBiz.findParent();
		m.addAttribute("list", alist);
		return "view/system/roleinfo/roleinfo_add";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "delete")
	public String deleteRole(Integer id) {

		if (roleAnthortyBiz.deleRoleAnth(id) > 0 && roleBiz.delete(id) > 0) {
			return "redirect:role.do?roleFind";
		}
		return "view/system/roleinfo/roleinfo_list";
	}

	/**
	 * 根据id查询
	 * 
	 * @param id
	 * @param m
	 * @return
	 */
	@RequestMapping(params = "byid")
	public String findByid(Integer id, Model m) {
		Role role = roleBiz.findById(id);
		NameAndAnthory andAnthory = this.findNameAndAnthoryById(id);
		andAnthory.setRoleName(role.getName());
		List<Anthoies> list = new ArrayList<Anthoies>();
		List<Anthorty> allAnthory = anthortyBiz.findParent();
		for (Anthorty te : allAnthory) {
			list.add(new Anthoies(te.getName(), false));
		}
		if (!"".equals(andAnthory) && andAnthory != null
				&& andAnthory.getList() != null) {
			for (Anthoies an : list) {
				if (andAnthory.getList().contains(an.getName())) {
					an.setFlag(true);
				}
			}
		}
		if(list.size()==0){
			list.add(new Anthoies(" ", false));
		}
		m.addAttribute("findId", role);
		m.addAttribute("andAnthory", andAnthory);
		m.addAttribute("list", list);
		return "view/system/roleinfo/role_change";
	}

	/**
	 * 更新
	 * 
	 * @param r
	 * @return
	 */
	@RequestMapping(params = "update")
	public String update(Role r) {
		System.out.println("***********************************");
		if (roleBiz.update(r) > 0) {
			return "redirect:role.do?roleFind";
		}
		return "view/system/roleinfo/roleinfo_update";
	}

	/**
	 * 角色改变
	 */
	@RequestMapping(params = "rsChange")
	public String rolechang(Model m) {
		m.addAttribute("rsList", staffBiz.findAll());
		return "view/system/roleinfo/staffinfo_role_list";
	}

	/**
	 * 很据条件查询
	 * 
	 * @param name
	 * @param sex
	 * @param m
	 * @return
	 */
	@RequestMapping(params = "likefind")
	public String likeName(String sname, String sex, Model m) {
		m.addAttribute("rsList", staffBiz.likename(sname, sex));
		return "view/system/roleinfo/staffinfo_role_list";
	}

	/**
	 * 保存
	 * 
	 * @param s
	 * @return
	 */
	@RequestMapping(params = "saves")
	public String staffSave(Staff s) {
		if (staffBiz.save(s) > 0) {
			return "redirect:role.do?rsChange";
		}
		return "view/system/staffinfo/staffinfo_add";
	}

	/**
	 * 根据ID查询员工
	 * 
	 * @param id
	 * @param m
	 * @return
	 */
	@RequestMapping(params = "byids")
	public String findById(Integer id, Model m) {
		m.addAttribute("roleall", roleBiz.findAll());
		m.addAttribute("staffbyid", staffBiz.findById(id));
		return "view/system/roleinfo/role_change";
	}

	@RequestMapping(params = "saverole")
	public String saverole(Integer rid,
			@RequestParam("quanxian") String[] quanxian) {

		List<Anthorty> list = anthortyBiz.findAnthortyByRoleId(rid);
		if (list == null || "".equals(list) || list.size() == 0) {

		} else {
			roleAnthortyBiz.deleRoleAnth(rid);
		}

		if (quanxian != null && !"".equals(quanxian) && quanxian.length > 0) {
			for (String str : quanxian) {
				Anthorty anthorty = anthortyBiz.findByName(str);
				RoleAnthorty roleAnthorty = new RoleAnthorty();
				roleAnthorty.setAid(anthorty.getAid());
				roleAnthorty.setRid(rid);
				roleAnthortyBiz.save(roleAnthorty);
			}
		}

		return "redirect:role.do?roleFind";

		// return "view/system/roleinfo/role_change";
	}

	public List<NameAndAnthory> findNameAndAnthory() {
		List<Role> rList = roleBiz.findAll();
		List<NameAndAnthory> roleList = new ArrayList<NameAndAnthory>();
		if (rList != null && !"".equals(rList) && rList.size() > 0) {
			for (int i = 0; i < rList.size(); ++i) {
				List<Anthorty> list = anthortyBiz.findAnthortyByRoleId(rList
						.get(i).getRid());
				String roleName = rList.get(i).getName();
				List<String> temp = null;
				if (list != null && !"".equals(list) && list.size() > 0) {
					temp = new ArrayList<String>();
					for (int j = 0; j < list.size(); ++j) {
						temp.add(list.get(j).getName());
					}
				}
				NameAndAnthory nameAndAnthory = new NameAndAnthory(rList.get(i)
						.getRid(), roleName, temp);
				roleList.add(nameAndAnthory);
			}
		}
		return roleList;
	}

	public NameAndAnthory findNameAndAnthoryById(int rid) {

		List<Anthorty> list = anthortyBiz.findAnthortyByRoleId(rid);
		List<String> temp = null;
		if (list != null && !"".equals(list) && list.size() > 0) {
			temp = new ArrayList<String>();
			for (int j = 0; j < list.size(); ++j) {
				temp.add(list.get(j).getName());
			}
		}
		NameAndAnthory roleList = new NameAndAnthory(rid, null, temp);
		return roleList;
	}

}
