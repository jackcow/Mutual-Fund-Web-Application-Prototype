<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="template-employee-top.jsp" />
<div>
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<h3>Select Customer Account</h3>
		</div>
	</div>
	<div class="row">
		<c:choose>
			<c:when test="${ (empty msg) }">
			</c:when>
			<c:otherwise>
				<h3 style="color: blue">${msg}</h3>
			</c:otherwise>
		</c:choose>

		<c:forEach var="error" items="${errors}">
			<h3 style="color: red">${error}</h3>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<form action="viewCustomer.do" method="POST">
				<div class="form-group">
					<div class="row">
						<div class="col-md-3">
							<label>Choose account(UserName):</label>
						</div>
						<div class="col-md-offset-1 col-md-4">
							<select class="form-control" name="userName">
								<option></option>
								<c:choose>
									<c:when test="${ (empty userList) }"></c:when>
									<c:otherwise>
										<c:forEach var="user" items="${ userList }">
											<option>${ user.getUserName() }</option>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
					<br> <br>
				</div>

				<div class="row">
					<div class="col-xs-6" align="right">
						<input type="submit" class="btn btn-default" name="action"
							value="Get Customer Details">
					</div>
					<div class="col-xs-6" align="left">
						<input type="submit" class="btn btn-default" name="action"
							value="Get Transaction History"> <br> <br> <br>
					</div>
				</div>
			</form>
		</div>
		</div>
		<jsp:include page="template-buttom.jsp" />