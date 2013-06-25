<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.Header" %>
<%
    if (!string.IsNullOrEmpty(CreateInstance.DomainInfoDao.THIS().MinLogo))
    {
%>
<style type="text/css">
    #header .banner, header #header .banner
    {
        background: url('<%= SettingGroup.DomainInfoMinLogo(CreateInstance.DomainInfoDao.THIS()) %>') no-repeat scroll right top transparent;
        height: 100px;
    }
</style>
<% 
    }
%>
<header id="top">
    <div id="header">
        <div class="container ">
            <div class="row">
                <div class="span16">
                    <div class="banner">
                        <a href="<%= WebUrl.Index() %>">
                            <%= new HtmlImg(SettingGroup.DomainInfoMaxLogo(CreateInstance.DomainInfoDao.THIS()), "")%>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="span16">
                    <div class="navbar">
                        <div class="navbar-inner">
                            <div class="container">
                                <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span></a>
                                <div class="nav-collapse">
                                    <ul class="nav ">
                                        <li class='<%= this.Local == "Index" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("首页") { Href = WebUrl.Index() }%></li>
                                        <li class='<%= this.Local == "Album" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("资源专辑") { Href = WebUrl.AlbumList() }%></li>
                                        <li class='<%= this.Local == "Video" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("课例点播") { Href = WebUrl.Video() }%></li>
                                        <%
                                            if (SettingGroup.HasSubject == true)
                                            {
                                        %>
                                        <li class='<%= this.Local == "Subject" ? "active" : "" %> visible-desktop'>
                                            <%= new HtmlAnchor("专题研究") { Href = WebUrl.SubjectList() }%></li>
                                        <%
                                            }
                                        %>
                                        <%
                                            if (SettingGroup.HasMeeting == true)
                                            {
                                        %>
                                        <li class='<%= this.Local == "Meeting" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("教研互动") { Href = WebUrl.MeetingList() }%></li>
                                        <%
                                            }
                                        %>
                                        <%
                                            if (SettingGroup.HasLive == true)
                                            {
                                        %>
                                        <li class='<%= this.Local == "Live" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("校园直播") { Href = WebUrl.Live() }%></li>
                                        <% 
                                            }
                                        %>
                                        <%
                                            if (SettingGroup.Online == true)
                                            {
                                        %>
                                        <li class='<%= this.Local == "Online" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("在线直播") { Href = WebUrl.Online() }%></li>
                                        <% 
                                            }
                                        %>
                                        <%
                                            if (SettingGroup.HasDomain == true)
                                            {
                                        %>
                                        <li class='<%= this.Local == "School" ? "active" : "" %>'>
                                            <%= new HtmlAnchor("学校列表") { Href = WebUrl.School() }%></li>
                                        <% 
                                            }
                                        %>
                                    </ul>
                                    <ul class="nav pull-right">
                                        <li style="display: none;" class="logpre">
                                            <form id="frmMiniLogin" class="navbar-search " method="post" action="<%= WebUrl.Login() %>">
                                            <%= new HtmlHidden("SRC",Request.Url) %>
                                            </form>
                                        </li>
                                        <li class="divider-vertical"></li>
                                        <li>
                                            <asp:PlaceHolder ID="HeaderSearch" runat="server" />
                                        </li>
                                        <li class="divider-vertical"></li>
                                        <li style="" class="logpre">
                                            <%= new HtmlAnchor("注册") { Href= WebUrl.Signup()}%>
                                        </li>
                                        <li style="" class="logpre">
                                            <%= new HtmlAnchor("登录") { Href = "#login", OnClick = "document.getElementById('frmMiniLogin').submit();return false;" }%>
                                        </li>
                                        <li style="" class="dropdown logafter" style="display: none;"><a data-toggle="dropdown" class="dropdown-toggle " href="#My" target="_blank">欢迎, <b class="uname">??</b><b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-header">个人空间</li>
                                                <li>
                                                    <%= new HtmlAnchor("更改个人信息" + new HtmlImg(SettingGroup.UserHeadPortrait(CreateInstance.UserDao.Get(this.UserCode)),"我的头像") { Class="avatar", Width=32, Height=32,OnError="this.src='"+Import.CSSFile("img/user_32.png")+"'"}) { Title="我的头像", Href= WebUrl.Basic() }%>
                                                </li>
                                                <li class="divider"></li>
                                                <li>
                                                    <%= new HtmlAnchor("上传") { Href = WebUrl.MyVideoUpload(), Target = "_blank", Title="上传视频" }%>
                                                </li>
                                                <li>
                                                    <%= new HtmlAnchor("控制面版") { Href= WebUrl.My()}%>
                                                </li>
                                                <li class="divider"></li>
                                                <li>
                                                    <%= new HtmlAnchor("注销") { Href = WebUrl.Logout() }%>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <script type="text/javascript">
                                        //判断登录状态
                                        if ($.cookie("UserCode") != null && $.cookie("ParentCode") != null) {
                                            $(".logpre").hide();
                                            $(".logafter").show();
                                            $(".logafter .uname").html($.cookie("UserName"));
                                        }
                                        else {
                                            $(".logafter").hide();
                                            $(".logpre").show();
                                        }
                                    </script>
                                </div>
                                <!-- /.nav-collapse -->
                            </div>
                        </div>
                        <!-- /navbar-inner -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
