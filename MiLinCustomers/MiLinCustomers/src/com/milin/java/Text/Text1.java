package com.milin.java.Text;

import java.util.Vector;

import com.milin.java.CustomersUser.Cuser;
import com.milin.java.dao.UserDAO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class Text1 
{
	public static void main(String[] args) 
	{
		UserDAO userDAO=new UserDAO();
		/*Cuser textCuser=new Cuser("1159902744@qq.com","asdzxc123","����","��","base");
		
		boolean bool=userDAO.AddUser(textCuser);
		if (bool) {
			System.out.println("����û��ɹ�");
		}else {
			System.out.println("����û�ʧ��");
		}*/
		
		boolean bool=userDAO.FindUser("1159902744@qq.com");
		if (bool) {
			System.out.println("�û�����");
		}
		/*boolean bool=userDAO.DeleteUser("1159902744@qq.com");
		if (bool) {
			System.out.println("ɾ���ɹ�");
		}*/
		
		/*java.util.List<Cuser> list;
		list=userDAO.FindAllTmUsers();
		for (int i = 0; i < list.size(); i++) {
			Cuser cuser=(Cuser)list.get(i);
			System.out.println(cuser.getEmail());
		}*/
		
		/*Cuser newCuser=userDAO.ReturnCuser("1159902944@qq.com");
		System.out.println(newCuser.getPasswordString());
		
		boolean bool=userDAO.UpdataeUser(newCuser);*/
	}
}
