<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="EUC-KR">
    <title>���ſϷ�</title>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">   
    <style>
        body {
            font-family: "Gowun Dodum", sans-serif !important;
            background-color: #f8f9fa;
        }

        .container {

        }

        .receipt {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .receipt-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .receipt-content table {
            width: 100%;
            border-collapse: collapse;
        }

        .receipt-content table,
        .receipt-content th,
        .receipt-content td {
            border: 1px solid #dee2e6;
        }

        .receipt-content th,
        .receipt-content td {
            padding: 10px;
            text-align: center;
        }

        .receipt-action {
            margin-top: 20px;
            text-align: right;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            color: #fff;
        }
    </style>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />


<div style="width: 70%; margin: 100px auto;">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-offset-2 col-md-8">
                <div class="receipt">
                    <div class="receipt-title">���� ������</div>
                    <div class="receipt-content">
                        <p>������ ���� ���Ű� �Ǿ����ϴ�.</p>
                        <table>
                            <tr>
                                <th>��ǰ��ȣ</th>
                                <td>${product.prodNo}</td>
                            </tr>
                            <tr>
                                <th>�����ھ��̵�</th>
                                <td>${purchase.buyer.userId }</td>
                            </tr>
                            <tr>
                                <th>���Ź��</th>
                                <td>${purchase.paymentOption == 1? "���ݱ���" : "�ſ뱸��"}</td>
                            </tr>
                            <tr>
                                <th>�������̸�</th>
                                <td>${purchase.receiverName}</td>
                            </tr>
                            <tr>
                                <th>�����ڿ���ó</th>
                                <td>${purchase.receiverPhone}</td>
                            </tr>
                            <tr>
                                <th>�������ּ�</th>
                                <td>${purchase.divyAddr}</td>
                            </tr>
                            <tr>
                                <th>���ſ�û����</th>
                                <td>${purchase.divyRequest}</td>
                            </tr>
                            <tr>
                                <th>����������</th>
                                <td>${purchase.divyDate}</td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="receipt-action">
	                    <a href="/purchase/payment?" class="btn btn-primary">�����Ϸ�����</a>
                        <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1)">����</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
