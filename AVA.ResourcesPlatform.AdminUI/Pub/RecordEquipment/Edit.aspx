<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.RecordEquipment.Edit" %>

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
                            <li>设备信息 </li>
                            <%
                                if (true==false)
                                {
                            %>
                            <li>转播服务信息 </li>
                            <% 
                                }
                            %>
                        </ul>
                    </div>
                    <div class="pans">
                        <div style="display: none;" class="panel">
                            <div>
                                <form id="frmRecordEquipment" action="" onsubmit="return false;">
                                <div>
                                    <table class="g-table-cntacomm">
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_所属域").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_所属域").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("ParentDomain_Name_Code", IN(this.ViewData["_RecordEquipment"], this.ViewData["_RecordEquipment.ParentDomain.Name"] + "[" + this.ViewData["_RecordEquipment.ParentDomain.Code"] + "]")) { ReadOnly = true, Class = "ipt-t ipt-t-dft", OnBlur = "$.validator.itemValid(&quot;#frmRecordEquipment [name=ParentDomain]&quot;,&quot;Edit&quot;);" }%>
                                                <%= new HtmlHidden("ParentDomain", this.ViewData["_RecordEquipment.ParentDomain.Guid"])%>
                                                <a href="#selectDomain" class="decoration-none" onclick="return SelectDomain('#frmRecordEquipment [name=ParentDomain]','#frmRecordEquipment [name=ParentDomain_Name_Code]')"><span class="txt-info">[<%= DefineEnum.选择.Define() %>]</span></a><a href="#clear" class="decoration-none select-clear hidden"><span class="txt-info">[<%= DefineEnum.清空.Define() %>]</span></a>
                                                <%= new HtmlYKTip("ParentDomain") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_设备名称").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_设备名称").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("Name", this.ViewData["_RecordEquipment.Name"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                                <%= new HtmlYKTip("Name") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_IP地址").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_IP地址").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("IPAddress", this.ViewData["_RecordEquipment.IPAddress"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                                <div title="" onclick="PingService();" class="btn btn-dft">
                                                    <span id="PingServiceIPAddress">测试录播设备是否连接正常</span>
                                                </div>
                                                <%= new HtmlYKTip("IPAddress") %>
                                                <script type="text/javascript">
                                                    function PingService()
                                                    {
                                                        var ip = $("#frmRecordEquipment [name=IPAddress]").val().trim();
                                                        if(ip==""||ip==null)
                                                        {
                                                            alert("请输入录播设备IP");
                                                            return;
                                                        }
                                                        $.ajax(
                                                        {
                                                            cache: false,
                                                            type: "POST",
                                                            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.HelperAjax.PingService",
                                                            data: "ip=" + encodeURIComponent(ip),
                                                            async: true,
                                                            dataType: 'json',
                                                            success: function (result) {
                                                                $("#PingServiceIPAddress").html("测试录播设备是否连接正常");
                                                                if(result=="1")
                                                                {
                                                                    alert("录播设备连接成功");
                                                                }
                                                                else if(result=="0")
                                                                {
                                                                    alert("录播设备连接失败");
                                                                }
                                                                else
                                                                {
                                                                    alert(result);
                                                                }
                                                            },
                                                            beforeSend: function () {
                                                                $("#PingServiceIPAddress").html("正在测试...");
                                                            },
                                                            complete: function () {
                                                            },
                                                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                                                $("#PingServiceIPAddress").html("测试录播设备是否连接正常");
                                                                var message = XMLHttpRequest.responseText;
                                                                Global.Error(message);
                                                            }
                                                        });
                                                    }
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_Web端口").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_Web端口").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("WebPort", this.ViewData["_RecordEquipment.WebPort"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_节目ID").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_节目ID").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("ProgramID", this.ViewData["_RecordEquipment.ProgramID"]) { Class = "ipt-t ipt-t-dft " }%>
                                                <%= new HtmlYKTip("ProgramID") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_录播端口号").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_录播端口号").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("RecordPort", this.ViewData["_RecordEquipment.RecordPort"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_登录名").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_登录名").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("LoginName", this.ViewData["_RecordEquipment.LoginName"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_登录密码").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_登录密码").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("Password", this.ViewData["_RecordEquipment.Password"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_直播登录名").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_直播登录名").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("LoginNameView", this.ViewData["_RecordEquipment.LoginNameView"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_直播登录密码").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_直播登录密码").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlText("PasswordView", this.ViewData["_RecordEquipment.PasswordView"], 256) { Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_是否录制Video1").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_是否录制Video1").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlCheckBox("RecordVideo1", this.ViewData["_RecordEquipment.RecordVideo1"], true, false) { Class = ""}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_是否录制Video2").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_是否录制Video2").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlCheckBox("RecordVideo2", this.ViewData["_RecordEquipment.RecordVideo2"], true, false) { Class = ""}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_自动录制").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_自动录制").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlCheckBox("AutoRecord", this.ViewData["_RecordEquipment.AutoRecord"], true, false) { Class = ""}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_停止录制不停止直播").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_停止录制不停止直播").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlCheckBox("UnStopLiveOnRecord", this.ViewData["_RecordEquipment.UnStopLiveOnRecord"], true, false) { Class = ""}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_IP路由").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_IP路由").HtmlEncode() %>：
                                            </th>
                                            <td class="tooltip" title="<%= Define.Get("RecordEquipment_IPRoute_IP路由分配，请用|分隔转换前后IP，多个请用换行分开").ToScriptTag()%>">
                                                <%= new HtmlTextArea("IPRoute", this.ViewData["_RecordEquipment.IPRoute"], 512) { Class = "ipt-t ipt-t-dft width400 height100"}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_所属转播服务").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_所属转播服务").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlSelect("ParentAgentServer", "Name", "Guid", "Guid") { Option = CreateInstance.AgentServerDao.GetAll(), DefaultSelectValue= this.ViewData["_RecordEquipment.ParentAgentServer.Guid"] }.InsertOption("::请选择::","",0)%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>视频启动转换编码： </th>
                                            <td>
                                                <%= new HtmlCheckBox("ASHas", this.ViewData["_RecordEquipment.ASHas"], true, false) { Class = ""}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>视频宽： </th>
                                            <td>
                                                <%= new HtmlText("AVAAgentPort", this.ViewData["_RecordEquipment.AVAAgentPort"]) { DefaultValue="640", Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>视频高： </th>
                                            <td>
                                                <%= new HtmlText("MMSAgentPort", this.ViewData["_RecordEquipment.MMSAgentPort"]) { DefaultValue="480", Class = "ipt-t ipt-t-dft " }%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>视频码流率： </th>
                                            <td>
                                                <%= new HtmlText("AVAMaxClientNum", this.ViewData["_RecordEquipment.AVAMaxClientNum"]) { DefaultValue="500000", Class = "ipt-t ipt-t-dft " }%>
                                                视频码流率 = 码流K * 1000；如512K码流=512*1024= 512000；如2M码流=2048*1000= 2048000；
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>视频帧率： </th>
                                            <td>
                                                <%= new HtmlText("MMSMaxClientNum", this.ViewData["_RecordEquipment.MMSMaxClientNum"]) { DefaultValue="25",  Class = "ipt-t ipt-t-dft " }%>
                                                设置要小于或等于原帧率，取值小于或等于30，超过无效。
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_描述").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_描述").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlTextArea("Description", this.ViewData["_RecordEquipment.Description"], 2000) { Class = "ipt-t ipt-t-dft width400 height100"}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_排序号").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_排序号")%>： </th>
                                            <td class="tooltip" title="<%= Define.Get("RecordEquipment_SortNumber_标示记录在相同学科的记录中的位置").ToScriptTag()%>">
                                                <%= new HtmlText("SortNumber", this.ViewData["_RecordEquipment.SortNumber"], 4) { Class = "ipt-t ipt-t-dft ", DefaultValue = 0 }%>
                                                <%= new HtmlYKTip("SortNumber") %>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                                </div>
                                <table class="g-table-cntacomm">
                                    <tr>
                                        <th title="<%= Define.Get("RecordEquipment_状态").ToScriptTag() %>">
                                            <%= Define.Get("RecordEquipment_状态")%>： </th>
                                        <td class="tooltip" title="<%= Define.Get("RecordEquipment_Status_标示记录是否有效").ToScriptTag()%>">
                                            <%= new HtmlCheckBox("Status", this.ViewData["_RecordEquipment.Status"], 1, 0) { DefaultChecked = 0 }%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>
                                            <%= new HtmlHidden("KEY", KEY)%>
                                            <%= new HtmlSubmit("Send", "Edit", GetSubmitMothed(this.ViewData["_RecordEquipment"])) { Class = "hidden" }%>
                                            <div onclick="$(this).siblings(':submit')[0].click();" class="btn btn-dft btn-dft-impt">
                                                <span>
                                                    <%= GetSubmitText(this.ViewData["_RecordEquipment"])%></span>
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
                        <div style="display: none;" class="panel">
                            <div>
                                <form id="frmRecordEquipmentAgentServer" action="" onsubmit="return false;">
                                <div>
                                    <table class="g-table-cntacomm">
                                        <tr>
                                            <th title="<%= Define.Get("RecordEquipment_转播重编码").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_转播重编码").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlCheckBox("ASHas", this.ViewData["_RecordEquipment.ASHas"], true, false) { Class = "", OnChange="SwitchASHas();"}%>
                                            </td>
                                        </tr>
                                        <tr class="ASHas" title="">
                                            <th title="<%= Define.Get("RecordEquipment_所属转播服务").ToScriptTag() %>">
                                                <%= Define.Get("RecordEquipment_所属转播服务").HtmlEncode() %>： </th>
                                            <td>
                                                <%= new HtmlSelect("ParentAgentServer", "Name", "Guid", "Guid") { Option = CreateInstance.AgentServerDao.GetAll(), OnChange="SelectASData();", DefaultSelectValue= this.ViewData["_RecordEquipment.ParentAgentServer.Guid"] }.AddOption("::请选择::","")%>
                                                <%= new HtmlHidden("ASAgentID", this.ViewData["_RecordEquipment.ASAgentID"]) %>
                                            </td>
                                        </tr>
                                    </table>
                                    <div id="divAgentServerConfigs" style="display: none;">
                                        正在加载数据
                                    </div>
                                </div>
                                <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                                </div>
                                <table class="g-table-cntacomm">
                                    <tr>
                                        <th></th>
                                        <td>
                                            <%= new HtmlHidden("KEY", KEY)%>
                                            <%= new HtmlSubmit("Send", "Edit", "UpdateAS(this)") { Class = "hidden" }%>
                                            <div onclick="$(this).siblings(':submit')[0].click();" class="btn btn-dft btn-dft-impt">
                                                <span>更新转播 </span>
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
                    </div>
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
<%= Import.Script("js", "/Ajax/Pub/RecordEquipmentAjax.js")%>
<script type="text/javascript">
    //验证方法
    //验证控件
    $.validator.initConfig({ validatorGroup: "Edit", form: "#frmRecordEquipment" });
    //排序号
    $("#frmRecordEquipment [name=SortNumber]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "num1"
        },
        message:
        {
            required: "<%= Define.Get("RecordEquipment_SortNumber_排序号不能为空").ToScriptChar() %>",
        regex: "<%= Define.Get("RecordEquipment_SortNumber_排序号应为数字").ToScriptChar() %>"
    }
    });
    //所属域
    $("#frmRecordEquipment [name=ParentDomain]").formValidator({
        targetFocus : "#frmRecordEquipment [name=ParentDomain_Name_Code]",
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("RecordEquipment_DomainGuid_请选择所属域").ToScriptChar() %>"
    }
    });
    //设备名称
    $("#frmRecordEquipment [name=Name]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("RecordEquipment_Name_请输入设备名称").ToScriptChar() %>"
    }
    });
    //节目ID
    $("#frmRecordEquipment [name=ProgramID]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "num1"
        },
        message:
        {
            required: "<%= Define.Get("RecordEquipment_ProgramID_节目ID不能为空").ToScriptChar() %>",
        regex: "<%= Define.Get("RecordEquipment_ProgramID_节目ID应为数字").ToScriptChar() %>"
    }
    });
