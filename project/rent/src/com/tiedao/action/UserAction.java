package com.tiedao.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.UserService;

public class UserAction  extends ActionSupport{

	private User user;
	private UserService userService;
	private Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	private Map<String, Object> session = ActionContext.getContext().getSession();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 登录功能
	 * @return
	 */
	public String login(){
		
		User u = userService.findByLogin(this.user);
		if(u == null){
			return "login";
		}else{
			session.put("loginUser", u);
			
			return "list";
		}
	}
	/**
	 * 检查用户名是否存在
	 */
	public String checkUserName() throws Exception{
		User u = userService.findByNickName(this.user);
		try{
			response.setContentType("text/html;charset=UTF-8");
			if(u == null){
				response.getWriter()
					.println("{\"rolemessage\":\"<span style='color:green;'>恭喜您，此用户可以使用</span>\",\"flag\":\"true\"}");
			}else{
				response.getWriter()
					.println("{\"rolemessage\":\"<span style='color:green;'>对不起，此用户已经被使用</span>\",\"flag\":\"false\"}");
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 
	 */
	public String registerUser(){
		boolean flag = userService.saveUser(this.user);
		if(!flag){
			request.put("regError", "注册失败");
			return "reg";
		}else{
			User u = userService.findByLogin(this.user);
			if (u != null) {
				session.clear();
				session.put("loginUser", u);
				return "list";
			} else {
				request.put("loginError", "登陆失败");
				return "index";
			}
		}
		
	}
	
}
