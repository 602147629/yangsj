<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<!--#include file="adojavas.inc"-->   
<% 
  var conn=Server.CreateObject("ADODB.Connection")			//����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);									//������
  sql="select * from student"; 							//SQL��ѯ���
  rs=Server.CreateObject("ADODB.Recordset"); 				//����Recordset����
  rs.Open(sql,conn,1,1);									//�򿪼�¼��
%>
<html>
<head>
<title>��ҳ��ʾ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<table width="100%" border="1" cellspacing="2" cellpadding="2" class="border">
  <tr>
    <td height="25" width="20%">ѧ��</td>
    <td height="25" width="20%">ѧ������</td>
    <td height="25" width="20%">ѧ���Ա�</td>
    <td height="25" width="20%">����</td>
    <td height="25" width="20%">רҵ</td>
  </tr>
  <%
rs.PageSize =5;								//����ÿһҳ����ʾ�ļ�¼��	
var x,page=1;
maxpage=rs.PageCount;						//ͳ��ҳ��
page=Request.QueryString("page").item;		//��ȡ��ҳ��ҳ��
if (page==null)								//���pageΪnull������pageΪ1
{
page=1;
}
else
{
page=parseInt(page);						//��pageת��Ϊ����
if (page<1){page=1;}							//�趨ҳ���ֵ
if(page>maxpage){ page=maxpage;}
}
rs.AbsolutePage=page;
if (page==maxpage){x=rs.RecordCount-(maxpage-1)* rs.PageSize;}	//ָ��ÿһҳ�ļ�¼��					
else{x= rs.PageSize }
for(var i=1;i<=x;i++)							//ѭ���������
 {
if (!rs.EOF) 
 {
Response.Write("<tr>");
Response.Write("<td>"+rs("student_id")+"</td>");
Response.Write("<td>"+rs("student_name")+"</td>");
Response.Write("<td>"+rs("student_sex")+"</td>");
Response.Write("<td>"+rs("student_age")+"</td>");
Response.Write("<td>"+rs("student_zhuangye")+"</td>");
Response.Write("</tr>");
rs.MoveNext;
  }
}
Response.Write("<tr>")
Response.Write("<td height='25' colspan='5'>");
if (!(1==page)) 								//���ҳ�볬����
{ 
Response.Write("<A HREF=15-13.asp?page=1>��һҳ</A>&nbsp;&nbsp;"); 
Response.Write("<A HREF=15-13.asp?page=" + (page-1) + ">��һҳ</A>&nbsp;&nbsp;"); 
} 
if (!(rs.PageCount==page)) 
{ 
Response.Write("<A HREF=15-13.asp?page=" + (page+1) + ">��һҳ</A>&nbsp;&nbsp;"); 
Response.Write("<A HREF=15-13.asp?page=" + rs.PageCount + ">���һҳ</A>&nbsp;&nbsp;"); 
} 
Response.Write("ҳ��:<font color='Red'>"+page+"/"+rs.PageCount+"</font></p>");
Response.Write("</td><tr>");
Response.Write("</table>");
rs.Close;
rs=null;
conn.Close;
conn=null;
%>

</body>
</html>

