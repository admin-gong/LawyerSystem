<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="Scripts/tip.js"></script>
<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showorder";
		document.forms.form2.submit();
	}
	function deleteV(obj) {
		var $parent = self.parent.$;
		$parent('body').alert({
			type : 'info',
			title : '系统提示', //标题
			content : '确认要删除这条记录吗?', //提示文字信息
			modal : true, //模式，开关灯
			draggable : false,
			buttons : [ {
				id : 'yes',
				name : '确定',
				callback : function() {
					document.getElementById("checkbutton").value = obj.id;
					document.forms.form2.action = "deleteorder";
					document.forms.form2.submit();
				}
			}, {
				id : 'no',
				name : '取消',
				callback : function() {
				}
			} ]
		})
	}
</script>
<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
			$(function() {
				$('#list').show();
			})
		</script>
	</s:if>
	<s:if test="#result =='fail'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '抱歉，没有找到符合的结果！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
	<s:if test="#result =='deletesuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : '系统提示', //标题
					content : '删除成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
				document.forms.form2.action = "showorder";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>其他<b class="tip"></b>预约管理
	</div>
	<table class="table table-striped table-bordered table-condensed"
		id="list">
		<thead>
			<tr class="tr_detail">
				<td>姓名</td>
				<td>内容</td>
				<td>电话</td>
				<td>地址</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="name" /> </a></td>
					<td><s:property value="theme" />
					</td>
					<td><s:property value="phone" />
					</td>
					<td><s:property value="address" />
					</td>
					<s:set name="stbtnm" value="uid"></s:set>
					<td><a class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='deleteV(this)'>删除</a></td>
				</tr>
			</s:iterator>
			<tr class="tr_pagenumber">
				<form id="form2" method="post">
					<td colspan="100">共<s:property value="#pageNum" />页&nbsp;&nbsp;共<s:property
							value="#resultNum" />条记录&nbsp;&nbsp;<a
						class="badge badge-inverse" id="firstpage"
						onclick='changePage(this)'>首页</a>&nbsp; <a
						class="badge badge-inverse" id="prepage"
						onclick='changePage(this)'>上一页</a>&nbsp; <a
						class="badge badge-warning">&nbsp;&nbsp;&nbsp;&nbsp;第<s:property
								value="#nowPage" />页&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp; <a
						class="badge badge-inverse" id="nextpage"
						onclick='changePage(this)'>下一页</a>&nbsp; <a
						class="badge badge-inverse" id="lastpage"
						onclick='changePage(this)'>尾页</a>&nbsp;&nbsp;&nbsp;&nbsp; 跳转到<input
						id="topage" name="topage" style="width:30px;">页&nbsp;&nbsp
						<a class="badge badge-inverse" id="jump"
						onclick='changePage(this)'>跳转</a>&nbsp;&nbsp;&nbsp;&nbsp; 每页显示<input
						id="showMany" name="showMany" style="width:30px;">条记录&nbsp;&nbsp
					<a class="badge badge-inverse" id="refresh"
						onclick='changePage(this)'>刷新</a> <input type="hidden"
						id="checkbutton" name="buttonName">
					</td>
				</form>
			</tr>
		</tbody>
	</table>

</body>
</html>

