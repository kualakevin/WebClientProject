<%=
	Helpers.ArchiveHelper.search(
			request.getParameter("name").toString(),
			request.getParameter("year").toString(),
			request.getParameter("season").toString())
%>