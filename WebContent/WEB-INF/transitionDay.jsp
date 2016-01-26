<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="template-employee-top.jsp" />
<div>
	<div class="row">
		<div class="col-md-offset-2 col-md-12">
			<div class="row">
				<div class="col-md-offset-2 col-md-12">
					<h2>Transition Day</h2>
				</div>
			</div>
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

			<form method="POST" action="transitionDay.do">
				<div class="row">
					<div class="col-lg-6">
						<h3>Update Funds</h3>
						Please set the new closing prices for each fund.<br> <br>
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>Symbol</th>
										<th>Name of Fund</th>
										<th>Last Price</th>
										<th>Closing Price</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="fund" items="${fundList}" >
										<tr>
											<td width="20%">${ fund.getSymbol() }</td>
											<td width="30%">${ fund.getFundName() }</td>
											<td align="right">
												<div class="form-group input-group">
													<span class="input-group-addon">$</span>
													${ fund.getPrice() }
												</div>
												
											<td align="right">
												<div class="form-group input-group">
												<span class="input-group-addon">$</span> <input
													name="fund_${ fund.getSymbol() }" type="text" required
													class="form-control"/>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				Enter the new trading day, Date must be greater than the last transition indicated below <br> <br>
				<div class="row">
					<div class="col-lg-3">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>Trading Day: (mm/dd/yyyy)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="date" type="date" required
										class="form-control" value="${ lastDay }"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="clo-lg-3" align="center">
						<br/> <br/>
						<input type="submit" class="btn btn-default" name="action" value="Transit Day">
					</div>
				</div>
				
			</form>
		</div>

		<jsp:include page="template-buttom.jsp" />