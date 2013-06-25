<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.Video.List1" %>
<table class="g-table-comm" cellpadding="2px" cellspacing="0px">
    <tr class="thead">
        <th class="wd0">
        </th>
        <th class="wd1 ckb">
            <%= new HtmlCheckBox() { Class = "trSelAll", Title = DefineEnum.全选_不选_本页所有记录.Define(), Lang = ".listContainer .trsel" }%>
        </th>
        <th class="wd2">
        </th>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "Status": //Video_状态
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Status").ToScriptTag() %>',event)">
                <%= Define.Get("Video_状态").HtmlEncode() %>
                <%= OrderBy("Status") %>
            </span>
        </th>
        <%
break;
                    case "VideoUserUserTypeDomainName": //Video_UserUserTypeDomainName_域网站名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_User._UserType._Domain.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_UserUserTypeDomainName_域网站名称").HtmlEncode() %>
                <%= OrderBy("_User._UserType._Domain.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoUserUserTypeDomainCode": //Video_UserUserTypeDomainCode_域域编码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_User._UserType._Domain.Code").ToScriptTag() %>',event)">
                <%= Define.Get("Video_UserUserTypeDomainCode_域域编码").HtmlEncode() %>
                <%= OrderBy("_User._UserType._Domain.Code") %>
            </span>
        </th>
        <%
break;
                    case "VideoUserUserTypeName": //Video_UserUserTypeName_用户类型类型名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_User._UserType.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_UserUserTypeName_用户类型类型名称").HtmlEncode() %>
                <%= OrderBy("_User._UserType.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoUserTrueName": //Video_UserTrueName_真实名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_User.TrueName").ToScriptTag() %>',event)">
                <%= Define.Get("Video_UserTrueName_真实名称").HtmlEncode() %>
                <%= OrderBy("_User.TrueName") %>
            </span>
        </th>
        <%
break;
                    case "VideoUserUserName": //Video_UserUserName_用户名
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_User.UserName").ToScriptTag() %>',event)">
                <%= Define.Get("Video_UserUserName_用户名").HtmlEncode() %>
                <%= OrderBy("_User.UserName") %>
            </span>
        </th>
        <%
break;
                    case "VideoCategoryName": //Video_CategoryName_学科名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Category.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_CategoryName_学科名称").HtmlEncode() %>
                <%= OrderBy("_Category.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoLessonTextbookPressName": //Video_LessonTextbookPressName_出版社出版社名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Lesson._Textbook._Press.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_LessonTextbookPressName_出版社出版社名称").HtmlEncode() %>
                <%= OrderBy("_Lesson._Textbook._Press.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoLessonTextbookGradeName": //Video_LessonTextbookGradeName_年级年级名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Lesson._Textbook._Grade.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_LessonTextbookGradeName_年级年级名称").HtmlEncode() %>
                <%= OrderBy("_Lesson._Textbook._Grade.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoLessonTextbookCategoryName": //Video_LessonTextbookCategoryName_学科学科名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Lesson._Textbook._Category.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_LessonTextbookCategoryName_学科学科名称").HtmlEncode() %>
                <%= OrderBy("_Lesson._Textbook._Category.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoLessonTextbookName": //Video_LessonTextbookName_课本课本名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Lesson._Textbook.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_LessonTextbookName_课本课本名称").HtmlEncode() %>
                <%= OrderBy("_Lesson._Textbook.Name") %>
            </span>
        </th>
        <%
break;
                    case "VideoLessonName": //Video_LessonName_单元课名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_Lesson.Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_LessonName_单元课名称").HtmlEncode() %>
                <%= OrderBy("_Lesson.Name") %>
            </span>
        </th>
        <%
break;
                    case "Name": //Video_视频名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Name").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频名称").HtmlEncode() %>
                <%= OrderBy("Name") %>
            </span>
        </th>
        <%
break;
                    case "Cover": //Video_封面
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Cover").ToScriptTag() %>',event)">
                <%= Define.Get("Video_封面").HtmlEncode() %>
                <%= OrderBy("Cover") %>
            </span>
        </th>
        <%
break;
                    case "Summary": //Video_简介
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Summary").ToScriptTag() %>',event)">
                <%= Define.Get("Video_简介").HtmlEncode() %>
                <%= OrderBy("Summary") %>
            </span>
        </th>
        <%
break;
                    case "FileType": //Video_视频文件类型
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"FileType").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频文件类型").HtmlEncode() %>
                <%= OrderBy("FileType") %>
            </span>
        </th>
        <%
break;
                    case "FileSize": //Video_文件大小
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"FileSize").ToScriptTag() %>',event)">
                <%= Define.Get("Video_文件大小").HtmlEncode() %>
                <%= OrderBy("FileSize") %>
            </span>
        </th>
        <%
break;
                    case "Period": //Video_时长（秒）
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Period").ToScriptTag() %>',event)">
                <%= Define.Get("Video_时长（秒）").HtmlEncode() %>
                <%= OrderBy("Period") %>
            </span>
        </th>
        <%
break;
                    case "VideoView": //Video_视频播放量
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"VideoView").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频播放量").HtmlEncode() %>
                <%= OrderBy("VideoView") %>
            </span>
        </th>
        <%
break;
                    case "CommentCount": //Video_评论数
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"CommentCount").ToScriptTag() %>',event)">
                <%= Define.Get("Video_评论数").HtmlEncode() %>
                <%= OrderBy("CommentCount") %>
            </span>
        </th>
        <%
break;
                    case "CollectCount": //Video_收藏数
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"CollectCount").ToScriptTag() %>',event)">
                <%= Define.Get("Video_收藏数").HtmlEncode() %>
                <%= OrderBy("CollectCount") %>
            </span>
        </th>
        <%
break;
                    case "Copyright": //Video_版权
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Copyright").ToScriptTag() %>',event)">
                <%= Define.Get("Video_版权").HtmlEncode() %>
                <%= OrderBy("Copyright") %>
            </span>
        </th>
        <%
break;
                    case "Share": //Video_是否公开：就是是否共享给其他学校用户
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Share").ToScriptTag() %>',event)">
                <%= Define.Get("Video_观看权限").HtmlEncode() %>
                <%= OrderBy("Share") %>
            </span>
        </th>
        <%
break;
                    case "Lock": //Video_是否加锁
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Lock").ToScriptTag() %>',event)">
                <%= Define.Get("Video_是否加锁").HtmlEncode() %>
                <%= OrderBy("Lock") %>
            </span>
        </th>
        <%
break;
                    case "LockVideoUserUserTypeDomainName": //LockVideo_UserUserTypeDomainName_Lock域网站名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_LockUser._UserType._Domain.Name").ToScriptTag() %>',event)">
                <%= Define.Get("LockVideo_UserUserTypeDomainName_Lock域网站名称").HtmlEncode() %>
                <%= OrderBy("_LockUser._UserType._Domain.Name") %>
            </span>
        </th>
        <%
break;
                    case "LockVideoUserUserTypeDomainCode": //LockVideo_UserUserTypeDomainCode_Lock域域编码
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_LockUser._UserType._Domain.Code").ToScriptTag() %>',event)">
                <%= Define.Get("LockVideo_UserUserTypeDomainCode_Lock域域编码").HtmlEncode() %>
                <%= OrderBy("_LockUser._UserType._Domain.Code") %>
            </span>
        </th>
        <%
break;
                    case "LockVideoUserUserTypeName": //LockVideo_UserUserTypeName_Lock用户类型类型名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_LockUser._UserType.Name").ToScriptTag() %>',event)">
                <%= Define.Get("LockVideo_UserUserTypeName_Lock用户类型类型名称").HtmlEncode() %>
                <%= OrderBy("_LockUser._UserType.Name") %>
            </span>
        </th>
        <%
break;
                    case "LockVideoUserTrueName": //LockVideo_UserTrueName_Lock真实名称
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_LockUser.TrueName").ToScriptTag() %>',event)">
                <%= Define.Get("LockVideo_UserTrueName_Lock真实名称").HtmlEncode() %>
                <%= OrderBy("_LockUser.TrueName") %>
            </span>
        </th>
        <%
break;
                    case "LockVideoUserUserName": //LockVideo_UserUserName_Lock用户名
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"_LockUser.UserName").ToScriptTag() %>',event)">
                <%= Define.Get("LockVideo_UserUserName_Lock用户名").HtmlEncode() %>
                <%= OrderBy("_LockUser.UserName") %>
            </span>
        </th>
        <%
