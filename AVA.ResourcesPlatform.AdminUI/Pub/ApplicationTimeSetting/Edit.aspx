<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.ApplicationTimeSetting.Edit" %>

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
                <div class="ln-thick ln-c-mid">
                </div>
                <div class="subcontent">
                    <form id="frmApplicationTimeSetting" action="" onsubmit="return false;">
                    <div>
                        <table class="g-table-cntacomm">
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_所属域").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_所属域").HtmlEncode() %>：
                                </th>
                                <td>
                                    <%= new HtmlText("ParentDomain_Name_Code", IN(this.ViewData["_ApplicationTimeSetting"], this.ViewData["_ApplicationTimeSetting.ParentDomain.Name"] + "[" + this.ViewData["_ApplicationTimeSetting.ParentDomain.Code"] + "]")) { ReadOnly = true, Class = "ipt-t ipt-t-dft", OnBlur = "$.validator.itemValid(&quot;#frmApplicationTimeSetting [name=ParentDomain]&quot;,&quot;Edit&quot;);" }%>
                                    <%= new HtmlHidden("ParentDomain", this.ViewData["_ApplicationTimeSetting.ParentDomain.Guid"])%>
                                    <a href="#selectDomain" class="decoration-none" onclick="return SelectDomain('#frmApplicationTimeSetting [name=ParentDomain]','#frmApplicationTimeSetting [name=ParentDomain_Name_Code]')"><span class="txt-info">[<%= DefineEnum.选择.Define() %>]</span></a>
                                    <a href="#clear" class="decoration-none select-clear hidden"><span class="txt-info">[<%= DefineEnum.清空.Define() %>]</span></a>
                                    <%= new HtmlYKTip("ParentDomain") %>
                                </td>
                            </tr>
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_第几节课").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_第几节课").HtmlEncode() %>：
                                </th>
                                <td>
                                    <%= new HtmlText("Chatper", this.ViewData["_ApplicationTimeSetting.Chatper"], 200) { Class = "ipt-t ipt-t-dft " }%>
                                </td>
                            </tr>
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_是否周末").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_是否周末").HtmlEncode() %>：
                                </th>
                                <td>
                                    <%= new HtmlCheckBox("IsWeek", this.ViewData["_ApplicationTimeSetting.IsWeek"], 1, 0) { Class = ""}%>
                                </td>
                            </tr>
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_开始时间").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_开始时间").HtmlEncode() %>：
                                </th>
                                <td>
                                    <%= new HtmlText("StartTime", this.ViewData["_ApplicationTimeSetting.StartTime"].ToDateTimeN().ToTime()) { Class = "ipt-t ipt-t-dft time " }%>
                                    <%= new HtmlYKTip("StartTime") %>
                                </td>
                            </tr>
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_结束时间").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_结束时间").HtmlEncode() %>：
                                </th>
                                <td>
                                    <%= new HtmlText("EndTime", this.ViewData["_ApplicationTimeSetting.EndTime"].ToDateTimeN().ToTime()) { Class = "ipt-t ipt-t-dft time " }%>
                                    <%= new HtmlYKTip("EndTime") %>
                                </td>
                            </tr>
                            <tr>
                                <th title="<%= Define.Get("ApplicationTimeSetting_排序号").ToScriptTag() %>">
                                    <%= Define.Get("ApplicationTimeSetting_排序号")%>：
                                </th>
                                <td class="tooltip" title="<%= Define.Get("ApplicationTimeSetting_SortNumber_标示记录在相同学科的记录中的位置").ToScriptTag()%>">
                                    <%= new HtmlText("SortNumber", this.ViewData["_ApplicationTimeSetting.SortNumber"], 4) { Class = "ipt-t ipt-t-dft ", DefaultValue = 0 }%>
                                    <%= new HtmlYKTip("SortNumber") %>
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                    <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                    </div>
                    <table class="g-table-cntacomm">
                        <tr>
                            <th>
                            </th>
                            <td>
                                <%= new HtmlHidden("KEY", KEY)%>
                                <%= new HtmlSubmit("Send", "Edit", GetSubmitMothed(this.ViewData["_ApplicationTimeSetting"])) { Class = "hidden" }%>
                                <div onclick="$(this).siblings(':submit')[0].click();" class="btn btn-dft btn-dft-impt">
                                    <span>
                                        <%= GetSubmitText(this.ViewData["_ApplicationTimeSetting"])%></span></div>
                                <div title="" onclick="GoList();" class="btn btn-dft">
                                    <span>
                                        <%= DefineEnum.返_回.Define() %></span></div>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
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
<%= Import.Script("js", "/Ajax/Pub/ApplicationTimeSettingAjax.js")%>
<script type="text/javascript">
    //验证方法
    //验证控件
    $.validator.initConfig({ validatorGroup: "Edit", form: "#frmApplicationTimeSetting" });
    //排序号
    $("#frmApplicationTimeSetting [name=SortNumber]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "num1"
        },
        message:
        {
            required: "<%= Define.Get("ApplicationTimeSetting_SortNumber_排序号不能为空").ToScriptChar() %>",
            regex: "<%= Define.Get("ApplicationTimeSetting_SortNumber_排序号应为数字").ToScriptChar() %>"
        }
    });
    //所属域
    $("#frmApplicationTimeSetting [name=ParentDomain]").formValidator({
        targetFocus : "#frmApplicationTimeSetting [name=ParentDomain_Name_Code]",
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("ApplicationTimeSetting_DomainGuid_请选择所属域").ToScriptChar() %>"
        }
    });
    //开始时间
    $("#frmApplicationTimeSetting [name=StartTime]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "time"
        },
        message:
        {
            required: "<%= Define.Get("ApplicationTimeSetting_StartTime_请选择开始时间").ToScriptChar() %>",
            regex: "<%= Define.Get("ApplicationTimeSetting_StartTime_开始时间格式不正确").ToScriptChar() %>"
        }
    });
    //结束时间
    $("#frmApplicationTimeSetting [name=EndTime]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "time"
        },
        message:
        {
            required: "<%= Define.Get("ApplicationTimeSetting_EndTime_请选择结束时间").ToScriptChar() %>",
            regex: "<%= Define.Get("ApplicationTimeSetting_EndTime_结束时间格式不正确").ToScriptChar() %>"
        }
    });
</script>
<script type="text/javascript">
    //页面调用AJAX方法
    //添加
    function Insert(send) {
        ApplicationTimeSettingAjax.Insert($("#frmApplicationTimeSetting"), send, function (json) {
            document.getElementById("frmApplicationTimeSetting").KEY.value = json.Key
            alert("<%= DefineEnum.添加成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //更新
    function Update(send) {
        ApplicationTimeSettingAjax.Update($("#frmApplicationTimeSetting"), send, function (json) {
            document.getElementById("frmApplicationTimeSetting").KEY.value = json.Key
            alert("<%= DefineEnum.修改成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //删除
    function Delete(send) {
        var key = document.getElementById("frmApplicationTimeSetting").KEY.value;
        ApplicationTimeSettingAjax.Delete(key, send, function (json) {
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
</html>
