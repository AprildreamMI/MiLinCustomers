package com.milin.java.CustomersUser;


//customers
/*+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| c_Id       | int(20)     | NO   | PRI | NULL    | auto_increment |
| c_Email    | varchar(50) | NO   | UNI | NULL    |                |
| c_Password | varchar(30) | NO   |     | NULL    |                |
| c_Name     | varchar(30) | NO   |     | NULL    |                |
| c_Gender   | char(2)     | NO   |     | NULL    |                |
| c_Address  | varchar(50) | YES  |     | NULL    |                |
| c_Phone    | varchar(11) | YES  |     | NULL    |                |
| c_Type     | varchar(10) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+*/

/**
 * @author MagicWing
 * ”√ªß¿‡
 */
public class Cuser {
	private String Id;
	private String Email;
	private String PasswordString;
	private String Name;
	private String Gender;
	private String Address;
	private String Phone;
	private String Type;
	
	
	public Cuser() {
		super();
	}

	public Cuser(String email, String passwordString) {
		super();
		Email = email;
		PasswordString = passwordString;
	}

	public Cuser(String id, String email, String passwordString, String name,
			String gender, String address, String phone, String type) {
		super();
		Id = id;
		Email = email;
		PasswordString = passwordString;
		Name = name;
		Gender = gender;
		Address = address;
		Phone = phone;
		this.Type = type;
	}
	
	public Cuser(String email, String passwordString, String name, String gender,String type) {
		super();
		Email = email;
		PasswordString = passwordString;
		Name = name;
		Gender = gender;
		Type=type;
	}

	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPasswordString() {
		return PasswordString;
	}
	public void setPasswordString(String passwordString) {
		PasswordString = passwordString;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getType() {
		return Type;
	}
	public void setBase(String type) {
		this.Type = type;
	}
	
	
}
