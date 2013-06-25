<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.OnlineShow.OnlineShowControl" %>
<script type="text/javascript">
    //更新小窗口播放的地址
    $("#aAVAPlayerOutPut").attr("href", "#live");
</script>
<ul class="live-btn-group">
    <li class="live-header">直播控制</li>
    <li class="divider"></li>
    <li class="playbtn arrow"><a class="btn" href="#">状态：<span id="spnThisTimeRecordEquipmentStatus"><%= this.Status%>
    </span></a></li>
    <%
        if (this.Status == "录制中" || this.Status == "直播中")
        {
            if (this.RecordEquipment.ASHas == true
                && this.RecordEquipment.ParentAgentServer != null
                && this.AsStatus == AVA.ResourcesPlatform.Model.Pub.RecordEquipmentASStatusEnum.转发转播中.Define())
            {
                var liveAVA = CreateInstance.RecordEquipmentDao.LiveURL(this.RecordEquipment);
    %>
    <li class="divider"></li>
    <li class="playbtn arrow"><a class="btn btn-avalive" id="avaView<%= this.RecordEquipment.Guid %>" href="#" onclick="GoToViewLive();return false;">收看转播</a>
        <script type="text/javascript">
            //更新小窗口播放的地址
            $("#aAVAPlayerOutPut").attr("href", "<%= liveAVA %>");
            function GoToViewLive() {
                var avaPlayer = document.getElementById("AVAPlayer");
                if (avaPlayer != null
                        && typeof (avaPlayer) != "undefined"
                        && typeof (avaPlayer.Play) != "undefined") {
                    avaPlayer.Url = "<%= liveAVA %>";
                    avaPlayer.Play();
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
    %>
    <li class="divider"></li>
    <li><a class="btn btn-live" id="a1" href="#" onclick="GoToViewLive();return false;">收看直播</a>
        <script type="text/javascript">
            //更新小窗口播放的地址
            $("#aAVAPlayerOutPut").attr("href", "ava://<%= this.RecordEquipment.IPAddress %>:<%= this.RecordEquipment.RecordPort %>/?PID=<%= this.RecordEquipment.ProgramID %>&user=<%= this.RecordEquipment.LoginNameView %>&password=<%= this.RecordEquipment.PasswordView %>");
            function GoToViewLive() {
                var avaPlayer = document.getElementById("AVAPlayer");
                if (avaPlayer != null
                        && typeof (avaPlayer) != "undefined"
                        && typeof (avaPlayer.Play) != "undefined") {
                    avaPlayer.Url = "ava://<%= this.RecordEquipment.IPAddress %>:<%= this.RecordEquipment.RecordPort %>/?PID=<%= this.RecordEquipment.ProgramID %>&user=<%= this.RecordEquipment.LoginNameView %>&password=<%= this.RecordEquipment.PasswordView %>";
                    avaPlayer.Play();
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
    <li class="divider"></li>
    <li class="playbtn arrow"><a class="btn btn-none" href="#">直播未启动</a></li>
    <%
                    }
    %>
</ul>
<div style="display: none;">
    <%= this.AsStatus %>
</div>
