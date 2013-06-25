<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryParameterContainer.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.RecordEquipment.QueryParameterContainer" %>
<tr>
    <td>
        <%= new HtmlSelect("$LeftParenthesis", "Value", "Key") { Option = typeof(Z.Core.NHibernateCore.Search.QueryParenthesisEnum) }%>
    </td>
    <td>
        <select onchange="GetQueryParamter(this);">
            <option value="" selected="selected">::请选择::</option>
            <option value="Version" title="<%= Define.Get("RecordEquipment_版本号").ToScriptTag()%>"><%= Define.Get("RecordEquipment_版本号").HtmlEncode()%></option>
            <option value="SortNumber" title="<%= Define.Get("RecordEquipment_排序号").ToScriptTag()%>"><%= Define.Get("RecordEquipment_排序号").HtmlEncode()%></option>
            <option value="Status" lang="Status" title="<%= Define.Get("RecordEquipment_状态").ToScriptTag()%>"><%= Define.Get("RecordEquipment_状态").HtmlEncode()%></option>
            <option value="_Domain.Name" title="<%= Define.Get("RecordEquipment_DomainName_网站名称").ToScriptTag()%>"><%= Define.Get("RecordEquipment_DomainName_网站名称").HtmlEncode()%></option>
            <option value="_Domain.Code" title="<%= Define.Get("RecordEquipment_DomainCode_域编码").ToScriptTag()%>"><%= Define.Get("RecordEquipment_DomainCode_域编码").HtmlEncode()%></option>
            <option value="Name" title="<%= Define.Get("RecordEquipment_设备名称").ToScriptTag()%>"><%= Define.Get("RecordEquipment_设备名称").HtmlEncode()%></option>
            <option value="IPAddress" title="<%= Define.Get("RecordEquipment_IP地址").ToScriptTag()%>"><%= Define.Get("RecordEquipment_IP地址").HtmlEncode()%></option>
            <option value="WebPort" title="<%= Define.Get("RecordEquipment_Web端口").ToScriptTag()%>"><%= Define.Get("RecordEquipment_Web端口").HtmlEncode()%></option>
            <option value="ProgramID" title="<%= Define.Get("RecordEquipment_节目ID").ToScriptTag()%>"><%= Define.Get("RecordEquipment_节目ID").HtmlEncode()%></option>
            <option value="RecordPort" title="<%= Define.Get("RecordEquipment_录播端口号").ToScriptTag()%>"><%= Define.Get("RecordEquipment_录播端口号").HtmlEncode()%></option>
            <option value="LoginName" title="<%= Define.Get("RecordEquipment_登录名").ToScriptTag()%>"><%= Define.Get("RecordEquipment_登录名").HtmlEncode()%></option>
            <option value="Password" title="<%= Define.Get("RecordEquipment_登录密码").ToScriptTag()%>"><%= Define.Get("RecordEquipment_登录密码").HtmlEncode()%></option>
            <option value="Description" title="<%= Define.Get("RecordEquipment_描述").ToScriptTag()%>"><%= Define.Get("RecordEquipment_描述").HtmlEncode()%></option>
            <option value="ASHas" lang="ASHas" title="<%= Define.Get("RecordEquipment_转播重编码").ToScriptTag()%>"><%= Define.Get("RecordEquipment_转播重编码").HtmlEncode()%></option>
            <option value="ASAgentID" title="<%= Define.Get("RecordEquipment_转播设置ID").ToScriptTag()%>"><%= Define.Get("RecordEquipment_转播设置ID").HtmlEncode()%></option>
            <option value="_AgentServer.Name" title="<%= Define.Get("RecordEquipment_AgentServerName_服务器名称").ToScriptTag()%>"><%= Define.Get("RecordEquipment_AgentServerName_服务器名称").HtmlEncode()%></option>
        </select>
        <div style="display: none">
        </div>
    </td>
    <td class="queryTypeContainer">
        <select>
            <option value="" selected="selected">::--::</option>
        </select>
    </td>
    <td class="fieldContainer">
        <input type="text" name="$FieldValue" />
    </td>
    <td>
        <%= new HtmlSelect("$RightParenthesis", "Value", "Key") { Option = typeof(Z.Core.NHibernateCore.Search.QueryParenthesisEnum) }%>
    </td>
    <td>
        <%= new HtmlSelect("$LogicType", "Value", "Key") { Option = typeof(Z.Core.NHibernateCore.Search.LogicTypeEnum) }%>
    </td>
    <td>
        <div title="" onclick="AddQueryParameter(this);" class="btn btn-dft">
            <span>
                <%= DefineEnum.添加.Define() %></span></div>
        <div title="" onclick="DeleteQueryParameter(this);" class="btn btn-dft">
            <span>
                <%= DefineEnum.删除.Define() %></span></div>
    </td>
</tr>
