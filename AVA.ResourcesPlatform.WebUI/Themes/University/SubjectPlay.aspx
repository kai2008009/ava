<%@ Page Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.SubjectPlay" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <%= this.Subject.Name %>
        -
        <%= this.Video.Name %>
        -
        <%= this.Title %></title>
    <meta name="Description" content="<%= this.Subject.Description.ToScriptTag() %>"  />
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
    <%= Import.ScriptTheme("js/excanvas.min.js")%>
    <%= Import.Script("js", "/YK_Validate/YK_Validate.js")%>
    <%= Import.Script("js", "/YK_Validate/YK_ValidateRegex.js")%>
    <%= Import.CSS("js", "/YK_Validate/validator.css")%>
    <%= Import.Script("/global.aspx")%>
    <%= Import.Script("js", "/global.js")%>
    <%= Import.CSS("style.css")%>
    <%= Import.ScriptTheme("js/libs/jquery.treeview.min.js")%>
    <%= Import.ScriptTheme("js/libs/jquery.rating.pack.js")%>
    <%= Import.ScriptTheme("js/libs/jquery.stupid.js")%>
    <%= Import.ScriptTheme("js/libs/jquery.jqplot.min.js")%>
    <%= Import.ScriptTheme("js/libs/plugins/jqplot.lineRenderer.js")%>
    <%= Import.CSS("style/jquery.jqplot.min.css")%>
    <%= Import.CSS("style/jquery.rating.css")%>
    <%= Import.CSS("style/jquery.stupid.css")%>

    <%= new HeadInstance(this) { }.ToHtml() %>
</head>
<body>
    <%= new BrowserTipInstance(this) { }.ToHtml() %>
    <%= new HeaderInstance(this) { Local = "Subject", ReplaceItems = new ReplaceItems().Add("HeaderSearch", ReplaceTypeEnum.Html, new SearchSubjectMaxInstance(this) { }.ToHtml()) }.ToHtml()%>
    <div class="content" role="main">
        <div class="container">
            <div class="row">
                <div class="span16">
                    <%= new NavInstance(this) { }.Add(this.Subject.Name,WebUrl.SubjectView(this.Subject.Guid)).Add(this.Video.Name,null).ToHtml()%>
                </div>
                <!-- /span16 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="span10">
                    <%= new VideoPlayPlayerInstance(this) { TransferControl="/SubjectPlay/VideoPlayPlayer" }.ToHtml() %>
                    <%
                        if (this.Subject.STEnable == true)
                        {
                    %>
                    <div class="box">
                        <div class="">
                            <div class="">
                                <ul style="list-style: none;" class="tabs">
                                    <li id="thrkSTScoreItem" tabidx="rkSTScoreItem" class=""><a class="btn" id="thrkSTScoreItemHref" href="#divSTScoreItem" data-toggle="tab">评价量表</a></li>                                    
                                    <li id="thrkVideoSWPattern" tabidx="rkVideoSWPattern" class=""><a class="btn" href="#divVideoSWPattern" data-toggle="tab">教学行为分析</a></li>
                                    <li class="active" id="thrkVideoSWPatternGrid" tabidx="rkVideoSWPatternGrid"><a class="btn" href="#divVideoSWPatternGrid" data-toggle="tab">行为分析图</a></li>

                                </ul>
                            </div>

                            <div class="pill-content body">
                                <div data-pills="rkSTScoreItem" id="divSTScoreItem">
                                    <div class="pill-body hor-tabs">
                                        <%= new SubjectPlaySTScoreItemInstance(this) { }.ToHtml() %>
                                    </div>
                                </div>                                
                                <div data-pills="rkVideoSWPattern" id="divVideoSWPattern">
                                    <div class="pill-body">
                                        <%= new VideoPlaySWPatternGridInstance(this) { Width=10 }.ToHtml()%>
                                    </div>
                                </div>

                                <div class="active" data-pills="rkVideoSWPatternGrid" id="divVideoSWPatternGrid">
                                    <div class="pill-body">
                                        <%= new VideoPlaySWPatternInstance(this) { Width=550, Height=450 }.ToHtml()%>
                                    </div>
                                </div>
                            </div>

                            <script type="text/javascript">
                                $(function () {
                                    $('.tabs').tabs();
                                    $('#thrkSTScoreItemHref').click();
                                })

                            </script>

                        </div>
                    </div>
                    <%
                        }
                    %>
                   
                </div>
                <div class="span6">
                    <div class="">
                        <%= new SubjectPlayInfoInstance(this) { }.ToHtml() %>
                        <div class="box" style="display: none;" id="collapseTimeInfoSWAttachment">
                            <div class="accordion body" style="min-height: 0px;">
                                <%= new VideoPlayTimeInfoInstance(this).ToHtml() %>
                                <%= new VideoPlaySWInstance(this).ToHtml() %>
                                <%= new VideoPlayAttachmentInstance(this).ToHtml() %>
                            </div>
                        </div>
                        <script type="text/javascript">
                            if ($("#collapseTimeInfoSWAttachment").find("div").length > 0) {
                                $("#collapseTimeInfoSWAttachment").show();
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%= new FooterInstance(this) { }.ToHtml() %>
    <%= new PVHistoryAddInstance(this) { PKId = this.Subject.Guid, TargetType = "Subject" }.ToHtml()%>
</body>
</html>
