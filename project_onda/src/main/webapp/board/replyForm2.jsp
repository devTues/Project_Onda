<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>게시판 - 답변글</title>
    
    <style type="text/css">
        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
    </style>
    
</head>
<body>
 
    <br>
    <b><font size="6" color="gray">답글 작성</font></b>
    <br>
    
    <form method="post" action="ReplyPro.bo?page=${page}" name="qna_board">
    
    <input type="hidden" name="cus_id" value="${sessionScope.cus_id}">
    <input type="hidden" name="qna__num" value="${qna_board.qna_num}"/>
    <input type="hidden" name="qna__ref" value="${qna_board.qna_ref}"/>
    <input type="hidden" name="qna_re_lev" value="${qna_board.qna_re_lev}"/>
    <input type="hidden" name="qna_re_seq" value="${qna_board.qna_re_seq}"/>
 
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td id="title">작성자</td>
            <td>${sessionScope.cus_id}</td>
        </tr>
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="qna_title" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="qna_content" cols="72" rows="20">
                </textarea>            
            </td>        
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="등록" >
                <input type="button" value="목록" onclick="javascript:history.go(-1)">            
            </td>
        </tr>
    </table>    
    </form>
    
</body>
</html>
