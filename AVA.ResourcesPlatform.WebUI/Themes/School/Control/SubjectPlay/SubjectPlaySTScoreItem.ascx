<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubjectPlaySTScoreItem.ascx.cs" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectPlay.SubjectPlaySTScoreItem" %>
<%
    var ListSTScoreType = this.ListSTScoreItem.GroupBy(l => l.ParentSTScoreType)
        .Select(l => l.Key)
        .OrderBy(l => l.SortNumber)
        .ToList();
%>

<ul style="list-style: none;" class="tabs">
    <%
        for (int i = 0; i <= ListSTScoreType.Count - 1; i++)
        {
    %>
    <li class='<%= i==0?"active":"" %>' id="thrkLst<%= ListSTScoreType[i].Guid %>" tabidx="rkLst<%= ListSTScoreType[i].Guid %>"><a class="btn" href="#content<%= ListSTScoreType[i].Guid %>" data-toggle="tab"><%= ListSTScoreType[i].Name %></a></li>
    <% 
        }
    %>
</ul>
<style type="text/css">
    .rating-cancel{display:none}
</style>
<div class="pill-content hor-content">
    <%
        for (int i = 0; i <= ListSTScoreType.Count - 1; i++)
        {
    %>
    <div class='<%= i==0?"active":"" %>' data-pills="rkLst<%= ListSTScoreType[i].Guid %>" id="content<%= ListSTScoreType[i].Guid %>">
        <div class="pill-body">
            评估内容
                  <table class="table">
                      <%
            foreach (var stScoreItem in this.ListSTScoreItem.Where(l => l.ParentSTScoreType == ListSTScoreType[i])
                .OrderBy(l => l.SortNumber)
                .ToList())
            {
                      %>
                      <tr>
                          <th>要求</th>
                          <th style="width:140px;">得分</th>
                          <th style="width:80px;">权重</th>
                      </tr>
                      <tr>
                          <td>
                              <%= stScoreItem.Name %><br />
                              <%= stScoreItem.Description.RestoreHtml() %>
                          </td>
                          <td>
                              <form action="" id="frm<%=stScoreItem.Guid %>" method="post" onsubmit="return false;">
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
                for (var j = 1; j <= 5; j++)
                {
                                      %>

                                      <%= new HtmlRadio("frm"+stScoreItem.Guid,score*j,"0") { Class="pingfen",Checked=(localScore==score*j?true:false) }%>

                                      <%
                }
                                      %>
                                  </div>
                              </form>
                          </td>
                          <td><%= stScoreItem.ScoreRatio %></td>
                      </tr>

                      <% 
            } 
                      %>
                  </table>
        </div>
    </div>
    <% 
        }
    %>
</div>
<script type="text/javascript">
    $(function () { // wait for document to load
        $('input.pingfen').rating({
            callback: function (value, link) {
                //alert(this);
                var params = "";
                params += "STScoreItemGuid=" + $("#" + this.name).find("[name=STScoreItemGuid]").val();
                params += "&";
                params += "VideoGuid=" + $("#" + this.name).find("[name=VideoGuid]").val();
                params += "&";
                params += "Score="+ value;
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
                         Global.Disabled(this, false);
                     },
                     beforeSend: function () {
                         Global.Disabled(this, true);
                     },
                     complete: function () {
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {                         
                         Global.Disabled(this, false);
                         var message = XMLHttpRequest.responseText;
                         Global.Error(message);
                     }
                 });
            },
            focus: function (value, link) {
                link.title = '我想评' + value + '分';
            }
        });
    });
</script>
