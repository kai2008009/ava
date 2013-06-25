<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayTimeInfo" %>
<%
    if (this.ListVideoTimeInfo != null && this.ListVideoTimeInfo.Count > 0)
    {
%>
<div class="accordion-group">
    <div class="accordion-heading">
        <a href="#collapseTimeInfo" data-parent="#collapseTimeInfoSWAttachment" data-toggle="collapse" class="accordion-toggle">知识点列表 </a>
    </div>
    <div class="accordion-body collapse" id="collapseTimeInfo">
        <div class="accordion-inner">
            <ul>
                <%
        foreach (var videoTimeInfo in this.ListVideoTimeInfo)
        {
                %>
                <li>
                    <%= new HtmlAnchor(videoTimeInfo.Description) { Href = "#" + videoTimeInfo.Seconds, OnClick = "GoToTimeSpot(" + videoTimeInfo.Seconds + ")", Class = "show_title" }%>
                    <%= AVA.ResourcesPlatform.Config.Helper.FormatSecond(videoTimeInfo.Seconds / 1000) %>
                </li>
                <% 
        }
                %>
            </ul>
        </div>
    </div>
</div>
<% 
    }
%>