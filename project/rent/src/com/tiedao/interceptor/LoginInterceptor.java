package com.tiedao.interceptor;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.tiedao.pojo.User;
/**
 * 登录的拦截器
 * @author Administrator
 *
 */
public class LoginInterceptor extends MethodFilterInterceptor {
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User) invocation.getInvocationContext().getSession().get("loginUser");
		if (user == null) {
			invocation.getInvocationContext().getSession().clear();
			return "login";//如果用户没有登录，跳转到登录页面
		} else {
			return invocation.invoke();
		}
	}
}
