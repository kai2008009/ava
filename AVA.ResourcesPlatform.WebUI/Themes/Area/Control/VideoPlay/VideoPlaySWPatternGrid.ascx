<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlaySWPatternGrid" %>
<%
    var guid = Guid.NewGuid().ToString().Replace("-", "");
%>
<div id="st_wraper<%= guid %>"></div>
<%
    string data = "[";
    string dtime = "[";
    string dguid = "[";
    for (int i = 0; i <= this.ListVideoSWPattern.Count - 1; i++)
    {
        if (i == 0 || i % this.Width == 0)
        {
            data += "[";
            dtime += "[";
            dguid += "[";
        }
        data += "\"" + this.ListVideoSWPattern[i].Tag + "\"";
        dtime += "\"" + this.ListVideoSWPattern[i].Seconds / 1000 + "\"";
        dguid += "\"" + SetKey(this.ListVideoSWPattern[i].Guid,this.ListVideoSWPattern[i].Version ) + "\"";
        if ((i + 1) % this.Width == 0 || i == this.ListVideoSWPattern.Count - 1)
        {
            data += "]";
            dtime += "]";
            dguid += "]";
        }
        if (i != ListVideoSWPattern.Count - 1)
        {
            data += ",";
            dtime += ",";
            dguid += ",";
        }
    }
    data += "]";
    dtime += "]";
    dguid += "]";
    string x_axise = "[";
    string y_axise = "[";
    double rows = Math.Ceiling(this.ListVideoSWPattern.Count.ToDouble() / this.Width);
    for (int i = 1; i <= rows; i++)
    {
        y_axise += i.ToString();
        if (i != rows)
        {
            y_axise += ",";
        }
    }
    for (int i = 1; i <= this.Width; i++)
    {
        x_axise += i.ToString();
        if (i != this.Width)
        {
            x_axise += ",";
        }
    }
    x_axise += "]";
    y_axise += "]";
%>
<script type="text/javascript">
    $(function () {
        $('.tabs').tabs();
    })
    var isFlash = (navigator.userAgent.indexOf("iPad") == -1 && navigator.userAgent.indexOf("iPhone") == -1);
    $(document).ready(function () {
        $('#st_wraper<%= guid %>').stupid(
             {
                 blurFunc:function(item){
                     //console.log("output");
                     //console.log(item);
                     //console.log($(item).val());
                     //console.log($(item).attr("datime"));

                     if($.cookie("UserCode") != null && $.cookie("ParentCode") != null)
                     {
                         if($(item).val()!="S"&& $(item).val()!="T")
                         {
                             alert("请输入'S'或'T'");
                             item.focus();
                             return;
                         }
                         var params = "";
                         params += "key=" + $(item).attr("key");
                         params += "&";
                         params += "&";
                         params += "Tag="+ $(item).val();
                         $.ajax(
                        {
                            cache: false,
                            type: "POST",
                            url: Global.Site + "/Ajax.aspx?AVA.ResourcesPlatform.Ajax.ClientAjax.VideoSWPatternEdit",
                            data: params,
                            async: true,
                            dataType: 'json',
                            success: function (result) {
                                $(item).attr("oldvalue",$(item).val());//成功的话把旧值加上
                                Global.Disabled(item, false);
                            },
                            beforeSend: function () {
                                Global.Disabled(item, true);
                            },
                            complete: function () {
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $(item).val($(item).attr("oldvalue"));//失败返回的话把旧值加上
                                Global.Disabled(item, false);
                                var message = XMLHttpRequest.responseText;
                                Global.Error(message);
                            }
                        });
                     }
                     else
                     {
                         $(item).val($(item).attr("oldvalue"));
                     }
                     
                 },
                 dtime:<%= dtime %>,
                 data: <%= data %>,
                 dguid: <%= dguid %>,
                 x_axise: <%= x_axise %>,
                 y_axise: <%= y_axise %>
                 }, isFlash?jwplayer('JWPlayerHTML4'):jwplayer('JWPlayerHTML5')
        );
    });
    
</script>
