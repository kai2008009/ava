<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectPlay.SubjectPlaySTScoreItem" %>
<%
    var ListSTScoreType = this.ListSTScoreItem.GroupBy(l => l.ParentSTScoreType)
        .Select(l => l.Key)
        .OrderBy(l => l.SortNumber)
        .ToList();
%>


<table border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td nowrap colspan="4">
            <p align="center" style='text-align: center'>信息技术与课程整合优秀课评比评价指标</p>
        </td>
    </tr>
    <tr>
        <td nowrap colspan="2">
            <p align="center" style='text-align: center'>
                评价指标</td>
        <td style="width:40px;" nowrap>
            <p align="left" style='text-align: left'>权重</p>
        </td>
        <td style="width:120px" valign="top">
            <p align="left" style='text-align: left'>分数</p>
        </td>
    </tr>

    <%
        for (int i = 0; i <= ListSTScoreType.Count - 1; i++)
        {
    %>
    <tr>
        <td colspan="4">
            <table>

                <%
            foreach (var stScoreItem in this.ListSTScoreItem.Where(l => l.ParentSTScoreType == ListSTScoreType[i]).OrderBy(l => l.SortNumber).ToList())
            {
                %>
                <tr>

                    <td width="100"><%= ListSTScoreType[i].Name %></td>
                    <td width="400">
                        <%= stScoreItem.Name %><br />
                        <%= stScoreItem.Description.RestoreHtml() %>
                    </td>
                    <td style="width:40px;"><%= stScoreItem.ScoreRatio %></td>
                    <td style="width:120px">
                        <form action="" id="Form1" method="post" onsubmit="return false;">
                            <%= new HtmlHidden("STScoreItemGuid",stScoreItem.Guid) %>
                            <%= new HtmlHidden("VideoGuid",this.Video.Guid) %>
                            <div>
                                <%
               var score = stScoreItem.ScoreRatio / 5;
               //找取当前用户的评分

               double? localScore = null;

               var stUserScoreItem = CreateInstance.STUserScoreItemDao.Where(l => l.ParentSTUser.ParentUser == this.User
               && l.ParentVideo == this.Video
               && l.ParentSTScoreItem == stScoreItem)
               .ToList()
               .FirstResult();
               if (stUserScoreItem != null)
               {
                   localScore = stUserScoreItem.Score;
               }
                                %>
                                <nobr>
                                <%= new HtmlText("frm"+stScoreItem.Guid,localScore) {Class="span1",ID="item"+stScoreItem.Guid}%>
                                <%= new HtmlButton("评分") {Class="span1", OnClick="STUserScoreItemEdit(this,'"+stScoreItem.Guid+"','"+this.Video.Guid+"',$('+item"+stScoreItem.Guid+"').val())", Width=50}%>
                                    </nobr>
                            </div>
                        </form>

                    </td>

                    <tr>

                        <% } %>
            </table>
        </td>
    </tr>
    <% } %>
</table>


<script type="text/javascript">
    function STUserScoreItemEdit(send, STScoreItemGuid, VideoGuid, Score) {
        //alert(this);
        var params = "";
        params += "STScoreItemGuid=" + STScoreItemGuid;
        params += "&";
        params += "VideoGuid=" + VideoGuid;
        params += "&";
        params += "Score=" + Score;
        //alert(params);
        //return;
        $.ajax(
         {
             cache: false,
             type: "POST",
             url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.STUserScoreItemEdit",
             data: params,
             async: true,
             dataType: 'json',
             success: function (result) {
                 alert("评分成功")
                 //send.lang = send.value;
                 Global.Disabled(send, false);
                 send.value = "评分";
             },
             beforeSend: function () {
                 Global.Disabled(this, true);
                 send.value = "评分中...";
             },
             complete: function () {
             },
             error: function (XMLHttpRequest, textStatus, errorThrown) {
                 Global.Disabled(send, false);
                 send.value = "评分";
                 var message = XMLHttpRequest.responseText;
                 Global.Error(message);
             }
         });
    }
</script>
