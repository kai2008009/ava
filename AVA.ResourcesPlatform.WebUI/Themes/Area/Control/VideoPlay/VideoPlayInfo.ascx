<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayInfo" %>
<div class="box mbox">
     <div style="cursor: s-resize;" class="head">
        <div class="caption">
            <div class="title">
                视频简介
            </div>
        </div>
    </div>
    <!--head end-->
    <div class="body tabwrap" id="slide-con_AlbumInfo">
        <div class="staff">
            <!--列表模式-->
            <ul>
                <li>
                    <%= new HtmlImg(CreateInstance.UserDao.HeadPortrait(this.Video.ParentUser)) { Height=64, Width=64 }%>
                </li>
                <li>主讲教师：
                    <%= new HtmlAnchor(this.Video.Author) { Target = "_blank", Href = WebUrl.Show(this.Video.ParentUser.ParentUserType.ParentDomain.Code, this.Video.ParentUser.UserName), Title = this.Video.ParentUser.ParentUserType.ParentDomain.Name }%>
                </li>
                <li>课程学校：
                    <%= new HtmlAnchor(this.Video.ParentUser.ParentUserType.ParentDomain.Name) { Target = "_blank", Href = new UrlExecute() { ParentDomain = this.Video.ParentUser.ParentUserType.ParentDomain.Guid }.ToUrl(SearchType.Video) }%>
                </li>
                <li>学程:
                    <%= new HtmlAnchor(this.Video.ParentCategory.Name) { Target = "_blank", Href = new UrlExecute() { ParentCategory = this.Video.ParentCategory.Guid }.ToUrl(SearchType.Video) }%>
                </li>
                <%
                    if (this.ListChannel.Count > 0)
                    {
                %>
                <li>课程:
                    <%
                        foreach (var channel in this.ListChannel)
                        {
                    %>
                    <%= new HtmlAnchor(channel.Name) { Target = "_blank", Href = new UrlExecute() { ParentChannel = channel.Guid }.ToUrl(SearchType.Video) }%>
                    <% 
                        }
                    %>
                </li>
                <% 
                    }
                %>
                <%
                    if (this.ListVideoTag.Count > 0)
                    {
                %>
                <li>标签:
                    <%
                        foreach (var tag in this.ListVideoTag)
                        {
                    %>
                    <%= new HtmlAnchor(tag.Title) { Target = "_blank", Href = new UrlExecute() { TagTitle = tag.Title }.ToUrl(SearchType.Video) }%>
                    <% 
                        }
                    %>
                </li>
                <% 
                    }
                %>
            </ul>
        </div>
        <div class="pill-content">
            <br class="clearfix">
        </div>
    </div>
    <!--body end-->
</div>
