<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<div class="d-flex justify-content-between align-items-end ">
			<div class="pt-3">
				<span class="logo display-2">Homegram</span>
			</div>
			<div>
				<a href="/user/signin_view" class="text-dark font-weight-bold mr-2">로그인</a>
			</div>
		</div>
		<hr>
		<div class="mt-5 mb-5">
			<div class="contentSpring col-6 d-flex">
				<div class="col-6 mt-5">
					<span class="springText">Spring is when you feel like whistling even with a shoe full of slush. (Doug Larson)</span>
				</div>
				<div class="col-6">
					<img width="300" height="450" alt="spring" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMDFfMjAw%2FMDAxNjEyMTQzMTgwMzM1.Ac0srCAbWrirGX128GnUcTpLf7YsQWpc9xCZfJUl-cgg.z1LmPLSOnu2ybn-FY1ykgxrGud8kfGijQ6FSMB5AavMg.JPEG.cool1962%2F19.jpg&type=sc960_832">
				</div>
			</div>
			<div class="contentSummer col-6 d-flex">
				<div class="col-6 mt-5">
					<span class="summerText">The summer night is like a perfection of thought. (Wallace Stevens)</span>
				</div>
				<div class="col-6">
					<img width="300" height="450" alt="Summer" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2F4c%2Fae%2F73%2F4cae73eccaf4dca747bd9a2ceff18644.jpg&type=sc960_832">
				</div>
			</div>
			<div class="contentAutumn col-6 d-flex">
				<div class="col-6 mt-5">
					<span class="autumnText">Autumn is a second spring when every leaf is a flower. (Albert Camus)</span>
				</div>
				<div class="col-6">
					<img width="300" height="450" alt="Autumn" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA5MjZfMTQz%2FMDAxNjAxMDg5MjYyOTQ2.DIVm998g8xWI577VylOQM1DaD7oot-OCO1tzq5TzZfsg.tYDdd-z1TFZL1h2MyxEB1ieniQ1dINOQ9lFPCPsUf3Qg.PNG.soungwoo7377%2F%25B8%25B6%25B8%25A5%25BD%25C4%25B9%25B05.png&type=sc960_832">
				</div>
			</div>
			<div class="contentWinter col-6 d-flex">
				<div class="col-6 mt-5">
					<span class="winterText">In the depth of winter, I finally learned that within me there lay an invincible summer. (Albert Camus)</span>
				</div>
				<div class="col-6">
					<img width="300" height="450" alt="winter" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEyMDFfMzAg%2FMDAxNjM4MzI0MTI5NzQw.RtR24o928KOm9eoQc58PNN5XzRe_M2w4KAe6scllzdwg.Sqacmz_QUPR7caDsM9RVyK6648KRmy8AXwyKy4D2AwEg.JPEG.ssanta302%2F%25BA%25AE%25B3%25AD%25B7%25CE%25C0%25CE%25C5%25D7%25B8%25AE%25BE%25EE.jpg&type=sc960_832">
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>
</html>