</script>
<script type="text/javascript">
    //页面调用AJAX方法
    //添加
    function Insert(send) {
        RecordEquipmentAjax.Insert($("#frmRecordEquipment"), send, function (json) {
            document.getElementById("frmRecordEquipment").KEY.value = json.Key
            alert("<%= DefineEnum.添加成功.Define().ToScriptChar() %>,如当前录播有转播服务，请在转播服务选项卡中填写。");
            window.location.href = "Edit.aspx?Guid=" + json.Data;
        });
    };
    //更新
    function Update(send) {
        RecordEquipmentAjax.Update($("#frmRecordEquipment"), send, function (json) {
            document.getElementById("frmRecordEquipment").KEY.value = json.Key
            alert("<%= DefineEnum.修改成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //删除
    function Delete(send) {
        var key = document.getElementById("frmRecordEquipment").KEY.value;
        RecordEquipmentAjax.Delete(key, send, function (json) {
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
    function SwitchASHas() {
        if ($("#frmRecordEquipmentAgentServer [Name=ASHas]").attr("checked") == true) {
            $(".ASHas").show();
            var parentAgentServer = $("#frmRecordEquipmentAgentServer [Name=ParentAgentServer]").val();
            var asAgentID = $("#frmRecordEquipmentAgentServer [Name=ASAgentID]").val();
            if (parentAgentServer != "" && asAgentID != "") {
                //有数据进行添加
                SelectASData();
            }
        }
        else {
            $(".ASHas").hide();
            $("#frmRecordEquipmentAgentServer [Name=ParentAgentServer]").val("");
            $("#frmRecordEquipmentAgentServer [Name=ASAgentID]").val("");
            $("#divAgentServerConfigs").html("");
        }
    }
    SwitchASHas();

    function SelectASData() {
        if ($("#frmRecordEquipmentAgentServer [Name=ASHas]").attr("checked") == true) {
            var parentAgentServer = $("#frmRecordEquipmentAgentServer [Name=ParentAgentServer]").val();
            var asAgentID = $("#frmRecordEquipmentAgentServer [Name=ASAgentID]").val();
            if (parentAgentServer != "") {
                Global.HtmlControl(
                "Pub/RecordEquipment/AgentServerConfigs",
                "Guid=" + parentAgentServer + "&AgentID=" + asAgentID,
                null,
                function (result) {
                    $("#divAgentServerConfigs").html(result.Html);
                    $("#divAgentServerConfigs").show();
                },
                null,
                null);
            }
            else {
                $("#divAgentServerConfigs").html("");
                $("#divAgentServerConfigs").hide();
            }
        }
    }

    function ChangeASAgent(asAgentID) {
        $("#frmRecordEquipmentAgentServer [Name=ASAgentID]").val(asAgentID);
        SelectASData();
    }


    //更新
    function UpdateAS(send) {
        RecordEquipmentAjax.UpdateAS($("#frmRecordEquipmentAgentServer"), send, function (json) {
            document.getElementById("frmRecordEquipmentAgentServer").KEY.value = json.Key
            alert("转播设置成功");
            GoList();
        });
    };
</script>
</html>
