<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<% 
  var conn=Server.CreateObject("ADODB.Connection")			//����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);									//������
  sql="select * from student where student_sex='Ů'"; 			//SQL��ѯ���
  rs=Server.CreateObject("ADODB.Recordset"); 				//����Recordset����
  rs.Open(sql,conn,1,1);									//�򿪼�¼��
  var i=0;  											//����һ��ѭ������ 
%>


<html>
<head>
<title>������ݱ��</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<% 
rs.MoveFirst;                                            //ָ���ƶ�����¼���ĵ�һ����¼
while(!rs.EOF)
 {
for(i=0;i<=rs.Fields.Count-1;i++)
{
Response.Write(rs(i)+"&nbsp;&nbsp;&nbsp;");
}
Response.Write("<br>");
rs.MoveNext;
}
rs.Close();                                             //�رռ�¼��
rs=null;
conn.Close();                                          //�ر����ݿ�
conn=null;
%>
</body>
</html>

