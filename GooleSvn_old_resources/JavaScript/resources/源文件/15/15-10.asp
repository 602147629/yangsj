<%@LANGUAGE="JAVASCRIPT" CODEPAGE="936"%>
<%
var  conn=Server.CreateObject("ADODB.Connection")     //����connection����
var path=Server.MapPath("data.mdb");                    //ȡ��data.mdb���ݿ��ʵ��·��
var connstr="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="+path;  //����Դ�������ַ���
conn.Open(connstr);                                    //������
                   			  //SQL��ѯ���
sql="insert into student(student_id,student_name,student_sex,student_age,student_zhuangye,student_address,student_tel) values('200709110020','������','Ů',23,'�����Ӧ��','����ʡ������','13656894520')"
conn.Execute(sql); 
Response.Redirect("15-7.asp")
%>

