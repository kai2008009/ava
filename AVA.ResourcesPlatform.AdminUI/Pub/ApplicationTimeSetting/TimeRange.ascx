<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimeRange.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.TimeRange" %>
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

        //判断是否有直播申请
        bool apply = true;

        bool reject = CreateInstance.RecordEquipmentRejectDao.AllowedApplyForIssue(this.RecordEquipment, startTime, endTime);
        if (reject == false)
        {
            apply = false;
%>
<label>
    <%= new HtmlCheckBox("", false, "", "") { Disabled = true }%>
    <%= item.StartTime.ToTime()%>
    -
    <%= item.EndTime.ToTime()%>
    (<%= item.Chatper %>)
    [<%= Define.Get("ApplicationTimeSetting_课室维护").ToScriptTag()%>]
</label>
<% 
    }
        if (this.CheckApplyIssued == true && apply == true)
        {
            var issue = CreateInstance.ApplicationDao.AllowedApplyForIssue(this.RecordEquipment, startTime, endTime, null);
            if (issue == false)
            {
                apply = false;
%>
<label title="">
    <%= new HtmlCheckBox("", false, "", "") { Disabled = true }%>
    <%= item.StartTime.ToTime()%>
    -
    <%= item.EndTime.ToTime()%>
    (<%= item.Chatper %>)
    [<%= Define.Get("ApplicationTimeSetting_已有批准直播申请").ToScriptTag()%>]
</label>
<%
    }
        }
        if (apply == true)
        {
            //判断有多少在申请当中的记录
            var issueCount = CreateInstance.ApplicationDao.IssueCount(this.RecordEquipment, startTime, endTime, null);                    
%>
<label title="">
    <%= new HtmlCheckBox("TimeRange", false, startTime.ToLongDate() + "|" + endTime.ToLongDate(), "")%>
    <%= item.StartTime.ToTime()%>
    -
    <%= item.EndTime.ToTime()%>
    (<%= item.Chatper %>)
    <%
    if (issueCount > 0)
    {
    %>
    <%= Define.Get("Application_已存在{0}条有效申请", issueCount).ToScriptTag()%>
    <% 
    }
    %>
</label>
<% 
    }
    }
%>