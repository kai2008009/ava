<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.LivePlay.LivePlayControl" %>
<script type="text/javascript">
    //更新小窗口播放的地址
    $("#aAVAPlayerOutPut").attr("href", "#live");
</script>
    <ul class="live-btn-group" style="padding-bottom:0px;margin-bottom:5px">        
        <li class="divider" style="float:left"></li>
        <li class="playbtn arrow" style="float:left; cursor:default;"><a class="btn" href="#">状态：<span id="spnThisTimeRecordEquipmentStatus"><%= this.Status%>
        </span></a></li>
        
        <%--<li class="live-header"> </li>
        <li style="float:left"> </li>
        <li class="live-header" style="float:left">录制：</li>
        <li style="float:left"><span id="spnThisTimeApplicationVideoCount"><%= this.Application._ListRecordVideo.Count %>
        </span></li>
        --%>
        <%
            if (CreateInstance.ApplicationDao.Useableness(this.Application))
            {
        %>
        <%
                if (this.Application.ParentUser.Guid == CookieGroup.UserCode)
                {
        %>
        <li class="divider" style="float:left"> </li>
        <li style="float:left;">
            <%
                    if (this.Status == Z.Core.Lang.Define.Get("RecordEquipment_准备就绪") || this.Status == Z.Core.Lang.Define.Get("RecordEquipment_直播中"))
                    {
            %>
            <a class="btn btn-start" id="spnApplicationStart" href="#start" onclick="$(this).find('img').attr('src', '<%=Import.CSSFile("loading16.gif") %> ');ThisTimeApplicationStart('<%= this.Application.Guid %>','<%= this.Application.Guid %>');return false;">
                <%= new HtmlImg(Import.CSSFile("loading16.gif")) { Class = "StartLoading" }.Style(new { Display="none"})%>
                启动录制</a>
            <%
                    }
                    if (this.Status == Z.Core.Lang.Define.Get("RecordEquipment_录制中"))
                    {
            %>
            <a class="btn btn-stop" id="spnApplicationEnd" onclick="ThisTimeApplicationEnd('<%= this.Application.Guid %>','<%= this.Application.Guid %>');">
                <%= new HtmlImg(Import.CSSFile("loading16.gif")) { Class = "StopLoading" }.Style(new { Display="none"})%>
                停止录制</a>
            <%
                    }
            %>
        </li>
        <% 
                }
        %>
        <%
                if (CookieGroup.UserCode != null)
                {
                    if (this.Status == Z.Core.Lang.Define.Get("RecordEquipment_录制中") || this.Status == Z.Core.Lang.Define.Get("RecordEquipment_直播中"))
                    {
                        if (this.Application.ParentRecordEquipment.ParentAgentServer != null
                            && this.AsStatus == AVA.ResourcesPlatform.Model.Pub.RecordEquipmentASStatusEnum.转发转播中.Define())
                        {
                            var liveAS =CreateInstance.AgentServerDao.AVAASURL(this.Application.ParentRecordEquipment);
        %>
        <li class="divider" style="float:left"> </li>
        <li class="playbtn arrow" style="float:left"><a class="btn btn-avalive" id="avaView<%= this.Application.Guid %>" lang="<%= liveAS %>" href="#" onclick="GoToViewLive(this);return false;">收看转播</a>
            <script type="text/javascript">
                //更新小窗口播放的地址
                $("#aAVAPlayerOutPut").attr("href", "<%= liveAS %>");
                function GoToViewLive(send) {
                    var avaPlayer = document.getElementById("AVAPlayer");
                    if (avaPlayer != null
                        && typeof (avaPlayer) != "undefined"
                        && typeof (avaPlayer.Play) != "undefined") {
                        avaPlayer.Url = "<%= liveAS %>";
                        avaPlayer.ToolbarVisible = true;
                        avaPlayer.Play();
                        if (send != null) {
                            send.title = avaPlayer.Url;
                        }
                    }
                    else {
                        if (document.all) {
                            alert("请先安装AVA播放器");
                        }
                        else {
                            alert("当前操作器只支持IE浏览器");
                        }
                    }
                }
            </script>
        </li>
        <% 
                        }
                        else
                        {
                            var liveAVA = CreateInstance.RecordEquipmentDao.LiveURL(this.Application.ParentRecordEquipment);
        %>
        <li class="divider" style="float:left"></li>
        <li style="float:left"><a class="btn btn-live" id="a1" lang="<%= liveAVA %>" href="#" onclick="GoToViewLive(this);return false;">收看直播</a>
            <script type="text/javascript">
                //更新小窗口播放的地址
                $("#aAVAPlayerOutPut").attr("href", "<%= liveAVA %>");
                function GoToViewLive(send) {
                    var avaPlayer = document.getElementById("AVAPlayer");
                    if (avaPlayer != null
                        && typeof (avaPlayer) != "undefined"
                        && typeof (avaPlayer.Play) != "undefined") {
                        avaPlayer.Url = "<%= liveAVA %>";
                        avaPlayer.ToolbarVisible = true;
                        avaPlayer.Play();
                        if (send != null) {
                            send.title = avaPlayer.Url;
                        }
                    }
                    else {
                        if (document.all) {
                            alert("请先安装AVA播放器");
                        }
                        else {
                            alert("当前操作器只支持IE浏览器");
                        }
                    }
                }
            </script>
        </li>
        <% 
                        }
                    }
                    else
                    {
        %>
        <li class="divider" style="float:left"> </li>
        <li class="playbtn arrow" style="float:left"><a class="btn btn-none" href="#">直播未启动</a></li>
        <%
                    }
                }
                else
                {
        %>
        <li class="divider" style="float:left"> </li>
        <li class="playbtn arrow" style="float:left"><a class="btn btn-none" href="#">登录后才能收看</a></li>
        <% 
                }
        %>
        <%
            }
        %>
    </ul>
<div style="display:none;">
    <%= this.AsStatus %>
</div>