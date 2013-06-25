<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryParameter.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.QueryParameter" %>
<%
    switch (this.Key)
    {
        case "Version":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "Version")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._int)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "SortNumber":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "SortNumber")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._int)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "_Domain.Name":
        %>
<%= new HtmlHidden("$TableAlias","_Domain")%>
<%= new HtmlHidden("$Field", "Name")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._string)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "_Domain.Code":
        %>
<%= new HtmlHidden("$TableAlias","_Domain")%>
<%= new HtmlHidden("$Field", "Code")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._string)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "IsWeek":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "IsWeek")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._int)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "Chatper":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "string")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._string)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "StartTime":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "StartTime")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._DateTime)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
        case "EndTime":
        %>
<%= new HtmlHidden("$TableAlias","_Alias")%>
<%= new HtmlHidden("$Field", "EndTime")%>
<%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._DateTime)%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
        <%
        break;
            default:
%>
<%= new HtmlHidden("$TableAlias","")%>
<%= new HtmlHidden("$Field", "")%>
<%= new HtmlHidden("$FieldType", "")%>
<%= new HtmlHidden("$ExpressionKey", null)%>
<%= new HtmlHidden("$IgnoreEmpty", "0")%>
<%
        break;
    }
%>