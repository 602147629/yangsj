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
<title>������ݱ���ֶ�����</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<% for(i=0;i<=rs.Fields.Count-1;i++)                       //ѭ������ֶ�����
{
Response.Write(rs(i).Name+"&nbsp;&nbsp;" )//��ȡ�ֶ�����

}
rs.Close();                                             //�رռ�¼��
rs=null;
conn.Close();                                          //�ر����ݿ�
conn=null;
%>
</body>
</html>

