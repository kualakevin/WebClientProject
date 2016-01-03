<html>
	<head>
		<title>Home</title>
		<link rel="icon" href="../images/Shana.ico">
		<jsp:include page="../html/Home.html" />
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 		<script src="../zweatherfeed-131/jquery.zweatherfeed.min.js" type="text/javascript"></script>
 		
 		<script type="text/javascript">
			 $(document).ready(function () {
			   $('#los-angeles').weatherfeed(['USCA0638']);
			 });
		 </script>
		 <script type="text/javascript">
			 $(document).ready(function () {
			   $('#japan').weatherfeed(['JAXX0085']);
			 });
		 </script>
	</head>
	<body>
		<div class="weather-wrapper">
			<div id="los-angeles" class="weather-widget">weather</div>
			<div id="japan" class="weather-widget">weather</div>
		</div>
	</body>
</html>