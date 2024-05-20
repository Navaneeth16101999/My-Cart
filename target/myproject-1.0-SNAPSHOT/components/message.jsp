<%--This approach ensures that the message is shown to the user only once after a specific action
(such as form submission or registration) and won't be displayed again if the user refreshes the page
or navigates to other pages within the application.--%>

<%

    String message = (String) session.getAttribute("message");
    if (message != null) {


%>

<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%=message%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message");
    }


%>