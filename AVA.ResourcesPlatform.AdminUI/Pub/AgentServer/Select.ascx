<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Select.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.Select1" %>
<table class="g-table-comm" cellpadding="2px" cellspacing="0px">
    <tr class="thead">
        <th class="wd0">
        </th>
        <th class="wd1">
        </th>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "Name": //AgentServer_服务器名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Name").ToScriptTag() %>',event)">
                <%= Define.Get("AgentServer_服务器名称").HtmlEncode() %>
                <%= OrderBy("Name") %>
            </span>
        </th>
        <%
break;
                    case "IPAddress": //AgentServer_服务器Web地址
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"IPAddress").ToScriptTag() %>',event)">
                <%= Define.Get("AgentServer_服务器Web地址").HtmlEncode() %>
                <%= OrderBy("IPAddress") %>
            </span>
        </th>
        <%
break;
                    case "DBUser": //AgentServer_转播SID
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"DBUser").ToScriptTag() %>',event)">
                <%= Define.Get("AgentServer_转播SID").HtmlEncode() %>
                <%= OrderBy("DBUser") %>
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
        <td class="wd0 summary" title="<%= DefineEnum.点击显示简述.Define() %>" onclick="GetSummary(this,'/Pub/AgentServer/summary','guid=<%= item.Guid %>')">
        </td>
        <td class="wd1 select" onclick="Select(&quot;<%= item.Guid.ToString(null).ToScriptTag()%>&quot;,&quot;<%= item.Name.ToString(null).ToScriptTag() %>&quot;);">
        </td>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "Name":
        %>
        <td>
            <span title="<%= item.Name.ToString(string.Empty).ToScriptTag() %>">
                <%= item.Name %>
            </span>
        </td>
        <%
break;
                    case "IPAddress":
        %>
        <td>
            <span title="<%= item.IPAddress.ToString(string.Empty).ToScriptTag() %>">
                <%= item.IPAddress %>
            </span>
        </td>
        <%
break;
                    case "DBUser":
        %>
        <td>
            <span title="<%= item.DBUser.ToString(string.Empty).ToScriptTag() %>">
                <%= item.DBUser %>
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