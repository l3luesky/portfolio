<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .star-rating {
            border: solid 1px #ccc;
            display: flex;
            flex-direction: row-reverse;
            font-size: 1.5em;
            justify-content: space-around;
            padding: 0 .2em;
            text-align: center;
            width: 5em;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ccc;
            cursor: pointer;
        }

        .star-rating :checked~label {
            color: #f90;
        }

        .star-rating label:hover,
        .star-rating label:hover~label {
            color: #fc0;
        }

        /* explanation */
        article {
            background-color: #ffe;
            box-shadow: 0 0 1em 1px rgba(0, 0, 0, .25);
            color: #006;
            font-family: cursive;
            font-style: italic;
            margin: 4em;
            max-width: 30em;
            padding: 2em;
        }
    </style>
</head>

<body>
   
</body>
<script>
function doPopupopen() {
    window.open("결제1.html", 'popup', 'width=#fieldset, height=#fieldset, scrollbars= 0, toolbar=0, menubar=no');
}

function do_alert() {
    alert("결제가 완료되었습니다.");
    opener.location.href="test.html";
    self.close();
}

</script>





</html>