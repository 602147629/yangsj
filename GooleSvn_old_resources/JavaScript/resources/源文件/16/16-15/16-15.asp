<%@ LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<head>
<title>Ajax��Aspʵ�����β˵�</title>
<script language="javascript">
var xmlHttp; //����һ��ȫ�ֱ���

//�����������ڲ��ͼ�����ʽ��ִ��AJAX
//id,��id
//rid,�����ڱ��е�id
//pid,ͼid
function DivDisplay(id,rid,pid)
{
	if (GetId(id).style.display=='')
	{
		GetId(id).style.display='none';
		GetId(pid).src = 'images/closed.gif';
	}
	else
	{
		GetId(id).style.display='';
		GetId(pid).src = 'images/opened.gif';
		if (GetId(id).innerHTML=='')
		{
			ShowChild(id,rid);
		}
	}
}

//����XMLHttpRequest����
function CreateXMLHttpRequest()
{
	if (window.ActiveXObject)
	{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if (window.XMLHttpRequest) 
	{
		xmlHttp = new XMLHttpRequest();
	}
}

//Ajax������
//id,��id
//rid,�����ڱ��е�id
function ShowChild(id,rid)
{
	CreateXMLHttpRequest();
	if(xmlHttp)
	{
		xmlHttp.open('POST','admin.asp',true);
		xmlHttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var SendData = 'id='+rid;
		xmlHttp.send(SendData);
		xmlHttp.onreadystatechange=function()
		{
		   if(xmlHttp.readyState==4)
		   {
			 if(xmlHttp.status==200)
			 {
				GetId(id).innerHTML = xmlHttp.responseText;
			 }
			 else
			 {
				GetId(id).innerHTML='����'+xmlHttp.statusText;
			 }
		   }
		   else
		   {
				GetId(id).innerHTML="�����ύ����...";
			}
	  	}
		
	 }
	 else
	 {
	 	GetId(id).innerHTML='��Ǹ�������������֧��XMLHttpRequest����ʹ��IE6���ϰ汾��';
	 }
}



//ȡ��ҳ�����
//id,��id
function GetId(id)
{
	return document.getElementById(id);
} 
</script>
</head>

<body>
<%
'�������ݿ�
dim conn,connstr,db
db="database/tree.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.Open connstr

'��ʾ��Ŀ¼
sql="select * from t_column where c_Depth=0 "
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
do while not rs.eof
	if rs("c_childnum")>0 then
		response.Write("<img id='p"&rs("c_Id")&"' src=""images/closed.gif"" width=""30"" height=""15"" onclick=""DivDisplay('c"&rs("c_id")&"','"&rs("c_id")&"','p"&rs("c_id")&"')"" style=""cursor : hand;"" align=""absmiddle"">")
	else
		response.Write("<img src=""images/nofollow2.gif"" width=""30"" height=""15"" align=""absmiddle"" >")
	end if
	response.Write("<b>")
	response.Write(rs("c_Name"))
	if rs("c_childnum")>0 then response.Write("("&rs("c_childnum")&")") 
	response.Write("</b>")
	response.Write("<br>")
	if rs("c_childnum")>0 then
		response.Write("<div id='c"&rs("c_Id")&"' style='display:none;'></div>")
	end if
	rs.movenext
loop
rs.close
set rs=nothing
conn.close
Set conn = Nothing
%>
</body>
</html>