break;
                    case "LockDateTime": //Video_锁定时间
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"LockDateTime").ToScriptTag() %>',event)">
                <%= Define.Get("Video_锁定时间").HtmlEncode() %>
                <%= OrderBy("LockDateTime") %>
            </span>
        </th>
        <%
break;
                    case "LockDescription": //Video_锁定说明
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"LockDescription").ToScriptTag() %>',event)">
                <%= Define.Get("Video_锁定说明").HtmlEncode() %>
                <%= OrderBy("LockDescription") %>
            </span>
        </th>
        <%
break;
                    case "Examine": //Video_审核状态
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Examine").ToScriptTag() %>',event)">
                <%= Define.Get("Video_审核状态").HtmlEncode() %>
                <%= OrderBy("Examine") %>
            </span>
        </th>
        <%
break;
                    case "Description": //Video_描述
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Description").ToScriptTag() %>',event)">
                <%= Define.Get("Video_描述").HtmlEncode() %>
                <%= OrderBy("Description") %>
            </span>
        </th>
        <%
break;
                    case "RecTime": //Video_录制时间
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"RecTime").ToScriptTag() %>',event)">
                <%= Define.Get("Video_录制时间").HtmlEncode() %>
                <%= OrderBy("RecTime") %>
            </span>
        </th>
        <%
