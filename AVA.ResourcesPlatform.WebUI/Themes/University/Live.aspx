<%@ Page Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Live" %>

<!DOCTYPE html>
<html>
<head>
    <title>校园直播 -
        <%= this.Title %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


    <%= Import.ScriptTheme("js/moment.min.js")%>
    <%= Import.ScriptTheme("js/underscore-min.js")%>
    <%= Import.ScriptTheme("js/zh-cn.js")%>
    <%= Import.ScriptTheme("js/live.calendar.js")%>

    <%= Import.CSS("style/live.calendar.css")%>

    <%= new HeadInstance(this) { }.ToHtml() %>
</head>
<body>
    <%= new HeaderInstance(this) { Local = "Live", ReplaceItems = new ReplaceItems().Add("HeaderSearch", ReplaceTypeEnum.Html, new SearchLiveMaxInstance(this) { }.ToHtml()) }.ToHtml()%>
    <div class="content" role="main">
        <div class="container">
            <div class="row">
                <div class="span16">
                    <%= new NavInstance(this) { }.Add("校园直播",null).ToHtml()%>
                </div>
                <!-- /span16 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="span16">
                    <div class="searchBox">
                        <div class="tab-content ">
                            <div id="hot" class="tab-pane  active">

                                <h3 class="title">直播列表 </h3>
                                <hr>
                                <div class="live_schedule hor" id="live_schedule" style="margin: 0 auto;">
                                </div>

                                <script type="text/javascript">
                                    var result = "first ";
                                    $(document).ready(function () {
                                        $('#live_schedule').LiveScheduler({ url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.LiveData" });

                                    });
                                </script>
                                <div id="SearchList" class="videolist  clearfix">
                                    <%= new SearchLiveListInstance(this) { PageSize = 20 }.ToHtml()%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%= new FooterInstance(this) { }.ToHtml() %>
</body>
</html>
