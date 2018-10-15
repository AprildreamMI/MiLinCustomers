# 密林”用户管理平台

> ##### 如需导入本项目
>
> 1、在Ecplice 或者 MyEcplice 中导入本文件夹下的工程文件夹为 MiLinCustomers
>
> 2、在MySQL中运行初始化 项目描述文件夹下的milintb.sql 文件进行初始化
>
> 3、修改BaseDao.java 文件中的用户名和密码

## 一：需求

**1.**  用户可以在浏览器上进行注册，登陆，修改查看个人信息，修改信息，添加个人信息，修改密码等操作。

**2.**  管理员可以登陆页面，查看所有注册用户信息，并且可以删除用户，修改用户信息，通过数据库添加用户，等操作。

**3.**  页面设计简洁，操作友好，方便。

## 二：思路

**1.**  搭建MySql数据库，建立数据库MiLinTb数据库，并设置编码为UTF-8.

**2.**  建立数据表，数据表结构对用用户类结构，有“用户编号（自增）”，“用户邮箱（用户唯一用户名）”，“用户密码”，“用户性别”，“用户地址”，“用户手机号”，“用户类型（来区分用户）”。

**3.**  新建“MiLinJSP”Java Web工程。

**4.**  编写Java代码，构建用户实类。

**5.**  导入“mysql-connector-java-5.1.13-bin.jar”架包，以此来连接数据库，进行数据库操作。

**6.**  编写JSP代码，设计页面，搭建可视化操作平台

**7.**  导入Tomact服务器，开启Tomact服务器，发布MinLinJSP,到浏览器中查看运行结果，

**8.**  测试各个模块功能

## 三：项目结构图

![项目结构](https://github.com/AprildreamMI/MiLinCustomers/blob/master/%E9%A1%B9%E7%9B%AE%E6%8F%8F%E8%BF%B0%E6%96%87%E4%BB%B6/%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84.png)

## 四：具体实现

### 1、创建数据库

```sql
-- 如果不存在MiLinTb数据库创建MiLinTb数据库并指定编码方式
CREATE DATABASE IF NOT EXISTS MiLinTb DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
```

### 2、**创建表和设计数据表结构**

​	**创建用户表“**customers**”**

```
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `c_Id` int(20) NOT NULL AUTO_INCREMENT,
  `c_Email` varchar(50) NOT NULL,
  `c_Password` varchar(30) NOT NULL,
  `c_Name` varchar(30) NOT NULL,
  `c_Gender` char(2) NOT NULL,
  `c_Address` varchar(50) DEFAULT NULL,
  `c_Phone` varchar(11) DEFAULT NULL,
  `c_Type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'base',
  PRIMARY KEY (`c_Id`),
  UNIQUE KEY `c_Email` (`c_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

```

### 3、创建用户类包和用户实类

##### 	a、创建用户包

```
com.milin.java.customersUser
```

##### 	b、创建用户类

```
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

	.......................
}
```

### 4、**建立数据库常规类连接数据库**

> **建立BaseDao.java**连接数据库，返回Connection**建立UserDao.java类**，通过Base.java获取Connection编写数据库工具方法.

```java
public class BaseDAO 
{
	private static String DRIVER_MYSQL_DRIVER="com.mysql.jdbc.Driver";//去顶连接数据库驱动为JDBC
	private static String URL_MYSOQ_URL="jdbc:mysql://127.0.0.1:3306/milintb?useUnicode=true&characterEncoding=utf8"; 
//数据库的名字milintb及使用的数据库管理工具MySql
	
	private static String SQLNAME_MYSQL_NAME = "root";
	private static String SQLPASSWORD_MYSQL_PASSWORD = "asdzxc456";

```

### 5、**建立JSP页面**

##### **a、login.jsp**

> 用户登录界面，通过正则表达式来规范用户登录，如果用户点注册按钮则通过doLogin.jsp页面来创建用户，如果点击登陆页面，则通过doLogin.jsp页面连接数据库检验用户名是否匹配。



##### b、doLogin.jsp

>  通过request.getParameter来接受从login.jsp页面传来的值。判断值，
>
>
>
> #####  如果有注册的值，
>
> 则通过数据库注册用户，如果注册成功则跳转到成功注册页（binggo.jsp），并通过session.setAttribute来传递成功注册的消息，在bingo.jsp页面接受msg消息
>
> ```JSP
> msg="注册成功";
> session.setAttribute("msg", msg);
> response.sendRedirect("bingo.jsp")
> ```
>
> 否则跳转到error.jsp页面。传递注册失败消息
>
>
>
> ##### 如果没有注册的值，
>
> 首先检查用户是否已经登录，如已经登录，则跳转error.jsp页面，否则通过数据库检验表单的用户名和密码是否匹配，如通过过匹配跳转userMain.jsp页面，并且设置session.setAttribute("loginUser", cuser);



##### c、head.jsp

>  插入到userMain.jsp页面，并通过下面代码

```JSP
Cuser loginUser=(Cuser)session.getAttribute("loginUser")
=loginUser.getType().equals("base")? "普通用户":"管理员

来判断是否是管理员或者普通用户，如果是，显示用户管理窗口，否则不显示
```



##### d、userMain.jsp

> 此页面为用户个人信息展示页面，是用户主页面，并提供密码修改等操作



##### e、userList.jsp

> 此页面是管理员管理用户页面，展示所有用户信息，管理员可在此页面删除用户，等操作。



## 五：测试

​	测试状况良好，基本能实现预期功能，

​	**但要使用高版本浏览器打开**
