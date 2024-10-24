<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>가게부 입력</title>
    <link rel="stylesheet" href="./resources/css/inputAc.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
    <form action="input.ac" align="center">
      <div class="wrap">
        <input type="hidden" name="memNo" value="${ loginUser.memNo }" />
        <div class="dealSet">
          <div class="acountInput">
            거래 유형 <br />
            <select name="dealType" id="dealType">
              <option>입금</option>
              <option>출금</option>
            </select>
          </div>
          <div class="acountInput">
            거래 구분 <br />
            <select name="dealDivide" id="dealDivide">
              <option>카드</option>
              <option>현금</option>
            </select>
          </div>
        </div>
        <div class="acountInput">
          거래 날짜 <br />
          <input
            type="date"
            id="paymentDate"
            name="paymentDate"
            placeholder="거래날짜를 입력해주세요" required
          />
        </div>
        <div class="acountInput">
          거래명 <br />
          <input
            type="text"
            id="compendiums"
            name="compendiums"
            placeholder="거래명을 입력해주세요" required
          />
        </div>
        <div class="acountInput">
          거래 금액 <br />
          <input
            type="text"
            id="amount"
            name="amount"
            placeholder="거래금액을 입력해주세요" required
          />
          원
        </div>
        <br />
        <button id="submit">등록하기</button>
      </div>
    </form>
  </body>
</html>
