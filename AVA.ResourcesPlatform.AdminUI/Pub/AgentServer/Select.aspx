<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Select.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.Select" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
        <%= this.Title %></title>
    <%= Import.Theme() %>
</head>
<body>
    <div id="divMain" class="gContent">
        <div class="gIbx">
            <div class="mContent">
                <div id="dvToolbar_inbox" class="g-toolbar">
                    <div class="btngrp">
                        <div style="margin-top: 5px;">
                            <form id="frmSearch" action="" onsubmit="return false;">
                            <%# Define.Get("AgentServer_服务器名称").HtmlEncode() %>：
                            <%= new HtmlHidden("$LeftParenthesis", (int)Z.Core.NHibernateCore.Search.QueryParenthesisEnum.None)%>
                            <%= new HtmlHidden("$TableAlias", "_Alias")%>
                            <%= new HtmlHidden("$Field", "Name")%>
                            <%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._string)%>
                            <%= new HtmlHidden("$ExpressionKey", null)%>
                            <%= new HtmlHidden("$QueryType", (int)Z.Core.NHibernateCore.Search.QueryTypeEnum.Like)%>
                            <%= new HtmlText("$FieldValue", null) { Width = 80 }%>
                            <%= new HtmlHidden("$RightParenthesis", (int)Z.Core.NHibernateCore.Search.QueryParenthesisEnum.None)%>
                            <%= new HtmlHidden("$LogicType", (int)Z.Core.NHibernateCore.Search.LogicTypeEnum.AND)%>
                            <%= new HtmlHidden("$IgnoreEmpty", "1")%>
                            <%# Define.Get("AgentServer_服务器Web地址").HtmlEncode() %>：
                            <%= new HtmlHidden("$LeftParenthesis", (int)Z.Core.NHibernateCore.Search.QueryParenthesisEnum.None)%>
                            <%= new HtmlHidden("$TableAlias", "_Alias")%>
                            <%= new HtmlHidden("$Field", "IPAddress")%>
                            <%= new HtmlHidden("$FieldType", (int)Z.Core.NHibernateCore.Search.FieldTypeEnum._string)%>
                            <%= new HtmlHidden("$ExpressionKey", null)%>
                            <%= new HtmlHidden("$QueryType", (int)Z.Core.NHibernateCore.Search.QueryTypeEnum.Like)%>
                            <%= new HtmlText("$FieldValue", null) { Width = 80 }%>
                            <%= new HtmlHidden("$RightParenthesis", (int)Z.Core.NHibernateCore.Search.QueryParenthesisEnum.None)%>
                            <%= new HtmlHidden("$LogicType", (int)Z.Core.NHibernateCore.Search.LogicTypeEnum.AND)%>
                            <%= new HtmlHidden("$IgnoreEmpty", "1")%>
                            <%= new HtmlSubmit(null, null) { OnClick = "GoSearch(this);" }.Style(new { Display = "none" })%>
                            </form>
                            <form id="frmQuery" action="" onsubmit="return false;">
                            <%= new HtmlHidden("PageIndex", "1") %>
                            <%= new HtmlHidden("PageSize", SettingGroup.ManagerDefine.ListCount)%>
                            <%= new HtmlHidden("Orders", null)%>
                            <%= new HtmlHidden("", null) { ID = "SearchParameter" }%>
                            </form>
                        </div>
                    </div>
                    <div class="btngrp">
                        <div onclick="GoSearch(this);" class="btn btn-dft btn-dft-gl">
                            <span>
                                <%= DefineEnum.查询.Define() %></span></div>
                        <div title="" onclick="GoAdvancedSearch(this);" class="btn btn-dft btn-dft-gr">
                            <span>
                                <%= DefineEnum.高级查询.Define() %></span></div>
                    </div>
                    <div class="btngrp btngrp-ext">
                        <div title="" onclick="GoColumn()" class="btn btn-dft">
                            <span>
                                <%= DefineEnum.列表项.Define() %></span></div>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div class="ln-thin ln-c-mid">
                </div>
                <div id="dvTitleinbox">
                    <div class="g-title-1">
                        <div class="fn-fle">
                            <h2>
                                <%= Title %>
                            </h2>
                            <span class="txt-info">
                                <%= DefineEnum._总共__strong__span_id____pageRecord____span___strong__.Define() %></span>
                        </div>
                        <div class="title-ext">
                            <a id="pageFirst" hidefocus="true">
                                <%= DefineEnum.首页.Define() %></a> &nbsp; <a id="pagePrev" hidefocus="true">
                                    <%= DefineEnum.上一页.Define()%></a> &nbsp; <a id="pageNext" hidefocus="true">
                                        <%= DefineEnum.下一页.Define()%></a> &nbsp; <a id="pageLast" hidefocus="true">
                                            <%= DefineEnum.末页.Define()%></a> &nbsp;
                            <select id="pageList">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="gIbx-tablayout">
                    <div class="txt-12 listContainer selectDefine" id="list">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both">
    </div>
    <div id="divViewDefine" class="gSys-msg-win" style="display: none; right: 10px; top: 45px;">
        <div class="fn-bgx bg-main-2 hd" style="cursor: default">
            <h4>
                <%= DefineEnum.请打勾选择需要显示在列表上的项.Define() %>
            </h4>
            <a title="<%= DefineEnum.关闭.Define() %>" hidefocus="true" class="fn-bg Aclose" href="#close"
                onclick="this.parentNode.parentNode.style.display='none';return false;">
                <%= DefineEnum.关闭.Define() %></a>
        </div>
        <div class="cont bdr-c-dark">
            <div class="gSys-inner-dict">
                <form id="frmViewDefine" action="" onsubmit="return false;">
                <div class="result bdr-c-mid">
                    <div class="inside">
                        <%= new HtmlHidden("KEY",KEY) %>
                        <ul id="ulViewDefine">
                            <%
                                Type t = typeof(AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.Select1);
                                var list = UserControlDefine.GetListViewDefine(UserCode, t.FullName, AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.Select1.LISTRPT);
                                foreach (var item in list)
                                {   
                            %>
                            <li>
                                <%= new HtmlHidden("Column", item.ColumnName)%>
                                <%= new HtmlCheckBox() { Name = "Sel", Checked = item.Selected, Value=1, UnValue=0, Disabled = item.Require }%>
                                <%= new HtmlHidden() { Name = "Sort", Value=item.SortNumber }%>
                                <%= item.ColumnDescription %>
                            </li>
                            <% 
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <div class="ft bdr-c-dark bg-cont">
                    <div class="sup">
                    </div>
                    <div class="opt">
                        <div onclick="ViewDefine(this);" class="btn btn-dft btn-dft-impt">
                            <span>
                                <%= DefineEnum.保_存.Define() %></span></div>
                        <div onclick="this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display='none';return false;"
                            class="btn btn-dft">
                            <span id="txtMsgBoxOk">
                                <%= DefineEnum.关_闭.Define()  %></span></div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div style="clear: both">
    </div>
    <div id="divSearch" class="gSys-msg-win search" style="display: none; top: 72px; margin: 0 auto;">
        <div id="dvMsgHead" class="fn-bgx bg-main-2 hd">
            <h4>
                <%= DefineEnum.查询选择器.Define() %></h4>
            <a title="<%= DefineEnum.关_闭.Define() %>" hidefocus="true" class="fn-bg Aclose" id="A1"
                href="#close" onclick="this.parentNode.parentNode.style.display='none';return false;">
                <%= DefineEnum.关闭.Define()  %></a>
        </div>
        <div class="cont bdr-c-dark">
            <div class="gSys-inner-dict">
                <form id="frmAdvancedQuery" action="" onsubmit="return false;">
                <div class="result bdr-c-mid">
                    <div class="inside">
                        <div>
                            <table style="width: 100%" cellpadding="0px" cellspacing="0px" class="g-table-comm">
                                <tr class="thead">
                                    <th style="border-left-width: 0px;">
                                        括号
                                    </th>
                                    <th>
                                        字段
                                    </th>
                                    <th>
                                        条件
                                    </th>
                                    <th>
                                        取值
                                    </th>
                                    <th>
                                        括号
                                    </th>
                                    <th>
                                        逻辑
                                    </th>
                                    <th align="left" style="width: 120px; text-align: left;">
                                        <div title="" onclick="AddQueryParameter(this);" class="btn btn-dft">
                                            <span>
                                                <%= DefineEnum.添加.Define() %></span></div>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="ft bdr-c-dark bg-cont">
                    <div class="sup">
                    </div>
                    <div class="opt">
                        <%= new HtmlSubmit("Send", null, "Search(this);") { Class = "hidden" }%>
                        <div title="" onclick="AdvancedSearch(this);" class="btn btn-dft btn-dft-impt">
                            <span>
                                <%= DefineEnum.查_询.Define() %></span></div>
                        <div id="Div2" title="" onclick="this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display='none';return false;"
                            class="btn btn-dft">
                            <span id="Span1">
                                <%= DefineEnum.关_闭.Define() %></span></div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%= Import.Script("/jquery-1.44.min.js")%>
<%= Import.Script("js","/JQueryUI/jquery-ui-1.8.9.custom.min.js")%>
<%= Import.Script("js", "/YK_Validate/YK_Validate.js")%>
<%= Import.Script("js", "/YK_Validate/YK_ValidateRegex.js")%>
<%= Import.CSS("js", "/YK_Validate/validator.css")%>
<%= Import.Script("js","/FancyBox/jquery.fancybox-1.2.1.js")%>
<%= Import.CSS("js", "/FancyBox/jquery.fancybox.css")%>
<%= Import.Script("/ToolTip/jquery.tipsy.js")%>
<%= Import.Script("/URL/jquery.url.js")%>
<%= Import.Script("/JsonCookie/json2.js")%>
<%= Import.Script("/JsonCookie/jquery.cookie.js")%>
<%= Import.Script("/JsonCookie/jquery.jsoncookie.js")%>
<%= Import.Script("/Global.aspx")%>
<%= Import.Script("/SelectForm.js")%>
<%= Import.Script("js", "/Global.js")%>
<%= Import.Script("js", "/Public.js")%>
<%= Import.Script("js", "/ListPublic.js")%>
<%= Import.Script("js", "/Ajax/Pub/AgentServerAjax.js")%>
<%= Import.Script("js", "/Ajax/Sys/ManagerViewDefineAjax.js")%>
<script type="text/javascript">
    //验证方法
</script>
<script type="text/javascript">
    function GetAdvancedQueryParams(send) {
        $("#frmSearch [name=$FieldValue]").val("");
        $("#SearchParameter").val(Global.GetFormValue($("#frmAdvancedQuery")));
        Search();
    }

    function AddQueryParameter(send) {
        Global.HtmlControl("/Pub/AgentServer/QueryParameterContainer", null, send, function (result) {
            $(send).parent().parent().after(result.Html);
        });
    }

    function GetQueryParamter(send) {
        Global.HtmlControl("/Pub/AgentServer/QueryParameter", "Key=" + encodeURIComponent(send.value), send, function (result) {
            $(send).parent().find("div").html(result.Html);
            Global.HtmlControl("/QueryTypeContainer", "Key=" + encodeURIComponent($(send).parent().find("div [name=$FieldType]").val()), send, function (resultFieldType) {
                $(send).parent().parent().find(".queryTypeContainer").html(resultFieldType.Html);
            });
            var dicKey = $(send).find("option:selected").attr("lang");
            if (dicKey != "") {
                Global.HtmlControl("/Pub/AgentServer/QueryParameterDictionary", "Key=" + encodeURIComponent(dicKey), send, function (resultDictionary) {
                    $(send).parent().parent().find(".fieldContainer").html(resultDictionary.Html);
                });
            }
            else {
                $(send).parent().parent().find(".fieldContainer").html("<input type=\"text\" name=\"$FieldValue\" />");
            }
        });
    }

    function DeleteQueryParameter(send) {
        $(send).parent().parent().remove();
    }
</script>
<script type="text/javascript">
    //页面调用AJAX方法
    //查询
    function GoSearch(send) {
        $("#SearchParameter").val(Global.GetFormValue($("#frmSearch")));
        Search(send);
    }
    function AdvancedSearch(send) {
        $("#frmSearch [name=$FieldValue]").val("");
        $("#SearchParameter").val(Global.GetFormValue($("#frmAdvancedQuery")));
        Search();
    }
    function Search(send) {
        $("#divSearch").hide();
        var params = $("#SearchParameter").val();
        if (params != null && params != "") {
            params += "&";
        }
        params += Global.GetFormValue($("#frmQuery"));
        $("#list").html(Global.LodingHtml);
        Global.UserControl("/Pub/AgentServer/Select", params, send, function (result) {
            $("#list").html(result.Html);
            YKPage(result.Data);
            ListInit();
        });
    };
</script>
<script type="text/javascript">
    //初始方法
    var valueControl = "<%= Request.QueryString["valueControl"].ToString("").ToScriptChar() %>";
    var nameControl = "<%= Request.QueryString["nameControl"].ToString("").ToScriptChar() %>";
</script>
<script type="text/javascript">
    //其他方法
</script>