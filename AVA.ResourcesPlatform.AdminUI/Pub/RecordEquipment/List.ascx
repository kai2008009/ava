<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.RecordEquipment.List1" %>
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
                <%= Define.Get("RecordEquipment_设备状态").HtmlEncode()%>
            </span>
        </th>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "Status": //RecordEquipment_状态
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Status").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_状态").HtmlEncode() %>
                <%= OrderBy("Status") %>
            </span>
        </th>
        <%
break;
                    case "RecordEquipmentDomainName": //RecordEquipment_DomainName_网站名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Domain.Name").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_DomainName_网站名称").HtmlEncode() %>
                <%= OrderBy("_Domain.Name") %>
            </span>
        </th>
        <%
break;
                    case "RecordEquipmentDomainCode": //RecordEquipment_DomainCode_域编码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Domain.Code").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_DomainCode_域编码").HtmlEncode() %>
                <%= OrderBy("_Domain.Code") %>
            </span>
        </th>
        <%
break;
                    case "Name": //RecordEquipment_设备名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Name").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_设备名称").HtmlEncode() %>
                <%= OrderBy("Name") %>
            </span>
        </th>
        <%
break;
                    case "IPAddress": //RecordEquipment_IP地址
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"IPAddress").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_IP地址").HtmlEncode() %>
                <%= OrderBy("IPAddress") %>
            </span>
        </th>
        <%
break;
                    case "WebPort": //RecordEquipment_Web端口
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"WebPort").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_Web端口").HtmlEncode() %>
                <%= OrderBy("WebPort") %>
            </span>
        </th>
        <%
break;
                    case "ProgramID": //RecordEquipment_节目ID
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"ProgramID").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_节目ID").HtmlEncode() %>
                <%= OrderBy("ProgramID") %>
            </span>
        </th>
        <%
break;
                    case "RecordPort": //RecordEquipment_录播端口号
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"RecordPort").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_录播端口号").HtmlEncode() %>
                <%= OrderBy("RecordPort") %>
            </span>
        </th>
        <%
break;
                    case "LoginName": //RecordEquipment_登录名
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"LoginName").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_登录名").HtmlEncode() %>
                <%= OrderBy("LoginName") %>
            </span>
        </th>
        <%
break;
                    case "Password": //RecordEquipment_登录密码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Password").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_登录密码").HtmlEncode() %>
                <%= OrderBy("Password") %>
            </span>
        </th>
        <%
break;
                    case "RecordVideo1": //RecordEquipment_是否录制Video1
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"RecordVideo1").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_是否录制Video1").HtmlEncode() %>
                <%= OrderBy("RecordVideo1") %>
            </span>
        </th>
        <%
break;
                    case "RecordVideo2": //RecordEquipment_是否录制Video2
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"RecordVideo2").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_是否录制Video2").HtmlEncode() %>
                <%= OrderBy("RecordVideo2") %>
            </span>
        </th>
        <%
break;
                    case "AutoRecord": //RecordEquipment_自动录制
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"AutoRecord").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_自动录制").HtmlEncode() %>
                <%= OrderBy("AutoRecord") %>
            </span>
        </th>
        <%
break;
                    case "Description": //RecordEquipment_描述
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Description").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_描述").HtmlEncode() %>
                <%= OrderBy("Description") %>
            </span>
        </th>
        <%
break;
                    case "ASHas": //RecordEquipment_转播重编码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"ASHas").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_转播重编码").HtmlEncode() %>
                <%= OrderBy("ASHas") %>
            </span>
        </th>
        <%
break;
                    case "RecordEquipmentAgentServerName": //RecordEquipment_AgentServerName_服务器名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_AgentServer.Name").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_AgentServerName_服务器名称").HtmlEncode() %>
                <%= OrderBy("_AgentServer.Name") %>
            </span>
        </th>
        <%
break;
                    case "SortNumber": //RecordEquipment_排序号
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"SortNumber").ToScriptTag() %>',event)">
                <%= Define.Get("RecordEquipment_排序号").HtmlEncode() %>
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
        <td class="wd0 summary" title="<%= DefineEnum.点击显示简述.Define() %>" onclick="GetSummary(this,'/Pub/RecordEquipment/summary','guid=<%= item.Guid %>')">
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
                    case "Status":
        %>
        <td>
            <span title="<%= (item.Status != null ? ((AVA.ResourcesPlatform.Model.Pub.RecordEquipmentStatusEnum)item.Status).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Status != null ? ((AVA.ResourcesPlatform.Model.Pub.RecordEquipmentStatusEnum)item.Status).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "RecordEquipmentDomainName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentDomain.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentDomain.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "RecordEquipmentDomainCode":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentDomain.Code", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentDomain.Code", item) %>
            </span>
        </td>
        <%
break;
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
                    case "WebPort":
        %>
        <td>
            <span title="<%= item.WebPort.ToString(string.Empty).ToScriptTag() %>">
                <%= item.WebPort %>
            </span>
        </td>
        <%
break;
                    case "ProgramID":
        %>
        <td>
            <span title="<%= item.ProgramID.ToString(string.Empty).ToScriptTag() %>">
                <%= item.ProgramID %>
            </span>
        </td>
        <%
break;
                    case "RecordPort":
        %>
        <td>
            <span title="<%= item.RecordPort.ToString(string.Empty).ToScriptTag() %>">
                <%= item.RecordPort %>
            </span>
        </td>
        <%
break;
                    case "LoginName":
        %>
        <td>
            <span title="<%= item.LoginName.ToString(string.Empty).ToScriptTag() %>">
                <%= item.LoginName %>
            </span>
        </td>
        <%
break;
                    case "Password":
        %>
        <td>
            <span title="<%= item.Password.ToString(string.Empty).ToScriptTag() %>">
                <%= item.Password %>
            </span>
        </td>
        <%
break;
                    case "RecordVideo1":
        %>
        <td>
            <span title="<%= item.RecordVideo1.ToString(string.Empty).ToScriptTag() %>">
                <%= item.RecordVideo1 %>
            </span>
        </td>
        <%
break;
                    case "RecordVideo2":
        %>
        <td>
            <span title="<%= item.RecordVideo2.ToString(string.Empty).ToScriptTag() %>">
                <%= item.RecordVideo2 %>
            </span>
        </td>
        <%
break;
                    case "AutoRecord":
        %>
        <td>
            <span title="<%= item.AutoRecord.ToString(string.Empty).ToScriptTag() %>">
                <%= item.AutoRecord %>
            </span>
        </td>
        <%
break;
                    case "Description":
        %>
        <td>
            <%= new HtmlSpan(item.Description) { FilterHtml = true, TextLength = 30, Suffix = "...", WideWord = true } %>
        </td>
        <%
break;
                    case "ASHas":
        %>
        <td>
            <span title="<%= item.ASHas.ToString(string.Empty).ToScriptTag() %>">
                <%= item.ASHas %>
            </span>
        </td>
        <%
break;
                    case "RecordEquipmentAgentServerName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentAgentServer.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentAgentServer.Name", item) %>
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
<script type="text/javascript">

    function GetMyStatus(key, guid) {
        $("#spn" + guid).html("更新中...");
        RecordEquipmentAjax.GetRecordEquipmentStatus(key, null, function (result) {
            $("#spn" + guid).html(result.Data);

        });
    }
</script>
