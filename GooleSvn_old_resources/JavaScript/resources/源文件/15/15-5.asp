<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<%
  var conn=Server.CreateObject("ADODB.Connection")    //����һ��connection�������
  var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+Server.MapPath("data.mdb") //����Դ�������ַ���
  conn.Open(connstr);                                  //�������ݿ�
  if (conn.state==1 )                                      //�ж��Ƿ�������
  { 
   Response.Write("�����ݽ���������");
   }
  else
   {
   Response.Write("û�����ӵ����ݿ�");
   }
   conn.Close;                                           //�ر�����
   conn=null;                                            //�ͷ��ڴ�
%>

