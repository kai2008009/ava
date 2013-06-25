<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MySubjectParticipate.ascx.cs" Inherits="AVA.ResourcesPlatform.WebUI.Control.My.MySubjectParticipate" %>
<div class="well">
<div class="p_title">
    <span class="title">我的专题：</span> 我参加的<%= this.ListSubjectUser.Count  %>个专题
</div>
<div class="dataControl box">
    <form id="frmSubjectUserSearch" method="post" action="<%= WebUrl.Proxy() %>">
    专题名称：
    <%= new HtmlText("Name", this.Name) { Width = 120 }%>
    日期从
    <%= new HtmlText("BeginTime", this.BeginTime.ToLongDate()) { Width = 80 }%>
    至
    <%= new HtmlText("EndTime", this.EndTime.ToLongDate()) { Width = 80 }%>
    <%= new HtmlHidden("Key","MySubjectParticipate") %>
    <%= new HtmlSubmit("查询") %>
    <%= new HtmlButton("删除", "SubjectUserBatchDelete(this);")%>
    </form>
    <script type="text/javascript">
        $(function () {
            $("#frmSubjectUserSearch [name=BeginTime]").datetimepicker({
                //maxDate: new Date($("#frmSubjectUserSearch [name=EndTime]").val()),
                onClose: function () {
                    $("#frmSubjectUserSearch [name=EndTime]").datetimepicker("option", "minDate", new Date(this.value));
                }
            });
            $("#frmSubjectUserSearch [name=EndTime]").datetimepicker({
                //minDate: new Date($("#frmSubjectUserSearch [name=BeginTime]").val()),
                onClose: function () {
                    $("#frmSubjectUserSearch [name=BeginTime]").datetimepicker("option", "maxDate", new Date(this.value));
                }
            });
        });
    </script>
    <script type="text/javascript">
        //批量删除
        function SubjectUserBatchDelete(send) {
            var items = $("#MySubjectUserData .trsel:checked");
            var key = "";
            for (var i = 0; i <= items.length - 1; i++) {
                key += "pkid=" + encodeURIComponent(items[i].value);
                if (i != items.length - 1) {
                    key += "&";
                }
            }
            if (key != "") {
                if (confirm("确认删除勾选的专题吗？") == true) {
                    $.ajax(
                    {
                        cache: false,
                        type: "POST",
                        url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectUserBatchDelete",
                        data: key,
                        async: true,
                        dataType: 'json',
                        success: function (result) {
                            $(send).val("删除");
                            alert("专题文件删除成功")
                            Global.Disabled(send, false);
                            $("#frmSubjectUserSearch").submit();
                        },
                        beforeSend: function () {
                            $(send).val("提交删除...");
                            Global.Disabled(send, true);
                        },
                        complete: function () {
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            $(send).val("删除");
                            Global.Disabled(send, false);
                            var message = XMLHttpRequest.responseText;
                            Global.Error(message);
                        }
                    });
                }
            }
            else {
                alert("请勾选要删除的专题！");
            }
        };

        //批量删除
        function SubjectUserDelete(send, pkid) {
            if (confirm("确认删除当前专题吗？") == true) {
                $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectUserDelete",
                    data: "key=" + pkid,
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        $(send).html("删除");
                        alert("专题文件删除成功")
                        Global.Disabled(send, false);
                        $("#frmSubjectUserSearch").submit();
                    },
                    beforeSend: function () {
                        $(send).html("删除中");
                        Global.Disabled(send, true);
                    },
                    complete: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $(send).html("删除");
                        Global.Disabled(send, false);
                        var message = XMLHttpRequest.responseText;
                        Global.Error(message);
                    }
                });
            }
        };

        //更改状态
        function SubjectChangeStatusClient(send, pkid) {
            if (confirm("确认更新当前专题状态吗?") == true) {
                $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectChangeStatus",
                    data: "key=" + pkid + "&Status=" + $(send).val(),
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        alert("专题状态更改成功")
                        send.lang = send.value;
                        Global.Disabled(send, false);
                    },
                    beforeSend: function () {
                        Global.Disabled(send, true);
                    },
                    complete: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Global.Disabled(send, false);
                        send.value = send.lang;
                        var message = XMLHttpRequest.responseText;
                        Global.Error(message);
                    }
                });
            }
            else {
                send.value = send.lang;
            }
        };
        //更改确认状态
        function SubjectUserConfirmInClient(send, pkid) {
            if (confirm("确认参与当前专题?")) {
                var remark = window.prompt("请输入确认备注:", "");
                $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectUserConfirm",
                    data: "key=" + pkid + "&ConfirmRemark=" + encodeURIComponent(remark) + "&ConfirmStatus=1",
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        alert("已更新确认状态")
                        $("#Status" + pkid).val("");
                        $("#ConfirmStatus" + pkid).html("已确认");
                        Global.Disabled(send, false);
                    },
                    beforeSend: function () {
                        Global.Disabled(send, true);
                    },
                    complete: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Global.Disabled(send, false);
                        $(send).val($("#Status" + pkid).val());
                        var message = XMLHttpRequest.responseText;
                        Global.Error(message);
                    }
                });
            }
        };

        //更改不参与状态
        function SubjectUserConfirmOutClient(send, pkid) {
            if (confirm("确认不参与当前专题?")) {
                var remark = window.prompt("请输入不参与备注:", "");
                $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectUserConfirm",
                    data: "key=" + pkid + "&ConfirmRemark=" + encodeURIComponent(remark) + "&ConfirmStatus=2",
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        alert("已更新不参与状态")
                        $("#Status" + pkid).val($(send).val());
                        $("#ConfirmStatus" + pkid).html("不参与");
                        Global.Disabled(send, false);
                    },
                    beforeSend: function () {
                        Global.Disabled(send, true);
                    },
                    complete: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Global.Disabled(send, false);
                        $(send).val($("#Status" + pkid).val());
                        var message = XMLHttpRequest.responseText;
                        Global.Error(message);
                    }
                });
            }
        };

        //签到
        function SubjectUserSignClient(send, pkid) {
            if (confirm("确认进入当前专题?")) {
                var remark = window.prompt("请输入进入备注:", "");
                $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectUserSign",
                    data: "key=" + pkid + "&SignInRemark=" + encodeURIComponent(remark),
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        $("#Status" + pkid).val($(send).val());
                        $("#ConfirmStatus" + pkid).html("已确认");
                        $("#SignInStatus" + pkid).html("已签到");
                        Global.Disabled(send, false);
                        alert("专题签到成功，点击\"确定\"进入专题，如浏览器屏蔽了弹出窗口，请将浏览器设置为允许当前网页弹出窗口后再重新点击\"进入专题\"");
                        window.open(result);
                    },
                    beforeSend: function () {
                        Global.Disabled(send, true);
                    },
                    complete: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Global.Disabled(send, false);
                        $(send).val($("#Status" + pkid).val());
                        var message = XMLHttpRequest.responseText;
                        Global.Error(message);
                    }
                });
            }
        };
    </script>
