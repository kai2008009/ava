<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.List1" %>
<table class="g-table-comm" cellpadding="2px" cellspacing="0px">
    <tr class="thead">
        <th class="wd0">
        </th>
        <th class="wd1 ckb">
            <%= new HtmlCheckBox() { Class = "trSelAll", Title = DefineEnum.全选_不选_本页所有记录.Define(), Lang = ".listContainer .trsel" }%>
        </th>
        <th class="wd2">
        </th>
        <th>
            <span>
                服务状态
            </span>
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
        <td class="wd1 ckb">
            <%= new HtmlCheckBox() { Value= SetKey(item.Guid, item.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
        </td>
        <td class="wd2">
            <nobr><a href="edit.aspx?guid=<%= item.Guid %>"><%= DefineEnum.修改.Define() %></a></nobr>
        </td>
        <td>
            <span id='spn<%= item.Guid %>' onclick='GetMyStatus("<%= SetKey(item.Guid,item.Version) %>","<%= item.Guid %>");' style="cursor: pointer">
                        查看状态
                    </span>
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
<script type="text/javascript">

    function GetMyStatus(key, guid) {
        $("#spn" + guid).html("更新中...");
        AgentServerAjax.ASStatus(key, null, function (result) {
            $("#spn" + guid).html(result);
        }, function ()
        {
            $("#spn" + guid).html("查看状态");
        });
    }
</script>