<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectPlay.SubjectPlayVideoScoreCommon" %>

<div id="divSTVideoScoreCommon" class="comments box">
</div>
  <div class="commentAction">
        <form id="frmSTVideoScoreComment" action="" onsubmit="return false;">
            <div class="commentTextArea">
                <textarea class="defaultext" cols="40" rows="2" name="CommentText" style="width: 90%;"></textarea>
            </div>
            <div class="toolbar">
                <div class="action">
                    <%= new HtmlHidden("SubjectGuid",this.Subject.Guid) %>
                    <%= new HtmlHidden("VideoGuid",this.Video.Guid) %>
                    <%= new HtmlButton("发表点评", "STVideoScoreCommentAdd", "STVideoScoreCommentAddClient(this)")%>
                </div>
                <div class="clear"></div>
            </div>
        </form>
    </div>
<script type="text/javascript">

    //验证控件
    $.validator.initConfig({ validatorGroup: "STVideoScoreCommentAdd", form: "#frmSTVideoScoreComment", alertMessage: true, showMessage: false });

    //评论
    $("#frmSTVideoScoreComment [name=CommentText]").formValidator({
        validatorGroup: "STVideoScoreCommentAdd",
        rules:
        {
            required: null
        },
        message:
        {
            required: "请输入点评内容"
        }
    });
</script>
<script type="text/javascript">
    function LoadSTVideoScoreCommon()
    {
        $("#divSTVideoScoreCommon").html("加载中...");
        var prams = "SubjectGuid=<%= this.Subject.Guid %>&VideoGuid=<%= this.Video.Guid %>";
        Global.HtmlControl("/Control/SubjectPlay/SubjectPlayVideoScoreCommonData", prams, null, function (json) {
            if (json != null) {
                $("#divSTVideoScoreCommon").html(json.Html);
            }
        });
    }
    $(function () {
        LoadSTVideoScoreCommon();
    })
    function STVideoScoreCommentAddClient(send) {
        $.ajax(
        {
            cache: false,
            type: "POST",
            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.STVideoScoreCommentAdd",
            data: Global.GetFormValue($("#frmSTVideoScoreComment")),
            async: true,
            dataType: 'json',
            success: function (result) {
                $(send).val("发表点评");
                $("#frmSTVideoScoreComment [name=CommentText]").val("");
                LoadSTVideoScoreCommon();
                alert("点评成功")
                Global.Disabled(send, false);
            },
            beforeSend: function () {
                $(send).val("提交点评...");
                Global.Disabled(send, true);
            },
            complete: function () {
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(send).val("发表点评");
                Global.Disabled(send, false);
                var message = XMLHttpRequest.responseText;
                Global.Error(message);
            }
        });
    }
</script>