break;
                    case "CreateTime": //Video_创建时间
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"CreateTime").ToScriptTag() %>',event)">
                <%= Define.Get("Video_创建时间").HtmlEncode() %>
                <%= OrderBy("CreateTime") %>
            </span>
        </th>
        <%
break;
                    case "VideoConvertStatus": //Video_视频转换结果
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"VideoConvertStatus").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频转换结果").HtmlEncode() %>
                <%= OrderBy("VideoConvertStatus") %>
            </span>
        </th>
        <%
break;
                    case "HasDownload": //Video_视频是否可以下载
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"HasDownload").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频是否可以下载").HtmlEncode() %>
                <%= OrderBy("HasDownload") %>
            </span>
        </th>
        <%
break;
                    case "Spreaker": //Video_主讲人
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"Spreaker").ToScriptTag() %>',event)">
                <%= Define.Get("Video_主讲人").HtmlEncode() %>
                <%= OrderBy("Spreaker") %>
            </span>
        </th>
        <%
break;
                    case "TeacherRatio": //Video_教师比例
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"TeacherRatio").ToScriptTag() %>',event)">
                <%= Define.Get("Video_教师比例").HtmlEncode() %>
                <%= OrderBy("TeacherRatio") %>
            </span>
        </th>
        <%
break;
                    case "StudentRatio": //Video_学生比例
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"StudentRatio").ToScriptTag() %>',event)">
                <%= Define.Get("Video_学生比例").HtmlEncode() %>
                <%= OrderBy("StudentRatio") %>
            </span>
        </th>
        <%
break;
                    case "TransferRatio": //Video_转换率
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"TransferRatio").ToScriptTag() %>',event)">
                <%= Define.Get("Video_转换率").HtmlEncode() %>
                <%= OrderBy("TransferRatio") %>
            </span>
        </th>
        <%
break;
                    case "TeachingType": //Video_授课类型
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"TeachingType").ToScriptTag() %>',event)">
                <%= Define.Get("Video_授课类型").HtmlEncode() %>
                <%= OrderBy("TeachingType") %>
            </span>
        </th>
        <%
break;
                    case "CaptionsFile": //Video_视频字幕
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"CaptionsFile").ToScriptTag() %>',event)">
                <%= Define.Get("Video_视频字幕").HtmlEncode() %>
                <%= OrderBy("CaptionsFile") %>
            </span>
        </th>
        <%
break;
                    case "SortNumber": //Video_排序号
        %>
        <th>
            <span onclick="Sort('<%= UserControlDefine.GetOrder(Query,"SortNumber").ToScriptTag() %>',event)">
                <%= Define.Get("Video_排序号").HtmlEncode() %>
                <%= OrderBy("SortNumber") %>
            </span>
        </th>
        <%
