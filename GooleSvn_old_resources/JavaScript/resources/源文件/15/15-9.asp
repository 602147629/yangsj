<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<% 
  var conn=Server.CreateObject("ADODB.Connection")			//����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);									//������
  sql="select * from student"; 							//SQL��ѯ���
  rs=Server.CreateObject("ADODB.Recordset"); 				//����Recordset����
  rs.Open(sql,conn,1,1);									//�򿪼�¼��
  var i=0;  											//����һ��ѭ������ 
%>
<html>
<head>
<title>������ݱ��</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="1" cellspacing="1" cellpadding="2" class="border">
  <tr>
    <td>ѧ��ѧ��</td>
    <td>ѧ������</td>
    <td>�Ա�</td>
    <td>����</td>
  </tr>
  <%                                                   //�����ͷ
rs.MoveFirst;                                         //ָ���ƶ�����¼���ĵ�һ����¼
while(!rs.EOF)
{
Response.Write("<tr>");
Response.Write("<td>"+rs("student_id")+"</td>");
Response.Write("<td>"+rs("student_name")+"</td>");
Response.Write("<td>"+rs("student_sex")+"</td>");
Response.Write("<td>"+rs("student_age")+"</td>");
Response.Write("</tr>");
rs.MoveNext; 
}
                                         //ָ�������ƶ�
rs.Close();                                             //�رռ�¼��
rs=null;
conn.Close();                                          //�ر����ݿ�
conn=null;
%>
</table>
</body>
</html>


