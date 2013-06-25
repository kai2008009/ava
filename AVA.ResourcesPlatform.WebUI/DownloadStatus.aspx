<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadStatus.aspx.cs" Inherits="AVA.ResourcesPlatform.WebUI.DownloadStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title id="Title1" runat="server"></title>
</head>
<body>
    <div>
        下载文件：<%= CreateInstance.RecordVideoDao.GetDownloadConsole().ListTaskQueue.Count %>个 总速度为：<%=  AVA.DownloadComponent.Methods.SpeedToString(CreateInstance.RecordVideoDao.GetDownloadConsole().ListTaskQueue.AllSpeed) %>
        <%--<%
            if (CreateInstance.RecordVideoDao.GetDownloadConsole().MaxSpeed > 0)
            {
        %>
        <br />
        总体限速：
        <%=  AVA.DownloadComponent.Methods.SpeedToString(CreateInstance.RecordVideoDao.GetDownloadConsole().MaxSpeed) %>
        <%
            }
        %>--%>
        <br />
        <table border="1px">
            <tr>
                <td>文件 </td>
                <td>大小 </td>
                <td>已下载 </td>
                <td>速度 </td>
                <td>状态 </td>
            </tr>
            <%
                for (int i = 0; i <= CreateInstance.RecordVideoDao.GetDownloadConsole().ListTaskQueue.Count - 1; i++)
                {
                    var task = CreateInstance.RecordVideoDao.GetDownloadConsole().ListTaskQueue[i];
            %>
            <tr>
                <td>
                    <%= task.FileName %>
                </td>
                <td>
                    <%= AVA.DownloadComponent.Methods.SizeToString(task.TotalSize) %>
                </td>
                <td>
                    <%= AVA.DownloadComponent.Methods.SizeToString( task.DownSize) %>
                </td>
                <td>
                    <%= AVA.DownloadComponent.Methods.SpeedToString(task.Speed) %>
                </td>
                <td>
                    <%= task.GetState %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
<script type="text/javascript">
    setTimeout(function () { window.location.href = window.location.href; }, 2000);
</script>
