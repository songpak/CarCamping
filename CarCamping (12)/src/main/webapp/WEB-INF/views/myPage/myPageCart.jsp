<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<%@ include file="../top.jsp" %>

<section class="pt-5 pb-5">
  <div class="container">
    <div class="row w-100">
        <div class="col-lg-12 col-md-12 col-12">
            <h3 class="display-5 mb-2 text-center">장바구니</h3>
            <h3 class="mb-5 text-center">- 장바구니에 담긴 상품 <i class="text-info font-weight-bold">3개</i> -</h3>
            <table id="shoppingCart" class="table table-condensed table-responsive">
                <thead>
                    <tr>
                        <th style="width:60%">상품</th>
                        <th style="width:12%">가격</th>
                        <th style="width:10%">수량</th>
                        <th style="width:16%"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <img src="https://via.placeholder.com/250x250/5fa9f8/ffffff" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <h4>상품명</h4>
                                    <p class="font-weight-light">브랜드 &amp; Name</p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">가격</td>
                        <td data-th="Quantity">
                            <input type="number" class="form-control form-control-lg text-center" value="1">
                        </td>
                        <td class="actions" data-th="">
                            <div class="text-right">
                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-sync"></i>
                                </button>
                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <img src="https://via.placeholder.com/250x250/5fa9f8/ffffff" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <h4>상품명</h4>
                                    <p class="font-weight-light">브랜드 &amp; Name</p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">$49.00</td>
                        <td data-th="Quantity">
                            <input type="number" class="form-control form-control-lg text-center" value="1">
                        </td>
                        <td class="actions" data-th="">
                            <div class="text-right">
                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-sync"></i>
                                </button>
                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <img src="https://via.placeholder.com/250x250/5fa9f8/ffffff" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <h4>상품명</h4>
                                    <p class="font-weight-light">브랜드 &amp; Name</p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">$49.00</td>
                        <td data-th="Quantity">
                            <input type="number" class="form-control form-control-lg text-center" value="1">
                        </td>
                        <td class="actions" data-th="">
                            <div class="text-right">
                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-sync"></i>
                                </button>
                               <button class="btn btn-white border-secondary bg-white btn-md mb-2">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="float:right">
        
                <h4>합계</h4>
                <h1>$99.00</h1>
            </div>
        </div>
    </div>
    <div class="row mt-4 d-flex align-items-center">
        <div class="col-sm-6 order-md-2 text-right">
            <a href="checkOutForm.jsp" class="btn btn-success mb-4 btn-lg pl-5 pr-5">결제하기</a>
        </div>
        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
            <a href="catalog.html">
                <i class="fas fa-arrow-left mr-2"></i> 계속 쇼핑하기</a>
        </div>
    </div>
</div>
</section>
 <%@ include file="../bottom.jsp" %>
 
 