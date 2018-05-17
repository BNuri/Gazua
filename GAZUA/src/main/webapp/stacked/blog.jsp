<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var j = new blogjson(); //blog검색 json 결과.
console.log(j);

var arr = new Array(j);
console.log(arr);
console.log(arr.length);
if(arr.length > 0){
	for(var i = 0; i < arr.length; i++){
		console.log("값 >> " + arr[i].)
	}
}

</script>
</head>
<body>

</body>
</html>