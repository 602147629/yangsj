<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<% 
  var conn=Server.CreateObject("ADODB.Connection")			//����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);									//������
  var sql="delete * from student where student_sex='Ů'"  //����ɾ����¼��sql���
  conn.Execute(sql)								//ִ��ɾ�����
  Response.Redirect("15-7.asp")   //���¶���ص�14-14.aspҳ��
%>



