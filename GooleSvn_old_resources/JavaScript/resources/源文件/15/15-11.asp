<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<% 
  var conn=Server.CreateObject("ADODB.Connection")			//����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);									//������
  sql="select * from student"; 							//SQL��ѯ���
  rs=Server.CreateObject("ADODB.Recordset"); 				//����Recordset����
rs.Open(sql,conn,2,3);                                  //�򿪼�¼��
rs.AddNew
rs("student_id")="200709110021"
rs("student_name")="�ܺ���"
rs("student_pass")="200709110021"
rs("student_sex")="��"
rs("student_age")=22
rs("student_zhuangye")="�����Ӧ��"
rs("student_address")="����"
rs("student_tel")="13548796321"
rs.Update
Response.Redirect("15-7.asp")
%>

