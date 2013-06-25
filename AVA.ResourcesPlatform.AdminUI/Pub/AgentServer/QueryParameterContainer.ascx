<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryParameterContainer.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.QueryParameterContainer" %>
<tr>
    <td>
        <%= new HtmlSelect("$LeftParenthesis", "Value", "Key") { Option = typeof(Z.Core.NHibernateCore.Search.QueryParenthesisEnum) }%>
    </td>
    <td>
        <select onchange="GetQueryParamter(this);">
            <option value="" selected="selected">::请选择::</option>
            <option value="Version" title="<%= Define.Get("AgentServer_版本号").ToScriptTag()%>"><%= Define.Get("AgentServer_版本号").HtmlEncode()%></option>
            <option value="Name" title="<%= Define.Get("AgentServer_服务器名称").ToScriptTag()%>"><%= Define.Get("AgentServer_服务器名称").HtmlEncode()%></option>
            <option value="IPAddress" title="<%= Define.Get("AgentServer_服务器Web地址").ToScriptTag()%>"><%= Define.Get("AgentServer_服务器Web地址").HtmlEncode()%></option>
            <option value="DBUser" title="<%= Define.Get("AgentServer_转播SID").ToScriptTag()%>"><%= Define.Get("AgentServer_转播SID").HtmlEncode()%></option>            
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
