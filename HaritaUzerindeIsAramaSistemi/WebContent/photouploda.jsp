<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
<input type="file" name="photo" size="50" accept="image/*" />
<br />
<button type="submit">Upload</button>
</form>
</body>
</html>