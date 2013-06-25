<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InportEdit.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.Application.InportEdit" %>

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
                </div>
                <div class="ln-thick ln-c-mid">
                </div>
                <div class="subcontent">


                    <form id="frmLiveInport" action="" method="post" onsubmit="return false;">
                        <table  class="g-table-cntacomm">
                            <tr>
                                <th><span class="label"><span class="required">*</span>课表文件：</span></th>
                                <td>
                                    <%= new HtmlHidden("FileName", null) { Class = "ipt-t ipt-t-dft " }%>
                                    <%= new HtmlYKTip("FileName")%>
                                    <div>
                                        <%= new SingleUploadInstance(this) { UploadTag = "FileName", InitParams = "FileFilter=课表导入Excel模版文件(*.xls)|*.xls,DefaultColor=#F5F5F5F5,SelectFiles=选择上传课表导入模版文件,Upload=确认上传课表" }.ToHtml()%>
                                        <script type="text/javascript">
                                            function UploadFinishedFileName(fileName, fileSize) {
                                                $("#frmLiveInport [Name=FileName]").val(fileName);
                                            }
                                        </script>
                                    </div>
                                    下载课表导入模版
                    <%= new HtmlAnchor("课表导入模版.xls") {  Href = "课表导入模版.xls"}%>
                                    <br />
                                    模版填写说明请下载
                    <%= new HtmlAnchor("课表导入使用说明.doc") {  Href = "课表导入使用说明.doc"}%>
                                    <br />
                                    请根据课表模版填写申请信息，相对应填写的内容为申请时填写或先把的内容。 </td>
                            </tr>
                            <tr>
                                <th style="text-align: right;"><span class="label">直播封面：</span></th>
                                <td>
                                    <table border="0px">
                                        <tr>
                                            <td>
                                              <%= new HtmlHidden("Cover", ViewData["_Video.Cover"])%>
                                                <%= new HtmlImg(SettingGroup.NonePic) { Class = "default-image"}%>
                                                <br />
                                                <a href="#deleteCover" class="delete-image decoration-none hidden"><span class="txt-info">[<%= DefineEnum.删除.Define() %>]</span></a> <a href="#uploadCover" class="decoration-none" onclick="return UploadFile('#frmLiveInport [name=Cover]','<%= Define.Get("封面上传")%>','0','<%= SettingGroup.VideoUploadPath %>','','480', '300')"><span class="txt-info">[<%=  DefineEnum.图片上传.Define() %>]</span></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>支持.jpg、gif、png格式的图片 </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align: right;"></th>
                                <td>
                                    <%= new HtmlHidden("Key", SetKey(this.ViewData["_Application.Guid"], this.ViewData["_Application.Version"]))%>
                                    <%= new HtmlHidden("ParentUser", this.User.Guid)%>
                                    <%= new HtmlSubmit("导入申请", "ApplicationEdit", "LiveInportClient(this);").Style(new { Width = "100px" })%>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <iframe id="frmDownload" src="" style="display: none"></iframe>
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
<%= Import.Script("js", "/Ajax/Pub/ApplicationAjax.js")%>
<script type="text/javascript">
    //验证控件
    $.validator.initConfig({ validatorGroup: "LiveInport", form: "#frmLiveInport", alertMessage: true, showMessage: false });

    //课表文件
    $("#frmLiveInport [name=FileName]").formValidator({
        validatorGroup: "LiveInport",
        rules:
        {
            required: null
        },
        message:
        {
            required: "请先上传课表申请。"
        }
    });
</script>
<script type="text/javascript">
    function LiveInportClient(send) {
        $.ajax(
        {
            cache: false,
            type: "POST",
            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.LiveInportClient",
            data: Global.GetFormValue($("#frmLiveInport")),
            async: true,
            dataType: 'json',
            success: function (result) {
                $(send).val('申请');
                alert("导入成功数据：" + result.Count);
                document.getElementById("frmDownload").src = result.DataUrl;
                Global.Disabled(send, false);
            },
            beforeSend: function () {
                $(send).val('申请中...');
                Global.Disabled(send, true);
            },
            complete: function () {
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(send).val('申请');
                Global.Disabled(send, false);
                var message = XMLHttpRequest.responseText;
                Global.Error(message);
            }
        });
    }
</script>
