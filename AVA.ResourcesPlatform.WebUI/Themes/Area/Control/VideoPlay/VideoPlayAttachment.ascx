<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayAttachment" %>
<%
    if (this.ListVideoAttachment != null && this.ListVideoAttachment.Count > 0)
    {
%>
<div class="accordion-group">
    <div class="accordion-heading">
        <a href="#collapseAttachment" data-parent="#collapseTimeInfoSWAttachment" data-toggle="collapse" class="accordion-toggle">附件 </a>
    </div>
    <div class="accordion-body collapse" id="collapseAttachment">
        <div class="accordion-inner">
            <ul>
                <%
        foreach (var videoAttachment in this.ListVideoAttachment)
        {
                %>
                <li>
                    <%= new HtmlAnchor(videoAttachment.FileName) { Href = SettingGroup.VideoAttachmentFile(videoAttachment), Target = "_blank", Class = "show_title" }%>
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