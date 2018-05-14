<%@ control language="C#" autoeventwireup="true" inherits="ViewSwitcher, App_Web_yszl0pdy" %>
<div id="viewSwitcher">
    <%: CurrentView %> view | <a href="<%: SwitchUrl %>" data-ajax="false">Switch to <%: AlternateView %></a>
</div>
