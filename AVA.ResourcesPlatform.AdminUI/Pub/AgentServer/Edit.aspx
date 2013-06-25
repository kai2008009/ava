<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.AgentServer.Edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
        <%= this.Title %></title>
    <%= Import.Theme() %>
</head>
<body>
    <div id="divMain" class="gContent">
        <div class="gCnta">
            <div class="gCnta-cont">
                <div class="g-title-2">
                    <div class="ico-loading right hidden">
                    </div>
                    <div title="<%= DefineEnum.点击查看帮助.Define().ToScriptTag() %>" class="ico-question right">
                    </div>
                    <h3 class="txt-14">
                        <%= Title %></h3>
                    <span class="txt-info">[<a href="#" onclick="GoList();return false;"><%= DefineEnum.返回.Define() %></a>]</span>
                </div>
                <div class="gWel-tab">
                    <div class="tabs txt-link">
                        <ul>
                            <li>转播服务信息 </li>
                            <%
                                //if (Has(this.ViewData["_AgentServer"]))
                                if (true==false)
                                {
                            %>
                            <li>转播服务路数信息 </li>
                            <% 
                                }
                            %>
                        </ul>
                    </div>
                    <div class="pans">
                        <div style="display: none;" class="panel">
                            <div>
                                <form id="frmAgentServer" action="" onsubmit="return false;">
                                <div>
                                    <table class="g-table-cntacomm">
                                        <tr>
                                            <th title="<%= Define.Get("AgentServer_服务器名称").ToScriptTag() %>">
                                                <%= Define.Get("AgentServer_服务器名称").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("Name", this.ViewData["_AgentServer.Name"], 256) { Class = "ipt-t ipt-t-dft width400 " }%>
                                                <%= new HtmlYKTip("Name") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("AgentServer_服务器Web地址").ToScriptTag() %>">
                                                <%= Define.Get("AgentServer_服务器Web地址").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("IPAddress", this.ViewData["_AgentServer.IPAddress"], 256) { Class = "ipt-t ipt-t-dft width400" }%>                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("AgentServer_转播SID").ToScriptTag() %>">
                                                <%= Define.Get("AgentServer_转播SID").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("DBUser", this.ViewData["_AgentServer.DBUser"], 256) { Class = "ipt-t ipt-t-dft width400" }%>
                                                <%= new HtmlYKTip("DBUser") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("AgentServer_IP路由").ToScriptTag() %>">
                                                <%= Define.Get("AgentServer_IP路由").HtmlEncode() %>：
                                            </th>
                                            <td class="tooltip" title="<%= Define.Get("AgentServer_IPRoute_IP路由分配，请用|分隔转换前后IP，多个请用换行分开").ToScriptTag()%>">
                                                <%= new HtmlTextArea("IPRoute", this.ViewData["_AgentServer.IPRoute"], 512) { Class = "ipt-t ipt-t-dft width400 height100"}%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                                </div>
                                <table class="g-table-cntacomm">
                                    <tr>
                                        <th></th>
                                        <td>
                                            <%= new HtmlHidden("KEY", KEY)%>
                                            <%= new HtmlSubmit("Send", "Edit", GetSubmitMothed(this.ViewData["_AgentServer"])) { Class = "hidden" }%>
                                            <div onclick="$(this).siblings(':submit')[0].click();" class="btn btn-dft btn-dft-impt">
                                                <span>
                                                    <%= GetSubmitText(this.ViewData["_AgentServer"])%></span>
                                            </div>
                                            <div title="" onclick="GoList();" class="btn btn-dft">
                                                <span>
                                                    <%= DefineEnum.返_回.Define() %></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                        </div>
                        <%
                            //if (Has(this.ViewData["_AgentServer"]))
                            if (true == false)
                            {
                        %>
                        <div style="display: none;" class="panel">
                            <div id="divAgentServerConfigs">
                                正在加载数据
                            </div>
                        </div>
                        <% 
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%= Import.Script("/jquery-1.44.min.js")%>
<%= Import.Script("js","/JQueryUI/jquery-ui-1.8.9.custom.min.js")%>
<%= Import.Script("js", "/XhEditor/xheditor-zh-cn.min.js")%>
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
<%= Import.Script("/global.aspx")%>
<%= Import.Script("/SelectForm.js")%>
<%= Import.Script("js", "/global.js")%>
<%= Import.Script("js", "/Public.js")%>
<%= Import.Script("js", "/ListPublic.js")%>
<%= Import.Script("js", "/Ajax/Pub/AgentServerAjax.js")%>
<script type="text/javascript">
    //验证方法
    //验证控件
    $.validator.initConfig({ validatorGroup: "Edit", form: "#frmAgentServer" });
    //服务器名称
    $("#frmAgentServer [name=Name]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("AgentServer_Name_请输入服务器名称").ToScriptChar() %>"
    }
    });
    //服务器IP
    $("#frmAgentServer [name=IPAddress]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("AgentServer_IPAddress_请输入服务器Web地址").ToScriptChar() %>"
    }
    });
    //数据库用户
    $("#frmAgentServer [name=DBUser]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("AgentServer_DBUser_请输入转播SID").ToScriptChar() %>"
    }
    });
</script>
<script type="text/javascript">
    //页面调用AJAX方法
    //添加
    function Insert(send) {
        AgentServerAjax.Insert($("#frmAgentServer"), send, function (json) {
            document.getElementById("frmAgentServer").KEY.value = json.Key;
            alert("<%= DefineEnum.添加成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //更新
    function Update(send) {
        AgentServerAjax.Update($("#frmAgentServer"), send, function (json) {
            document.getElementById("frmAgentServer").KEY.value = json.Key;
            alert("<%= DefineEnum.修改成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //删除
    function Delete(send) {
        var key = document.getElementById("frmAgentServer").KEY.value;
        AgentServerAjax.Delete(key, send, function (json) {
            GoList();
        });
    };
</script>
<script type="text/javascript">
    //初始方法
    //以下为图片显示
    //以下为文件下载
</script>
<script type="text/javascript">
    //其他方法
</script>

