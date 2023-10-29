<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>댓글 목록</title>
</head>
<body>
    <h1>댓글 목록</h1>

    <div id="commentList">
        <c:forEach items="${comments}" var="comment">
            <div class="comment">
                <p>${comment.content}</p>
            </div>
        </c:forEach>
    </div>

    <form id="commentForm">
        <textarea id="commentContent" rows="4" cols="50"></textarea>
        <button id="addCommentBtn">댓글 추가</button>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#addCommentBtn").click(function (event) {
                event.preventDefault();

                var content = $("#commentContent").val();
                if (content.trim() !== "") {
                    var newComment = { content: content };

                    $.ajax({
                        type: "POST",
                        url: "/comments",
                        contentType: "application/json",
                        data: JSON.stringify(newComment),
                        success: function (response) {
                            $("#commentContent").val("");
                            $("#commentList").append("<div class='comment'><p>" + response.content + "</p></div>");
                        },
                        error: function (error) {
                            console.error("Error adding comment: " + error);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
