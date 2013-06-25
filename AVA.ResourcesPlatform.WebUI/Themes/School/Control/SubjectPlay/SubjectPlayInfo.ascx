<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectPlay.SubjectPlayInfo" %>
<div class="box ">
    <div class="">
        <div class="">
            <ul class="nav nav-tabs tabs">
                <li tabidx="rkVideoSWPattern" id="thrkVideoSWPattern" class="active"><a href="#cont" data-toggle="tab">本单元简介</a></li>
                <li tabidx="rkSubjectDescription" id="thrkSubjectDescription" class="">
                    <%= new HtmlAnchor("专题简介") { Href = "#divSubjectDescription" }.AddAttribute("data-toggle","tab")%>
                </li>
                <li tabidx="rkSTUserComment" id="thrkSTUserComment" class=""><a href="#divSTUserComment" data-toggle="tab">专家观点</a></li>
                <li tabidx="UserComments" id="LUserComments" class=""><a href="#UserComments" data-toggle="tab">精彩视点</a></li>

            </ul>
        </div>
    </div>
    <!--head end-->
    <div class="body tabwrap" id="slide-con_SubjectInfo">
        <div class="pill-content">
            <div data-pills="rkVideoSWPattern" id="cont" class="active">
                <div class="pill-body">
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
                            <%
                                if (this.Video.TeacherRatio != null
                                    && this.Video.StudentRatio != null)
                                {
                            %>
                            <li style="margin-top: 5px;">师生活动比例
                            </li>
                            <li>老师活动比例：
                    <%= this.Video.TeacherRatio%>% </li>
                            <li>学生活动比例：
                    <%= this.Video.StudentRatio%>% </li>
                            <li>转换率：
                    <%= this.Video.TransferRatio%>%（30’取样） </li>
                            <%
                        if (this.Video.TeachingType != null)
                        {
                            %>
                            <li>课堂类型：
                    <%= ((AVA.ResourcesPlatform.Model.Pub.VideoTeachingTypeEnum)this.Video.TeachingType).Define() %>
                            </li>
                            <% 
                        }
                            %>
                            <% 
                    }
                            %>
                        </ul>

                        <%= new VideoPlaySWPatternInstance(this) { Width=200, Height=200 }.ToHtml()%>
                    </div>
                </div>
            </div>
            <div data-pills="rkSubjectDescription" id="divSubjectDescription">
                <div class="pill-body">
                    <%= this.Subject.Description %>
                </div>
            </div>
            <div data-pills="rkSTUserComment" id="divSTUserComment">
                <div class="pill-body">
                    <%= new SubjectPlayVideoScoreCommonInstance(this) { }.ToHtml() %>
                </div>
            </div>
            <div data-pills="UserComments" id="UserComments">
                <div class="pill-body">
                    <div id="commentArea" class="commentArea">

                        <%= new CommentListInstance(this) { TargetType = "Video", TargetGuid = this.Video.Guid }.ToHtml()%>
                        <%= new CommentAddInstance(this) { TargetType = "Video", TargetGuid = this.Video.Guid }.ToHtml()%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--body end-->
</div>
