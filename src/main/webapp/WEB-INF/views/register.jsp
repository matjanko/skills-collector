<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Rejestracja użytkownika</title>
</head>
<body>
    <jsp:include page="fragments/header.jsp"/>

    <form method="post" action="/register">
        <table>
            <tr>
                <td><label for="firstName">Imię:</label></td>
                <td><input type="text" required value="${newUser.firstName}" id="firstName" name="firstName"/></td>
            </tr>
            <tr>
                <td><label for="lastName">Nazwisko:</label></td>
                <td><input type="text" required value="${newUser.lastName}" id="lastName" name="lastName"/></td>
            </tr>
            <tr>
                <td><label for="username">Login:</label></td>
                <td><input type="text" required value="${newUser.username}" id="username" name="username"/></td>
            </tr>
            <tr>
                <td><label for="password">Hasło:</label></td>
                <td><input type="password" required value="${newUser.password}" id="password" name="password"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Dodaj użytkownika"/>
                    <input type="reset" value="Wyczyść dane"/>
                </td>
            </tr>
        </table>
    </form>

    <jsp:include page="fragments/footer.jsp"/>
</body>
</html>
