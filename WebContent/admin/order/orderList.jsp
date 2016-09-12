<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>관리자용 티켓 신청 리스트</title>
        <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
        <script>
            $(function () {
                $("#datepicker1, #datepicker2").datepicker({
                    dateFormat: 'yy-mm-dd'
                });
            });

        </script>
        <script type="text/javascript">
            function doImgPop(img) {
                img1 = new Image();
                img1.src = (img);
                imgControll(img);
            }

            function imgControll(img) {
                if ((img1.width != 0) && (img1.height != 0)) {
                    viewImage(img);
                } else {
                    controller = "imgControll('" + img + "')";
                    intervalID = setTimeout(controller, 20);
                }
            }
            function viewImage(img) {
                W = img1.width;
                H = img1.height;
                O = "width=" + W + ",height=" + H + ",scrollbars=yes";
                imgWin = window.open("", "", O);
                imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
                imgWin.document.write("<body topmargin=0 leftmargin=0>");
                imgWin.document.write("<img src=" + img + " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
                imgWin.document.close();
            }
            function deletecheck(num) {
                if (confirm("주문을 취소하시겠습니까?")) {
                    window.location.href = "/order/adminOrderCancel.action?order_num=" + num;
                } else {
                    alert("취소되었습니다");
                    return false;
                }
            }
            function change() {
                var num = document.orderList.searchNum.value;

                if (num == 2) {
                    //신청날짜 선택했을 때
                    return 2;
                }
                if (num == 3) {
                    //주문상태 선택했을 때
                    return 3;
                }
                return num;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">관리자용 주문 내역 페이지</p></div>
                <form name="orderList" method="post"action="/order/adminOrderSearch.action">
                    <table width="100%" align="center" class="table table-hover">
                        <thead>
                            <tr>
                                <th class="tg-2thk" colspan="5">주문 정보</th>
                                <th class="tg-2thk" colspan="4">신청자 정보</th>
                            </tr>
                            <tr>
                                <td class="tg-j4kc" align="center">주문번호</td>
                                <td class="tg-j4kc" align="center">신청일자</td>
                                <td class="tg-j4kc">신청 전시회</td>
                                <td class="tg-j4kc" align="center">바코드</td>
                                <td class="tg-j4kc" align="center">신청 상태</td>
                                <td class="tg-j4kc" align="center">회원번호</td>
                                <td class="tg-j4kc" align="center">E-mail( ID )</td>
                                <td class="tg-j4kc" align="center">성명</td>
                                <td class="tg-j4kc" align="center">연락처</td>
                            </tr>
                        </thead>
                        <s:iterator value="orderList" status="stat">
                            <tr>
                                <td width="70" align="center"><b>${order_num}</b></td>
                                <td width="90" align="center"><fmt:formatDate value="${order_date }" pattern="yyyy-MM-dd hh:mm" /></td>
                                <td>${showboard_num} ) <a href="/order/orderView.action?order_num=${order_num}&currentPage=${currentPage }"> ${subject } </a></td>
                                <s:if test='%{status == "티켓 신청" }'>
                                    <td align="center" width="150"><img src="../barcodeImg/${barcode}.png" style="cursor: pointer;" onclick="doImgPop('../barcodeImg/${barcode}.png')" width="150" />
                                    </td>
                                    <td align="center" width="80">${status }<br>
                                        <input type="button" name="status" value="취소하기" onclick="return deletecheck(${order_num})" class="btn btn-default btn-xs">
                                    </td>
                                </s:if>
                                <s:else>
                                    <td width="150">-</td>
                                    <td align="center" width="65">${status }</td>
                                </s:else>
                                <td align="center" width="70"><b>${member_num}</b></td>
                                <td>${email}</td>
                                <td align="center" width="80">${name}</td>
                                <td align="center">${tel}</td>
                            </tr>
                        </s:iterator>
                        <s:if test="orderList.size() == 0">
                            <tr>
                                <td colspan="9" align="center"><font size="2"> 신청된 전시가 없습니다.</font></td>
                            </tr>
                        </s:if>
                        <thead>
                            <tr>
                                <td colspan="9" align="center"><s:property value="pagingHtml" escape="false" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="9">
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <div class="col-md-3" style="padding-right: 0px;">
                                                <select name="searchNum"  class="form-control">
                                                    <option value="0">주문자ID(E-mail)</option>
                                                    <option value="1">전시회명</option>
                                                    <option value="2">신청상태</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-3" style="padding-left: 0px;">
                                                <input class="searchk form-control" type="text" name="searchKeyword" size="15" maxlength="20" /> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <p>조회기간:</p>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-3"><input type="text" id="datepicker1" name="datepicker1" class="form-control"></div>
                                        </div>
                                        <div class="form-group">~</div>
                                        <div class="form-group">
                                            <div class="col-md-3"><input type="text" id="datepicker2" name="datepicker2" class="form-control"></div>
                                        </div>
                                    </div>
                                    <input class="btn btn-default btn-xs" name="search" type="submit" value="검색" />
                                </td>
                            </tr>
                        </thead>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>