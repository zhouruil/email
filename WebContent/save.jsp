<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.zrl.bean.Email,java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">
<%
String userid=session.getAttribute("userid").toString();
String username=session.getAttribute("username").toString();
if(userid==null||userid.equals("")){
	response.sendRedirect("http://localhost:8080/springmvc");
}
List<Email> in_emails=new ArrayList();
in_emails=(ArrayList<Email>)request.getAttribute("save_emails");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>草稿箱</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">草稿箱</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab2">草稿箱</a></li> 
  	</ul>
    </div> 
    </ul>
    
    </div> 
    
    
  	<div id="tab2" class="tabson">

    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>标题</th>
        <th>收件人</th>
        <th>时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <%
        int i=1;
        for(Email e:in_emails){
        	out.print("<tr><td><input name='' type='checkbox'/></td>");
        	out.print("<td>"+i+"</td>");
        	out.print("<td>"+e.getTitle()+"</td>");
        	out.print("<td>"+e.getAddressee_id()+"</td>");
        	out.print("<td>"+e.getTime()+"</td>");
        	out.print("<td><a href='send.jsp?addresser_id="+e.getAddressee_id()+"&title="+e.getTitle());
        	out.print("&content="+e.getContent()+"' class='tablelink'>编辑</a><a href='delete.jsp?id="+e.getId()+"' class='tablelink'> 删除</a></td>");
        	out.print("</tr>");
        	i++;
        }
        %>
        
        </tr> 
        </tbody>
    </table>
    
   
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>

</body>
</html>

