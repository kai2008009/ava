<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimeRangeRejectTemp.ascx.cs"
    Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.TimeRangeRejectTemp" %>
<%
    for (int i = 0; i <= this.ListApplicationTimeSetting.Count - 1; i++)
    {
        if (i != 0)
        {
%>
<br />
<%
    }
        var item = this.ListApplicationTimeSetting[i];
        //判断是否课室维护
        var startTime = new DateTime(this.IssueDate.Year, this.IssueDate.Month, this.IssueDate.Day,
            item.StartTime.Hour, item.StartTime.Minute, item.StartTime.Second);
        var endTime = new DateTime(this.IssueDate.Year, this.IssueDate.Month, this.IssueDate.Day,
            item.EndTime.Hour, item.EndTime.Minute, item.EndTime.Second);

        var issueCount = CreateInstance.ApplicationDao.IssueCount(this.RecordEquipment, startTime, endTime, null);
        var applyCount = CreateInstance.ApplicationDao.ApplyCount(this.RecordEquipment, startTime, endTime, null);
        var rejectCount = CreateInstance.RecordEquipmentRejectDao.RejectCount(this.RecordEquipment, startTime, endTime);
        var title = "";

        if (applyCount > 0)
        {
            if (title != "")
            {
                title += "\r\n";
            }
            title += Define.Get("Application_已存在{0}条批准申请", applyCount).ToScriptTag();
        }
        if (issueCount > 0)
        {
            if (title != "")
            {
                title += "\r\n";
            }
            title += Define.Get("Application_已存在{0}条有效申请", issueCount).ToScriptTag();
        }
        if (rejectCount > 0)
        {
            //维护
            title += Define.Get("RecordEquipmentReject_已存在{0}条维护记录", rejectCount).ToScriptTag();
        }
%>
<label>
    <%= new HtmlCheckBox("TimeRange", false, startTime.ToLongDate() + "|" + endTime.ToLongDate(), "") { Disabled = rejectCount > 0 }%>
    <%= item.StartTime.ToTime()%>
    -
    <%= item.EndTime.ToTime()%>
    (<%= item.Chatper %>)
    <%
        if (title != "")
        {
    %>
    [<%= title%>]
    <%
        }
    %>
</label>
<%
    }
%>