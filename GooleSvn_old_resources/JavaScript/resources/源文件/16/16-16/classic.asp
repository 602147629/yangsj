<%
Dim conn,rs
Dim connstr
Dim sqlCmd


'�������ݿ����Ӷ��󲢴�
set conn=server.createobject("adodb.connection")
connstr="Provider=Microsoft.jet.oledb.4.0;data source=" & server.mappath("GuestBook.mdb")
conn.open connstr
'���ڴ����ݿ��л�ȡ���ݵ�sql���
sqlCmd="select title,author,date,content from data order by date desc"
'�������ݼ�����
set rs=server.createobject("adodb.recordset")

if Request.form("title")<>"" then
	'�����ҳ���ύ�������ύ�����ݼ������ݿ�
	rs.open sqlCmd,conn,1,3
	rs.addnew
	rs("title")=request.form("title")
	rs("author")=request.form("author")
	rs("content")=request.form("content")
	rs.update
    rs.close
end if


set rs=server.createobject("adodb.recordset")

	'����ֱ�Ӵ����ݿ��л�ȡ����
	rs.open sqlCmd,conn,1,1
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Classic GuestBook</title>
<style type="text/css">
<!--
body			{	font-size:0.75em;text-align:center;}
dl				{	margin:0;}
dt				{	background-color:#666;color:#fff;margin:1px;padding:0 3px;}
dd				{	margin:3px;}
div				{	margin:auto;line-height:150%;text-align:left;width:400px;border:1px solid #666;}
#postBox		{	margin-top:10px;}
dd.button		{	text-align:center;}
dd.button input	{	margin:0 20px;}
//-->
</style>
</head>

<body>
<div id="msgList">
	<%
		'������¼������Html���룬�Ӷ���������ʾ��ҳ��
		while not rs.eof
	%>
	<dl>
		<dt>���⣺<%=rs("title")%></dt>
		<dd>���ߣ�<%=rs("author")%> &nbsp;���ڣ�<%=rs("date")%></dd>
		<dd><%=rs("content")%></dd>
	</dl>
	<%
		rs.movenext
		wend
		'�ر����ݿ����Ӽ���¼�����ͷ���Դ
		rs.close
		conn.close
		set rs=nothing
		set conn=nothing
	%>
</div>
<div id="postBox">
	<form action="classic.asp" method="post">
		<dl>
			<dt>������������</dt>
			<dd>���⣺<input type="text" maxlength="150" size="45" name="title"/></dd>
			<dd>���ߣ�<input type="text" maxlength="50" size="45" name="author"/></dd>
			<dd>���ݣ�<textarea rows="10" cols="45" name="content"></textarea></dd>
			<dd class="button">
				<input type="submit" value="�ύ"/>
				<input type="reset" value="����"/>
			</dd>
		</dl>
	</form>
</div>
</body>
</html>