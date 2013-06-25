<%@ Control Language="C#" AutoEventWireup="true" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlayPlayerFlash" %>
<div style="margin-top: 10px;"></div>

<div id="JWPlayerHTML4">这里为多媒体播放器，如果看到当前内容，请确认浏览器开启了脚本支持和Flash插件。</div>
<div style="display: none;">
    <video id="JWPlayerHTML5" height="400" width="570"></video>

</div>

<script type="text/javascript" src='<%= Request.WebPath()+"/Tools/JWPlayer/jwplayer.js" %>'></script>
<script type="text/javascript" src='<%= Request.WebPath()+"/Tools/JWPlayer/jquery.tmpl.min.js" %>'></script>
<script type="text/javascript">
    if ('<%= this.VideoResourcePath.VideoShow %>' == '') {
        alert("未有可播放的视频文件，可能视频文件未转换，或已删除！");
    }
    if ('<%= this.VideoResourcePath.Message %>' != '') {
        alert("<%= this.VideoResourcePath.Message %>");
    }    
    var isFlash = (navigator.userAgent.indexOf("iPad") == -1 && navigator.userAgent.indexOf("iPhone") == -1);
    var nrURL = "<%= this.VideoResourcePath.VideoShow %>";
    var hdURL = "<%= this.VideoResourcePath.HighDefinition %>";
    function changeVideo(pos, statue) {
        if (statue) {
            SwitchBitrate(hdURL);
        }
        else {
            SwitchBitrate(nrURL);
        }
    }
    MP4Player(nrURL, <%= Spot / 1000 %>);
    function MP4Player(url, seek) {
        if (isFlash) {
            //HTML4
            $("#JWPlayerHTML5").parent().hide();
            $("#JWPlayerHTML4").show();
            jwplayer("JWPlayerHTML4").setup({
                flashplayer: '<%= Request.WebPath()+"/Tools/JWPlayer/AvaPlayer.swf" %>',
                controlbar: 'bottom',
                file: FormatHTML5Path(url),
                image: "<%= SettingGroup.VideoCoverL(this.Video) %>",
                provider: 'http',
                autostart: "true",
                streamer: "start",
                height: 400,
                width: 570,
                plugins: {
                    <% if (this.Video._ListVideoTimeInfo.Count > 0)
                       {
                    %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/cueboy.swf" %>': {
                        dockname: '知识点',
                        heading: "<%= this.Video.Name.ToScriptChar() %>",
                        dimensions: '100x50',
                        editable: false,
                        repeatable: false,
                        oncomplete: true,
                        url: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                        file: "<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>",
                        onclick: 'play'
                    },
                    <%
                       }
                    %>
                    <% if (this.Video._ListVideoSW.Count > 0)
                       {
                    %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/cueboysw.swf" %>': {
                        dockname: '微课环节',
                        heading: "<%= this.Video.Name.ToScriptChar() %>",
                        dimensions: '100x50',
                        editable: false,
                        repeatable: false,
                        oncomplete: false,
                        url: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                        file: "<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>",
                        onclick: 'play'
                    },
                    <%
                       }
                    %>
                    <%
    if (!string.IsNullOrEmpty(this.Video.CaptionsFile))
    {
                    %>
                    '<%= Request.WebPath() %>/Tools/JWPlayer/captions.swf':  { file: "<%= Request.WebPath() + SettingGroup.VideoUploadPath + this.Video.Guid + "/" + this.Video.CaptionsFile %>", label: "Chinese" }
                    ,
                    <% 
    }
                    %>
                    <%
    if (!string.IsNullOrEmpty(this.VideoResourcePath.HighDefinition))
    {
                    %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/hdswitcher.swf" %>': {
                        state: url == hdURL,
                        outfunc: 'changeVideo',
                        file: FormatHTML5Path(hdURL)
                    }
                    ,
<% 
    }
%>
                    'NONE':{NONE:"NONE"}
                }
            });
            if (typeof (seek) != "undefined"
            && seek > 0) {
                if (jwplayer("JWPlayerHTML4").getState() != 'PLAYING') {    //若当前未播放，先启动播放器
                    jwplayer("JWPlayerHTML4").play();
                }
                jwplayer("JWPlayerHTML4").seek(seek);
            }
        }
        else {
            //HTML5
            $("#JWPlayerHTML4").hide();
            $("#JWPlayerHTML5").parent().show();
            jwplayer("JWPlayerHTML5").setup({
                controlbar: 'bottom',
                file: url,
                image: "<%= SettingGroup.VideoCoverL(this.Video) %>",
                provider: 'http',
                autostart: "true",
                streamer: "start",
                height: 400,
                width: 570,
                plugins: {
                    <% if (this.Video._ListVideoTimeInfo.Count > 0)
                       {
                    %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/cueboy.swf" %>': {
                        dockname: '知识点',
                        heading: "<%= this.Video.Name.ToScriptChar() %>",
                        dimensions: '100x50',
                        editable: false,
                        repeatable: false,
                        url: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                        file: "<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>",
                        onclick: 'play'
                    },
                    <%
                       }
                    %>
                    <% if (this.Video._ListVideoSW.Count > 0)
                       {
                    %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/cueboysw.swf" %>': {
                        dockname: '微课环节',
                        heading: "<%= this.Video.Name.ToScriptChar() %>",
                        dimensions: '100x50',
                        editable: false,
                        repeatable: false,
                        url: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                        file: "<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>",
                        onclick: 'play'
                    },
                    <%
                       }
                    %>
                    <%
    if (!string.IsNullOrEmpty(this.Video.CaptionsFile))
    {
                    %>
                    '<%= Request.WebPath() %>/Tools/JWPlayer/captions.js':  { file: "<%= Request.WebPath() + SettingGroup.VideoUploadPath + this.Video.Guid + "/" + this.Video.CaptionsFile %>", label: "Chinese" }
                    ,
                    <% 
    }
                    %>
            <%
    if (!string.IsNullOrEmpty(this.VideoResourcePath.HighDefinition))
    {
            %>
                    '<%= Request.WebPath()+"/Tools/JWPlayer/hdswitcher.swf" %>': {
                        state: url == hdURL,
                        outfunc: 'changeVideo',
                        file: FormatHTML5Path(hdURL)
                    }
                    ,
                <% 
    }
                %>
                    'NONE':{NONE:"NONE"}
                },
                modes: [
                                { type: 'html5' },
                                { type: 'flash', src: '<%= Request.WebPath()+"/Tools/JWPlayer/AvaPlayer.swf" %>' }
                ]
            });
                            if (typeof (seek) != "undefined"
                            && seek > 0) {
                                //转换
                                jwplayer("JWPlayerHTML5").seek(seek);
                            }
                        }
                    }

                    function GoToTimeSpot(seek) {
                        seek = seek / 1000;//录播为毫秒
                        if (isFlash) {
                            //HTML4
                            if (typeof (seek) != "undefined"
                            && seek > 0) {
                                if (jwplayer("JWPlayerHTML4").getState() != 'PLAYING') {    //若当前未播放，先启动播放器
                                    jwplayer("JWPlayerHTML4").play();
                                }
                                jwplayer("JWPlayerHTML4").seek(seek);
                            }
                        }
                        else {
                            //HTML5
                            if (jwplayer("JWPlayerHTML5").getState() != 'PLAYING') {    //若当前未播放，先启动播放器
                                jwplayer("JWPlayerHTML5").play();
                            }
                            if (typeof (seek) != "undefined"
                            && seek > 0) {
                                //转换
                                jwplayer("JWPlayerHTML5").seek(seek);
                            }
                        }
                    }

                    function FormatHTML5Path(url) {
                        var temp1 = '<%= this.VideoResourcePath.RouteWebSite %>';
                        var temp2 = '<%= this.VideoResourcePath.RouteRecourseSite %>';
                        url = url.replace(temp1, temp2);
                        return url;
                    }

                    function SwitchBitrate(url) {
                        var position = 0;
                        if (isFlash) {
                            var position = jwplayer("JWPlayerHTML4").getPosition();
                            if (position == null || typeof (position) == "undefined") {
                                position = 0;
                            }
                        }
                        else {
                            var position = jwplayer("JWPlayerHTML5").getPosition();
                            if (position == null || typeof (position) == "undefined") {
                                position = 0;
                            }
                        }
                        MP4Player2(url, position);
                    }

                    function MP4Player2(url, seek) {
                        if (isFlash) {
                            //HTML4
                            $("#JWPlayerHTML5").parent().hide();
                            $("#JWPlayerHTML4").show();
                            jwplayer("JWPlayerHTML4").load({
                                flashplayer: '<%= Request.WebPath()+"/Tools/JWPlayer/AvaPlayer.swf" %>',
                                file: FormatHTML5Path(url),
                                //image: "<%= SettingGroup.VideoCoverL(this.Video) %>",
                                provider: 'http',
                                autostart: "true",
                                streamer: "start"
                            });
                            if (typeof (seek) != "undefined"
                                && seek > 0) {
                                //转换
                                jwplayer("JWPlayerHTML4").seek(seek);
                            }
                        }
                        else {
                            //HTML5
                            $("#JWPlayerHTML4").hide();
                            $("#JWPlayerHTML5").parent().show();
                            jwplayer("JWPlayerHTML5").load({
                                file: url,
                                //image: "<%= SettingGroup.VideoCoverL(this.Video) %>",
                                provider: 'http',
                                autostart: "true",
                                streamer: "start",
                                modes: [
                                    { type: 'html5' },
                                    { type: 'flash', src: '<%= Request.WebPath()+"/Tools/JWPlayer/AvaPlayer.swf" %>' }
                                ]
                            });
                                if (typeof (seek) != "undefined"
                                    && seek > 0) {
                                    //转换
                                    jwplayer("JWPlayerHTML5").seek(seek);
                                }
                            }
                        }

