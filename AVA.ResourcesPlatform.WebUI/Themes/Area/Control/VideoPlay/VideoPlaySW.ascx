<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlaySW" %>
<%
    if (this.ListVideoSW != null && this.ListVideoSW.Count > 0)
    {
%>
<div class="accordion-group">
    <div class="accordion-heading">
        <a href="#collapseSW" data-parent="#collapseTimeInfoSWAttachment" data-toggle="collapse" class="accordion-toggle">微课环节 </a>
    </div>
    <div class="accordion-body collapse" id="collapseSW">
        <div class="accordion-inner">
            <ul>
                <%
        foreach (var videoSW in this.ListVideoSW)
        {
                %>
                <li>
                    <%= new HtmlAnchor(CreateInstance.VideoSWDao.FormatSW(videoSW.SW)) { Href = "#" + videoSW.Seconds, OnClick = "GoToTimeSpot(" + videoSW.Seconds + ")", Class = "show_title" }%>
                    <%= AVA.ResourcesPlatform.Config.Helper.FormatSecond(videoSW.Seconds / 1000) %>
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