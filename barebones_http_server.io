server := HttpServer clone do(
	setPort(1234);

	renderResponse := method(req,resp,
		req type
		list("path","uri","body") foreach(k,
			val := req perform(k);
			resp body appendSeq(k .. ": " .. val .. "<br/>")
		)
		resp body appendSeq("<hr>")
	)
)
server start