</script>

<div>
    <div class="well">
        <div class="toggle-info" title="课程详细信息" id="toggle-info">
            <h3>课程详细信息</h3>

            <p>
                <%= this.Video.Description.RestoreHtml() %>
            </p>


        </div>
        <div>
            <a href="#" class="toggle-info-btn t" rel="toggle-info" title="切换显示详细信息"><span>切换显示详细信息</span></a>

            <%
                if (this.VideoResourcePath.SHD != "")
                {
            %>
            <%= new HtmlAnchor("超高清") { Class = "btn SwitchBitrate", Href = "#SHD", OnClick = "SwitchBitrate('" + this.VideoResourcePath.SHD + "');return false;" }.Style(new { Display="none"})%>
            &nbsp;
            <% 
                }
            %>
            <%
                if (this.VideoResourcePath.HD != "")
                {
            %>
            <%= new HtmlAnchor("高清") { Class="btn SwitchBitrate", Href = "#HD", OnClick="SwitchBitrate('"+this.VideoResourcePath.HD+"');return false;" }.Style(new { Display="none"})%>
            &nbsp;
            <% 
                }
            %>
            <%
                if (this.VideoResourcePath.NR != "")
                {
            %>
            <%= new HtmlAnchor("标清") { Class="btn SwitchBitrate", Href = "#NR", OnClick="SwitchBitrate('"+this.VideoResourcePath.NR+"');return false;" }.Style(new { Display="none"})%>
            &nbsp;
            <% 
                }
            %>
            <%
                if (this.VideoResourcePath.LW != "")
                {
            %>
            <%= new HtmlAnchor("流畅") { Class="btn SwitchBitrate", Href = "#LW", OnClick="SwitchBitrate('"+this.VideoResourcePath.LW+"');return false;" }.Style(new { Display="none"})%>
            &nbsp;
            <% 
                }
            %>
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
                    
                </div>
                <!-- 百度分享 end -->
            </div>
            <div class="pull-right">
                <label>分享代码</label>
                <input id="share_it_content" value="" type="text" style="width:160px;" />
                <input type="button" id="share_it" class="btn" value="复制" onclick="setcopy('share_it_content');" />

            </div>
            <%
                if (this.Video.HasDownload == true)
                {
            %>
            &nbsp;
            <%= new HtmlAnchor("下载") { Class = "btn pull-right", OnClick="alert(\"如果视频不能正常下载，请用右键别存为的方式下载，下载后请将视频文件名更改为："+this.Video.FileName.Replace("'","").Replace

("\"","")+"\")", Target = "_blank", Href = SettingGroup.VideoFileDownload(this.Video) }.Style(new { margin_right="10px"  })%>
            &nbsp;
            <% 
                }
            %>
        </div>
        <script type="text/javascript">
            if (isFlash == false) {
                $(".SwitchBitrate").show();
            }
        </script>
        <script>

            var jwplayerConfig = "abc";
            $(document).ready(function () {
                if (undefined !== $.template) {
                    if ($('#share_it').length > 0) {
                        jwplayerConfig = [{
                            base_path: '<%= Request.WebPath() %>',
                            file: '<%= this.VideoResourcePath.VideoShow %>',
                            image: "<%= SettingGroup.VideoCoverL(this.Video) %>",
                            player_path: '<%= Request.WebPath()+"/Tools/JWPlayer/AvaPlayer.swf" %>',
                            cue_boy_path: '<%= Request.WebPath()+"/Tools/JWPlayer/cueboy.swf" %>',
                            cue_url_path: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                            cue_file_path: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoTimeInfoXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                            cue_heading: '<%= this.Video.Name.ToScriptChar() %>',
                            weike_path: '<%= Request.WebPath()+"/Tools/JWPlayer/cueboysw.swf" %>',
                            weike_dockname: '微课环节',
                            weike_heading: '<%= this.Video.Name.ToScriptChar() %>',
                            weike_dimensions: '100x50',
                            weike_editable: false,
                            weike_url: '<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXMLAdd.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>',
                            weike_file: "<%= Request.WebPath() %>/Tools/JWPlayer/Service/VideoSWXML.aspx?Guid=<%= this.Video.Guid %>&TemplateGuid=<%= new Random().Next() %>"
                        }];
                        if (!is_ie) {
                            var markup = '<object type="application/x-shockwave-flash" data="${player_path}" width="100%" height="100%" bgcolor="#000000" id="mediaPlayer" name="mediaPlayer" tabindex="0"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="seamlesstabbing" value="true"><param name="wmode" value="opaque"><param name="flashvars" value="netstreambasepath=${base_path}&amp;id=mediaPlayer&amp;levels=%5B%5BJSON%5D%5D%5B%5D&amp;file=${file}&amp;plugins=${cue_boy_path}&amp;cueboy.file=${cue_file_path}&amp;cueboy.dockname=%E6%89%93%E7%82%B9%E4%BF%A1%E6%81%AF&amp;cueboy.heading=${cue_heading}&amp;cueboy.dimensions=100x48&amp;cueboy.onclick=play&amp;cueboy.editable=true&amp;cueboy.pluginmode=FLASH&amp;controlbar.position=over"></object>';

                            $.template("shareItTemplate", markup);

                            $('#share_it_content').val($('<div>').append($.tmpl("shareItTemplate", jwplayerConfig).clone()).html());



                        } else {
                            var markup = '<object type="application/x-shockwave-flash" data="${player_path}" width="100%" height="100%" bgcolor="#000000" id="mediaPlayer" name="mediaPlayer" tabindex="0">';

                            var markup_param = '<param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="seamlesstabbing" value="true"><param name="wmode" value="opaque"><param name="flashvars" value="netstreambasepath=${base_path}&amp;id=mediaPlayer&amp;levels=%5B%5BJSON%5D%5D%5B%5D&amp;file=${file}&amp;plugins=${cue_boy_path}&amp;cueboy.file=${cue_file_path}&amp;cueboy.dockname=%E6%89%93%E7%82%B9%E4%BF%A1%E6%81%AF&amp;cueboy.heading=${cue_heading}&amp;cueboy.dimensions=100x48&amp;cueboy.onclick=play&amp;cueboy.editable=true&amp;cueboy.pluginmode=FLASH&amp;controlbar.position=over">';



                            $.template("shareItTemplate", markup);
                            $.template("shareItTemplate_param", markup_param);
                            var temp = $.tmpl("shareItTemplate", jwplayerConfig).clone();
                            var temparam = $.tmpl("shareItTemplate_param", jwplayerConfig).clone();
                            $('#share_it_content').val($('<div>').append(temp).html().replace('</div></OBJECT>', '') + $('<div>').append(temparam).html() + '</object>');


                        }


                    }
                }
            });


        </script>

    </div>
</div>
<div class="clear">
</div>
<hr />
