<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayPlayerAVA" %>
<div style="margin-top: 10px;"></div>
<div id="AVAPlayerHTML4" style="display: none;">
    这里为多媒体播放器，如果看到当前内容，请确认是否已经安装了AVA播放器，并在IE浏览器中浏览，并确认浏览器开启了脚本支持和AVA插件。
    <br />
    如未安装请点击下载
    <%= new HtmlAnchor("AVAPlayer.zip") { Href= Request.WebPath() + "/Resource/AVAPlayer.zip"}%>
    解压后安装
</div>
<div id="AVAPlayerContainer" style="display: none;">
    <object id="AVAPlayer" width="100%" classid="CLSID:F0F46491-5032-428B-AE54-A8863C0C0BFF">
    </object>
</div>
<div id="AVAPlayerIMG" style="display: none;">
    <%= new HtmlImg(Request.WebPath() + SettingGroup.VideoUploadPath + this.Video.Cover, this.Video.Name).Style(new { Width="100%" })%>
</div>
<script type="text/javascript">
    var avaPlayer = document.getElementById("AVAPlayer");
    if (document.all) {
        if (avaPlayer == null
            || typeof (avaPlayer.Play) == "undefined") {
            $("#AVAPlayerHTML4").show();
            $("#AVAPlayerContainer").hide();
            $("#AVAPlayerIMG").show();
        }
        else {
            $("#AVAPlayerIMG").hide();
            $("#AVAPlayerContainer").show();
            $("#AVAPlayer").height(($("#AVAPlayer").width() / 16 * 10) + 40);
        }
    }
    else {
        $("#AVAPlayerHTML4").show();
        $("#AVAPlayerContainer").hide();
        $("#AVAPlayerIMG").show();
    }
    avaPlayer.AxBorderStyle = 0;
    if ("<%=  Request.UserHostAddress %>" == "::1"
    || "<%=  Request.UserHostAddress %>" == "127.0.0.1") {
        avaPlayer.Url = '<%= Request.WebPath() + "/Upload/Video/" + this.Video.Guid + "/" + this.Video.FileName %>';
    }
    else {
        avaPlayer.Url = '<%= SettingGroup.MMSUrl + "/Video/" + this.Video.Guid + "/" + this.Video.FileName %>';
    }
    function AVAPlay() {
        avaPlayer.ToolbarVisible = true;
        avaPlayer.Play();
        try {
            $("#AVAPlayer").height($("#AVAPlayer").height() + 1);
            $("#AVAPlayer").height($("#AVAPlayer").height() - 1);
            if (avaPlayer.Version == "3.9.9.34") {//这个版本是Player_v2.9.1.6默认按比例显示的
                avaPlayer.setAspectType(0, 0)
                avaPlayer.setAspectType(1, 0)
                avaPlayer.setAspectType(2, 0)
            }
        }
        catch (ex) { }
    }
    function AVAContinue() {
        avaPlayer.Continue();
    }
    function AVAPause() {
        avaPlayer.Pause();
    }
    function AVAStop() {
        avaPlayer.Stop();
    }
    function AVAGoTo10Second() {
        avaPlayer.GotoTimeSpot(10 * 1000);
    }
    function AVAGetRecLength() {
        alert(avaPlayer.GetRecLength() / 1000);
    }

    function AVAFullScreen() {
        avaPlayer.FullScreen();
    }

    function InitGoToTimeSpot(spot) {
        avaPlayer.Play();
        GoToTimeSpotLast(spot)
    }

    function GoToTimeSpotLast(spot) {
        var recLength = avaPlayer.GetRecLength(); //得到当前秒数
        if (spot > recLength && recLength != 0) {
            avaPlayer.GotoTimeSpot(spot);

        }
        else {
            setTimeout(function () { GoToTimeSpotLast(spot) }, 100);
        }
    }

    function GoToTimeSpot(spot) {
        if (avaPlayer == null
            || typeof (avaPlayer.Play) == "undefined") {
            alert("当前操放器只支持IE浏览器，请在IE浏览器中查看")
        }
        else {
            avaPlayer.GotoTimeSpot(spot);
        }
    }
    $(function () {
        if (avaPlayer != null
                && typeof (avaPlayer.Play) != "undefined") {
            setTimeout("AVAPlay();", 2000);
        }
    });
</script>
<script type="text/javascript">
    //如果有跳到知识点
    $(function () {
        <%
    if (this.Spot > 0)
    {
            %>
        if (avaPlayer != null
        && typeof (avaPlayer.Play) != "undefined") {
            setTimeout("InitGoToTimeSpot(<%= this.Spot %>);", 2000);
        }
        <% 
    }
        %>

    });
</script>
<!--.showInfo-->
<div>
    <div>
        <div class="toggle-info well" id="toggle-info">
            <h3></h3>
            <p>
                <%= this.Video.Description.RestoreHtml() %>
            </p>
        </div>
        <div class="well">
            <a href="#" class="toggle-info-btn t" rel="toggle-info" title="切换显示详细信息"><span>切换显示详细信息</span></a>

            <%if (Request.UserHostAddress == "::1"
    || Request.UserHostAddress == "127.0.0.1")
              {
            %>
            <%= new HtmlAnchor("小窗口播放") {Class="btn SwitchBitrate", Href = Request.WebPath() + "/Upload/Video/" + this.Video.Guid + "/" + this.Video.FileName }%>
            <% 
              }
              else
              {
            %>
            <%= new HtmlAnchor("小窗口播放") {Class="btn SwitchBitrate", Href = SettingGroup.MMSUrl + "/Video/" + this.Video.Guid + "/" + this.Video.FileName }%>
            <% 
              }%>
        </div>
    </div>
</div>
<div class="clear">
</div>
<hr />
