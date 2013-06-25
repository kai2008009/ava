<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyRecordVideo.ascx.cs" Inherits="AVA.ResourcesPlatform.WebUI.Control.My.MyRecordVideo" %>
<div class="well">
    <div class="p_title">
        <span class="title">我的直播视频：</span>我的<%= this.Query.RecordCount%>个直播视频
    </div>
    <div class="dataControl box">
        <form id="frmRecordVideoSearch" method="post" action="<%= WebUrl.Proxy() %>">
        名称：
        <%= new HtmlText("Name", this.Name) { Width = 120 }%>
        时间从
        <%= new HtmlText("StartTime", this.StartTime.ToLongDate()) { Width = 120 }%>
        至
        <%= new HtmlText("EndTime", this.EndTime.ToLongDate()) { Width = 120 }%>
        <%= new HtmlHidden("Key","MyRecordVideo") %>
        <%= new HtmlSubmit("查询") %>
        <%= new HtmlButton("获取视频文件", "RecordVideoDownload(this);")%>
        <%= new HtmlButton("删除", "RecordVideoBatchDelete(this);")%>
        </form>
        <script type="text/javascript">
            $(function () {
                $("#frmRecordVideoSearch [name=StartTime]").datetimepicker({
                    //maxDate: new Date($("#frmRecordVideoSearch [name=EndTime]").val()),
                    onClose: function () {
                        //$("#frmRecordVideoSearch [name=EndTime]").datetimepicker("option", "minDate", new Date(this.value));
                    }
                });
                $("#frmRecordVideoSearch [name=EndTime]").datetimepicker({
                    //minDate: new Date($("#frmRecordVideoSearch [name=StartTime]").val()),
                    onClose: function () {
                        //$("#frmRecordVideoSearch [name=StartTime]").datetimepicker("option", "maxDate", new Date(this.value));
                    }
                });
            });
        </script>
        <script type="text/javascript">
            //批量删除
            function RecordVideoBatchDelete(send) {
                var items = $("#MyRecordVideoData .trsel:checked");
                var key = "";
                for (var i = 0; i <= items.length - 1; i++) {
                    key += "pkid=" + encodeURIComponent(items[i].value);
                    if (i != items.length - 1) {
                        key += "&";
                    }
                }
                if (key != "") {
                    if (confirm("确认删除勾选的直播录像吗？") == true) {
                        $.ajax(
                    {
                        cache: false,
                        type: "POST",
                        url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.RecordVideoBatchDelete",
                        data: key,
                        async: true,
                        dataType: 'json',
                        success: function (result) {
                            $(send).val("删除");
                            alert("直播录像文件删除成功")
                            Global.Disabled(send, false);
                            $("#frmRecordVideoSearch").submit();
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
                    alert("请勾选要删除的直播录像！");
                }
            };

            //批量删除
            function RecordVideoDelete(send, pkid) {
                if (confirm("确认删除当前直播录像吗？") == true) {
                    $.ajax(
                {
                    cache: false,
                    type: "POST",
                    url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.RecordVideoDelete",
                    data: "key=" + pkid,
                    async: true,
                    dataType: 'json',
                    success: function (result) {
                        $(send).html("删除");
                        alert("直播录像文件删除成功")
                        Global.Disabled(send, false);
                        $("#frmRecordVideoSearch").submit();
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
        </script>
        <%
            if (1 == 0)
            {
        %>
        <script type="text/javascript">

            function RecordVideoDownload(send) {

                var items = $("#MyRecordVideoData .trsel:checked");
                if (items != null && items.length != 0) {
                    if (confirm("确认获取视频文件勾选的直播录像吗？下载时间根据视频大小和网络环境会不同，在IE浏览器中可能会适成假死状态！如果在下载时关闭浏览器，系统只会下载当前已下载或正在下载的视频。") == true) {
                        for (var i = 0; i <= items.length - 1; i++) {
                            var spanDownloadStatus = $(items[i]).parent().parent().find(".DownloadStatus");
                            $(items[i]).parent().parent().find(".DownloadStatus").html("正在下载");
                            $.ajax(
                        {
                            cache: false,
                            type: "POST",
                            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.RecordVideoDownload",
                            data: "key=" + items[i].value,
                            async: false,
                            dataType: 'json',
                            success: function (result) {
                                $("#download" + items[i].lang).html(result.Message);
                                if (result.Message == "未下载") {
                                    alert("未对视频进行下载，可能视频正在录制中！");
                                }
                                else if (result.Message == "已下载") {
                                    $("#aCovert" + items[i].lang).show();
                                }
                            },
                            beforeSend: function () {
                                $("#download" + items[i].lang).html("获取中...");
                            },
                            complete: function () {
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                var message = XMLHttpRequest.responseText;
                                $("#download" + items[i].lang).html(message);
                            }
                        });
                        }
                        alert("操作执行完成");
                    }
                }
                else {
                    alert("请勾选要获取视频文件的直播录像！");
                }
            }
        </script>
        <% 
        }
        else if (1 == 1)
        {  
        %>
        <script type="text/javascript">

            function RecordVideoDownload(send) {

                var items = $("#MyRecordVideoData .trsel:checked");
                if (items != null && items.length != 0) {
                    if (confirm("确认获取视频文件勾选的直播录像吗？系统会将当前下载请求添加到下载队列，由下载队列进行下载。") == true) {
                        for (var i = 0; i <= items.length - 1; i++) {
                            var spanDownloadStatus = $(items[i]).parent().parent().find(".DownloadStatus");
                            $(items[i]).parent().parent().find(".DownloadStatus").html("正在下载");
                            $.ajax(
                        {
                            cache: false,
                            type: "POST",
                            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.RecordVideoDownload",
                            data: "key=" + items[i].value,
                            async: false,
                            dataType: 'json',
                            success: function (result) {
                                $("#download" + items[i].lang).html(result.Message.replace("视频", ""));
                                if (result.Message == "未下载") {
                                    alert("未对视频进行下载，可能视频正在录制中！");
                                }
                                else if (result.Message == "已下载") {
                                    $("#aCovert" + items[i].lang).show();
                                }
                                if (result.Key == 3
                                    || result.Key == 4
                                    || result.Key == 5) {
                                    $("#downloadDetail" + items[i].lang).show();
                                }
                            },
                            beforeSend: function () {
                                $("#download" + items[i].lang).html("获取中...");
                            },
                            complete: function () {
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                var message = XMLHttpRequest.responseText;
                                $("#download" + items[i].lang).html(message);
                            }
                        });
                        }
                        alert("下载提交完成请等待下载任务对提交进行处理");
                    }
                }
                else {
                    alert("请勾选要获取视频文件的直播录像！");
                }
            }
        </script>
        <% 
        }
        else
        {
            throw new Z.Core.Tools.ExceptionMessage("未知下载方式");
        }
        %>
    </div>
    <div id="MyRecordVideoData" class="data">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tbody>
                <tr id="dataHead" class="dataHead">
                    <td valign="middle" class="sel" style="width: 20px;">
                        <input type="checkbox" class="trselall" />
                    </td>
                    <td valign="middle">文件名 </td>
                    <td valign="middle" class="disabled">视频 </td>
                    <td valign="middle" class="disabled">直播录像时间 </td>
                    <td valign="middle" class="disabled"></td>
                    <td valign="middle" class="disabled">操作 </td>
                </tr>
                <!--注意 数据行 第一行 和 最后一行 有样式  请加判断添加 当只有一行时 class="firstLine lastLine"-->
                <%
                    for (int i = 0; i <= this.ListRecordVideo.Count - 1; i++)
                    {
                        var recordVideo = this.ListRecordVideo[i];
                %>
                <tr class='<%= i == 0 ? "firstLine" : ""  %> <%= i == this.ListRecordVideo.Count - 1 ? "lastLine" : ""  %>'>
                    <td class="sel">
                        <%= new HtmlCheckBox() { Lang = recordVideo.Guid, Value = SetKey(recordVideo.Guid, recordVideo.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
                    </td>
                    <td class="v">
                        <ul>
                            <li>
                                <p>
                                    <%
                    if (FileExists(SettingGroup.RecordVideoUploadPath + recordVideo.ParentUser.Guid + "/", recordVideo.FileName))
                    {
                                    %>
                                    <%= new HtmlAnchor(recordVideo.FileName) { Href = WebUrl.Uri(SettingGroup.RecordVideoUploadPath + recordVideo.ParentUser.Guid + "/" + recordVideo.FileName) }%>
                                    <% 
                                    }
                                    else
                                    {
                                    %>
                                    <%= recordVideo.FileName%>
                                    <% 
                                    }
                                    %>
                                </p>
                                <%
                        if (recordVideo.ToVideo > 0)
                        {
                                %>
                                已发布<%= recordVideo.ToVideo %>次
                                <% 
                        }
                                %>
                            </li>
                        </ul>
                    </td>
                    <td>
                        <%= ViewData.Val("ParentRecordEquipment.Name", recordVideo)%>
                    </td>
                    <td>
                        <%= recordVideo.StartTime.ToLongDate() %>
                        <br />
                        至
                        <br />
                        <%= recordVideo.EndTime.ToLongDate() %>
                    </td>
                    <td><span id="download<%= recordVideo.Guid%>" class="DownloadStatus">
                        <%= (recordVideo.DownloadStatus != null ? ((AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum)recordVideo.DownloadStatus).Define() : null).Replace("视频","")%>
                    </span>
                        <br />
                        <%= new HtmlAnchor("查看详细") { ID="downloadDetail" + recordVideo.Guid, Href = WebUrl.MyRecordVideoDownloadDetail(recordVideo.Guid) }.Style(new { Display = "None" })%>
                        <%
                    if (recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.视频队列中
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.视频正在等待续传
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.视频正在下载
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.已下载
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.已发布
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.发布失败)
                    {
                        %>
                        <script type="text/javascript">
                            $("#downloadDetail<%= recordVideo.Guid %>").show();
                        </script>
                        <%
                        }
                        %>
                        <%--
                    <%= AVA.ResourcesPlatform.Config.Helper.FormatSize(recordVideo.FileSize.ToDouble())%>--%>
                    </td>
                    <td>
                        <%
                    if ((recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.已下载
                        ||recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.已发布
                        || recordVideo.DownloadStatus == (int)AVA.ResourcesPlatform.Model.Pub.RecordVideoDownloadStatusEnum.发布失败)
                        && FileExists(SettingGroup.RecordVideoUploadPath + recordVideo.ParentUser.Guid + "/", recordVideo.FileName))
                    {
                        %>
                        <%= new HtmlAnchor("发布课例") { Href = WebUrl.MyVideoUpload(recordVideo.Guid) }%>
                        <% 
                        }
                        else
                        {
                        %>
                        <%= new HtmlAnchor("发布课例") { ID = "aCovert" + recordVideo.Guid, Href = WebUrl.MyVideoUpload(recordVideo.Guid) }.Style(new { Display = "none" })%>
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
        $("#MyRecordVideoData .trselall").click(function () {
            if (this.checked == true) {
                $("#MyRecordVideoData .trsel").attr("checked", "checked");
            }
            else {
                $("#MyRecordVideoData .trsel").removeAttr("checked");
            }
        })
        function SelectMyRecordVideoAll() {
            var bool = $("#MyRecordVideoData .trselall").attr("checked");
            bool = !bool;
            if (bool == true) {
                $("#MyRecordVideoData .trsel").attr("checked", "checked");
                $("#MyRecordVideoData .trselall").attr("checked", "checked");
            }
            else {
                $("#MyRecordVideoData .trsel").removeAttr("checked");
                $("#MyRecordVideoData .trselall").removeAttr("checked");
            }
        }
    </script>
    <div>
        <a onclick="SelectMyRecordVideoAll(); return false;" href="#">全选 - 取消</a>
    </div>
    <%= new PagerAjaxInstance(this) { RecordCount = this.Query.RecordCount, PageRecordSize = this.Query.PageSize, PageIndex = this.Query.PageIndex, PageJsFn = WebUrl.MyRecordVideo(int.MaxValue, this.Name, this.StartTime.ToString(null), this.EndTime.ToString(null)) }.ToHtml()%>
</div>
