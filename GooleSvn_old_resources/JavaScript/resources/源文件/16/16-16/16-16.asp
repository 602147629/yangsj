<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Dim conn,rs
Dim connstr
Dim sqlCmd

'�������ݿ����Ӷ��󲢴�
set conn=server.createobject("adodb.connection")
connstr="Provider=Microsoft.jet.oledb.4.0;data source=" & server.mappath("16-16.mdb")
conn.open connstr
'���ڴ����ݿ��л�ȡ���ݵ�sql���
sqlCmd="select title,author,date,content from data order by date desc"
'�������ݼ�����
set rs=server.createobject("adodb.recordset")


'�����ݿ��л�ȡ����
rs.open sqlCmd,conn,1,1

%>
<html>
<head>
<title>Ajax��Aspʵ�����Ա�</title>
<style type="text/css">
<!--
body			{	font-size:0.75em;text-align:center;}
dl				{	margin:0;}
dt				{	background-color:#00ee00;color:#fff000;margin:1px;padding:0 3px;}
dd				{	margin:3px;}
div				{	margin:auto;line-height:150%;text-align:left;width:400px;border:1px solid #666000;}
#postBox		{	margin-top:10px;}
dd.button		{	text-align:center;}
dd.button input	{	margin:0 20px;}
//-->
</style>

<script type="text/javascript">
<!--
//���û������첽�ύ��������
function ajaxSubmit(){
	//��ȡ�û�����
	var title=document.forms[0].title.value;
	var author=document.forms[0].author.value;
	var content=document.forms[0].content.value;
	//����XMLHttpRequest����
	var xmlhttp;
	try{
		xmlhttp=new XMLHttpRequest();
	}catch(e){
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	//�����������������
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4){
			if (xmlhttp.status==200){
				var date=xmlhttp.responseText;
				addToList(date);
			}else{
				alert("error");
			}
		}
	}
	//�����ӣ�true��ʾ�첽�ύ
	xmlhttp.open("post", "Add.asp", true);
	//������Ϊpostʱ��Ҫ��������httpͷ
	xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	//��������
	xmlhttp.send("title="+escape(title)+"&author="+escape(author)+"&content="+escape(content));
}

//���û�������ʾ��ҳ��
function addToList(date){
	//��ȡ�����б�div����
	var msg=document.getElementById("msgList");
	//����dl��Ǽ����ӱ��
	var dl=document.createElement("dl");
	var dt=document.createElement("dt");
	var dd=document.createElement("dd");
	var dd2=document.createElement("dd");
	//�������뵽��Ӧ��λ��
	msg.insertBefore(dl,msg.firstChild);
	dl.appendChild(dt);
	dl.appendChild(dd);
	dl.appendChild(dd2);
	//�����������
	dt.innerHTML="���⣺"+document.forms[0].title.value;
	dd.innerHTML="���ߣ�"+document.forms[0].author.value+" &nbsp;���ڣ�"+date;
	dd2.innerHTML=document.forms[0].content.value;
	//����û������
	document.forms[0].title.value="";
	document.forms[0].author.value="";
	document.forms[0].content.value="";
}
//-->
</script>
</head>

<body>
<div id="msgList">
	<%
		'������¼������Html���룬�Ӷ���������ʾ��ҳ��
		while not rs.eof
	%>
	<dl>
		<dt>���⣺<%=rs("title")%></dt>
		<dd>���ߣ�<%=rs("author")%> &nbsp;���ڣ�<%=rs("date")%></dd>
		<dd><%=rs("content")%></dd>
	</dl>
	<%
		rs.movenext
		wend
		'�ر����ݿ����Ӽ���¼�����ͷ���Դ
		rs.close
		conn.close
		set rs=nothing
		set conn=nothing
	%>
</div>
<div id="postBox">
	<form name="theForm" method="post">
		<dl>
			<dt>�༭���ύ��������</dt>
			<dd>���⣺<input type="text" maxlength="150" size="45" name="title"/></dd>
			<dd>���ߣ�<input type="text" maxlength="50" size="45" name="author"/></dd>
			<dd>���ݣ�<textarea rows="5" cols="45" name="content"></textarea></dd>
			<dd class="button">
				<input type="button" onClick="ajaxSubmit()" value="�ύ"/>
				<input type="reset" value="����"/>
			</dd>
		</dl>
	</form>
</div>
</body>
</html>