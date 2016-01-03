<html>
	<head>
		<title>View File</title>
		<link rel="icon" href="../images/Shana.ico">
		<jsp:include page="../html/ViewFile.html" />
	</head>
	<body>
		<div>
			<div class="file-wrapper">
			<div class="file-container">
				<object class="file" data="../text/<%= request.getParameter("filename") %>"></object>
			</div>
		</div>
		</div>
	</body>
</html>