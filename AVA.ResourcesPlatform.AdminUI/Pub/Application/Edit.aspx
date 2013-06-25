<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="AVA.ResourcesPlatform.AdminUI.Pub.Application.Edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
        <%= this.Title %></title>
    <%= Import.Theme() %>
</head>
<body>
    <div id="divMain" class="gContent">
        <div class="gCnta">
            <div class="gCnta-cont">
                <div class="g-title-2">
                    <div class="ico-loading right hidden">
                    </div>
                    <div title="<%= DefineEnum.点击查看帮助.Define().ToScriptTag() %>" class="ico-question right">
                    </div>
                    <h3 class="txt-14">
                        <%= Title %></h3>
                    <span class="txt-info">[<a href="#" onclick="GoList();return false;"><%= DefineEnum.返回.Define() %></a>]</span>
                    <span class="txt-info">[<a href="InportEdit.aspx">导入课表</a>]</span>
                </div>
                <div class="gWel-tab">
                    <div class="tabs txt-link">
                        <ul>
                            <li>预约申请信息 </li>
                            <%
                                if (Has(this.ViewData["_Application"]))
                                {
                            %>
                            <li>关联学科 </li>
                            <li>关联频道 </li>
                            <% 
                                }
                            %>
                        </ul>
                    </div>
                    <div class="pans">
                        <div style="display: none;" class="panel">
                            <div>
                                <form id="frmApplication" action="" onsubmit="return false;">
                                    <div>
                                        <table class="g-table-cntacomm">
                                            <tr>
                                                <th title="<%= Define.Get("Application_所属用户").ToScriptTag() %>">
                                                    <%= Define.Get("Application_所属用户").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("ParentUser_TrueName_UserName", IN(this.ViewData["_Application"], this.ViewData["_Application.ParentUser.TrueName"] + "[" + this.ViewData["_Application.ParentUser.UserName"] + "]")) { ReadOnly = true, Class = "ipt-t ipt-t-dft", OnBlur = "$.validator.itemValid(&quot;#frmApplication [name=ParentUser]&quot;,&quot;Edit&quot;);" }%>
                                                    <%= new HtmlHidden("ParentUser", this.ViewData["_Application.ParentUser.Guid"])%>
                                                    <a href="#selectUser" class="decoration-none" onclick="return SelectUser('#frmApplication [name=ParentUser]','#frmApplication [name=ParentUser_TrueName_UserName]')"><span class="txt-info">[<%= DefineEnum.选择.Define() %>]</span></a> <a href="#clear" class="decoration-none select-clear hidden"><span class="txt-info">[<%= DefineEnum.清空.Define() %>]</span></a>
                                                    <%= new HtmlYKTip("ParentUser") %>
                                                </td>
                                            </tr>
                                            <tr style='<%= IN(this.ViewData["_Application"], "", "display:none;")%>'>
                                                <th title="<%= Define.Get("Application_RecordEquipmentDomainName_域网站名称").ToScriptTag() %>">
                                                    <%= Define.Get("Application_RecordEquipmentDomainName_域网站名称").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText(null, this.ViewData["_Application.ParentRecordEquipment.ParentDomain.Name"]) { ReadOnly = true, Disabled = true, Class = "ipt-t ipt-t-dft" }%>
                                                </td>
                                            </tr>
                                            <tr style='<%= IN(this.ViewData["_Application"], "", "display:none;")%>'>
                                                <th title="<%= Define.Get("Application_RecordEquipmentDomainCode_域域编码").ToScriptTag() %>">
                                                    <%= Define.Get("Application_RecordEquipmentDomainCode_域域编码").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText(null, this.ViewData["_Application.ParentRecordEquipment.ParentDomain.Code"]) { ReadOnly = true, Disabled = true, Class = "ipt-t ipt-t-dft" }%>
                                                </td>
                                            </tr>
                                            <%
                                                if (Has(this.ViewData["_Application"]) == false)
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_所属录播设备").ToScriptTag() %>">
                                                    <%= Define.Get("Application_所属录播设备").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%
                                                    foreach (var recordEquipment in this.ListRecordEquipment)
                                                    {
                                                    %>
                                                    <label for="recordEquipment<%= recordEquipment.Guid %>">
                                                        <%= new HtmlCheckBox("ParentRecordEquipment", recordEquipment.Guid, "") { ID="recordEquipment"+ recordEquipment.Guid }%>
                                                        <%= recordEquipment.Name %><%--(<%= recordEquipment.IPAddress %>)--%>
                                                    </label>
                                                    <% 
                                                    }
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                    
                                                }
                                                else
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_所属录播设备").ToScriptTag() %>">
                                                    <%= Define.Get("Application_所属录播设备").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("ParentRecordEquipmentName", Has(this.ViewData["_Application.ParentRecordEquipment"]) ? this.ViewData["_Application.ParentRecordEquipment.Name"] : (this.RecordEquipment != null ? this.RecordEquipment.Name : "")) { ReadOnly = true, Class = "ipt-t ipt-t-dft", Disabled = Has(this.ViewData["_Application"]) }%>
                                                    <%
                                                    if (Has(this.ViewData["_Application"]) == false)
                                                    {
                                                    %>
                                                    <%= new HtmlHidden("ParentRecordEquipment", Has(this.ViewData["_Application.ParentRecordEquipment"]) ? this.ViewData["_Application.ParentRecordEquipment.Guid"] : (this.RecordEquipment != null ? this.RecordEquipment.Guid : "")) { OnChange = "GetTimeRange();" }%>
                                                    <a href="#selectRecordEquipment" class="decoration-none" onclick="return SelectRecordEquipment('#frmApplication [name=ParentRecordEquipment]','#frmApplication [name=ParentRecordEquipmentName]')"><span class="txt-info">[<%= DefineEnum.选择.Define() %>]</span></a> <a href="#clear" class="decoration-none select-clear hidden"><span class="txt-info">[<%= DefineEnum.清空.Define() %>]</span></a>
                                                    <%= new HtmlYKTip("ParentRecordEquipment") %>
                                                    <%
                                                    } 
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_申请日期").ToScriptTag() %>">
                                                    <%= Define.Get("Application_申请日期").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("ApplicationDate", this.ViewData["_Application.ApplicationDate"].ToDateTimeN().ToShortDate()) { Class = "ipt-t ipt-t-dft date ", ReadOnly = Has(this.ViewData["_Application"]), Disabled = Has(this.ViewData["_Application"]), OnChange = "GetTimeRange();" }%>
                                                    <%= new HtmlYKTip("ApplicationDate") %>
                                                </td>
                                            </tr>
                                            <%
                                                if (Has(this.ViewData["_Application"]))
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_开始时间").ToScriptTag() %>">
                                                    <%= Define.Get("Application_开始时间").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("StartTime", this.ViewData["_Application.StartTime"].ToDateTimeN().ToTime()) { Class = "ipt-t ipt-t-dft time" }%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_结束时间").ToScriptTag() %>">
                                                    <%= Define.Get("Application_结束时间").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("EndTime", this.ViewData["_Application.EndTime"].ToDateTimeN().ToTime()) { Class = "ipt-t ipt-t-dft time " }%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("ApplicationTimeSetting_申请时间段").ToScriptTag() %>">
                                                    <%= Define.Get("ApplicationTimeSetting_申请时间段").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <div id="divTimeRange">
                                                        请先选择申请用户所属设备和申请日期
                                                    </div>
                                                </td>
                                            </tr>
                                            <% 
                                                }
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_所属年级").ToScriptTag() %>">
                                                    <%= Define.Get("Application_所属年级").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("ParentGrade_Name", IN(this.ViewData["_Application"], this.ViewData["_Application.ParentGrade.Name"])) { ReadOnly = true, Class = "ipt-t ipt-t-dft" }%>
                                                    <%= new HtmlHidden("ParentGrade", this.ViewData["_Application.ParentGrade.Guid"])%>
                                                    <a href="#selectGrade" class="decoration-none" onclick="return SelectGradeLast('#frmApplication [name=ParentGrade]','#frmApplication [name=ParentGrade_Name]')"><span class="txt-info">[<%= DefineEnum.选择.Define() %>]</span></a>
                                                    <a href="#clear" class="decoration-none select-clear hidden"><span class="txt-info">[<%= DefineEnum.清空.Define() %>]</span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_封面").ToScriptTag() %>">
                                                    <%= Define.Get("Application_封面").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlHidden("Cover", ViewData["_Application.Cover"])%>
                                                    <%= new HtmlImg(SettingGroup.NonePic) { Class = "default-image"}%>
                                                    <br />
                                                    <a href="#deleteCover" class="delete-image decoration-none hidden"><span class="txt-info">[<%= DefineEnum.删除.Define() %>]</span></a> <a href="#uploadCover" class="decoration-none" onclick="return UploadFile('#frmApplication [name=Cover]','<%= Define.Get("Application_Cover_录播预约申请封面上传")%>','0','<%= SettingGroup.ApplicationUploadPath %>','','480', '300')"><span class="txt-info">[<%=  DefineEnum.图片上传.Define() %>]</span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_主讲人").ToScriptTag() %>">
                                                    <%= Define.Get("Application_主讲人").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("Speaker", this.ViewData["_Application.Speaker"], 200) { Class = "ipt-t ipt-t-dft " }%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_标题").ToScriptTag() %>">
                                                    <%= Define.Get("Application_标题").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("Title", this.ViewData["_Application.Title"], 200) { Class = "ipt-t ipt-t-dft " }%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_是否对外公开").ToScriptTag() %>">
                                                    <%= Define.Get("Application_是否对外公开").HtmlEncode() %>：
                                                </th>
                                                <td class="tooltip" title="<%= Define.Get("Application_Share_将当前直播对整个域用户公开").ToScriptTag()%>">
                                                    <%= new HtmlRadio("Share", this.ViewData["_Application.Share"].ToInt(-1) == 0, 0, null) { ID = "Application_Share_0" }.Style(new { Width = "auto" })%>
                                                    <label for="Application_Share_0">
                                                        自己</label>
                                                    <%= new HtmlRadio("Share", this.ViewData["_Application.Share"].ToInt(-1) == 1, 1, null) { ID = "Application_Share_1" }.Style(new { Width = "auto" })%>
                                                    <label for="Application_Share_1">
                                                        本校</label>
                                                    <%= new HtmlRadio("Share", this.ViewData["_Application.Share"].ToInt(-1) == 2, 2, null) { ID = "Application_Share_2" }.Style(new { Width = "auto" })%>
                                                    <label for="Application_Share_2">
                                                        全部</label>
                                                    <%= new HtmlYKTip("Share") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_申请说明").ToScriptTag() %>">
                                                    <%= Define.Get("Application_申请说明").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlTextArea("Description", this.ViewData["_Application.Description"], 2000) { Class = "ipt-t ipt-t-dft width400 height100"}%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_到场人数").ToScriptTag() %>">
                                                    <%= Define.Get("Application_到场人数").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("NumberOfPeople", this.ViewData["_Application.NumberOfPeople"]) { Class = "ipt-t ipt-t-dft " }%>
                                                    <%= new HtmlYKTip("NumberOfPeople") %>
                                                </td>
                                            </tr>
                                            <%
                                                if (Has(this.ViewData["_Application.ParentDealUser"]) == true)
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_审批用户").ToScriptTag() %>">
                                                    <%= Define.Get("Application_审批用户").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("DealUserGuid", this.ViewData["_Application.ParentDealUser.UserName"], 32) { ReadOnly = true, Disabled = true, Class = "ipt-t ipt-t-dft " }%>
                                                    <%= new HtmlYKTip("ParentDealUser")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_审批日期").ToScriptTag() %>">
                                                    <%= Define.Get("Application_审批日期").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("DealTime", this.ViewData["_Application.DealTime"].ToDateTimeN().ToLongDate()) { Class = "ipt-t ipt-t-dft datetime " }%>
                                                    <%= new HtmlYKTip("DealTime")%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_审批说明").ToScriptTag() %>">
                                                    <%= Define.Get("Application_审批说明").HtmlEncode() %>：
                                                </th>
                                                <td>
                                                    <%= new HtmlTextArea("DealRemark", this.ViewData["_Application.DealRemark"], 2000) { Class = "ipt-t ipt-t-dft width400 height100"}%>
                                                </td>
                                            </tr>
                                            <%
                                                if (Has(this.ViewData["_Application"]) == true
                                                    && this.ViewData["_Application.ConfirmRemark"] != null)
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("确认说明").ToScriptTag() %>">
                                                    <%= Define.Get("确认说明").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlTextArea("ConfirmRemark", this.ViewData["_Application.ConfirmRemark"], 2000) { Class = "ipt-t ipt-t-dft width400 height100" }%>
                                                </td>
                                            </tr>
                                            <% 
                                                }
                                                else if (Has(this.ViewData["_Application"]) == true
                                                    && this.ViewData["_Application.Stauts"].ToInt() != (int)AVA.ResourcesPlatform.Model.Pub.ApplicationStatusEnum.批准)
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("确认说明").ToScriptTag() %>">
                                                    <%= Define.Get("确认说明").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlTextArea("ConfirmRemark", this.ViewData["_Application.ConfirmRemark"], 2000) { Class = "ipt-t ipt-t-dft width400 height100" }%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <td>
                                                    <span>
                                                        <%= new HtmlButton("Send", "ConfirmApp", "ConfirmApp(this);") { Class = "hidden" }%>
                                                        <div onclick="ConfirmApp(this);" class="btn btn-dft btn-dft-impt">
                                                            <span>
                                                                <%= Define.Get("确认").HtmlEncode()%></span>
                                                        </div>
                                                    </span>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                        
                                            %>
                                        </table>
                                        <%
                                            if (Has(this.ViewData["_Application"]) == true)
                                            {
                                        %>
                                        <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                                        </div>
                                        <table class="g-table-cntacomm">
                                            <%
                                                if (Has(this.ViewData["_Application.ParentCancelUser"]) == true)
                                                {
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_拒绝用户").ToScriptTag() %>">
                                                    <%= Define.Get("Application_拒绝用户").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("CancelUserGuid", this.ViewData["_Application.ParentCancelUser.UserName"], 32) { Class = "ipt-t ipt-t-dft " }%>
                                                    <%= new HtmlYKTip("ParentCancelUser")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th title="<%= Define.Get("Application_拒绝日期").ToScriptTag() %>">
                                                    <%= Define.Get("Application_拒绝日期").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlText("CancelTime", this.ViewData["_Application.CancelTime"].ToDateTimeN().ToLongDate()) { Class = "ipt-t ipt-t-dft datetime " }%>
                                                    <%= new HtmlYKTip("CancelTime")%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            <tr>
                                                <th title="<%= Define.Get("Application_拒绝说明").ToScriptTag() %>">
                                                    <%= Define.Get("Application_拒绝说明").HtmlEncode()%>：
                                                </th>
                                                <td>
                                                    <%= new HtmlTextArea("CancelRemark", this.ViewData["_Application.CancelRemark"], 2000) { Class = "ipt-t ipt-t-dft width400 height100" }%>
                                                </td>
                                            </tr>
                                        </table>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div style="margin-top: -1px;" class="ln-thin ln-c-mid">
                                    </div>
                                    <table class="g-table-cntacomm">
                                        <%--<tr>
                            <th title="<%= Define.Get("Application_状态").ToScriptTag() %>">
                                <%= Define.Get("Application_状态")%>：
                            </th>
                            <td class="tooltip" title="<%= Define.Get("Application_Status_标示记录是否有效").ToScriptTag()%>">
                                <%= new HtmlCheckBox("Status", this.ViewData["_Application.Status"], 1, 0) { DefaultChecked = 0 }%>
                            </td>
                        </tr>--%>
                                        <tr>
                                            <th></th>
                                            <td>
                                                <%
                                                    if (Has(this.ViewData["_Application"]) == false)
                                                    {
                                                %>
                                                <%= new HtmlHidden("KEY", KEY)%>
                                                <%= new HtmlSubmit("Send", "Edit", GetSubmitMothed(this.ViewData["_Application"])) { Class = "hidden" }%>
                                                <div onclick="$(this).siblings(':submit')[0].click();" class="btn btn-dft btn-dft-impt">
                                                    <span>
                                                        <%= GetSubmitText(this.ViewData["_Application"])%></span>
                                                </div>
                                                <%
                                                    }
                                                    else if (this.ViewData["_Application.Status"].ToIntN() == (int)AVA.ResourcesPlatform.Model.Pub.ApplicationStatusEnum.批准
                                                        || this.ViewData["_Application.Status"].ToIntN() == (int)AVA.ResourcesPlatform.Model.Pub.ApplicationStatusEnum.确认)
                                                    {
                                                %>
                                                <%= new HtmlHidden("KEY", KEY)%>
                                                <span>
                                                    <%= new HtmlButton("Send", "Update", "Update(this);") { Class = "hidden" }%>
                                                    <div onclick="Update(this);" class="btn btn-dft btn-dft-impt">
                                                        <span>修改</span>
                                                    </div>
                                                </span>
                                                <span>
                                                    <%= new HtmlButton("Send", "Cancel", "Cancel(this);") { Class = "hidden" }%>
                                                    <div onclick="Cancel(this);" class="btn btn-dft btn-dft-impt">
                                                        <span>
                                                            <%= Define.Get("Application_作废").HtmlEncode()%></span>
                                                    </div>
                                                </span>
                                                <% 
                                                    }
                                                    else if (this.ViewData["_Application.Status"].ToIntN() == (int)AVA.ResourcesPlatform.Model.Pub.ApplicationStatusEnum.申请)
                                                    {
                                                %>
                                                <%= new HtmlHidden("KEY", KEY)%>
                                                <span>
                                                    <%= new HtmlButton("Send", "Update", "Update(this);") { Class = "hidden" }%>
                                                    <div onclick="Update(this);" class="btn btn-dft btn-dft-impt">
                                                        <span>修改</span>
                                                    </div>
                                                </span>
                                                <span>
                                                    <%= new HtmlButton("Send", "Apply", "Apply(this);") { Class = "hidden" }%>
                                                    <div onclick="Apply(this);" class="btn btn-dft btn-dft-impt">
                                                        <span>
                                                            <%= Define.Get("Application_批准").HtmlEncode()%></span>
                                                    </div>
                                                </span>
                                                <span>
                                                    <%= new HtmlButton("Send", "Cancel", "Cancel(this);") { Class = "hidden" }%>
                                                    <div onclick="Cancel(this);" class="btn btn-dft btn-dft-impt">
                                                        <span>
                                                            <%= Define.Get("Application_作废").HtmlEncode()%></span>
                                                    </div>
                                                </span>
                                                <%
                                                    }
                                                    else if (this.ViewData["_Application.Status"].ToIntN() == (int)AVA.ResourcesPlatform.Model.Pub.ApplicationStatusEnum.拒绝)
                                                    {
                                                %>
                                                <% 
                                                    }
                                                %>
                                                <div title="" onclick="GoList();" class="btn btn-dft">
                                                    <span>
                                                        <%= DefineEnum.返_回.Define() %></span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <%
                            if (Has(this.ViewData["_Application"]))
                            {
                        %>

                        <div style="display: none; padding: 0px 0px 0px 0px;" class="panel">
                            <div>
                                <iframe class="ifrmtab" width="100% " height="100% " frameborder="0" scrolling="auto" title="../ApplicationCategory/ListIFrame.aspx?ApplicationGuid=<%= this.PrimaryKey %>"></iframe>
                            </div>
                        </div>
                        <div style="display: none; padding: 0px 0px 0px 0px;" class="panel">
                            <div>
                                <iframe class="ifrmtab" width="100% " height="100% " frameborder="0" scrolling="auto" title="../ApplicationChannel/ListIFrame.aspx?ApplicationGuid=<%= this.PrimaryKey %>"></iframe>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%= Import.Script("/jquery-1.44.min.js")%>
<%= Import.Script("js","/JQueryUI/jquery-ui-1.8.9.custom.min.js")%>
<%= Import.Script("js", "/XhEditor/xheditor-zh-cn.min.js")%>
<%= Import.Script("js", "/YK_Validate/YK_Validate.js")%>
<%= Import.Script("js", "/YK_Validate/YK_ValidateRegex.js")%>
<%= Import.CSS("js", "/YK_Validate/validator.css")%>
<%= Import.Script("js","/FancyBox/jquery.fancybox-1.2.1.js")%>
<%= Import.CSS("js", "/FancyBox/jquery.fancybox.css")%>
<%= Import.Script("/ToolTip/jquery.tipsy.js")%>
<%= Import.Script("/URL/jquery.url.js")%>
<%= Import.Script("/JsonCookie/json2.js")%>
<%= Import.Script("/JsonCookie/jquery.cookie.js")%>
<%= Import.Script("/JsonCookie/jquery.jsoncookie.js")%>
<%= Import.Script("/global.aspx")%>
<%= Import.Script("/SelectForm.js")%>
<%= Import.Script("js", "/global.js")%>
<%= Import.Script("js", "/Public.js")%>
<%= Import.Script("js", "/ListPublic.js")%>
<%= Import.Script("js", "/Ajax/Pub/ApplicationAjax.js")%>
<script type="text/javascript">
    //验证方法
    //验证控件
    $.validator.initConfig({ validatorGroup: "Edit", form: "#frmApplication" });
    //    //排序号
    //    $("#frmApplication [name=SortNumber]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            required: null,
    //            regex: "num1"
    //        },
    //        message:
    //        {
    //            required: "<%= Define.Get("Application_SortNumber_排序号不能为空").ToScriptChar() %>",
    //            regex: "<%= Define.Get("Application_SortNumber_排序号应为数字").ToScriptChar() %>"
    //        }
    //    });
    //所属用户
    $("#frmApplication [name=ParentUser]").formValidator({
        targetFocus: "#frmApplication [name=ParentUser_TrueName_UserName]",
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("Application_UserGuid_请选择所属用户").ToScriptChar() %>"
        }
    });
    <%
    if (Has(this.ViewData["_Application"]) == false)
    {
                                %>
    //所属录播设备
    $("#frmApplication [name=ParentRecordEquipment]").formValidator({
        targetFocus: "#frmApplication [name=ParentRecordEquipment_Name]",
        validatorGroup: "Edit",
        rules:
        {
            required: null
        },
        message:
        {
            required: "<%= Define.Get("Application_RecordEquipmentGuid_请选择所属录播设备").ToScriptChar() %>"
        }
    });
    <%} %>
    //申请日期
    $("#frmApplication [name=ApplicationDate]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            required: null,
            regex: "date"
        },
        message:
        {
            required: "<%= Define.Get("Application_ApplicationDate_请选择申请日期").ToScriptChar() %>",
            regex: "<%= Define.Get("Application_ApplicationDate_申请日期格式不正确").ToScriptChar() %>"
        }
    });
    //观看权限
    $("#frmApplication [name=Share]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            min: 1
        },
        message:
        {
            min: "请选择观看权限"
        }
    });
    //    //开始时间
    //    $("#frmApplication [name=StartTime]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            required: null,
    //            regex: "date"
    //        },
    //        message:
    //        {
    //            required: "<%= Define.Get("Application_StartTime_请选择开始时间").ToScriptChar() %>",
    //            regex: "<%= Define.Get("Application_StartTime_开始时间格式不正确").ToScriptChar() %>"
    //        }
    //    });
    //    //结束时间
    //    $("#frmApplication [name=EndTime]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            required: null,
    //            regex: "date"
    //        },
    //        message:
    //        {
    //            required: "<%= Define.Get("Application_EndTime_请选择结束时间").ToScriptChar() %>",
    //            regex: "<%= Define.Get("Application_EndTime_结束时间格式不正确").ToScriptChar() %>"
    //        }
    //    });
    //到场人数
    $("#frmApplication [name=NumberOfPeople]").formValidator({
        validatorGroup: "Edit",
        rules:
        {
            regex: "num1"
        },
        message:
        {
            regex: "<%= Define.Get("Application_NumberOfPeople_输入格式不正确").ToScriptChar() %>"
        }
    });
    //    //审批用户
    //    $("#frmApplication [name=ParentDealUser]").formValidator({
    //        targetFocus : "#frmApplication [name=ParentDealUser_TrueName_UserName]",
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            required: null
    //        },
    //        message:
    //        {
    //            required: "<%= Define.Get("Application_DealUserGuid_请选择审批用户").ToScriptChar() %>"
    //        }
    //    });
    //    //审批日期
    //    $("#frmApplication [name=DealTime]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            regex: "date"
    //        },
    //        message:
    //        {
    //            regex: "<%= Define.Get("Application_DealTime_审批日期格式不正确").ToScriptChar() %>"
    //        }
    //    });
    //    //拒绝用户
    //    $("#frmApplication [name=ParentCancelUser]").formValidator({
    //        targetFocus : "#frmApplication [name=ParentCancelUser_TrueName_UserName]",
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            required: null
    //        },
    //        message:
    //        {
    //            required: "<%= Define.Get("Application_CancelUserGuid_请选择拒绝用户").ToScriptChar() %>"
    //        }
    //    });
    //    //拒绝日期
    //    $("#frmApplication [name=CancelTime]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            regex: "date"
    //        },
    //        message:
    //        {
    //            regex: "<%= Define.Get("Application_CancelTime_拒绝日期格式不正确").ToScriptChar() %>"
    //        }
    //    });
    //    //确认日期
    //    $("#frmApplication [name=ConfirmTime]").formValidator({
    //        validatorGroup: "Edit",
    //        rules:
    //        {
    //            regex: "date"
    //        },
    //        message:
    //        {
    //            regex: "<%= Define.Get("Application_ConfirmTime_拒绝日期格式不正确").ToScriptChar() %>"
    //        }
    //    });
