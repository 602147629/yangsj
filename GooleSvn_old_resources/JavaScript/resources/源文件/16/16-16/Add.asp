<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Dim conn,rs
Dim connstr
Dim sqlCmd

'�������ݿ����Ӷ��󲢴�
set conn=server.createobject("adodb.connection")
connstr="Provider=Microsoft.jet.oledb.4.0;data source=" & server.mappath("16-16.mdb")
conn.open connstr

'���ύ�����ݼ������ݿ�
sqlCmd="insert into data(title,author,content) values('" & request.form("title") & "','" & request.form("author") & "','" & request.form("content") & "')"
conn.execute(sqlCmd)

'���ط�����ʱ��
Response.write(Date)
%>
