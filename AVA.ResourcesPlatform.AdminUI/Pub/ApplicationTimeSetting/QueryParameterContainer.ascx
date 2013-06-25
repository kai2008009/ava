<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryParameterContainer.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.QueryParameterContainer" %>
<tr>
    <td>
        <%= new HtmlSelect("$LeftParenthesis", "Value", "Key") { Option = typeof(Z.Core.NHibernateCore.Search.QueryParenthesisEnum) }%>
    </td>
    <td>
        <select onchange="GetQueryParamter(this);">
            <option value="" selected="selected">::请选择::</option>
            <option value="Version" title="<%= Define.Get("ApplicationTimeSetting_版本号").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_版本号").HtmlEncode()%></option>
            <option value="SortNumber" title="<%= Define.Get("ApplicationTimeSetting_排序号").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_排序号").HtmlEncode()%></option>
            <option value="_Domain.Name" title="<%= Define.Get("ApplicationTimeSetting_DomainName_网站名称").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_DomainName_网站名称").HtmlEncode()%></option>
            <option value="_Domain.Code" title="<%= Define.Get("ApplicationTimeSetting_DomainCode_域编码").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_DomainCode_域编码").HtmlEncode()%></option>
            <option value="Chatper" title="<%= Define.Get("ApplicationTimeSetting_第几节课").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_第几节课").HtmlEncode()%></option>
            <option value="IsWeek" lang="IsWeek" title="<%= Define.Get("ApplicationTimeSetting_是否周末").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_是否周末").HtmlEncode()%></option>            
            <option value="StartTime" lang="StartTime" title="<%= Define.Get("ApplicationTimeSetting_开始时间").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_开始时间").HtmlEncode()%></option>
            <option value="EndTime" lang="EndTime" title="<%= Define.Get("ApplicationTimeSetting_结束时间").ToScriptTag()%>"><%= Define.Get("ApplicationTimeSetting_结束时间").HtmlEncode()%></option>
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