</script>
<script type="text/javascript">
    //页面调用AJAX方法
    //添加
    function Insert(send) {
        ApplicationAjax.Insert($("#frmApplication"), send, function (json) {
            document.getElementById("frmApplication").KEY.value = json.Key
            alert("<%= DefineEnum.添加成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //更新
    function Update(send) {
        ApplicationAjax.Update($("#frmApplication"), send, function (json) {
            document.getElementById("frmApplication").KEY.value = json.Key
            alert("<%= DefineEnum.修改成功.Define().ToScriptChar() %>");
            GoList();
        });
    };
    //删除
    function Delete(send) {
        var key = document.getElementById("frmApplication").KEY.value;
        ApplicationAjax.Delete(key, send, function (json) {
            GoList();
        });
    };
    //作废
    function Cancel(send) {
        if (confirm("确认作废申请吗?")) {
            ApplicationAjax.Cancel($("#frmApplication"), null, function (json) {
                document.getElementById("frmApplication").KEY.value = json.Key
                alert("<%= Define.Get("Application_作废成功").ToScriptChar() %>");
                GoList();
            });
        }
    };
    //批准
    function Apply(send) {

        if (confirm("确认批准申请吗?")) {
            ApplicationAjax.Apply($("#frmApplication"), null, function (json) {
                document.getElementById("frmApplication").KEY.value = json.Key
                alert("<%= Define.Get("Application_批准成功").ToScriptChar() %>");
                GoList();
            });
        }
    };
    //确认
    function ConfirmApp(send) {
        if (confirm("确认确认申请吗?")) {
            ApplicationAjax.ConfirmApp($("#frmApplication"), null, function (json) {
                document.getElementById("frmApplication").KEY.value = json.Key
                alert("确认成功");
                GoList();
            });
        }
    };
</script>
<script type="text/javascript">
    //初始方法
    //以下为图片显示
    function GetTimeRange() {
        if ($("#divTimeRange").length > 0) {
            var userGuid = $("#frmApplication [Name=ParentUser]").val();
            var recordEquipmentGuid = $("#frmApplication [Name=ParentRecordEquipment]").val();
            var applicationDate = $("#frmApplication [Name=ApplicationDate]").val();
            if (recordEquipmentGuid != null && recordEquipmentGuid != ""
            && applicationDate != null && applicationDate != ""
            && userGuid != null && userGuid != "") {
                $("#divTimeRange").html("正在加载申请时间段数据")
                var params = "";
                params += "IssueDate=" + encodeURIComponent(applicationDate);
                params += "&RecordEquipmentGuid=" + encodeURIComponent(recordEquipmentGuid);
                params += "&UserGuid=" + encodeURIComponent(userGuid);
                params += "&CheckApplyIssued=true";
                params += "&CheckBooking=true";

                Global.HtmlControl("/Pub/ApplicationTimeSetting/TimeRange", params, null, function (result) {
                    $("#divTimeRange").html(result.Html);
                });
            }
            else {
                $("#divTimeRange").html("请先选择申请用户所属设备和申请日期");
            }
        }
    }
    $(function () {
        $("#frmApplication [Name=ParentRecordEquipment]").parent().find(".select-clear").bind("click", function () {
            GetTimeRange()
        });
        $("#frmApplication [Name=ParentUser]").parent().find(".select-clear").bind("click", function () {
            GetTimeRange()
        });
        GetTimeRange();
        $("#frmApplication [Name=ApplicationDate]").datepicker(
        {
            minDate: 0,
            onClose: function () { $.validator.itemValid("#frmApplication [name=ApplicationDate]", "Edit"); }
        });

    })
    //以下为文件下载
</script>
<script type="text/javascript">
    //初始方法
    //以下为图片显示
    //封面
    $("#frmApplication [name=Cover]").siblings("img").attr("src", Global.Site + "<%= SettingGroup.ApplicationUploadPath %>" + $("#frmApplication [name=Cover]").val());
    //以下为文件下载
</script>
<script type="text/javascript">
    //其他方法
</script>
