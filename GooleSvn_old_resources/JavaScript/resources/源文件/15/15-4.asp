<%@LANGUAGE="JAVASCRIPT" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>form</title>
</head>
<body>
<%
var username=Request.Form("username")
var pass=Request.Form("password")
var sex=Request.Form("sex")
var like=Request.Form("like")
Response.Write("<p><h1>�û��ύ�ĸ�����Ϣ</h1></p>")
Response.Write("<hr color='#0000FF'>")
Response.Write("<h2>�û���Ϊ:"+username+"</h2><br>")
Response.Write("<h2>����Ϊ:"+pass+"</h2><br>")
Response.Write("<h2>�Ա�Ϊ:"+sex+"</h2><br>")
Response.Write("<h2>����Ϊ:"+like+"</h2><br>")
%>
</body>
</html>

