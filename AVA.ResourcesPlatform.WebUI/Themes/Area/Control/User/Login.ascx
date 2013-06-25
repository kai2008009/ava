<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.User.Login" %>
<div class="alert alert-block">
    <a style="display: none" href="#" data-dismiss="alert" class="close" target="_blank">×</a>
    <h4 class="alert-heading">提示</h4>
    已经注册？请登录：
</div>
<div class="forms">
    <form action="" onsubmit="return false;" id="frmLogin">
    <div class="items">
        <div class="item">
            <label class="lbl">所属网站：</label>
            <%= new HtmlSelect("DomainGuid", "Name", "Guid", "Guid") { Option = this.ListDomain, SelectedValue = CookieGroup.DomainGuid }%>
            <%= new HtmlYKTip("DomainGuid")%>
        </div>
        <div class="item">
            <label class="lbl">用户名：</label>
            <%= new HtmlText("UserName", null)%>
            <%= new HtmlYKTip("UserName") %>
        </div>
        <div class="item">
            <label class="lbl">密码：</label>
            <%= new HtmlPassword("Password") %>
            <%= new HtmlYKTip("Password") %>
        </div>
        <div class="item indent" style="">
            <%= new HtmlHidden("Src",this.Src) %>
            <%= new HtmlSubmit("登录","Login","LoginClient(this);") %>
            <span class="forgot_pwd">
                <%= new HtmlAnchor("忘记密码") { Href = WebUrl.FindPWD() }%>
            </span>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript">
    //验证控件
    $.validator.initConfig({ validatorGroup: "Login", form: "#frmLogin", alertMessage: true, showMessage: false });
    //用户名
    $("#frmLogin [name=UserName]").formValidator({
        validatorGroup: "Login",
        rules:
        {
            required: null
        },
        message:
        {
            required: "请输入用户名"
        }
    });
    //用户密码
    $("#frmLogin [name=Password]").formValidator({
        validatorGroup: "Login",
        rules:
        {
            required: null
        },
        message:
        {
            required: "请输入用户密码"
        }
    });

</script>
<script type="text/javascript">
    function LoginClient(send) {
        $.ajax(
        {
            cache: false,
            type: "POST",
            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.Login",
            data: Global.GetFormValue($("#frmLogin")),
            async: true,
            dataType: 'json',
            success: function (result) {
                $(send).val("登录成功");
                window.location.href = result;
                Global.Disabled(send, false);
            },
            beforeSend: function () {
                $(send).val("验证用户...");
                Global.Disabled(send, true);
            },
            complete: function () {
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(send).val("登录");
                Global.Disabled(send, false);
                var message = XMLHttpRequest.responseText;
                Global.Error(message);
            }
        });
    }



    function clearCookie() {
        var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
        if (keys) {
            for (var i = keys.length; i--;)
                document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
        }
    }
    clearCookie();
</script>
