<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Response.ContentType = "text/html"
Response.Charset = "GB2312"   '�����������

Dim id,child
id=Request.Form("id")
if id="" then response.end()

'�������ݿ�
dim conn,connstr,db
db="database/tree.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.Open connstr


'��ʾ��Ŀ¼
sql="select * from t_column where c_parentid="&id
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1 
do while not rs.eof
	if rs("c_depth")>0 then
		for i=1 to rs("c_depth")
			child=child&"&nbsp;&nbsp;"
		next 
	end if
	if rs("c_childnum")>0 then
	  	child=child&"<img id='p"&rs("c_Id")&"' src=""images/closed.gif"" width=""30"" height=""15"" onclick=""DivDisplay('c"&rs("c_Id")&"','"&rs("c_Id")&"','p"&rs("c_Id")&"')"" style=""cursor : hand;"" align=""absmiddle"">"
	else
	  	child=child&"<img src=""images/nofollow2.gif"" width=""30"" height=""15"" align=""absmiddle""  >"
	end if
    child=child&rs("c_Name")
    if rs("c_childnum")>0 then child=child&"("&rs("c_childnum")&")"
	child=child&"<br>"
	if rs("c_childnum")>0 then
	  	child=child&"<div id='c"&rs("c_Id")&"' style='display:none;'></div>"
	end if
	rs.movenext
loop
rs.close
set rs=nothing
conn.close
Set conn = Nothing

Response.Write (child)
Response.End
%>
 