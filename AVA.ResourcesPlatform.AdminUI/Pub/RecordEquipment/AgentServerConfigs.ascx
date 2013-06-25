<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgentServerConfigs.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.RecordEquipment.EditAgentServer" %>
<%
    if (this.ErrorMessage != null)
    {
%>
<table class="g-table-cntacomm">
    <tr>
        <td style="width: 200px;"><span style="font-size: 120%;">信息获取出错： </span></td>
        <td><span style="font-size: 120%;">
            <%= this.ErrorMessage%>
        </span></td>
    </tr>
</table>
<% 
    }
    else
    {
%>
<table class="g-table-cntacomm">
    <tr>
        <th>服务器信息： </th>
        <td><span style="font-size: 120%;">
            <%= this.AgentServerStatus%>
        </span></td>
    </tr>
    <tr>
        <th>AVA播放器收看最大数： </th>
        <td>
            <%= new HtmlText("AVAMaxClientNum", this.ViewData["_Configs.AVAMaxClientNum"]) { Class = "ipt-t ipt-t-dft ", DefaultValue = 300 }%>
        </td>
    </tr>
    <tr>
        <th>微软播放器收看最大数： </th>
        <td>
            <%= new HtmlText("MMSMaxClientNum", this.ViewData["_Configs.MMSMaxClientNum"]) { Class = "ipt-t ipt-t-dft ",  DefaultValue = 50 }%>
            <%= new HtmlYKTip("MMSMaxClientNum") %>
        </td>
    </tr>
    <tr>
        <th>自动重连： </th>
        <td>
            <%= new HtmlCheckBox("AutoConnection", this.ViewData["_Configs.AutoConnection"], true, false) { Class = ""}%>
        </td>
    </tr>
    <tr>
        <th>重连间隔秒数： </th>
        <td>
            <%= new HtmlText("AutoInterval", this.ViewData["_Configs.AutoInterval"]) { Class = "ipt-t ipt-t-dft " }%>
            <%= new HtmlYKTip("AutoInterval") %>
        </td>
    </tr>
    <tr>
        <th>视频启动转换编码： </th>
        <td>
            <%= new HtmlCheckBox("V1_enabled", this.ViewData["_Codecs.V1_enabled"], true, false) { Class = ""}%>
        </td>
    </tr>
    <tr>
        <th>视频宽： </th>
        <td>
            <%= new HtmlText("V1_x", this.ViewData["_Codecs.V1_x"]) { DefaultValue="640", Class = "ipt-t ipt-t-dft " }%>
        </td>
    </tr>
    <tr>
        <th>视频高： </th>
        <td>
            <%= new HtmlText("V1_y", this.ViewData["_Codecs.V1_y"]) { DefaultValue="480", Class = "ipt-t ipt-t-dft " }%>
        </td>
    </tr>
    <tr>
        <th>视频码流率： </th>
        <td>
            <%= new HtmlText("V1_bps", this.ViewData["_Codecs.V1_bps"]) { DefaultValue="500000", Class = "ipt-t ipt-t-dft " }%>
            视频码流率 = 码流K * 1000；如512K码流=512*1024= 512000；如2M码流=2048*1000= 2048000；
        </td>
    </tr>
    <tr>
        <th>视频帧率： </th>
        <td>
            <%= new HtmlText("V1_fps", this.ViewData["_Codecs.V1_fps"]) { DefaultValue="25",  Class = "ipt-t ipt-t-dft " }%>
            设置要小于或等于原帧率，取值小于或等于30，超过无效。
        </td>
    </tr>
</table>
<%
    }
%>
