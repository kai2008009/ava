<%@ Page Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.User.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>个人空间 -
        <%= this.Title %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%= Import.CSS("js", "/JQueryUI/css/redmond/jquery-ui-1.8.9.custom.css")%>
    <%= Import.ScriptTheme("js/libs/jquery-1.7.1.min.js")%>
    <%= Import.Script("/URL/jquery.url.js")%>
    <%= Import.Script("/JsonCookie/json2.js")%>
    <%= Import.Script("/JsonCookie/jquery.cookie.js")%>
    <%= Import.Script("/JsonCookie/jquery.jsoncookie.js")%>
    <%= Import.Script("js","/JQueryUI/jquery-ui-1.8.9.custom.min.js")%>
    <%= Import.Script("js", "/YK_Validate/YK_Validate.js")%>
    <%= Import.Script("js", "/YK_Validate/YK_ValidateRegex.js")%>
    <%= Import.CSS("js", "/YK_Validate/validator.css")%>
    <%= Import.Script("/global.aspx")%>
    <%= Import.Script("js", "/global.js")%>
    <%= Import.CSS("style.css")%>
    <%= Import.ScriptTheme("js/libs/bootstrap.calendar.js")%>
    <%= Import.ScriptTheme("js/libs/bootstrap-popover.js")%>
    <%= Import.ScriptTheme("js/libs/bootstrap-tooltip.js")%>
    <%= Import.CSS("js/libs/bootstrap.calendar.css")%>
    
    <%= new HeadInstance(this) { }.ToHtml() %>