</div>
<div id="MySubjectUserData" class="data">
    <table cellspacing="0" cellpadding="0" width="100%">
        <tbody>
            <tr id="dataHead" class="dataHead">
                <td valign="middle" class="sel" style="width: 20px;">
                    <input type="checkbox" class="trselall" />
                </td>
                <td valign="middle">
                    专题
                </td>
                <td valign="middle">
                    
                </td>
                <td valign="middle" class="disabled">
                    用户
                </td>
                <td valign="middle" class="disabled">
                    专题时间
                </td>
                <td valign="middle" class="disabled">
                    最后申请时间
                </td>
                <td valign="middle" class="disabled" style="width: 60px;">
                    操作
                </td>
            </tr>
            <!--注意 数据行 第一行 和 最后一行 有样式  请加判断添加 当只有一行时 class="firstLine lastLine"-->
            <%
                for (int i = 0; i <= this.ListSubjectUser.Count - 1; i++)
                {
                    var subject = this.ListSubjectUser[i].ParentSubject;
                    var subjectUser = this.ListSubjectUser[i];
            %>
            <tr class='<%= i == 0 ? "firstLine" : ""  %> <%= i == this.ListSubjectUser.Count - 1 ? "lastLine" : ""  %>'>
                <td class="sel">
                    <%= new HtmlCheckBox() { Value = SetKey(subjectUser.Guid, subjectUser.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
                </td>
                <td class="v">
                    <ul>
                        <li>
                            <%= new HtmlAnchor(
                                new HtmlImg(SettingGroup.SubjectCover(subject), subject.Name) { Width=100, Height=62, OnErrorImg=SettingGroup.DefaultImg}
                                ) { Href = WebUrl.SubjectView(subject.Guid), Target = "_blank", Title = subject.Name }%>
                        </li>
                    </ul>
                </td>
                <td>
                     <p>
                                <%= new HtmlAnchor(subject.Name) { Href = WebUrl.SubjectView(subject.Guid), Target = "_blank" }%>
                                <br />
                                <%
                                    var classExamine = "";
                                    if (subject.Examine == (int)AVA.ResourcesPlatform.Model.Pub.SubjectExamineEnum.审核通过)
                                    {
                                        classExamine = "pass";
                                    }
                                    else if (subject.Examine == (int)AVA.ResourcesPlatform.Model.Pub.SubjectExamineEnum.审核不通过)
                                    { }
                                    else
                                    {
                                        classExamine = "";
                                    }
                                %>
                                <span class="<%=classExamine  %>">
                                    <nobr>
                        <%= ((AVA.ResourcesPlatform.Model.Pub.SubjectExamineEnum)subject.Examine).Define() %>
                        <%= ((AVA.ResourcesPlatform.Model.Pub.SubjectStatusEnum)subject.Status).Define() %>
                        </nobr>
                                </span>
                                <%
                                    if (subject.Lock == (int)AVA.ResourcesPlatform.Model.Pub.SubjectLockEnum.锁定)
                                    {
                                %>
                                <%= new HtmlSpan("锁定") { Title = subject.ParentLockUser.UserName + " " + subject.LockDateTime + " " + subject.LockDescription }.Style(new { Color = "Red" })%>
                                <% 
                                    }
                                %>
                                <%
                                    if (subject.ShareUpload == (int)AVA.ResourcesPlatform.Model.Pub.SubjectShareUploadEnum.是)
                                    {
                                %>
                                <br />
                                公开上传
                                <% 
                                    }
                    
                                %>
                                <br />
                                播放：<%= subject.VideoView%>
                                评论：<%= subject.CommentCount%>
                            </p>
                </td>
                <td>
                    <%= subjectUser.ParentUser.ParentUserType.ParentDomain.Name %>
                    <br />
                    <%= new HtmlAnchor(subjectUser.ParentUser.TrueName) { Href=WebUrl.Show(subject.ParentUser.ParentUserType.ParentDomain.Code,subject.ParentUser.UserName) }%>
                    (
                    <%= new HtmlAnchor(subjectUser.ParentUser.UserName) { Href = WebUrl.Show(subject.ParentUser.ParentUserType.ParentDomain.Code, subject.ParentUser.UserName) }%>
                    )
                </td>
                <td>
                    <%= subject.BeginTime.ToLongDate() %>
                    <br />
                    至
                    <br />
                    <%= subject.EndTime.ToLongDate() %>
                </td>
                <td>
                    <%= subject.CutoffTime.ToLongDate() %>
                </td>
                <td>
                    <%
                        if (subject.ShareUpload == (int)AVA.ResourcesPlatform.Model.Pub.SubjectShareUploadEnum.是)
                        {
                    %>
                    <%= new HtmlAnchor("我的视频") { Href = WebUrl.MySubjectUserVideo(subject.Guid) }%>
                    <br />
                    <%= new HtmlAnchor("我的专辑") { Href = WebUrl.MySubjectUserAlbum(subject.Guid) }%>
                    <br />
                    <%
                    if (SettingGroup.HasMeeting == true)
                    {
                    %>
                    <%= new HtmlAnchor("我的教研") { Href = WebUrl.MySubjectUserMeeting(subject.Guid) }%>
                    <br />
                    <%
                    }
                    %>
                    <%= new HtmlAnchor("我的直播") { Href = WebUrl.MySubjectUserApplication(subject.Guid) }%>
                    <% 
                        }
                    %>
                </td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $("#MySubjectUserData .trselall").click(function () {
        if (this.checked == true) {
            $("#MySubjectUserData .trsel").attr("checked", "checked");
        }
        else {
            $("#MySubjectUserData .trsel").removeAttr("checked");
        }
    })
    function SelectMySubjectUserAll() {
        var bool = $("#MySubjectUserData .trselall").attr("checked");
        bool = !bool;
        if (bool == true) {
            $("#MySubjectUserData .trsel").attr("checked", "checked");
            $("#MySubjectUserData .trselall").attr("checked", "checked");
        }
        else {
            $("#MySubjectUserData .trsel").removeAttr("checked");
            $("#MySubjectUserData .trselall").removeAttr("checked");
        }
    }
</script>
<div>
     <a onclick="SelectMySubjectUserAll(); return false;" href="#">全选 - 取消</a>
</div>
    <%= new PagerAjaxInstance(this) { RecordCount = this.Query.RecordCount, PageRecordSize = this.Query.PageSize, PageIndex = this.Query.PageIndex, PageJsFn = WebUrl.MySubjectParticipate(int.MaxValue, this.Name, this.BeginTime.ToString(null), this.EndTime.ToString(null)) }.ToHtml()%>

    </div>