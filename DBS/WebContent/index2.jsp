<!-- 2018-07-04 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>CU 편의점택배</title>  
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="CU편의점택배 홈페이지,편의점택배,포스트박스,CUpost,씨유,예약,접수,추적,조회,픽업,국제">
		<meta name="keywords" content="CU편의점택배 홈페이지,편의점택배,포스트박스,CUpost,씨유,예약,접수,추적,조회,픽업,국제">
		<link rel="stylesheet" type="text/css" href="./css/common.css">
		<script async src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="./js/jquery-2.2.4.min.js"></script>
	    <script type="text/javascript" src="./js/common.js"></script>
	
	</head>
	<body>
		<div class="accessbility"><a href="#gotoMainContents">본문  바로가기</a></div>
		
		
		<!-- Header Start -->
		<header class="gnbFixed">
			<div class="inner">
				<h1><a href="/"><img src="/img/common/img_logo.png" alt="CU 포스트"></a></h1>
				<span class="util">
				
					<!--로그인전-->
					<a href="/postbox/common/login.cupost">로그인</a>
					<a href="/postbox/common/join_step1.cupost">회원가입</a>
					
				</span>
				<nav>
					<ul>
						<li class=""><a href="/postbox/local/member/reservation.cupost">국내택배</a>
							<div class="sub" style="display: none;">
								<ul class="inner" style="padding-left:365px/*265px*/">
									<li><a href="/postbox/local/member/reservation.cupost">택배 예약</a></li>
									<li><a href="/postbox/local/member/reservationBulk.cupost">대량발송 예약</a></li>
									<!-- 
									<li><a href="/postbox/local/general/handPrice.cupost">수기 송장</a></li>
									-->
									<li><a href="/postbox/local/general/guideHowto.cupost">이용안내</a></li>
								</ul>
							</div>
						</li>
						<!--
						<li><a href="/postbox/today/member/reservation.cupost">당일특송</a>
							<div class="sub">
								<ul class="inner" style="padding-left:375px">
									<li><a href="/postbox/today/member/reservation.cupost">접수</a></li>
									<li><a href="/postbox/today/member/reservationBulk.cupost">대량발송 접수</a></li>
									<li><a href="/postbox/today/general/guideHowto.cupost">이용안내</a></li>
								</ul>
							</div>
						</li>
						-->	
						<li class=""><a href="/postbox/ems/member/reservation.cupost">국제특송</a>
							<div class="sub" style="display: none;">
								<ul class="inner" style="padding-left:462px/*482px*/">
									<li><a href="/postbox/ems/member/reservation.cupost">국제특송 예약</a></li>
									<li><a href="/postbox/ems/general/guideNation.cupost">배송가능국가</a></li>
									<li><a href="/postbox/ems/general/guideHowto.cupost">이용안내</a></li>
								</ul>
							</div>
						</li>
						<li><a href="/postbox/delivery/local.cupost">배송조회</a>
							<div class="sub" style="display: none;">
								<ul class="inner" style="padding-left:495px/*515px*/">
									<li><a href="/postbox/delivery/local.cupost">국내택배</a></li>
									<!-- 
									<li><a href="/postbox/delivery/today.cupost">당일특송</a></li>
									 -->
									<li><a href="/postbox/delivery/ems.cupost">국제특송</a></li>
										<li><a href="/postbox/delivery/pickupNew.cupost">편의점 PICK-UP</a></li> 
								<!--<li><a href="/postbox/delivery/pickup.cupost">편의점 PICK-UP</a></li>-->
								</ul>
							</div>
						</li>
						<li><a href="/postbox/cuevent/eventList.cupost">이벤트&amp;소식</a>
							<div class="sub" style="display: none;">
								<ul class="inner" style="padding-left:515px/*535px*/">
									<li><a href="/postbox/cuevent/eventList.cupost">이벤트</a></li>
									<li><a href="/postbox/cs/eventWinnerList.cupost">당첨자 발표</a></li>
									<li><a href="/postbox/cs/newsList.cupost">CUpost 소식</a></li>
									<li><a href="/postbox/cs/noticeList.cupost">공지사항</a></li>
								</ul>
							</div>
						</li>
						<li><a href="/postbox/membership/gradeBenefit.cupost">회원혜택</a>
							<div class="sub" style="display: none;">
								<ul class="inner" style="padding-left:600px/*620px*/">
									<li><a href="/postbox/membership/gradeBenefit.cupost">등급별 혜택</a></li>
									<li><a href="/postbox/membership/coupon.cupost">할인쿠폰</a></li>
									<li><a href="/postbox/membership/gradeInfo.cupost">회원등급 및 제휴신청</a></li>
									<!-- 
									<li><a href="/postbox/membership/shoppingMall.cupost">쇼핑몰 택배</a></li>
									-->
								</ul>
							</div>
						</li>
					</ul>
					<div class="totalMenu">
						<a href="#" class="btnOpen">전체메뉴보기</a>
						
		<!--전체메뉴-->
		<div class="tMenuBox" style="display: none">
			<dl>
				<dt>국내택배</dt>
				<dd><a href="/postbox/local/member/reservation.cupost">택배 예약</a>
					<ul class="listType1">
						<li><a href="/postbox/local/member/reservation.cupost">예약</a></li>
						<li><a href="/postbox/local/member/reservationList.cupost">예약내역</a></li>
					</ul>
				</dd>
				<dd><a href="/postbox/local/member/reservationBulk.cupost">대량발송 예약</a></dd>
				<!-- 
				<dd><a href="/postbox/local/general/handPrice.cupost">수기송장</a></dd>
				-->
				<dd><a href="/postbox/local/general/guideHowto.cupost">이용안내</a>
					<ul class="listType1">
						<li><a href="/postbox/local/general/guideHowto.cupost">이용방법</a></li>
						<li><a href="/postbox/local/general/guidePrice.cupost">운임안내</a></li>
						<li><a href="/postbox/local/general/guidePackaging.cupost">포장안내</a></li>
						<li><a href="/postbox/local/general/guideImpossible.cupost">이용불가 상품</a></li>
						<li><a href="/postbox/local/general/guideProcess.cupost">배송과정</a></li>
					</ul>
				</dd>
			</dl>
			<!-- 
			<dl>
				<dt>당일특송</dt>
				<dd><a href="/postbox/today/member/reservation.cupost">국내택배접수</a>
					<ul class="listType1">
						<li><a href="/postbox/today/member/reservation.cupost">예약</a></li>
						<li><a href="/postbox/today/member/reservationList.cupost">예약내역</a></li>
					</ul>
				</dd>
				<dd><a href="/postbox/today/member/reservationBulk.cupost">대량발송접수</a></dd>
				<dd><a href="/postbox/today/general/guideHowto.cupost">이용안내</a>
					<ul class="listType1">
						<li><a href="/postbox/today/general/guideHowto.cupost">이용방법</a></li>
						<li><a href="/postbox/today/general/guidePrice.cupost">운임안내</a></li>
						<li><a href="/postbox/today/general/guidePackaging.cupost">포장안내</a></li>
						<li><a href="/postbox/today/general/guideImpossible.cupost">이용불가 상품</a></li>
						<li><a href="/postbox/today/general/guideProcess.cupost">배송과정</a></li>
					</ul>
				</dd>
			</dl> -->
			<dl>
				<dt>국제특송</dt>
				<dd><a href="/postbox/ems/member/reservation.cupost">국제특송 예약</a>
					<ul class="listType1">
						<li><a href="/postbox/ems/member/reservation.cupost">예약</a></li>
						<li><a href="/postbox/ems/member/reservationList.cupost">예약내역</a></li>
					</ul>
				</dd>
				<dd><a href="/postbox/ems/general/guideNation.cupost">배송가능국가</a></dd>
				<dd><a href="/postbox/ems/general/guideHowto.cupost">이용안내</a>
					<ul class="listType1">
						<li><a href="/postbox/ems/general/guideHowto.cupost">이용방법</a></li>
						<li><a href="/postbox/ems/general/guidePrice.cupost">운임안내</a></li>
						<li><a href="/postbox/ems/general/guideProcess.cupost">배송과정</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>배송조회</dt>
				<dd><a href="/postbox/delivery/local.cupost">국내택배</a></dd>
				<!-- 
				<dd><a href="/postbox/delivery/today.cupost">당일특송</a></dd>
				 -->
				<dd><a href="/postbox/delivery/ems.cupost">국제특송</a></dd>
				
				<dd><a href="/postbox/delivery/pickupNew.cupost">편의점 PICK-UP</a></dd>
				
				 <!-- 
				<dd><a href="/postbox/delivery/pickup.cupost">편의점 PICK-UP</a></dd>
				 -->
			</dl>
			<dl>
				<dt>이벤트&amp;소식</dt>
				<dd><a href="/postbox/cuevent/eventList.cupost">이벤트</a>
					<ul class="listType1">
						<li><a href="/postbox/cuevent/eventList.cupost">진행 중인 이벤트</a></li>
						<li><a href="/postbox/cuevent/eventList.cupost?searchStatus=E">지난 이벤트</a></li>
					</ul>
				</dd>
				<dd><a href="/postbox/cs/eventWinnerList.cupost">당첨자 발표</a></dd>
				<dd><a href="/postbox/cs/newsList.cupost">CUpost 소식</a></dd>
				<dd><a href="/postbox/cs/noticeList.cupost">공지사항</a></dd>
			</dl>
			<dl>
				<dt>회원혜택</dt>
				<dd><a href="/postbox/membership/gradeBenefit.cupost">등급별 혜택</a></dd>
				<dd><a href="/postbox/membership/coupon.cupost">할인쿠폰</a></dd>
				<dd><a href="/postbox/membership/gradeInfo.cupost">회원등급 및 제휴신청</a>
					<ul class="listType1">
						<li><a href="/postbox/membership/gradeInfo.cupost">신청안내</a></li>
						<li><a href="/postbox/membership/gradeApply.cupost">신청</a></li>
					</ul>
				</dd>
				<!-- 
				<dd><a href="/postbox/membership/shoppingMall.cupost">쇼핑몰 택배</a></dd>
				-->
			</dl>
			<a href="#" class="close">닫기</a>
		</div>
		<div class="dimmed" style="display: none"></div>
					</div>
				</nav>
			</div>
		</header>
		<!--// Header End -->
		
		<section id="gotoMainContents" class="mainCont" tabindex="0">
			<div class="mainLink">
				<a href="#" class="on" title="편의점 택배보내기 / 배송조회 / 간편서비스 / 편의점 위치 찾기 등 편의기능 제공 화면 이동">1</a>
				<a href="#" title="편의점 택배 이용방법 / 배송과정 안내 화면 이동">2</a>
				<a href="#" title="이벤트 / 공지사항 / 뉴스 목록 화면 이동">3</a>
			</div>
			<article class="mainBox01">
				<div class="rollingBox">
					
					<ul class="rollingList">
										
						<li class="" style="background: rgb(211, 242, 242);"><a href="/postbox/cuevent/eventView.cupost?eventId=CE20180618092433435"><img src="/upload/main/info/1529281625626.png" alt="Family 회원님~ 시원하게 할인쿠폰 100%쏩니다!" style="left: -429px; position: absolute;"></a></li>
										
						<li style="background: rgb(233, 224, 206);" class="on"><a href="/postbox/cuevent/eventView.cupost?eventId=CE20180618092018065"><img src="/upload/main/info/1529281697872.png" alt="Gold,vip,vvip 드루와~" style="left: -429px; position: absolute;"></a></li>
										
						<li style="background: rgb(226, 226, 226);" class=""><a href="/postbox/cuevent/eventView.cupost?eventId=CE20180702092151582"><img src="/upload/main/info/1530491046763.png" alt="CUpost 택배 이용 후기이벤트!" style="left: -429px; position: absolute;"></a></li>
										
					</ul>
					
					
					<div class="controlBox">
						
						<div class="playBox">
							<a href="#" class="play">시작</a>
							<a href="#" class="stop" style="display:none;">정지</a>
							<ul>
								
								<li class=""><a href="#">Family 회원님~ 시원하게 할인쿠폰 100%쏩니다!</a></li>
								
								<li class="on"><a href="#">Gold,vip,vvip 드루와~</a></li>
								
								<li class=""><a href="#">CUpost 택배 이용 후기이벤트!</a></li>
								
							</ul>
						</div>
						
						<ul class="controlList">
							<li><a href="/postbox/local/member/reservation.cupost">국내택배 예약</a>
							<!-- 
								<div class="inBox">
									<div class="fl">
										<p>간편하게 택배 예약을<br>신청하실 수 있습니다.</p>
										<div class="selBtn">
											<input type="hidden" id="s_type" value="L">
											<a href="javascript:setSendType('L')" class="on">국내</a>
											<a href="javascript:setSendType('T')" class="hiddenIcon">당일</a>
											<a href="javascript:setSendType('E')">국제</a>
										</div>
									</div>
									
									<div class="fr">
										<div class="addBox" id="send_input">
											<strong>보내는 사람</strong>
											<span>
												<input type="text" id="s_post" title="우편번호" placeholder="우편번호 찾기" style="width:300px;" readOnly>
												<a href="javascript:searchSendAddr();" role="button" class="btnType4 type2" >우편번호 찾기</a>
											</span>
											<span>
												<input type="text" id="s_addr" title="주소" placeholder="주소" style="width:395px;"  readOnly>
											</span>
											<span>
												<input type="text" id="s_detail" title="상세주소" placeholder="상세주소" style="width:300px;">
												<a href="javascript:next();" role="button" class="btnType4">다음</a>
											</span>
										</div>
										<div class="addBox" id="recive_input" style="display:none">
											<strong>받는 사람</strong>
											<span>
												<input type="text" id="r_post" title="우편번호"  maxlength="7" placeholder="우편번호 찾기" style="width:300px;" readOnly>
												<a href="javascript:searchReciveAddr();" role="button" class="btnType4 type2"  id="r_post_btn">우편번호 찾기</a>
											</span>
											<span>
												<input type="text" id="r_addr" title="주소" placeholder="주소" style="width:395px;" readOnly>
											</span>
											<span>
												<input type="text" id="r_detail" title="상세주소" placeholder="상세주소" style="width:300px;">
												<a href="javascript:reservation();" role="button" class="btnType4 type3">예약</a>
											</span>
										</div>
									</div>
		
								</div> -->
							</li>
							<li><a href="#">배송조회</a>
								<div class="inBox">
									<div class="fl">
										<p>쉽고 빠르게 배송상태를<br>확인하실 수 있습니다.</p>
										<div class="selBtn">
											<a href="#" class="on">국내</a>
											<a href="#" style="display:none">당일</a>
											<a href="#">국제</a>
											<a href="#" class="icoCu">PICK-UP</a>
										</div>
									</div>
									<div class="fr">
										<div>
											<strong>국내택배</strong>
											<form id="deliveryLocalForm" method="post">
											<input type="text" placeholder="운송장번호 '-' 없이 입력" id="local_invoice_no" maxlength="10" name="invoice_no" title="운송장번호 입력" data-numonly="true" class="mt40" style="width:100%;">
											</form>
											<div class="btn_c">
												<a href="javascript:deliveryLocalSearch();" role="button" class="btnType1">배송조회</a>
											</div>
										</div>
										<div style="display:none">
											<strong>당일배송</strong>
											<form id="deliveryTodayForm" method="post">
											<input type="text" placeholder="운송장번호 '-' 없이 입력" id="today_invoice_no" maxlength="10" name="invoice_no" title="운송장번호 입력" data-numonly="true" class="mt40" style="width:100%;">
											</form>
											<div class="btn_c">
												<a href="javascript:deliveryTodaySearch();" role="button" class="btnType1">배송조회</a>
											</div>
										</div>
										<div style="display:none">
											<strong>국제특송</strong>
											<form id="deliveryEmsForm" method="post">
											<input type="text" placeholder="운송장번호 '-' 없이 입력" id="ems_invoice_no" maxlength="10" name="invoice_no" title="운송장번호 입력" data-numonly="true" class="mt40" style="width:100%;">
											</form>
											<div class="btn_c">
												<a href="javascript:deliveryEmsSearch();" role="button" class="btnType1">배송조회</a>
											</div>
										</div>
										<div style="display:none">
											<strong>편의점 PICK-UP</strong>
											<form id="deliveryPickupForm" method="post">
											<div class="mt20">
												<span class="formWrap on"><input type="radio" name="pickup" id="pickup1" checked="checked"><label for="pickup1">주문번호</label></span>
												<span class="formWrap"><input type="radio" name="pickup" id="pickup2"><label for="pickup2">송장번호</label></span>
											</div>
											<input type="text" placeholder="운송장번호 '-' 없이 입력" id="pick_invoice_no" maxlength="20" name="invoice_no" title="운송장번호 입력" data-numonly="true" class="mt10" style="width:100%;">
											<input type="hidden" name="search_type" id="search_type" value="01">
											</form>
											<div class="btn_c pt0 mt20">
												<a href="javascript:deliveryPickupSearch();" role="button" class="btnType1">배송조회</a>
											</div>
											
											<!-- 
											<strong>편의점 PICK-UP</strong>
											<form id="deliveryPickupForm" method="post">
											<input type="text" placeholder="운송장번호 '-' 없이 입력"  id="pick_invoice_no"  maxlength="20" name="invoice_no" title="운송장번호 입력" data-numonly='true' class="mt40" style="width:100%;">
											</form>
											<div class="btn_c">
												<a href="javascript:deliveryPickupSearch();" role="button" class="btnType1">배송조회</a>
											</div>
											 -->
										</div>
									</div>
								</div>
							</li>
							<li><a href="#">서비스 안내</a>
								<div class="inBox type2">
									<div class="fl">
										<p>CU포스트와<br>함께하는<br>편의점 택배<br>서비스 안내</p>
									</div>
									<div class="fr">
										<div class="selBtn">
											<a href="/postbox/local/general/guideHowto.cupost">국내택배 이용방법</a>
											<a href="/postbox/local/general/guidePrice.cupost">운임안내</a>
											<a href="/postbox/local/general/guidePackaging.cupost">포장안내</a>
											<a href="/postbox/customer/cashReceipt.cupost">현금영수증 조회</a>
											<a href="/postbox/membership/gradeBenefit.cupost">회원혜택</a>
										</div>
									</div>
								</div>
							</li>
							<li class="map"><a href="/postbox/partner/convenienceStore.cupost">편의점 위치 찾기</a></li>
						</ul>
					</div>
				</div>
			</article>
			<article class="mainBox02">
				<div class="sect01">
					<span class="fl"><a href="#">편의점 택배<br>이용방법</a></span>
					<span class="fr"><a href="#">편의점 택배<br>배송과정</a></span>
				</div>
				<div class="sect02" style="display:none">
					<div class="guide01">
						<div class="irCont" tabindex="0" role="text">
							<p>편의점 택배 이용방법 - 365일 언제나 접수되는 CU 편의점 택배 빠르고 간편한 CU 편의점 택배 서비스를 만나보세요.</p>
							<ol>
								<li>물건을 포장한다</li>
								<li>CUpost 사이트에서 배송정보 예약한다.</li>
								<li>가까운 CU편의점에 간다.</li>
								<li>postbox 기계에서 중량만 측정하여 접수</li>
							</ol>
						</div>
						<span class="guideArr">
							<a href="#" class="fl">이용방법</a>
							<a href="#" class="fr">배송과정</a>
						</span>
					</div>
				</div>
				<div class="sect03" style="display:none">
					<div class="guide02">
						<div class="irCont" tabindex="0" role="text">
							<p>편의점 배송과정 - 국내배송은 물론 국제배송까지! 안전하고 빠른 배송서비스를 확인하세요. 보내는 분이 CU편의점으로 물건의 배송요청을 하면 CU편의점에서 배송사로 상품을 집하,해당 상품의 접수정보는 리얼타임으로 Cupost본사로 등록됩니다. 근거리 상품의 경우 CU편의점을 통해 직접 받는 분께 물건을 전달합니다. 배송사 집결지와 Cupost본사 간 집하요청 정보와 집하정보 배송완료 정보가 공유되며 배송사에서 받는 분께 상품 배송을 실행하면 Cupost에서 화물 추적을 시작 최종 받는 분께 물건이 도착하게 됩니다.</p>
						</div>
						<span class="guideArr">
							<a href="#" class="fl">이용방법</a>
							<a href="#" class="fr">배송과정</a>
						</span>
					</div>
				</div>
			</article>
			<article class="mainBox03">	
				
				<div class="mainEvent">
						
					<a href="./cuevent/eventView.cupost?eventId=CE20180509110122648"><img src="/upload/event/manage/1525830870361.jpg" alt="" width="485" height="200"></a>
						
					<a href="./cuevent/eventView.cupost?eventId=CE20171019190210006"><img src="/upload/event/manage/1508407184010.png" alt="CU편의점택배 신규회원가입시 500할인쿠폰적립" width="485" height="200"></a>
					
				</div>
						
					
				
				<div class="boardBox">
					<div><strong>공지사항</strong></div>
					<ul>
						
						
						<li><a href="/postbox/cs/noticeView.cupost?seq=1015">6월 택배 휴무일 안내</a><span>2018.06.04</span></li>
						
						
						<li><a href="/postbox/cs/noticeView.cupost?seq=1014">외부감사인 선임통지(공고)</a><span>2018.05.09</span></li>
						
						
						<li><a href="/postbox/cs/noticeView.cupost?seq=1013">5월 택배 휴무일 안내</a><span>2018.04.26</span></li>
						
						
						<li><a href="/postbox/cs/noticeView.cupost?seq=1012">CUpost 2018년 설 연휴 택배접수 중단안내</a><span>2018.01.29</span></li>
						
						
						<li><a href="/postbox/cs/noticeView.cupost?seq=1011">회원 이용약관 및 개인정보 취급방침 변경 안내 </a><span>2018.01.10</span></li>
					
					</ul>
					<a href="/postbox/cs/noticeList.cupost" class="more" aria-label="공지사항 더보기">더보기</a>
				</div>
				
				
				<div class="boardBox">
					<div><strong>CUpost 소식</strong></div>
					<ul>
						
						
						<li><a href="/postbox/cs/newsView.cupost?seq=1022">택배이용후기이벤트3 칭찬만받고싶... </a><span>2018.06.12</span></li>
						
						
						<li><a href="/postbox/cs/newsView.cupost?seq=1020">택배이용후기이벤트2 가정의달, CUpost가 책임진다!...</a><span>2018.05.09</span></li>
						
						
						<li><a href="/postbox/cs/newsView.cupost?seq=1016">택배이용 후기이벤트 CUpost 장원급제 BEST후기</a><span>2018.04.11</span></li>
						
						
						<li><a href="/postbox/cs/newsView.cupost?seq=1014">CUpost홈페이지 2017웹어워드 코리아 생활브랜드부...</a><span>2017.12.20</span></li>
						
						
						<li><a href="/postbox/cs/newsView.cupost?seq=1013">CUpost 2017년 마지막 서비스개선! 우수회원도 ...</a><span>2017.12.01</span></li>
					
					</ul>
					<a href="/postbox/cs/newsList.cupost" class="more" aria-label="CUpost 소식 더보기">더보기</a>
				</div>
				
			</article>
			<!-- <div class="ac mt70"><a href="https://www.cvsnet.co.kr/postbox/m_home/index.jsp" title="새창" target="_blank"><img src="/img/common/main_gs_banner.gif" alt="GS25에서 택배이용을 원하시는 고객은  아래 페이지로 이동해 주세요. cvsnet.co.kr (클릭시 해당 페이지로 이동합니다.)"></a></div> -->
		</section>
		
		
		<div class="LayerPopWrap" style="display: none; width: 600px; margin-left: -300px; position: fixed; top: 50%; margin-top: -207.5px;" id="searchAddrPost">
			    <div class="popTop">
					<h1>우편번호찾기</h1>
				</div>
		<div class="popCont">
		 		<div class="tabBox">
		            <ul class="tabList type2 col2">
		                <li id="tapload"><a href="javascript:loadShow();">신(도로명)주소 찾기</a></li>
		                <li id="tapdong" class="on"><a href="javascript:dongShow();">구(지번)주소 찾기</a></li>
		            </ul>
		            <div class="tabCont" id="dong">
		            	<h2 class="hiddenConts">구(지번)주소 찾기</h2>
		                <p>주소의 동(읍/면), 주소명칭을 입력하신 후 검색을 누르세요.<br><span class="fc3">예) 서울시 강남구 논현동 이라면, '논현동'으로 입력해 주세요.</span></p>
		                <div class="addSearch">
		                    <input type="text" id="eupmyeon" placeholder="동" title="주소의 동" style="width:185px;">
		                    <a href="javascript:blank();" role="button" id="addzipsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="dongResultZip">
		                   
		                </ul>
		            </div>
					 <div class="tabCont" id="load" style="display:none;">
		            	<h2 class="hiddenConts">신(도로명)주소 찾기</h2>
		            	<p>정확한 검색을 위해 '도로명 + 건물번호' 또는 '건물명'을 입력하신 후 검색을 누르세요.<br><span class="fc3">예) '광나루로56길 85' 또는 '테크노마트'</span></p>
		                <!-- <span class="formWrap"><input type="radio" id="addSel1" name="addSel" checked="checked"> <label for="addSel1">도로명+건물번호</label></span>
		                <span class="formWrap"><input type="radio" id="addSel2" name="addSel"> <label for="addSel2">건물명(아파트명)</label></span> -->
		                <div class="addSearch">
		                    <span>
		                        <select title="시/도 선택" style="width:185px;" id="searchSIDO" onchange="selectSIGUGUN(this)">
		                           	<option value="">선택</option>
									<option value="SEOUL">서울특별시</option>
									<option value="BUSAN">부산광역시</option>
									<option value="DAEGU">대구광역시</option>
									<option value="INCHEON">인천광역시</option>
									<option value="GWANGJU">광주광역시</option>
									<option value="DAEJEON">대전광역시</option>
									<option value="ULSAN">울산광역시</option>
									<option value="SEJONG">세종특별자치시</option>
									<option value="GANGWON">강원도</option>
									<option value="GYEONGGI">경기도</option>
									<option value="GYEONGNAM">경상남도</option>
									<option value="GYEONGBUK">경상북도</option>
									<option value="JEONNAM">전라남도</option>
									<option value="JEONBUK">전라북도</option>
									<option value="JEJU">제주특별자치도</option>
									<option value="CHUNGNAM">충청남도</option>
									<option value="CHUNGBUK">충청북도</option>
		                        </select>
		                        <select title="군/구 선택" id="sigungu" style="width:185px;">
		                            <option>군 / 구</option>
		                        </select>
		                    </span>
		                    <input type="text" id="searchText" placeholder="검색어" title="검색어" style="width:380px;">
		                    <!-- <input type="text"  id="building_main_no" placeholder="본번" title="본번" style="width:185px;" > -->
		                    <a href="javascript:blank();" role="button" id="loadsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="LoadResultZip">
		                  
		                </ul>
		            </div>
		        </div>
		    </div>
			<a href="#" class="popClose">닫기</a>
		</div>
		<script>
		function zipsearch(target_postno,target_addr,parent){
			/* $("#addSel1").val("");
			$("#addSel2").val(""); */
			$("#eupmyeon").val("");
			/* $("#building_main_no").val(""); */
			$("#searchSIDO").val("");
			$("#sigungu").html(' <option>군 / 구</option>');
			$("#searchText").val("");
			$("#LoadResultZip").html("");
			$("#dongResultZip").html("");
			loadShow();
			$.popup(
				'open'
				,{
		        	id: 'searchAddrPost',
		        	onOpen: function() {
		        				$("#addzipsearch").off("click");
		        	 			$("#addzipsearch").on("click",function(){
			        				if($.trim($("#eupmyeon").val())==""){
			        					alert("동을 입력하세요");
			        					$("#eupmyeon").focus();
			        				}else{
			        		    		$.post("/postbox/common/searchZip.cupost",
			     								{eupmyeon:$("#eupmyeon").val(),kind:"kor"},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.sigungu+" "+ob.eupmyeon+" "+ob.ri+" "+ob.apt_name +" "+ob.zone_start_addr;
			     											html+='<li onclick="selectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr+'" >'
			     												+'<a href="javascript:blank();" >'
				     											    	+'<em>['+zipcode+']</em>'+ addr
				     					                        	+'</a>'+
				     					                        '</li>';
				     					        		});
			     										
			     										if(data.list.length<1){
		     												html="<li>조회결과가 없습니다</li>";
			     										}	
			     										$("#dongResultZip").html(html);
			     										$("#dongResultZip").show();
				     									commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
		        	 			$("#loadsearch").off("click");
			        			$("#loadsearch").on("click",function(){
			        				if($.trim($("#searchSIDO").val())==""){
			        					alert('시도를 선택하세요');
			        					$("#searchSIDO").focus();
			        				}else  if($.trim($("#sigungu").val())==""){
			        					alert('시군구를 선택하세요');
			        					$("#sigungu").focus();
			    	        		}else  if($.trim($("#searchText").val())==""){
			    	        			alert('검색어를 입력하세요');
			    	        			$("#searchText").focus();
			    	        		}else{   	
			        					$.post("/postbox/common/searchLordZip.cupost",
			     								{
			        								searchSIDO:$("#searchSIDO").val(),
			        								sigungu:$("#sigungu").val(),
			        								searchText:$("#searchText").val()/* ,
			        								building_main_no:$("#building_main_no").val() */
			    	        					},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.sigungu+" "+ob.eupmyeon+" "+ob.ri+" "+ob.street_nm +" "+String(ob.building_main_no)+""+(String(ob.building_sub_no)=="0"?"":"-"+String(ob.building_sub_no))+" "+ob.sigungu_building_nm;
			     											html+='<li onclick="selectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr+'" >'
			     												+'<a href="javascript:blank();">'
			     												+'<em>['+zipcode+']</em>'+ addr
			     					                        	+'</a>'+
			     					                        '</li>';
			     					        			});
			     										
			     										if(data.list.length<1){
		     												html="<li>조회결과가 없습니다</li>";
			     										}
			     										$("#LoadResultZip").html(html);
			     										$("#LoadResultZip").show();
				     									commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
			        			
			        			/* $("#addSel1").click(function(){
			        				$("#building_main_no").show();
			        			});
			        			$("#addSel2").click(function(){
			        				$("#building_main_no").val("");
			        				$("#building_main_no").hide();
			        			}); */
			        			
			        			if(parent!=undefined || parent!="undefined"){
			        				$("#searchAddrPost .popClose").on("click",function(){
			        					if($(".dimmed").length>1){
			        						$(".dimmed").each(function(i,ob){
			        							if(i!=0)
			        								$(ob).remove();
			        						});
			        					}
			        					$("#"+parent).toggle();
			        			    });
			        			}
			        			$("#eupmyeon").off("keydown");
			        			$("#searchText").off("keydown");
			        			/* $("#building_main_no").off("keydown"); */
			        			$("#eupmyeon").keydown(function (event) { if(event.which==13){$("#addzipsearch").trigger("click");}});
			        			$("#searchText").keydown(function (event) {if(event.which==13){$("#loadsearch").trigger("click");}});
			        			/* $("#building_main_no").keydown(function (event) {if(event.which==13){$("#loadsearch").trigger("click");}}); */
			        			commonJs.centerMove();
			        			
		        	}
		        	
				
				});
			
		}
		function dongShow(){
			$("#dong").show();
			$("#tapdong").addClass("on");
			$("#load").hide();
			$("#tapload").removeClass("on");
			commonJs.centerMove();
		}
		function loadShow(){
			$("#load").show();
			$("#tapload").addClass("on");
			$("#dong").hide();
			$("#tapdong").removeClass("on");
			commonJs.centerMove();
			
		}
		
		function selectSIGUGUN(){
			if($("#searchSIDO").val()!=""){
				$.post("/postbox/common/searchLordZipSIGUGUN.cupost",
							{searchSIDO:$("#searchSIDO").val()},
							function(data){
								if(data.is_ok=="ok"){
									var html ="";
									$.each(data.list,function(i,ob){
										html+="<option value='"+ob.sigungu+"'>"+ob.sigungu+"</option>";
									});
									$("#sigungu").html(html);
								}					
							}
					);
			}else{
				$("#sigungu").html('');
			}
		}
		function selectZip(ob,target_postno,target_addr,parent){
			if(target_postno != undefined && target_postno !='undefined'){
				$("#"+target_postno).val($(ob).data("zipcode"));
			}
			if(target_addr != undefined && target_addr !='undefined'){
				$("#"+target_addr).val($(ob).data("addr"));
			}
			$("#searchAddrPost .popClose").trigger("click");
			if(parent!=undefined && parent!="undefined"){
				$("#"+parent).show();
			}
			$("#"+target_addr).next().select();
			if(target_addr=="s_addr"){
				$("#s_detail").select()
			}
			if(target_addr=="r_addr"){
				$("#r_detail").select()
			}
		}
			</script>
		
		<div class="LayerPopWrap" style="display: none; width: 600px; margin-left: -300px; position: fixed; top: 50%; margin-top: -207.5px;" id="mainsearchAddrPost">
			    <div class="popTop">
					<h1>우편번호찾기</h1>
				</div>
		<div class="popCont">
		 		<div class="tabBox">
		            <ul class="tabList type2 col2">
		                <li id="maintapload"><a href="javascript:mainloadShow();">신(도로명)주소 찾기</a></li>
		                <li id="maintapdong" class="on"><a href="javascript:maindongShow();">구(지번)주소 찾기</a></li>
		            </ul>
		            <div class="tabCont" id="maindong">
		            	<h2 class="hiddenConts">구(지번)주소 찾기</h2>
		                <p>주소의 동(읍/면), 주소명칭을 입력하신 후 검색을 누르세요.<br><span class="fc3">예) 서울시 강남구 논현동 이라면, '논현동'으로 입력해 주세요.</span></p>
		                <div class="addSearch">
		                    <input type="text" id="maineupmyeon" placeholder="동" title="주소의 동" style="width:185px;">
		                    <a href="javascript:blank();" role="button" id="mainaddzipsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="maindongResultZip">
		                   
		                </ul>
		            </div>
					 <div class="tabCont" id="mainload" style="display:none;">
		            	<h2 class="hiddenConts">신(도로명)주소 찾기</h2>
		            	<p>정확한 검색을 위해 '도로명 + 건물번호' 또는 '건물명'을 입력하신 후 검색을 누르세요.<br><span class="fc3">예) '광나루로56길 85' 또는 '테크노마트'</span></p>
		                <!-- <span class="formWrap"><input type="radio" id="mainaddSel1" name="addSel" checked="checked"> <label for="mainaddSel1">도로명+건물번호</label></span>
		                <span class="formWrap"><input type="radio" id="mainaddSel2" name="addSel"> <label for="mainaddSel2">건물명(아파트명)</label></span> -->
		                <div class="addSearch">
		                    <span>
		                        <select title="시/도" style="width:185px;" id="mainsearchSIDO" onchange="mainselectSIGUGUN(this)">
		                           	<option value="">선택</option>
									<option value="SEOUL">서울특별시</option>
									<option value="BUSAN">부산광역시</option>
									<option value="DAEGU">대구광역시</option>
									<option value="INCHEON">인천광역시</option>
									<option value="GWANGJU">광주광역시</option>
									<option value="DAEJEON">대전광역시</option>
									<option value="ULSAN">울산광역시</option>
									<option value="SEJONG">세종특별자치시</option>
									<option value="GANGWON">강원도</option>
									<option value="GYEONGGI">경기도</option>
									<option value="GYEONGNAM">경상남도</option>
									<option value="GYEONGBUK">경상북도</option>
									<option value="JEONNAM">전라남도</option>
									<option value="JEONBUK">전라북도</option>
									<option value="JEJU">제주특별자치도</option>
									<option value="CHUNGNAM">충청남도</option>
									<option value="CHUNGBUK">충청북도</option>
		                        </select>
		                        <select title="군/구" id="mainsigungu" style="width:185px;">
		                            <option>군 / 구</option>
		                        </select>
		                    </span>
		                    <input type="text" id="mainsearchText" placeholder="검색어" title="검색어" style="width:380px;">
		                    <!-- <input type="text"  id="mainbuilding_main_no" placeholder="본번" title="본번" style="width:185px;" > -->
		                    <a href="javascript:blank();" role="button" id="mainloadsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="mainLoadResultZip">
		                  
		                </ul>
		            </div>
		        </div>
		    </div>
			<a href="#" class="popClose">닫기</a>
		</div>
		<script>
		function mainzipsearch(target_postno,target_addr,parent){
			$("#mainaddSel1").val("");
			$("#mainaddSel2").val("");
			$("#maineupmyeon").val("");
			$("#mainbuilding_main_no").val("");
		
			$("#mainsigungu").html(' <option>군 / 구</option>');
			$("#mainsearchSIDO").val("");
			$("#mainsearchText").val("");
			$("#mainLoadResultZip").html("");
			$("#maindongResultZip").html("");
			mainloadShow();
			$.popup(
				'open'
				,{
		        	id: 'mainsearchAddrPost',
		        	onOpen: function() {
		        		$("#mainaddzipsearch").off("click");
		        	 			$("#mainaddzipsearch").on("click",function(){
			        				if($.trim($("#maineupmyeon").val())==""){
			        					alert("동을 입력하세요");
			        					$("#maineupmyeon").focus();
			        				}else{
			        		    		$.post("/postbox/common/searchZip.cupost",
			     								{eupmyeon:$("#maineupmyeon").val(),kind:"eng"},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.sigungu+" "+ob.eupmyeon+" "+ob.ri+" "+ob.apt_name +" "+ob.zone_start_addr;
			     											var addr_eng = ob.eng_apt_name + " " + ob.eng_ri + " " +ob.eng_eupmyeon+" "   + " "+ ob.eng_sigungu + " " + ob.eng_sido;
			     											
			     											html+='<li onclick="mainselectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr_eng+'" >'
			     												+'<a href="javascript:blank();" >'
				     											    	+'<em>['+zipcode+']</em>'+ addr +"<br>"+addr_eng
				     					                        	+'</a>'+
				     					                        '</li>';
				     					        		});
			     										if(data.list.length<1){
			     											html="<li>조회결과가 없습니다</li>";
			     										}
			     										$("#maindongResultZip").html(html);
			     										$("#maindongResultZip").show();
							     						commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
		        	 			$("#mainloadsearch").off("click");
			        			$("#mainloadsearch").on("click",function(){
			        				if($.trim($("#mainsearchSIDO").val())==""){
			        					alert('시도을 선택하세요');
			        					$("#mainsearchSIDO").focus();
			        				}else  if($.trim($("#mainsigungu").val())==""){
			        					alert('시군구을 선택하세요');
			        					$("#mainsigungu").focus();
			    	        		}else  if($.trim($("#mainsearchText").val())==""){
			    	        			alert('검색어을 입력하세요');
			    	        			$("#mainsearchText").focus();
			    	        		}else{   	
			        					$.post("/postbox/common/searchLordZip.cupost",
			     								{
			        								searchSIDO:$("#mainsearchSIDO").val(),
			        								sigungu:$("#mainsigungu").val(),
			        								searchText:$("#mainsearchText").val(),
			        								building_main_no:$("#mainbuilding_main_no").val()
			    	        					},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.eupmyeon+" "+ob.ri+" "+ob.street_nm +" "+String(ob.building_main_no)+""+(String(ob.building_sub_no)=="0"?"":"-"+String(ob.building_sub_no))+" "+ob.sigungu_building_nm;
			     											var addr_eng = ob.street_eng + " " + String(ob.building_main_no) + (String(ob.building_sub_no)=="0"?"":"-"+String(ob.building_sub_no)) + " " + ob.eupmyeon_eng + " " + ob.sigungu_eng + " " + ob.sido_eng;
			     										
			     											html+='<li onclick="mainselectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr_eng+'" >'
			     												+'<a href="javascript:blank();">'
			     												+'<em>['+zipcode+']</em>'+ addr +"<br>"+addr_eng
			     					                        	+'</a>'+
			     					                        '</li>';
			     					        			});
			     										if(data.list.length<1){
			     											html="<li>조회결과가 없습니다</li>";
			     										}
			     										$("#mainLoadResultZip").html(html);
			     										$("#mainLoadResultZip").show();
				     									commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
			        			
			        			$("#mainaddSel1").click(function(){
			        				$("#mainbuilding_main_no").show();
			        			});
			        			$("#mainaddSel2").click(function(){
			        				$("#mainbuilding_main_no").val("");
			        				$("#mainbuilding_main_no").hide();
			        			});
			        			
			        			if(parent!=undefined || parent!="undefined"){
			        				$("#mainsearchAddrPost .popClose").on("click",function(){
			        					if($(".dimmed").length>1){
			        						$(".dimmed").each(function(i,ob){
			        							if(i!=0)
			        								$(ob).remove();
			        						});
			        					}
			        					$("#"+parent).toggle();
			        			    });
			        			}
			        			commonJs.centerMove();
			        			
			        			$("#maineupmyeon").off("keydown");
			        			$("#mainsearchText").off("keydown");
			        			$("#mainbuilding_main_no").off("keydown");
			        			$("#maineupmyeon").keydown(function (event) { if(event.which==13){$("#mainaddzipsearch").trigger("click");}});
			        			$("#mainsearchText").keydown(function (event) {if(event.which==13){$("#mainloadsearch").trigger("click");}});
			        			$("#mainbuilding_main_no").keydown(function (event) {if(event.which==13){$("#mainloadsearch").trigger("click");}});
		        	}
		        	
				
				});
			
		}
		function maindongShow(){
			$("#maindong").show();
			$("#maintapdong").addClass("on");
			$("#mainload").hide();
			$("#maintapload").removeClass("on");
			commonJs.centerMove();
		}
		function mainloadShow(){
			$("#mainload").show();
			$("#maintapload").addClass("on");
			$("#maindong").hide();
			$("#maintapdong").removeClass("on");
			commonJs.centerMove();
			
		}
		
		function mainselectSIGUGUN(){
			if($("#mainsearchSIDO").val()!=""){
				$.post("/postbox/common/searchLordZipSIGUGUN.cupost",
							{searchSIDO:$("#mainsearchSIDO").val()},
							function(data){
								if(data.is_ok=="ok"){
									var html ="";
									$.each(data.list,function(i,ob){
										html+="<option value='"+ob.sigungu+"'>"+ob.sigungu+"</option>";
									});
									$("#mainsigungu").html(html);
								}					
							}
					);
			}else{
				$("#mainsigungu").html('');
			}
		}
		function mainselectZip(ob,target_postno,target_addr,parent){
			if(target_postno != undefined && target_postno !='undefined'){
				$("#"+target_postno).val($(ob).data("zipcode"));
			}
			if(target_addr != undefined && target_addr !='undefined'){
				$("#"+target_addr).val($(ob).data("addr"));
			}
			$("#mainsearchAddrPost .popClose").trigger("click");
			if(parent!=undefined || parent!="undefined"){
				$("#"+parent).show();
			}
			$("#"+target_addr).next().select();
			if(target_addr=="s_addr"){
				$("#s_detail").select()
			}
			if(target_addr=="r_addr"){
				$("#r_detail").select()
			}
		}
			</script>
		
		<div class="LayerPopWrap" style="display: none; width: 600px; margin-left: -300px; position: fixed; top: 50%; margin-top: -207.5px;" id="seoulsearchAddrPost">
			    <div class="popTop">
					<h1>우편번호찾기</h1>
				</div>
		<div class="popCont">
		 		<div class="tabBox">
		            <ul class="tabList type2 col2">
		                <li id="seoultapdong" class="on"><a href="javascript:seouldongShow();">구(지번)주소 찾기</a></li>
		                <li id="seoultapload"><a href="javascript:seoulloadShow();">신(도로명)주소 찾기</a></li>
		            </ul>
		            <div class="tabCont" id="seouldong">
		            	<h2 class="hiddenConts">구(지번)주소 찾기</h2>
		                <p>주소의 동(읍/면), 주소명칭을 입력하신 후 검색을 누르세요.<br><span class="fc3">예) 서울시 강남구 논현동 이라면, '논현동'으로 입력해 주세요</span></p>
		                <div class="addSearch">
		                    <input type="text" id="seouleupmyeon" placeholder="동" title="주소의 동 입력" style="width:185px;">
		                    <a href="javascript:blank();" role="button" id="seouladdzipsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="seouldongResultZip">
		                   
		                </ul>
		            </div>
					 <div class="tabCont" id="seoulload" style="display:none;">
		            	<h2 class="hiddenConts">신(도로명)주소 찾기</h2>
		                <span class="formWrap on"><input type="radio" id="seouladdSel1" name="addSel" checked="checked"> <label for="seouladdSel1">도로명+건물번호</label></span>
		                <span class="formWrap"><input type="radio" id="seouladdSel2" name="addSel"> <label for="seouladdSel2">건물명(아파트명)</label></span>
		                <div class="addSearch">
		                    <span>
		                        <select title="시/도" style="width:185px;" id="seoulsearchSIDO" onchange="seoulselectSIGUGUN(this)">
		                           	<option value="SEOUL">서울특별시</option>
								</select>
		                        <select title="군/구" id="seoulsigungu" style="width:185px;">
		                            <option>군 / 구</option>
		                        </select>
		                    </span>
		                    <input type="text" id="seoulsearchText" placeholder="검색어" title="검색어 입력" style="width:185px;">
		                    <input type="text" id="seoulbuilding_main_no" placeholder="본번" title="본번 입력" style="width:185px;">
		                    <a href="javascript:blank();" role="button" id="seoulloadsearch" class="btnType4">검색</a>
		                </div>
		                <ul class="addList" id="seoulLoadResultZip">
		                  
		                </ul>
		            </div>
		        </div>
		    </div>
			<a href="#" class="popClose">닫기</a>
		</div>
		<script>
		function seoulzipsearch(target_postno,target_addr,parent){
			$("#seouladdSel1").val("");
			$("#seouladdSel2").val("");
			$("#seouleupmyeon").val("");
			$("#seoulLoadResultZip").html("");
			$("#seouldongResultZip").html("");
			seouldongShow();
			$.popup(
				'open'
				,{
		        	id: 'seoulsearchAddrPost',
		        	onOpen: function() {
		        	 			$("#seouladdzipsearch").on("click",function(){
			        				if($.trim($("#seouleupmyeon").val())==""){
			        					alert("동을 입력하세요");
			        					$("#seouleupmyeon").focus();
			        				}else{
			        		    		$.post("/postbox/common/searchSeoul.cupost",
			     								{eupmyeon:$("#seouleupmyeon").val()},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.sigungu+" "+ob.eupmyeon+" "+ob.ri+" "+ob.apt_name +" "+ob.zone_start_addr;
			     											html+='<li onclick="seoulselectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr+'" >'
			     												+'<a href="javascript:blank();" >'
				     											    	+'<em>['+zipcode+']</em>'+ addr
				     					                        	+'</a>'+
				     					                        '</li>';
				     					        		});
			     										if(data.list.length<1)
			     											html="<li>조회결과가 없습니다</li>";
			     										$("#seouldongResultZip").html(html);
			     										commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
			        			$("#seoulloadsearch").on("click",function(){
			        				if($.trim($("#seoulsearchSIDO").val())==""){
			        					alert('시도을 선택하세요');
			        					$("#seoulsearchSIDO").focus();
			        				}else  if($.trim($("#seoulsigungu").val())==""){
			        					alert('시군구을 선택하세요');
			        					$("#seoulsigungu").focus();
			    	        		}else  if($.trim($("#seoulsearchText").val())==""){
			    	        			alert('검색어을 입력하세요');
			    	        			$("#seoulsearchText").focus();
			    	        		}else{   	
			        					$.post("/postbox/common/searchLordSeoul.cupostt",
			     								{
			        								searchSIDO:$("#seoulsearchSIDO").val(),
			        								sigungu:$("#seoulsigungu").val(),
			        								searchText:$("#seoulsearchText").val(),
			        								building_main_no:$("#seoulbuilding_main_no").val()
			    	        					},
			     								function(data){
			     									if(data.is_ok=="ok"){
			     										var html ="";
			     										$.each(data.list,function(i,ob){
			     											var zipcode =ob.post_no;
			     											var addr    =ob.sido+" "+ob.eupmyeon+" "+ob.ri+" "+ob.street_nm +" "+String(ob.building_main_no)+""+(String(ob.building_sub_no)=="0"?"":"-"+String(ob.building_sub_no))+" "+ob.sigungu_building_nm;
			     											html+='<li onclick="seoulselectZip(this,\''+target_postno+'\',\''+target_addr+'\',\''+parent+'\')" data-zipcode="'+zipcode+'" data-addr="'+addr+'" >'
			     												+'<a href="javascript:blank();">'
			     												+'<em>['+zipcode+']</em>'+ addr
			     					                        	+'</a>'+
			     					                        '</li>';
			     					        			});
			     										if(data.list.length<1)
			     											html="<li>조회결과가 없습니다</li>";
			     										$("#seoulLoadResultZip").html(html);
			     										commonJs.centerMove();
			     									}					
			     								}
			     						);
			        				}
			         			 });
			        			
			        			$("#seouladdSel1").click(function(){
			        				$("#seoulbuilding_main_no").show();
			        			});
			        			$("#seouladdSel2").click(function(){
			        				$("#seoulbuilding_main_no").val("");
			        				$("#seoulbuilding_main_no").hide();
			        			});
			        			
			        			if(parent!=undefined || parent!="undefined"){
			        				$("#seoulsearchAddrPost .popClose").on("click",function(){
			        					if($(".dimmed").length>1){
			        						$(".dimmed").each(function(i,ob){
			        							if(i!=0)
			        								$(ob).remove();
			        						});
			        					}
			        					$("#seoul"+parent).toggle();
			        			    });
			        			}
			        			seoulselectSIGUGUN();
			        			$("#seouleupmyeon").keydown(function (event) { if(event.which==13){$("#seouladdzipsearch").trigger("click");}});
			        			$("#seoulsearchText").keydown(function (event) {if(event.which==13){$("#seoulloadsearch").trigger("click");}});
			        			$("#seoulbuilding_main_no").keydown(function (event) {if(event.which==13){$("#seoulloadsearch").trigger("click");}});
			        			commonJs.centerMove();
			        			
		        	}
		        	
				
				});
			
		}
		function seouldongShow(){
			$("#seouldong").show();
			$("#seoultapdong").addClass("on");
			$("#seoulload").hide();
			$("#seoultapload").removeClass("on");
			commonJs.centerMove();
		}
		function seoulloadShow(){
			$("#seoulload").show();
			$("#seoultapload").addClass("on");
			$("#seouldong").hide();
			$("#seoultapdong").removeClass("on");
			commonJs.centerMove();
			
		}
		
		function seoulselectSIGUGUN(){
				$.post("/postbox/common/searchLordSeoulSIGUGUN.cupost",
							{searchSIDO:$("#seoulsearchSIDO").val()},
							function(data){
								if(data.is_ok=="ok"){
									var html ="";
									$.each(data.list,function(i,ob){
										html+="<option value='"+ob.sigungu+"'>"+ob.sigungu+"</option>";
									});
									$("#seoulsigungu").html(html);
								}					
							}
					);
			
		}
		function seoulselectZip(ob,target_postno,target_addr,parent){
			if(target_postno != undefined && target_postno !='undefined'){
				$("#"+target_postno).val($(ob).data("zipcode"));
			}
			if(target_addr != undefined && target_addr !='undefined'){
				$("#"+target_addr).val($(ob).data("addr"));
			}
			$("#seoulsearchAddrPost .popClose").trigger("click");
			if(parent!=undefined || parent!="undefined"){
				$("#"+parent).show();
			}
			$("#"+target_addr).next().select();
			if(target_addr=="s_addr"){
				$("#s_detail").select()
			}
			if(target_addr=="r_addr"){
				$("#r_detail").select()
			}
		}
			</script>
		<footer>
				
			<div class="footMenu">
				<span>
					<a href="/postbox/company.cupost">회사소개</a>
					<a href="/postbox/terms/terms.cupost">약관</a>
					<a href="/postbox/terms/privacy.cupost">개인정보 취급방침</a>
					<a href="/postbox/partner/pickupUse.cupost">사업제휴</a>
					<a href="/postbox/partner/convenienceStore.cupost">편의점 찾기</a>
					<a href="/postbox/customer/faqList.cupost">고객센터</a>
				</span>
				
				
				<div class="selType1" style="width:150px">
					<a href="#" title="열기">family site</a>
					<ul style="display: none">
						<li><a href="http://cu.bgfretail.com/index.do" target="_blank">CU</a></li>
					</ul>
				</div>
				
				<!-- 
				<select onchange="openFamily(this)" title="family site">
					<option value="">family site</option>
					<option value="http://cu.bgfretail.com/index.do">CU</option>
				</select>
				-->
			</div>
			<div class="footSect">
				<address>주소 : 서울특별시 광진구 광나루로56길 85 테크노마트 2405호</address>
				<p class="info"><span>상호명 : ㈜BGF포스트</span><span>대표자명 : 전태진</span><span>사업자등록번호 : 869-87-00550</span><span>고객센터 : 1577-1287</span><span>제휴문의 : 1566-1025</span><span>FAX : 02-6711-0699</span></p>
				<p class="fc3">COPYRIGHT 2016 CUpost ALL RIGHTS RESERVED.</p>
				
				<a title="새창" href="http://www.wa.or.kr/board/list.asp?BoardID=0006" target="_blank" class="wa" style="right:130px;">
					<img alt="(사)한국장애인단체총연합회 한국웹접근성인증평가원 웹 접근성 우수사이트 인증마크(WA인증마크)" src="/img/common/ico_wa.png" width="60" height="43">
				</a>
				<span class="snsLink">
					<a href="http://blog.naver.com/cupost" target="_blank">blog</a>
					<a href="https://www.facebook.com/cupost/" target="_blank">facebook</a>
					<a href="https://www.instagram.com/cupost__" target="_blank">instagram</a>
				</span>
				
				<!-- CVSnet 배너링크 표시 유무 체크 -->
		
						<div class="ac mt10"><a href="https://www.cvsnet.co.kr/main/index.do" title="새창" target="_blank"><img src="/img/common/main_gs_banner.jpg" alt="GS25에서 택배이용을 원하시는 고객은  아래 페이지로 이동해 주세요. cvsnet.co.kr (클릭시 해당 페이지로 이동합니다.)"></a></div>
		
			</div>
			<script>
				function openFamily(el){
					var url = $(el).val();
					if(""!=url)
						window.open(url);
				}
			</script>
		</footer>
		
		<div class="relativeBox">
		
			
		
			<div class="mainPopup" id="mainpopup_1043" style="display: none; top: 400px; left: 400px; z-index: 10000;">
				<a href="javascript:link('https://www.cupost.co.kr/postbox/cuevent/eventView.cupost?eventId=CE20180618092433435','N');"><img src="/upload/main/popup/1529394851263.png" alt="FAMILY 회원님~ 시원하게 할인쿠폰 100%쏩니다!"></a>
				<div><span class="formWrap"><input type="checkbox" id="todayCheck_1043" title="오늘 하루 이 창을 열지 않음"> <label for="todayCheck_1043">오늘 하루 이 창을 열지 않음</label></span></div>
				<a href="#" class="close">닫기</a>
			</div>
		
		
		
		</div>
		
		
		
		
		
		
		
		
		
		<script>
		$(document).ready(function() {
			    $(".inBox").first().find(".btnType4.type2").off("click"); 
			   
				$(".inBox .selBtn a").off("click");
			    $(".inBox .selBtn a").on("click", function(ev) {
			        //배송 조회 탭일 경우 
			        var tabIndex = $(".inBox .selBtn").index($(this).closest(".selBtn"));
			        if (tabIndex == 0) {
			            ev.preventDefault();
			        }
			        $(this).siblings().removeClass("on");
			        $(this).addClass("on");
			        if (tabIndex == 0) {
			            var subCont = $(this).closest(".fl").next(".fr");
			            var subContIdx = $(this).index();
			            subCont.children("div").hide();
			            subCont.children("div").eq(subContIdx).show();
			        }
			    });
		
			
			    keySet();
			    //팝업 리스트로 부터 팝업 생성
			    
			    	
			 	   commonJs.openMainPop('mainpopup_1043', '400', '400');
			    
			    
		});
		function link(url,target){
			if(url!=""){
				if(target=="N")
			    	window.open(url,"","");
				else
					location = url;
			}
		}
		function getCookie(name){    
			var wcname = name + '='; //  쿠키 이름
			var wcstart, wcend, end;   // 문자열을 추출하기 위한 변수를 선언 합니다.
			var i = 0;    
		
			  while(i <= document.cookie.length) { // 쿠키의 문자열을 전부 검색 합니다. 
			  wcstart = i;  
			  wcend   = (i + wcname.length);            
			if(document.cookie.substring(wcstart, wcend) == wcname) { // 동일한 문자열이 있다면
			if((end = document.cookie.indexOf(';', wcend)) == -1)  
			// 마지막 부분을 구분자를 통해 검색하고 마지막이 아니라면 쿠키를 계속 검색합니다.(마지막에는 (;) 없습니다.)                
			end = document.cookie.length;
			return document.cookie.substring(wcend, end); // rangs(value) 에 해당하는 문자열을 추출하여 리턴 합니다.
			  }            
		
			i = document.cookie.indexOf('', i) + 1;       
			  
			  if(i == 0)  // 모든 쿠키를 검색 했다면 while문을 제어 합니다. 
			break;    
			  }    
			  return '';
		} 
		
		
		
		function deliveryLocalSearch(){
			var invoice_no = $("#local_invoice_no").val();
			if (invoice_no == "") {
				alert("송장번호를 입력해 주세요.");
				$("#local_invoice_no").focus();
			} else if (isNaN(invoice_no)) {
				alert("숫자만 입력해 주세요.");
				$("#local_invoice_no").val("");
				$("#local_invoice_no").focus();
			} else if (invoice_no.length != 10) {
				alert("10자리 운송장 번호를 입력해 주세요.");
				$("#local_invoice_no").val("");
				$("#local_invoice_no").focus();
			} else if (invoice_no.substring(0, 1) == "7") {
				alert("편의점 PICK-UP 운송장 입니다.\n편의점 PICK-UP 페이지로 이동 합니다.");
				location.href="/postbox/delivery/pickupNew.cupost";
				//location.href="/postbox/delivery/pickup.cupost";
			} else {
				$("#deliveryLocalForm").attr("action","/postbox/delivery/localResult.cupost");
				$("#deliveryLocalForm").submit();
			}
		}
		function deliveryTodaySearch(){
			var invoice_no = $("#today_invoice_no").val();
			if (invoice_no == "") {
				alert("송장번호를 입력해 주세요.");
				$("#today_invoice_no").focus();
			} else if (isNaN(invoice_no)) {
				alert("숫자만 입력해 주세요.");
				$("#today_invoice_no").val("");
				$("#today_invoice_no").focus();
			} else if (invoice_no.length != 10) {
				alert("10자리 운송장 번호를 입력해 주세요.");
				$("#today_invoice_no").val("");
				$("#today_invoice_no").focus();
			} else if (invoice_no.substring(0, 1) == "7") {
				alert("편의점 PICK-UP 운송장 입니다.\n편의점 PICK-UP 페이지로 이동 합니다.");
				location.href="/postbox/delivery/pickupNew.cupost";
				//location.href="/postbox/delivery/pickup.cupost";
			} else {
				$("#deliveryTodayForm").attr("action","/postbox/delivery/todayResult.cupost");
				$("#deliveryTodayForm").submit();
			}
		}
		function deliveryEmsSearch(){
			var invoice_no = $("#ems_invoice_no").val();
			if (invoice_no == "") {
				alert("송장번호를 입력해 주세요.");
				$("#ems_invoice_no").focus();
			} else if (isNaN(invoice_no)) {
				alert("숫자만 입력해 주세요.");
				$("#ems_invoice_no").val("");
				$("#ems_invoice_no").focus();
			} else if (invoice_no.length != 10) {
				alert("10자리 운송장 번호를 입력해 주세요.");
				$("#ems_invoice_no").val("");
				$("#ems_invoice_no").focus();
			} else if (invoice_no.substring(0, 1) == "7") {
				alert("편의점 PICK-UP 운송장 입니다.\n편의점 PICK-UP 페이지로 이동 합니다.");
				location.href="/postbox/delivery/pickupNew.cupost";
				//location.href="/postbox/delivery/pickup.cupost";
			} else {
				$.post("/postbox/delivery/checkEmsInvoiceNo.cupost",{invoice_no:invoice_no},function(data){
					if(data.val == true|| data.val=="true"){
						$("#deliveryEmsForm").attr("action","/postbox/delivery/emsResult.cupost");
						$("#deliveryEmsForm").submit();
					}else{
						alert("EMS 송장번호가 아닙니다");
					}
				});
			}
		}
		function deliveryPickupSearch(){
			var invoice_no = $("#pick_invoice_no").val();
			if ($("#pickup1").parent().hasClass("on")){
				$("#search_type").val("01");
			}
		
			if ($("#pickup2").parent().hasClass("on")){
				$("#search_type").val("02");
			}
			/*
			if ($("#search_type").val() == "" ) {
				alert("조회 유형(주문번호 또는 송장번호)을 선택해 주세요.");
			} else if (invoice_no == "") {
				alert("송장번호 또는 주문번호를 입력해 주세요.");
				$("#pick_invoice_no").focus();
			} else if (isNaN(invoice_no)) {
				alert("숫자만 입력해 주세요.");
				$("#pick_invoice_no").val("");
				$("#pick_invoice_no").focus();
			} else if ($("#search_type").val() == "02" && invoice_no.length != 10) {
				alert("10자리 운송장 번호를 입력해 주세요.");
				$("#pick_invoice_no").val("");
				$("#pick_invoice_no").focus();
			} else {
				$("#deliveryPickupForm").attr("action","/postbox/delivery/pickupResult.cupost");
				$("#deliveryPickupForm").submit();
			}
			*/
			var invoice_no = $("#pick_invoice_no").val();
			
			
			if ($("#search_type").val() == "" ) {
				alert("조회 유형(주문번호 또는 송장번호)을 선택해 주세요.");
			} else if (invoice_no == "") {
				alert("송장번호 또는 주문번호를 입력해 주세요.");
				$("#pick_invoice_no").focus();
			} else if (isNaN(invoice_no)) {
				alert("숫자만 입력해 주세요.");
				$("#pick_invoice_no").val("");
				$("#pick_invoice_no").focus();
			} else {
				$("#deliveryPickupForm").attr("action","/postbox/delivery/pickupResultNew.cupost");
				$("#deliveryPickupForm").submit();
			}
		}
		function searchSendAddr(){
			if(getSendType()=="E"){
				mainzipsearch('s_post','s_addr')
			}
			if(getSendType()=="L"){
				zipsearch('s_post','s_addr');
			}
			if(getSendType()=="T"){
				seoulzipsearch('s_post','s_addr');
			}
		
		}
		
		function searchReciveAddr(){
			if(getSendType()=="L"){
				zipsearch('r_post','r_addr');
			}
			if(getSendType()=="T"){
				seoulzipsearch('r_post','r_addr');
			}
			
		}
		function next(){
			if($("#s_post").val()==""){
				alert("우편번호를 입력해주세요");
			}else if($("#s_addr").val()==""){
				alert("주소를 입력해주세요");
			}else if($("#s_detail").val()==""){
				alert("상세주소를 입력해주세요");
			}else{
				$("#send_input").hide();
				$("#recive_input").show();
			}
		}
		function setSendType(val){
			$("#s_post").val("");
			$("#s_addr").val("");
			$("#s_detail").val("");
			$("#r_post").val("");
			$("#r_addr").val("");
			$("#r_detail").val("");
			$("#s_type").val(val);
			if(getSendType()=="E"){
				$("#r_post").prop("readonly",false);
				$("#r_addr").prop("readonly",false);
				$("#r_post_btn").hide();
				$("#s_detail").on("keyup",function(){
					$("#s_detail").val($("#s_detail").val().replace(/[^a-zA-Z0-9\s]/g,''));
		    	});
				$("#r_post").on("keyup",function(){
					$("#r_post").val($("#r_post").val().replace(/[^0-9]/g,''));
		    	});
				$("#r_addr").on("keyup",function(){
					$("#r_addr").val($("#r_addr").val().replace(/[^a-zA-Z0-9\s]/g,''));
		    	});
				$("#r_detail").on("keyup",function(){
					$("#r_detail").val($("#r_detail").val().replace(/[^a-zA-Z0-9\s]/g,''));
		    	});
				$("#r_addr").attr("maxlength",100)
				$("#r_detail").attr("maxlength",100)
			}else{
				$("#r_post").prop("readonly",true);
				$("#r_addr").prop("readonly",true);
				$("#r_post_btn").show();
				$("#s_detail").off("keyup");
				$("#r_post").off("keyup");
				$("#s_detail").off("keyup");
				$("#r_detail").off("keyup");
				$("#r_addr").attr("maxlength",50)
				$("#r_detail").attr("maxlength",50)
			}
			$("#send_input").show();
			$("#recive_input").hide();
		
		}
		function getSendType(){
			return $("#s_type").val();
		} 
		function blank(){}
		function reservation(){
			if(getSendType!="E" && $("#r_post").val()==""){
				alert("우편번호를 입력해주세요");
				$("#r_post").focus();
			}else if($("#r_addr").val()==""){
				alert("주소를 입력해주세요");
				$("#r_addr").focus();
			}else if($("#r_detail").val()==""){
				alert("상세주소를 입력해주세요");
				$("#r_detail").focus();
			}else{
				$.post("/postbox/common/setReservationInfo.cupost",
						{
							save:$("#s_type").val(),
							real_sender_post_no:$("#s_post").val(),
					     	real_sender_addr:$("#s_addr").val(),
					     	real_sender_detaddr:$("#s_detail").val(),	
					     	receiver_post_no:$("#r_post").val(),
					     	receiver_addr:$("#r_addr").val(),
							receiver_detail_addr:$("#r_detail").val()	
						},
						function(data){
							if(data.is_ok=="ok"){
								if($("#s_type").val()=="L"){
									location.href="/postbox/local/member/reservation.cupost";
								}
								if($("#s_type").val()=="T"){
									location.href="/postbox/today/member/reservation.cupost";
								}
								if($("#s_type").val()=="E"){
									location.href="/postbox/ems/member/reservation.cupost";
								}
							}else{
								alert("서비스을 사용하실 수 없습니다");
							}
						}
				);
			}
			
		}
		function keySet(){
			$("[data-numonly='true']").on("keyup",function(){
				   var re =/[^0-9.]/g;
		         var temp=$(this).val();       
		         if(re.test(temp)){
		                   $(this).val(temp.replace(re,""));
		         }
				});
				
				$("[data-alphaonly='true']").on("keyup",function(){
					 var re = /[^a-zA-Z\s]/g;
		         var temp=$(this).val();       
		         if(re.test(temp)){
		                   $(this).val(temp.replace(re,""));
		         }
				});
				
				$("[data-alphanumonly='true']").on("keyup",function(){
					 var re = /[^a-zA-Z0-9\s]/g;
		         var temp=$(this).val();       
		         if(re.test(temp)){
		                   $(this).val(temp.replace(re,""));
		         }
				});
				
				$("[data-nameonly='true']").on("keyup",function(){
					 var re =/[^a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣\s]/g;
		         var temp=$(this).val();       
		         if(re.test(temp)){
		                   $(this).val(temp.replace(re,""));
		         }
				});
				
				$("[data-addronly='true']").on("keyup",function(){
					 var re = /[^a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣\s\,\(\)]/g;
		         var temp=$(this).val();       
		         if(re.test(temp)){
		                   $(this).val(temp.replace(re,""));
		         }
				});
		}
		</script>
		
		<!-- 기부금 게이지바 -->
		
		
		<script>
			function numberFormat(num)
			{
				num = String(num);
		
				var cnt = 0;
				var result = "";
				var arr_str = num.split(".");
				var str_mark = "";
				var str_tail = 1 < arr_str.length ? "."+ arr_str[1] : "";
		
				if(num.charAt(0) == "-"){
					str_mark = "-";
				}
		
				num = arr_str[0];
		
				if(num){
					num = num.replace(/\D/g, "");
		
					if(1 < num.length){
						num = num.replace(/^0+(?=\d)/, "");
		
						if(1 < num.length){
							num = num.split("");
		
							for(var i=num.length-1; 0<i; i--){
								if(++cnt % 3 == 0){
									num[i] = ","+ num[i];
								}
								result = num[i] + result;
							}
							result = num[i] + result;
						}else{
							result = num;
						}
					}else{
						result = num;
					}
				}
		
				return str_mark + result + str_tail;
			}
		
			function numberCounter(target, num, speed, callback)
			{
				this.now = 0;
				this.diff = 0;
				this.target = target;
				this.number = parseInt(num);
				this.speed = speed ? speed : 4;
				this.timer = null;
				this.callback = function(){};
		
				if(typeof callback == "function"){
					this.callback = callback;
				}
		
				this.counter();
			}
		
			numberCounter.prototype.counter = function(){
					var self = this;
					this.diff = this.number - this.now;
		
					if(0 < this.diff){
						self.now += Math.ceil(this.diff / this.speed);
					}
		
					this.target.innerHTML = numberFormat(this.now);
		
					if(this.now < this.number){
						this.timer = setTimeout(function(){ self.counter() }, 40);
					}else{
						clearTimeout(this.timer);
						this.callback();
					}
			};
		
			(function(){
					var $g = $("#donation-gauge .gauge");
					var $gv = $("#donation-gauge .gauge-value");
					var t = $("#donation-gauge .gauge-total").text();
					var v = $gv.text();
					var p = 0;
		
					if(t && v){
						t = Number(t.replace(/[^\d\/]/g, ""));
						v = Number(v.replace(/[^\d\/]/g, ""));
						per = v / t * 100;
						
						if(per > 100){
							per = 100;
						}
						
						if(4 < per){
							$g.animate({ "height":per+"%" }, 1500);
							$gv.animate({ "bottom":per +"%" }, 1500);
							new numberCounter($gv[0], v, 3);
						}
					}
			})();
		
			$(document).ready(function(){
					var baseTop = parseInt($("#donation-gauge").css("top"));
					$("#donation-gauge").animate({ "top":($(document).scrollTop() + baseTop) +"px" }, 600);
		
					$(window).scroll(function(){
							$("#donation-gauge").stop();
							$("#donation-gauge").animate({ "top":($(document).scrollTop() + baseTop) +"px" }, 600);
					});
			});
			
			function eventDonateDetail(){
				$('#frmEvent').attr("action","/postbox/cuevent/eventView.cupost")
				$('#frmEvent').submit();
			}
		</script>
		<!-- //기부금 게이지바 -->
		
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		  ga('create', 'UA-92509665-1', 'auto');
		  ga('send', 'pageview');
		</script>
		
		
		
		
		
		
		
		
	</body>
</html>