</head>
<body>
    <%= new BrowserTipInstance(this) { }.ToHtml() %>
    <%= new HeaderInstance(this) { Local="Index", ReplaceItems = new ReplaceItems().Add("HeaderSearch", ReplaceTypeEnum.Html,new SearchAlbumMaxInstance(this){}.ToHtml()) }.ToHtml()%>
    <div class="content" role="main">
        <div class="container">
            <div class="row">
                <div class="span4">
                    <div class="box mbox ">
                        <div class="head">
                            <div class="title ">
                                <a href="videolist.html" target="_blank" class="blue">名师信息</a>


                            </div>

                        </div>
                        <div class="body">

                            <div class="avatar teacher-b">

                                <%= new HtmlImg(SettingGroup.UserHeadPortraitL(this.LocalUser)) %>
                            </div>

                            <div class="profile-menu">
                                <%= new UserTotalInstance(this) { }.ToHtml()%>
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>浏览量
                                            </td>
                                            <td>
                                                <%= new UserMyGuestInstance(this) { MaxCount = 12 }.ToHtml()%></td>
                                        </tr>
                                </table>
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div>相关用户</div>
                                            </td>
                                        </tr>
                                </table>
                                <div>
                                    <%= new UserRandomInstance(this) { MaxCount= 6 }.ToHtml()%>
                                </div>
                            </div>
                        </div>
                        <%-- end body  --%>
                    </div>
                </div>
                
					
					
                    <div class="span8">
                        <div class="box mbox">
                            <div class="head">
                                <div class="title ">
                                    <a href="videolist.html" target="_blank" class="blue"><strong><%= this.LocalUser.TrueName %></strong>老师</a>
                                </div>

                            </div>
                            <div class="body">
                                <div class="teacher-info">
                                    <div class="brief">
                                        <span>简介：</span>
                                        <%= this.LocalUser.Remark %>
                                    </div>
                                    <hr />
                                    <div class="operate">

                                        <!-- 百度分享 start -->
                                        <div class="share">
                                            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                                                <span class="bds_more">分享到：</span>
                                                <a class="bds_qzone" title="分享到QQ空间" href="#"></a>
                                                <a class="bds_tsina" title="分享到新浪微博" href="#"></a>
                                                <a class="bds_tqq" title="分享到腾讯微博" href="#"></a>
                                                <a class="bds_renren" title="分享到人人网" href="#"></a>
                                            </div>
                                            <script type="text/javascript" id="bdshare_js" data="type=tools&amp;mini=1" src="http://bdimg.share.baidu.com/static/js/bds_s_v2.js?cdnversion=20120903"></script>
                                            <script type="text/javascript" id="bdshell_js" src="http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=16"></script>
                                            <script type="text/javascript">
                                                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
                                            </script>
                                        </div>
                                        <!-- 百度分享 end -->
                                    </div>
                                </div>
                            </div>
                        </div>
					

                        <div class="box mbox">
                            <div class="body well">

                                <ul class="nav nav-tabs tabs">
                                    <li tabidx="wodeshipin" id="wodehipin" class="active">
                                        <a href="#myVideoes" data-toggle="tab">我的视频</a>
                                    </li>
                                    <%--<li tabidx="wodezhuanji" id="wodezhuanji">
                                    <a href="#myAlbum" data-toggle="tab">我的专辑</a>
                                </li>
                                <li tabidx="wodepinlun" id="wodepinlun">
                                    <a href="#myComment" data-toggle="tab">关于我的评论</a>
                                </li>--%>
                                </ul>

                                <div class="pill-content body">
                                    <div id="myVideoes" data-pills="myVideoes" class="active">
                                        <div class="pill-body textlist">

                                            <%= new IndexVideoByInstance(this) { TransferControl="/User/UserVideo", PageSize=12, ParentUserGuid= this.LocalUser.Guid, OrderBy=AVA.ResourcesPlatform.Config.OrderType.时间倒序 }.ToHtml()%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="span4">
                    <div class="box mbox ">
                        <div class="head">
                            <div class="title ">
                                活动日历
                            </div>
                        </div>
                        <div class="body">
                            <div class="datepicker" id="calendar"></div>
                            <script type="text/javascript">
                                var evnts = function () {
                                    return {
                                        "event":
                                            [
                                                 { "date": "01/01/2012", "title": "1" }
                                                , { "date": "02/02/2012", "title": "2" }
                                                , { "date": "03/03/2012", "title": "34" }
                                                , { "date": "04/04/2012", "title": "123" }
                                                , { "date": "05/05/2012", "title": "223" }
                                                , { "date": "06/06/2012", "title": "4" }
                                                , { "date": "07/07/2012", "title": "5" }
                                                , { "date": "08/08/2012", "title": "14" }
                                                , { "date": "09/09/2012", "title": "10" }
                                                , { "date": "10/10/2012", "title": "10" }
                                                , { "date": "11/11/2012", "title": "10<ul><li><a href='#'>sd</a>osdn</li></ul>" }
                                                , { "date": "11/28/2012", "title": "10<ul><li><a href='#'>sd</a>osdn</li></ul>" }
                                                , { "date": "12/12/2012", "title": "10" }
                                            ]
                                    }
                                };
                                $('#calendar').Calendar(
                                    {
                                        'events': evnts,
                                        'weekStart': 1,
                                        'msg_events_header': '活动详情',
                                        msg_days: ["日", "一", "二", "三", "四", "五", "六"],
                                        msg_months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                                        // @todo  add   msg   manger fade pattern
                                        msg_today: '今天'
                                    }
                                    );

                            </script>
                            </div>
                        </div> <%-- end box  --%>
                        <div class="box mbox">
                            <div class="head"><a href="videolist.html" class="title">热门播放</a></div>
                            <div class="body videolist block clearfix">

                                <%= new IndexVideoByInstance(this) { ParentUserGuid = this.LocalUser.Guid,PageSize= 6, OrderBy= AVA.ResourcesPlatform.Config.OrderType.月播放量, TransferControl="/User/UserVideoRanking" }.ToHtml()%>
                            </div>
                        </div>
                    </div>
                </div><!-- end row	-->
			</div>
		</div>
                <%= new FooterInstance(this) { }.ToHtml() %>
                <%= new UserGuestAddInstance(this) { Target = this.LocalUser.Guid }.ToHtml()%>
           
</body>
</html>
