<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyVideoEdit.ascx.cs" Inherits="AVA.ResourcesPlatform.WebUI.Control.My.MyVideoEdit" %>
<div class="well">
    <div class="p_title">
        <span class="title">我的视频：</span>视频编辑<span class="f_r">
           <%= new MyVideoNavInstance(this) { Local = "编辑", Video = this.Video }.ToHtml() %>
        </span>
    </div>
    <hr />
    <div class="userInput pwd">
        <form id="frmVideoEdit" action="" method="post" onsubmit="return false;">
        <table border="0px" cellpadding="2px" cellspacing="2px" class="myTab">
            <tr>
                <td style="text-align: right; width: 150px;"><span class="label"><span class="required">*</span>标题：</span></td>
                <td>
                    <%= new HtmlText("Name", this.Video.Name, 256) { }%>
                    <%= new HtmlYKTip("Name")%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 150px;"><span class="label">主讲人：</span></td>
                <td>
                    <%= new HtmlText("Spreaker", this.Video.Spreaker, 256) { }%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>视频文件：</span></td>
                <td>
                    <%= new HtmlText("FileName", this.Video.FileName) { ReadOnly = true }%>
                    <%= new HtmlYKTip("FileName")%>
                    <div>
                        <%= new SingleUploadInstance(this) { UploadTag = "FileName", InitParams = "FileFilter=" + CreateInstance.DomainInfoDao.THIS().UploadVideoType.ToUpper().Replace("*.","") + "多媒体文件格式(" + CreateInstance.DomainInfoDao.THIS().UploadVideoType + ")|" + CreateInstance.DomainInfoDao.THIS().UploadVideoType + ",DefaultColor=#F5F5F5F5,SelectFiles=选择上传的视频文件,Upload=确认上传视频" }.ToHtml()%>
                        <%= new HtmlHidden("VideoUploadPath",SettingGroup.VideoUploadPath) %>
                        <script type="text/javascript">
                            //如果有视频的话，默认他是从视频路径加上视频Guid
                            $("#frmVideoEdit [name=VideoUploadPath]").val('<%= SettingGroup.VideoUploadPath + this.Video.Guid + "/" %>');
                            function UploadFinishedFileName(fileName, fileSize) {
                                $("#frmVideoEdit [Name=FileName]").val(fileName);
                                $("#frmVideoEdit [Name=FileSize]").val(fileSize)
                                if (fileName.toLowerCase().indexOf(".asf") != -1) {
                                    $("#frmVideoEdit [Name=FileType]").val("1");
                                } else if (fileName.toLowerCase().indexOf(".wmv") != -1) {
                                    $("#frmVideoEdit [Name=FileType]").val("2");
                                } else if (fileName.toLowerCase().indexOf(".flv") != -1) {
                                    $("#frmVideoEdit [Name=FileType]").val("3");
                                } else if (fileName.toLowerCase().indexOf(".rm") != -1) {
                                    $("#frmVideoEdit [Name=FileType]").val("4");
                                } else if (fileName.toLowerCase().indexOf(".rmvb") != -1) {
                                    $("#frmVideoEdit [Name=FileType]").val("5");
                                } else if (fileName.toLowerCase().indexOf(".avi") != -1) {
                                    $("#frmVideoUpload [Name=FileType]").val("6");
                                } else if (fileName.toLowerCase().indexOf(".mp4") != -1) {
                                    $("#frmVideoUpload [Name=FileType]").val("7");
                                } else {
                                    $("#frmVideoUpload [Name=FileType]").val("0");
                                }
                                //判断生成图片
                                if ($("#frmVideoEdit [name=FileName]").val() != "") {
                                    $("#btnUploadVideoToVideo").show();
                                    $("#frmVideoEdit [name=VideoUploadPath]").val("<%= SettingGroup.UploadPath %>");
                                }
                                else {
                                    $("#btnUploadVideoToVideo").hide();
                                    $("#frmVideoEdit [name=VideoUploadPath]").val("<%= SettingGroup.UploadPath %>");
                                }
                            }
                        </script>
                    </div>
                    请上传 mp4; wmv; asf; avi; flv 支持H264格式视频
                    <br />
                    <%= new HtmlAnchor("建议先转换视频后再上传，点击下载") { Href=Request.WebPath()+"/Resource/ConvertTools.zip" }%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>视频字幕：</span></td>
                <td>
                    <%= new HtmlText("CaptionsFile", this.Video.CaptionsFile) { Class = "ipt-t ipt-t-dft ",ReadOnly = true }%>
                    <%= new HtmlButton("清除","$('#frmVideoEdit [Name=CaptionsFile]').val('');").Style(new { Width = "60px" })%>
                    <%= new HtmlYKTip("CaptionsFile")%>
                    <div>
                        <%= new SingleUploadInstance(this) { UploadTag = "CaptionsFile", InitParams = "FileFilter=*.srt|*.srt,DefaultColor=#F5F5F5F5,SelectFiles=选择上传的视频字幕,Upload=确认上传字幕" }.ToHtml()%>
                        <script type="text/javascript">
                            function UploadFinishedCaptionsFile(captionsFile, fileSize) {
                                $("#frmVideoEdit [Name=CaptionsFile]").val(captionsFile);
                            }
                        </script>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>视频封面：</span></td>
                <td>
                    <table border="0px">
                        <tr>
                            <td>
                                <%= new HtmlHidden("Cover", this.Video.Cover) { Class = "ipt-t ipt-t-dft " }%>
                                <%= new HtmlImg(SettingGroup.VideoCover(this.Video), "") { ID = "imgCover", Width=140, Height=88, OnErrorImg=SettingGroup.DefaultImg }%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" value="上传封面" onclick="UploadVideoCover();" style="width: auto;" />
                                <input type="button" id="btnUploadVideoToVideo" value="从视频截取封面" onclick="UploadVideoToVideo();" style="width: auto; display: none;" />
                                <%= new HtmlYKTip("Cover")%>
                                <script type="text/javascript">
                                    function UploadVideoCover() {
                                        UploadFile('#frmVideoEdit [name=Cover]', '视频封面上传', '0', '<%= SettingGroup.VideoUploadPath %>', '', '480', '300');
                                    }
                                    $(function () {
                                        if ($("#frmVideoEdit [name=FileName]").val() != "") {
                                            $("#btnUploadVideoToVideo").show();
                                        }
                                        else {
                                            $("#btnUploadVideoToVideo").hide();
                                        }
                                    });
                                    function UploadVideoToVideo() {
                                        UploadImage('#frmVideoEdit [name=Cover]', '视频封面截取', '0', $("#frmVideoEdit [name=VideoUploadPath]").val(), $("#frmVideoEdit [name=FileName]").val(), '480', '300');
                                    }
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td>支持.jpg、gif、png格式的图片 </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="text-align: right;"><span class="label"><span class="required">*</span>文件类型：</span></td>
                <td>
                    <%= new HtmlSelect("FileType", "Value", "Key") { Option = typeof(AVA.ResourcesPlatform.Model.Pub.VideoFileTypeEnum), Disabled = true, SelectedValue=this.Video.FileType }.InsertOption("::" + DefineEnum.选择.Define() + "::", null, 0)%>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="text-align: right;"><span class="label"><span class="required">*</span>文件大小：</span></td>
                <td>
                    <%= new HtmlText("FileSize",this.Video.FileSize) { ReadOnly = true }%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>学科：</span></td>
                <td>
                    <%= new HtmlSelect("ParentCategory", "Name", "Guid", "Guid") { Option = this.ListAllCategory, DefaultSelectValue = "", OnChange = "GetTextbook();", SelectedValue = this.Video.ParentCategory.Guid }.InsertOption("::选择::", "", 0)%>
                    <%= new HtmlYKTip("ParentCategory") { }%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"></td>
                <td>当视频是针对课本的某一单元课时，请先选择课本学科、所属出版社和年级 </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">*出版社：</span></td>
                <td>
                    <%= new HtmlSelect("ParentPress", "Name", "Guid", "Guid") { Option = this.ListAllPress, DefaultSelectValue = "", SelectedValue = (this.Video.ParentLesson != null ? this.Video.ParentLesson.ParentTextbook.ParentPress.Guid : ""), OnChange = "GetTextbook();" }.InsertOption("::选择::", "", 0)%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">*年级：</span></td>
                <td>
                    <%= new HtmlSelect("ParentGrade", "Name", "Guid", "Guid") { Option = this.ListAllGrade, DefaultSelectValue = "", SelectedValue = (this.Video.ParentLesson != null ? this.Video.ParentLesson.ParentTextbook.ParentGrade.Guid : ""), OnChange = "GetTextbook();" }.InsertOption("::选择::", "", 0)%>
                </td>
            </tr>
            <tr id="liTextbook" style="display: none;">
                <td style="text-align: right;"><span class="label">*课本：</span></td>
                <td><span id="spanTextbook"></span></td>
            </tr>
            <tr id="liLesson" style="display: none;">
                <td style="text-align: right;"><span class="label">*课元课：</span></td>
                <td><span id="spanLesson"></span></td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">简介：</span></td>
                <td>
                    <%= new HtmlTextArea("Summary", this.Video.Summary, 2000)%>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="text-align: right;"><span class="label"><span class="required">*</span>录制时间：</span></td>
                <td>
                    <%= new HtmlText("RecTime", this.Video.RecTime.ToShortDate(), 200) { }.Style(new { Width = "120px" })%>
                    <%= new HtmlYKTip("RecTime")%>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="text-align: right;"><span class="label">时长(秒)：</span></td>
                <td>
                    <%= new HtmlText("Period", this.Video.Period, 200) { }.Style(new { Width = "120px" })%>
                    <%= new HtmlYKTip("Period")%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>版权：</span></td>
                <td>
                    <%= new HtmlRadio("Copyright", (this.Video.Copyright == 0 ? true : false), 0, null) { ID = "Video_Copyright_0" }.Style(new { Width = "auto" })%>
                    <label for="Video_Copyright_0">
                        原创
                    </label>
                    <%= new HtmlRadio("Copyright", (this.Video.Copyright == 1 ? true : false), 1, null) { ID = "Video_Copyright_1" }.Style(new { Width = "auto" })%>
                    <label for="Video_Copyright_1">
                        转载
                    </label>
                    <%= new HtmlYKTip("Copyright") %>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>观看权限：</span></td>
                <td>
                    <%= new HtmlRadio("Share", (this.Video.Share == 0 ? true : false), 0, null) { ID = "Video_Share_0" }.Style(new { Width = "auto" })%>
                    <label for="Video_Share_0">
                        自己
                    </label>
                    <%= new HtmlRadio("Share", (this.Video.Share == 1 ? true : false), 1, null) { ID = "Video_Share_1" }.Style(new { Width = "auto" })%>
                    <label for="Video_Share_1">
                        本校
                    </label>
                    <%= new HtmlRadio("Share", (this.Video.Share == 2 ? true : false), 2, null) { ID = "Video_Share_2" }.Style(new { Width = "auto" })%>
                    <label for="Video_Share_2">
                        全部
                    </label>
                    <%= new HtmlYKTip("Share") %>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">允许下载：</span></td>
                <td>
                    <%= new HtmlCheckBox("HasDownload",this.Video.HasDownload,1,0)%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">详细描述：</span></td>
                <td>
                    <%= new HtmlTextArea("Description", this.Video.Description, 2000)%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label"><span class="required">*</span>排序号：</span></td>
                <td>
                    <%= new HtmlText("SortNumber", this.Video.SortNumber, 4) { DefaultValue = 1 }%>
                    <%= new HtmlYKTip("SortNumber") %>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">标签用空格(" ")分开：</span></td>
                <td>
                    <%= new HtmlText("VideoTag", this.VideoTag, 256) { }%>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"><span class="label">所属频道：</span></td>
                <td>
                    <ul>
                        <%
                            foreach (var channel in this.ListAllChannel)
                            {
                                string parentChannelGuid = "";
                                if (channel.ParentChannel != null)
                                {
                                    parentChannelGuid = channel.ParentChannel.Guid;
                        %>
                        <li>
                            <%= new HtmlCheckBox("Channel", this.SelectChannel.Contains(channel.Guid), channel.Guid, "") { ID = "Channel" + channel.Guid, Class = "ChannelItem ChannelItemChannel" + parentChannelGuid, Lang = channel.ParentChannel.Guid }.Style(new { Width = "auto" })%>
                            <%= new HtmlLabel("Channel" + channel.Guid, channel.Name)%>
                        </li>
                        <%
                                }
                                else
                                {
                        %>
                        <li>
                            <%= new HtmlCheckBox("Channel", this.SelectChannel.Contains(channel.Guid), channel.Guid, "") { ID = "Channel" + channel.Guid, Class = "ChannelMaster ChannelMaster" + channel.Guid }.Style(new { Width = "auto" })%>
                            <%= new HtmlLabel("Channel" + channel.Guid, channel.Name)%>
                        </li>
                        <% 
                            }

                            }
                        %>
                    </ul>
                    <script type="text/javascript">
                        //绑定频道选择
                        $(".ChannelMaster").bind("click", function () {
                            if (this.checked == false) {
                                $(".ChannelItem" + this.id).removeAttr("checked");
                            }
                        })
                        //绑定频道选择
                        $(".ChannelItem").bind("click", function () {
                            if (this.checked == true) {
                                $(".ChannelMaster" + this.lang).attr("checked", "checked");
                            }
                            else {
                                if ($(".ChannelItemChannel" + this.lang + ":checked").length > 0) {
                                    $(".ChannelMaster" + this.lang).attr("checked", "checked");
                                }
                                else {
                                    $(".ChannelMaster" + this.lang).removeAttr("checked");
                                }
                            }
                        })
                    </script>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;"></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-align: right;"></td>
                <td>
                    <%= new HtmlHidden("Key", SetKey(this.Video.Guid, this.Video.Version))%>
                    <%= new HtmlSubmit("修改视频信息", "VideoEdit", "VideoEditClient(this);").Style(new { Width = "100px" })%></li> </td>
            </tr>
        </table>
        </form>
    </div>
    <script type="text/javascript">
        GetTextbook('<%= this.Video.ParentLesson != null ? this.Video.ParentLesson.ParentTextbook.Guid : ""%>', '<%= this.Video.ParentLesson != null ? this.Video.ParentLesson.Guid : ""%>');
        function GetTextbook(textbook, lesson) {
            var categoryGuid = $("#frmVideoEdit [Name=ParentCategory]").val();
            var pressGuid = $("#frmVideoEdit [Name=ParentPress]").val();
            var gradeGuid = $("#frmVideoEdit [Name=ParentGrade]").val();
            if (categoryGuid != "" && pressGuid != "" && gradeGuid != "") {
                //取出课本
                $("#spanTextbook").html("正在加载课本信息...");
                $("#liTextbook").show();
                $("#spanLesson").html("");
                $("#liLesson").hide();
                Global.HtmlControl("/Control/My/SelectTextbook", "ParentCategory=" + encodeURIComponent(categoryGuid)
            + "&ParentPress=" + encodeURIComponent(pressGuid) + "&ParentGrade=" + encodeURIComponent(gradeGuid) + "&TextbookGuid=" + textbook, null, function (result) {
                $("#spanTextbook").html(result.Html);
                //取单元课
                if (lesson != null) {
                    GetLesson(lesson);
                }
            });
            }
            else {
                //隐藏课本
                $("#spanTextbook").html("");
                $("#liTextbook").hide();
                $("#spanLesson").html("");
                $("#liLesson").hide();
            }
        }
        function GetLesson(lesson) {
            var textbookGuid = $("#frmVideoEdit [Name=ParentTextbook]").val();
            if (textbookGuid != "" && textbookGuid != null) {
                //取出单元课
                $("#spanLesson").html("正在加载单元课信息...");
                $("#liLesson").show();
                Global.HtmlControl("/Control/My/SelectLesson", "ParentTextbook=" + encodeURIComponent(textbookGuid) + "&LessonGuid=" + lesson, null, function (result) {
                    $("#spanLesson").html(result.Html);
                });
            }
            else {
                //隐藏单元课
                $("#spanLesson").html("");
                $("#liLesson").hide();
            }
        }
        $(function () {
            $("#frmVideoEdit [name=RecTime]").datepicker({
                onClose: function () {
                    $.validator.itemValid("#frmVideoEdit [name=RecTime]", "VideoEdit");
                }
            });
        });
    </script>
    <script type="text/javascript">

        //验证控件
        $.validator.initConfig({ validatorGroup: "VideoEdit", form: "#frmVideoEdit", alertMessage: true, showMessage: false });

        //视频名称
        $("#frmVideoEdit [name=Name]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null
        },
            message:
        {
            required: "请输入视频标题"
        }
        });
        //视频文件
        $("#frmVideoEdit [name=FileName]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null
        },
            message:
        {
            required: "请上传视频文件"
        }
        });
        ////视频文件
        //$("#frmVideoEdit [name=Cover]").formValidator({
        //    validatorGroup: "VideoEdit",
        //    rules:
        //{
        //    required: null
        //},
        //    message:
        //{
        //    required: "请上传视频封面"
        //}
        //});
        //文件大小
        $("#frmVideoEdit [name=FileSize]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            regex: "num1"
        },
            message:
        {
            regex: "请输入视频文件大小"
        }
        }); //所属学科
        $("#frmVideoEdit [name=ParentCategory]").formValidator({
            targetFocus: "#frmVideoEdit [name=ParentCategory_Name]",
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null
        },
            message:
        {
            required: "请选择所属学科"
        }
        });
        //时长（秒）
        $("#frmVideoEdit [name=Period]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null,
            regex: "num1"
        },
            message:
        {
            required: "请输入视频操作时长秒数",
            regex: "时长秒数格式不正确"
        }
        });
        //版权
        $("#frmVideoEdit [name=Copyright]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            min: 1
        },
            message:
        {
            min: "请选择版权"
        }
        });
        //观看权限
        $("#frmVideoEdit [name=Share]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            min: 1
        },
            message:
        {
            min: "请选择观看权限"
        }
        });
        //录制时间
        $("#frmVideoEdit [name=RecTime]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null,
            regex: "date"
        },
            message:
        {
            required: "请选择视频录制时间",
            regex: "录制时间格式不正确"
        }
        });
        //排序号
        $("#frmVideoEdit [name=SortNumber]").formValidator({
            validatorGroup: "VideoEdit",
            rules:
        {
            required: null,
            regex: "num1"
        },
            message:
        {
            required: "排序号不能为空",
            regex: "排序号应为数字"
        }
        });
    </script>
    <script type="text/javascript">
        function VideoEditClient(send) {
            $.ajax(
        {
            cache: false,
            type: "POST",
            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.VideoEdit",
            data: Global.GetFormValue($("#frmVideoEdit")),
            async: true,
            dataType: 'json',
            success: function (result) {
                $(send).val("修改视频信息");
                alert("视频信息修改成功")
                Global.Disabled(send, false);
                window.location.href = "<%= WebUrl.MyVideoEdit(this.Video.Guid) %>";
            },
            beforeSend: function () {
                $(send).val("提交修改...");
                Global.Disabled(send, true);
            },
            complete: function () {
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(send).val("修改视频信息");
                Global.Disabled(send, false);
                var message = XMLHttpRequest.responseText;
                Global.Error(message);
            }
        });
        }
    </script>
</div>
