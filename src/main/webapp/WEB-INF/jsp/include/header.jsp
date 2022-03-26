<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<header class="mt-3">
				<div class="logo text-center">
					<img width="300" alt="logo" src="/static/image/logo4.PNG">
				</div>
				<c:if test="${not empty userId }">
					<div>${userName }님 <a href="/user/sign_out">로그아웃</a></div>
				</c:if>
			</header>