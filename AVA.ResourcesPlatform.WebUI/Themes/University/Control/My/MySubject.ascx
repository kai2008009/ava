<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MySubject.ascx.cs" Inherits="AVA.ResourcesPlatform.WebUI.Control.My.MySubject" %>
<div class="well">
    <div class="p_title">
        <span class="title">我的专题：</span>我的<%= this.Query.RecordCount  %>个专题
    </div>
    <div class="dataControl box">
        <form id="frmSubjectSearch" method="post" action="<%= WebUrl.Proxy() %>">
        名称：
        <%= new HtmlText("Name", this.Name) { Width = 120 }%>
        日期从
        <%= new HtmlText("BeginTime", this.BeginTime.ToShortDate()) { Width = 80 }%>
        至
        <%= new HtmlText("EndTime", this.EndTime.ToShortDate()) { Width = 80 }%>
        <%= new HtmlHidden("Key","MySubject") %>
        <%= new HtmlSubmit("查询") %>
        <%= new HtmlButton("创建专题...", "window.location.href='" + WebUrl.MySubjectAdd() + "';")%>
        <%= new HtmlButton("删除", "SubjectBatchDelete(this);")%>
        </form>
        <script type="text/javascript">
            $(function () {
                $("#frmSubjectSearch [name=BeginTime]").datepicker({
                    maxDate: new Date($("#frmSubjectSearch [name=EndTime]").val()),
                    onClose: function () {
                        $("#frmSubjectSearch [name=EndTime]").datepicker("option", "minDate", new Date(this.value));
                    }
                });
                $("#frmSubjectSearch [name=EndTime]").datepicker({
                    minDate: new Date($("#frmSubjectSearch [name=BeginTime]").val()),
                    onClose: function () {
                        $("#frmSubjectSearch [name=BeginTime]").datepicker("option", "maxDate", new Date(this.value));
                    }
                });
            });
        </script>
        <script type="text/javascript">
            //批量删除
            function SubjectBatchDelete(send) {
                var items = $("#MySubjectData .trsel:checked");
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
                        url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectBatchDelete",
                        data: key,
                        async: true,
                        dataType: 'json',
                        success: function (result) {
                            $(send).val("删除");
                            alert("专题文件删除成功")
                            Global.Disabled(send, false);
                            $("#frmSubjectSearch").submit();
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
            function SubjectDelete(send, pkid) {
                if (confirm("确认删除当前专题吗？") == true) {
                    $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectDelete",
                    data: "key=" + pkid,
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        $(send).html("删除");
                        alert("专题文件删除成功")
                        Global.Disabled(send, false);
                        $("#frmSubjectSearch").submit();
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

            //更改排序号
            function SubjectChangeSortNumberClient(send, pkid) {
                if (send.value != send.lang) {
                    if (confirm("确认更新当前专题排序号吗?") == true) {
                        $.ajax(
                    {
                        cache: false,
                        type: "POST",
                        url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.SubjectChangeSortNumber",
                        data: "key=" + pkid + "&SortNumber=" + encodeURIComponent($(send).val()),
                        async: true,
                        dataType: 'json',
                        success: function (result) {
                            alert("专题排序号更新成功")
                            Global.Disabled(send, false);
                            $("#frmSubjectSearch").submit();
                        },
                        beforeSend: function () {
                            Global.Disabled(send, true);
                        },
                        complete: function () {
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            send.value = send.lang;
                            Global.Disabled(send, false);
                            var message = XMLHttpRequest.responseText;
                            Global.Error(message);
                        }
                    });
                    }
                    else {
                        send.value = send.lang;
                    }
                }
            };
        </script>
    </div>
    <div id="MySubjectData" class="data">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tbody>
                <tr id="dataHead" class="dataHead">
                    <td valign="middle" class="sel" style="width: 20px;">
                        <input type="checkbox" class="trselall" />
                    </td>
                    <td valign="middle">专题 </td>
                    <td valign="middle">名称</td>
                    <td valign="middle" class="disabled">状态 </td>
                    <td valign="middle" class="disabled">专题日期 </td>
                    <td valign="middle" class="disabled">截止加入日期 </td>
                    <td valign="middle" class="disabled" style="width: 100px;">操作 </td>
                </tr>
                <!--注意 数据行 第一行 和 最后一行 有样式  请加判断添加 当只有一行时 class="firstLine lastLine"-->
                <%
                    for (int i = 0; i <= this.ListSubject.Count - 1; i++)
                    {
                        var subject = this.ListSubject[i];
                %>
                <tr class='<%= i == 0 ? "firstLine" : ""  %> <%= i == this.ListSubject.Count - 1 ? "lastLine" : ""  %>'>
                    <td class="sel" valign="middle">
                        <%= new HtmlCheckBox() { Value = SetKey(subject.Guid, subject.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
                    </td>
                    <td class="v">
                        <ul>
                            <li>
                                <%= new HtmlAnchor(
                                new HtmlImg(SettingGroup.SubjectCover(subject), subject.Name) { Width=100, Height=62, OnErrorImg=SettingGroup.DefaultImg}
                                ) { Href = WebUrl.SubjectView(subject.Guid), Target = "_blank" }%>
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
                            <br />
                            <%
                        if (subject.ShareUpload == (int)AVA.ResourcesPlatform.Model.Pub.SubjectShareUploadEnum.是)
                        {
                            %>
                            公开上传
                            <% 
                    }
                    
                            %>
                            播放：<%= subject.VideoView%>
                            评论：<%= subject.CommentCount%>
                        </p>
                    </td>
                    <td>
                        <%
                    var classStatus = "";
                    if (subject.Status == (int)AVA.ResourcesPlatform.Model.Pub.SubjectStatusEnum.启动)
                    {
                        classStatus = "pass";
                    }
                    else
                    {
                        classStatus = "";
                    }
                        %>
                        <span class="<%=classStatus  %> short_input" >
                            <%= new HtmlSelect(null, "Value", "Key", "Key") { OnChange = "SubjectChangeStatusClient(this,'" + SetKey(subject.Guid, subject.Version) + "');", Lang = subject.Status.ToString(), Option = typeof(AVA.ResourcesPlatform.Model.Pub.SubjectStatusEnum), SelectedValue = subject.Status }.Style(new { Width = "auto" })%>
                        </span></td>
                    <td>
                        <%= subject.BeginTime.ToShortDate()%>
                        <br />
                        至
                        <br />
                        <%= subject.EndTime.ToShortDate()%>
                    </td>
                    <td>
                        <%= subject.CutoffTime.ToShortDate()%>
                    </td>
                    <td>
                        <%= new HtmlAnchor("编辑") { Href = WebUrl.MySubjectEdit(subject.Guid) }%>
                        |
                        <%= new HtmlAnchor("专辑") { Href = WebUrl.MySubjectAlbumList(subject.Guid) }%>
                        <%--<a href="#delete" onclick="SubjectDelete(this,'<%= SetKey(subject.Guid, subject.Version) %>'); return false;">删除</a>--%>
                        <br />
                        <%= new HtmlAnchor("人员") { Href = WebUrl.MySubjectUserList(subject.Guid) }%>
                        |
                        <%= new HtmlAnchor("申请") { Href = WebUrl.MySubjectUserApplyList(subject.Guid) }%>
                        <br />
                        <%= new HtmlAnchor("附件") { Href = WebUrl.MySubjectAttachmentList(subject.Guid) }%>
                        |
                        <%= new HtmlAnchor("视频") { Href = WebUrl.MySubjectVideoList(subject.Guid) }%>
                        <br />
                        <%
                if (SettingGroup.HasMeeting == true)
                {
            %>
                        <%= new HtmlAnchor("教研") { Href = WebUrl.MySubjectMeetingList(subject.Guid) }%>
                        |
                        <%
                        }
                         %>
                        <%= new HtmlAnchor("直播") { Href = WebUrl.MySubjectApplicationList(subject.Guid) }%>
                        <%
                        if (subject.STEnable == true)
                        {
                            %>
                        <%= new HtmlAnchor("奖项") { Href = WebUrl.MySTAwardList(subject.Guid) }%>
                        |
                        <%= new HtmlAnchor("评分项") { Href = WebUrl.MySTScoreItemList(subject.Guid) }%>
                        <br />
                        <%= new HtmlAnchor("评审") { Href = WebUrl.MySTUserList(subject.Guid) }%>
                        |
                        <%= new HtmlAnchor("排名") { Href = WebUrl.MySTfinallyScoreList(subject.Guid) }%>
                        <br />
                        <%= new HtmlAnchor("评分") { Href = WebUrl.MySTVideoScore(subject.Guid) }%>
                        <br />
                        <% 
                        }
                             %>
                        <%= new HtmlText("SortNumber", subject.SortNumber)
{ 
    OnKeyUp = "this.value=this.value.replace(/[^\\d]/g,'');",
    OnBlur = "this.value=this.value.replace(/[^\\d]/g,'');if(this.value==''){this.value=this.lang};SubjectChangeSortNumberClient(this,'" + SetKey(subject.Guid, subject.Version) + "')",
    Lang = subject.SortNumber.ToString(),
    Width = 50,
    Title = "修改当前专辑的位置"
}%>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $("#MySubjectData .trselall").click(function () {
            if (this.checked == true) {
                $("#MySubjectData .trsel").attr("checked", "checked");
            }
            else {
                $("#MySubjectData .trsel").removeAttr("checked");
            }
        })
        function SelectMySubjectAll() {
            var bool = $("#MySubjectData .trselall").attr("checked");
            bool = !bool;
            if (bool == true) {
                $("#MySubjectData .trsel").attr("checked", "checked");
                $("#MySubjectData .trselall").attr("checked", "checked");
            }
            else {
                $("#MySubjectData .trsel").removeAttr("checked");
                $("#MySubjectData .trselall").removeAttr("checked");
            }
        }
    </script>
    <div>
        <a onclick="SelectMySubjectAll(); return false;" href="#">全选 - 取消</a>
    </div>
    <%= new PagerAjaxInstance(this) { RecordCount = this.Query.RecordCount, PageRecordSize = this.Query.PageSize, PageIndex = this.Query.PageIndex, PageJsFn = WebUrl.MySubject(int.MaxValue, this.Name, this.BeginTime.ToString(null), this.EndTime.ToString(null)) }.ToHtml()%>
</div>
