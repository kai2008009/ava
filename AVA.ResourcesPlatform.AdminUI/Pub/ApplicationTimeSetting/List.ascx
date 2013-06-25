<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.List1" %>
<table class="g-table-comm" cellpadding="2px" cellspacing="0px">
    <tr class="thead">
        <th class="wd0">
        </th>
        <th class="wd1 ckb">
            <%= new HtmlCheckBox() { Class = "trSelAll", Title = DefineEnum.全选_不选_本页所有记录.Define(), Lang = ".listContainer .trsel" }%>
        </th>
        <th class="wd2">
        </th>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "ApplicationTimeSettingDomainName": //ApplicationTimeSetting_DomainName_网站名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Domain.Name").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_DomainName_网站名称").HtmlEncode() %>
                <%= OrderBy("_Domain.Name") %>
            </span>
        </th>
        <%
break;
                    case "ApplicationTimeSettingDomainCode": //ApplicationTimeSetting_DomainCode_域编码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Domain.Code").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_DomainCode_域编码").HtmlEncode() %>
                <%= OrderBy("_Domain.Code") %>
            </span>
        </th>
        <%
break;
                    case "IsWeek": //ApplicationTimeSetting_是否周末
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"IsWeek").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_是否周末").HtmlEncode() %>
                <%= OrderBy("IsWeek") %>
            </span>
        </th>
        <%
break;
                    case "Chatper": //ApplicationTimeSetting_第几节课
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Chatper").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_第几节课").HtmlEncode() %>
                <%= OrderBy("Chatper") %>
            </span>
        </th>
        <%
break;
                    case "StartTime": //ApplicationTimeSetting_开始时间
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"StartTime").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_开始时间").HtmlEncode() %>
                <%= OrderBy("StartTime") %>
            </span>
        </th>
        <%
break;
                    case "EndTime": //ApplicationTimeSetting_结束时间
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"EndTime").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_结束时间").HtmlEncode() %>
                <%= OrderBy("EndTime") %>
            </span>
        </th>
        <%
break;
                    case "SortNumber": //ApplicationTimeSetting_排序号
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"SortNumber").ToScriptTag() %>',event)">
                <%= Define.Get("ApplicationTimeSetting_排序号").HtmlEncode() %>
                <%= OrderBy("SortNumber") %>
            </span>
        </th>
        <%
break;
                }
            }
        %>
    </tr>
    <% 
        foreach (var item in this.ListData)
        {
    %>
    <tr class="trout">
        <td class="wd0 summary" title="<%= DefineEnum.点击显示简述.Define() %>" onclick="GetSummary(this,'/Pub/ApplicationTimeSetting/summary','guid=<%= item.Guid %>')">
        </td>
        <td class="wd1 ckb">
            <%= new HtmlCheckBox() { Value= SetKey(item.Guid, item.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
        </td>
        <td class="wd2">
            <nobr><a href="edit.aspx?guid=<%= item.Guid %>"><%= DefineEnum.修改.Define() %></a></nobr>
        </td>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "ApplicationTimeSettingDomainName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentDomain.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentDomain.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "ApplicationTimeSettingDomainCode":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentDomain.Code", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentDomain.Code", item) %>
            </span>
        </td>
        <%
break;
                    case "IsWeek":
        %>
        <td>
            <span title="<%= (item.IsWeek != null ? ((AVA.ResourcesPlatform.Model.Pub.ApplicationTimeSettingIsWeekEnum)item.IsWeek).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.IsWeek != null ? ((AVA.ResourcesPlatform.Model.Pub.ApplicationTimeSettingIsWeekEnum)item.IsWeek).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "StartTime":
        %>
        <td>
            <span title="<%= item.StartTime.ToDateTimeN().ToTime() %>">
                <%= item.StartTime.ToDateTimeN().ToTime()%>
            </span>
        </td>
        <%
break;
                    case "Chatper":
        %>
        <td>
            <span title="<%= item.Chatper %>">
                <%= item.Chatper%>
            </span>
        </td>
        <%
break;
                    case "EndTime":
        %>
        <td>
            <span title="<%= item.EndTime.ToDateTimeN().ToTime() %>">
                <%= item.EndTime.ToDateTimeN().ToTime()%>
            </span>
        </td>
        <%
break;
                    case "SortNumber":
        %>
        <td>
            <span title="<%= item.SortNumber.ToString(string.Empty).ToScriptTag() %>">
                <%= item.SortNumber %>
            </span>
        </td>
        <%
break;
                }
            }
        %>
    </tr>
        <%
        }
    %>
</table>