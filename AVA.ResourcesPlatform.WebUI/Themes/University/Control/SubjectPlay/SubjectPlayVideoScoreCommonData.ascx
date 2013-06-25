<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectPlay.SubjectPlayVideoScoreCommonData" %>
<table border="0px" style="width: 100%">
    <%
        foreach (var stVideoScore in this.ListSTVideoScore)
        {
    %>
    <tr>
        <td>
            <div class="comment">
                <div class="bar">
                    <%= new HtmlAnchor(stVideoScore.ParentSTUser.ParentUser.TrueName) { Target = "_blank", Href = WebUrl.Show(stVideoScore.ParentSTUser.ParentUser.ParentUserType.ParentDomain.Code, stVideoScore.ParentSTUser.ParentUser.UserName), Title = stVideoScore.ParentSTUser.ParentUser.ParentUserType.ParentDomain.Name }%>
                </div>
                <div class="con">
                    <div class="text">
                        <p>
                            <%= stVideoScore.Comment.RestoreHtml()%>
                            <br>
                        </p>
                    </div>
                </div>
            </div>
        </td>
    </tr>

    <% 
            }
    %>
</table>
