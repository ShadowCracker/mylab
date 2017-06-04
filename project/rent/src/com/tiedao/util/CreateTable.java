package com.tiedao.util;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.tiedao.pojo.User;


/**
 * SQL分类:
 * DDL:create drop alter truncate
 * DCL:grant revoke
 * TCL:commit rollback
 * DML:insert update detele select
 * @author yangming
 *
 */
public class CreateTable {
	public static void main(String[] args) {
		// 获取Configuration对象
		Configuration cfg = new Configuration();
		// 读取的是 hibernate.cfg.xml
		cfg.configure();

		
		SchemaExport export = new SchemaExport(cfg);
		export.create(true, true);
		
		
		List<User> list = new ArrayList<User>();
		User user = new User();
		user.setAddress("aaa");
		list.add(user);
	}

}
