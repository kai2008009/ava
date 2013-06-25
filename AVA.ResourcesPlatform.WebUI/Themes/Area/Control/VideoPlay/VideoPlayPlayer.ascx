<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayPlayer" %>
<%
    if (string.IsNullOrEmpty(this.VideoResourcePath.HighDefinition)
        && string.IsNullOrEmpty(this.VideoResourcePath.VideoShow)
        && !string.IsNullOrEmpty(this.VideoResourcePath.AVASRC))
    {
        //这里说明为未转换,且有文件AVA播放文件存在 那么用AVA播放器播放
%>
<%= new VideoPlayPlayerAVAInstance(this) { Video = this.Video, Spot = this.Spot ,VideoResourcePath = this.VideoResourcePath }.ToHtml() %>
<% 
    }
    else
    {
        //不然为用Flash播放
%>
<%= new VideoPlayPlayerFlashInstance(this) { Video = this.Video, Spot = this.Spot ,VideoResourcePath = this.VideoResourcePath }.ToHtml() %>
<% 
    }
%>