break;
                }
            }
        %>
    </tr>
    <% 
        foreach (var item in this.ListData)
        {
    %>
    <tr class="trout">
        <td class="wd0 summary" title="<%= DefineEnum.点击显示简述.Define() %>" onclick="GetSummary(this,'/Pub/Video/summary','guid=<%= item.Guid %>')">
        </td>
        <td class="wd1 ckb">
            <%= new HtmlCheckBox() { Value= SetKey(item.Guid, item.Version), Class = "trsel", Title = DefineEnum.选择_不选.Define() }%>
        </td>
        <td class="wd2">
            <nobr><a href="edit.aspx?guid=<%= item.Guid %>"><%= DefineEnum.修改.Define() %></a>
                <a href="<%= item.ParentUser.ParentUserType.ParentDomain.RouteWebSite %>/videoplay_<%=item.Guid %>.html" target="_blank">观看</a>
            </nobr>
        </td>
        <%
            foreach (var field in this.Fields)
            {
                switch (field)
                {
                    case "Status":
        %>
        <td>
            <span title="<%= (item.Status != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoStatusEnum)item.Status).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Status != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoStatusEnum)item.Status).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "VideoUserUserTypeDomainName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentUser.ParentUserType.ParentDomain.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentUser.ParentUserType.ParentDomain.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoUserUserTypeDomainCode":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentUser.ParentUserType.ParentDomain.Code", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentUser.ParentUserType.ParentDomain.Code", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoUserUserTypeName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentUser.ParentUserType.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentUser.ParentUserType.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoUserTrueName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentUser.TrueName", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentUser.TrueName", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoUserUserName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentUser.UserName", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentUser.UserName", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoCategoryName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentCategory.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentCategory.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoLessonTextbookPressName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLesson.ParentTextbook.ParentPress.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLesson.ParentTextbook.ParentPress.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoLessonTextbookGradeName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLesson.ParentTextbook.ParentGrade.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLesson.ParentTextbook.ParentGrade.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoLessonTextbookCategoryName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLesson.ParentTextbook.ParentCategory.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLesson.ParentTextbook.ParentCategory.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoLessonTextbookName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLesson.ParentTextbook.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLesson.ParentTextbook.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "VideoLessonName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLesson.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLesson.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "Name":
        %>
        <td>
            <span title="<%= item.Name.ToString(string.Empty).ToScriptTag() %>">
                <%= item.Name %>
            </span>
        </td>
        <%
break;
                    case "Cover":
        %>
        <td>
            <%= IMG(SettingGroup.VideoUploadPath, item.Cover) %>
            <%= item.Cover %>
        </td>
        <%
break;
                    case "Summary":
        %>
        <td>
            <%= new HtmlSpan(item.Summary) { FilterHtml = true, TextLength = 30, Suffix = "...", WideWord = true } %>
        </td>
        <%
break;
                    case "FileType":
        %>
        <td>
            <span title="<%= (item.FileType != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoFileTypeEnum)item.FileType).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.FileType != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoFileTypeEnum)item.FileType).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "FileSize":
        %>
        <td>
            <span title="<%= item.FileSize.ToString(string.Empty).ToScriptTag() %>">
                <%= item.FileSize %>
            </span>
        </td>
        <%
break;
                    case "Period":
        %>
        <td>
            <span title="<%= item.Period.ToString(string.Empty).ToScriptTag() %>">
                <%= item.Period %>
            </span>
        </td>
        <%
break;
                    case "VideoView":
        %>
        <td>
            <span title="<%= item.VideoView.ToString(string.Empty).ToScriptTag() %>">
                <%= item.VideoView %>
            </span>
        </td>
        <%
break;
                    case "CommentCount":
        %>
        <td>
            <span title="<%= item.CommentCount.ToString(string.Empty).ToScriptTag() %>">
                <%= item.CommentCount %>
            </span>
        </td>
        <%
break;
                    case "CollectCount":
        %>
        <td>
            <span title="<%= item.CollectCount.ToString(string.Empty).ToScriptTag() %>">
                <%= item.CollectCount %>
            </span>
        </td>
        <%
break;
                    case "Copyright":
        %>
        <td>
            <span title="<%= (item.Copyright != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoCopyrightEnum)item.Copyright).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Copyright != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoCopyrightEnum)item.Copyright).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "Share":
        %>
        <td>
            <span title="<%= (item.Share != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoShareEnum)item.Share).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Share != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoShareEnum)item.Share).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "Lock":
        %>
        <td>
            <span title="<%= (item.Lock != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoLockEnum)item.Lock).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Lock != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoLockEnum)item.Lock).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "LockVideoUserUserTypeDomainName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLockUser.ParentUserType.ParentDomain.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLockUser.ParentUserType.ParentDomain.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "LockVideoUserUserTypeDomainCode":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLockUser.ParentUserType.ParentDomain.Code", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLockUser.ParentUserType.ParentDomain.Code", item) %>
            </span>
        </td>
        <%
break;
                    case "LockVideoUserUserTypeName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLockUser.ParentUserType.Name", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLockUser.ParentUserType.Name", item) %>
            </span>
        </td>
        <%
break;
                    case "LockVideoUserTrueName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLockUser.TrueName", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLockUser.TrueName", item) %>
            </span>
        </td>
        <%
break;
                    case "LockVideoUserUserName":
        %>
        <td>
            <span title="<%= ViewData.Val("ParentLockUser.UserName", item).ToString(string.Empty).ToScriptTag() %>">
                <%= ViewData.Val("ParentLockUser.UserName", item) %>
            </span>
        </td>
        <%
break;
                    case "LockDateTime":
        %>
        <td>
            <span title="<%= item.LockDateTime.ToString(string.Empty).ToScriptTag() %>">
                <%= item.LockDateTime %>
            </span>
        </td>
        <%
break;
                    case "LockDescription":
        %>
        <td>
            <%= new HtmlSpan(item.LockDescription) { FilterHtml = true, TextLength = 30, Suffix = "...", WideWord = true } %>
        </td>
        <%
break;
                    case "Examine":
        %>
        <td>
            <span title="<%= (item.Examine != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoExamineEnum)item.Examine).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.Examine != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoExamineEnum)item.Examine).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "Description":
        %>
        <td>
            <%= new HtmlSpan(item.Description) { FilterHtml = true, TextLength = 30, Suffix = "...", WideWord = true } %>
        </td>
        <%
break;
                    case "RecTime":
        %>
        <td>
            <span title="<%= item.RecTime.ToDateTimeN().ToAutoShortDate() %>">
                <%= item.RecTime.ToDateTimeN().ToAutoShortDate() %>
            </span>
        </td>
        <%
break;
                    case "CreateTime":
        %>
        <td>
            <span title="<%= item.CreateTime.ToDateTimeN().ToAutoShortDate() %>">
                <%= item.CreateTime.ToDateTimeN().ToAutoShortDate() %>
            </span>
        </td>
        <%
break;
                    case "VideoConvertStatus":
        %>
        <td>
            <span title="<%= (item.VideoConvertStatus != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoVideoConvertStatusEnum)item.VideoConvertStatus).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.VideoConvertStatus != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoVideoConvertStatusEnum)item.VideoConvertStatus).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "HasDownload":
        %>
        <td>
            <span title="<%= item.HasDownload.ToString(string.Empty).ToScriptTag() %>">
                <%= item.HasDownload %>
            </span>
        </td>
        <%
break;
                    case "Spreaker":
        %>
        <td>
            <span title="<%= item.Spreaker.ToString(string.Empty).ToScriptTag() %>">
                <%= item.Spreaker %>
            </span>
        </td>
        <%
break;
                    case "TeacherRatio":
        %>
        <td>
            <span title="<%= item.TeacherRatio.ToString(string.Empty).ToScriptTag() %>">
                <%= item.TeacherRatio != null ? item.TeacherRatio + "%" : null %>
            </span>
        </td>
        <%
break;
                    case "StudentRatio":
        %>
        <td>
            <span title="<%= item.StudentRatio.ToString(string.Empty).ToScriptTag() %>">
                <%= item.StudentRatio != null ? item.StudentRatio + "%" : null %>
            </span>
        </td>
        <%
break;
                    case "TransferRatio":
        %>
        <td>
            <span title="<%= item.TransferRatio.ToString(string.Empty).ToScriptTag() %>">
                <%= item.TransferRatio != null ? item.TransferRatio + "%" : null%>
            </span>
        </td>
        <%
break;
                    case "TeachingType":
        %>
        <td>
            <span title="<%= (item.TeachingType != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoTeachingTypeEnum)item.TeachingType).Define() : null).ToString(string.Empty).ToScriptTag() %>">
                <%= item.TeachingType != null ? ((AVA.ResourcesPlatform.Model.Pub.VideoTeachingTypeEnum)item.TeachingType).Define() : null %>
            </span>
        </td>
        <%
break;
                    case "CaptionsFile":
        %>
        <td>
            <span title="<%= item.CaptionsFile.ToString(string.Empty).ToScriptTag() %>">
                <%= item.CaptionsFile %>
            </span>
        </td>
        <%
break;
                    case "SortNumber":
        %>
        <td>
            <span title="<%= item.SortNumber.ToString(string.Empty).ToScriptTag() %>">
                <%= item.SortNumber %>
            </span>
        </td>
        <%
break;
                }
            }
        %>
    </tr>
        <%
        }
    %>
</table>