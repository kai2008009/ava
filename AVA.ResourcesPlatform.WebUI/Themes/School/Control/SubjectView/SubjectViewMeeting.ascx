<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.SubjectView.SubjectViewMeeting" %>
<%
                if (SettingGroup.HasMeeting == true)
                {
            %>
<%
    if (this.ListSubjectMeeting != null && this.ListSubjectMeeting.Count > 0)
    {
%>
<div class="box mbox ">
    <div class="head">
        <div class="title ">
            专题教研
        </div>
    </div>
    <div class="videolist body clearfix">
        <ul>
            <%
        for (int i = 0; i <= this.ListSubjectMeeting.Count - 1; i++)
        {
            var subjectSpeaker = this.ListSubjectMeeting[i];
            var meeting = subjectSpeaker.ParentMeeting;
            var subject = subjectSpeaker.ParentSubject;
                                
            %>
            <li>
                <div class="vediodiv">
                    <%= new HtmlAnchor(
    new HtmlImg(SettingGroup.MeetingCover(meeting), meeting.Name) { Width=140, Height=88, OnErrorImg=SettingGroup.DefaultImg}
    ) { Title = meeting.Name, Target = "_blank", Href = WebUrl.MeetingView(meeting.Guid) }%>
                </div>
                <div class="clear"></div>
                <p class="ttle">
                    <%= new HtmlAnchor(meeting.Name) { Target = "_blank", Title = meeting.Name, Href = WebUrl.MeetingView(meeting.Guid) }%>
                </p>
                <p>
                    <span>上传:</span>
                    <%= new HtmlAnchor(meeting.ParentUser.TrueName) { Title = meeting.ParentUser.ParentUserType.ParentDomain.Name + " " + meeting.ParentUser.TrueName, Target = "_blank", Href = WebUrl.Show(meeting.ParentUser.ParentUserType.ParentDomain.Code, meeting.ParentUser.UserName) }%>
                </p>
            </li>
            <% 
               
        }
            %>
        </ul>
    </div>
    <div class="clearFloat"></div>
</div>
<%
    }
%>
<%
}
 %>