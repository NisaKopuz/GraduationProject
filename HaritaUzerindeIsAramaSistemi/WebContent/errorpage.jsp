<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.huia.service.dao.ad.AdDAOImp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hata</title>
</head>
<body>

<% session.invalidate(); %>

<script type="text/javascript">


var path = window.location.pathname;
var stringpath='http://localhost:8080'+path
window.location.href = stringpath;

</script>


</body>
</html>