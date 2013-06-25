<%@ Control Language="C#" Inherits="AVA.ResourcesPlatform.WebUI.Control.VideoPlay.VideoPlaySWPattern" %>
<%
    if (this.ListVideoSWPattern.Count > 0)
    {
        var guid = Guid.NewGuid().ToString().Replace("-","");
%>
<div id="divVideoPlaySWPattern<%= guid %>" style="height: <%= this.Height %>px; width: <%= this.Width %>px;"></div>
<script type="text/javascript">

    $(function () {
        $.jqplot.config.enablePlugins = true;
        var ss<%= guid %> = new Array();;//[[0, 5], [5, 5], [5, 10], [10, 10], [10, 15], [15, 15], [15, 20], [20, 20]];
        ss<%= guid %>.push([0, 0]);
    <%
        double s = 0;
        double t = 0;
        for (int i = 0; i <= this.ListVideoSWPattern.Count - 1; i++)
        {
            var pattern = this.ListVideoSWPattern[i];
            if (pattern.Tag == "S")
            {
                s += 1;
            }
            else
            {
                t += 1;
            }
    %>
        ss<%= guid %>.push([<%=t%>,<%=s%>]);
    <%
         
        }
    %>
        $.jqplot('divVideoPlaySWPattern<%= guid %>', [ss<%= guid %>],
        {
            title: '',
            axesDefaults: {
                min: 0,
                max: <%= s > t ? s:t %>,
                pad: 1,
                autoscale: true
            },
            axes: {
                xaxis: {
                    tickInterval: 1,
                    autoscale: true
                },
                yaxis: {
                    tickInterval: 1,
                    autoscale: true
                }

            },
            tickInterval: 5,
            numberTicks: 6,
            legend: {
                show: true,
                rendererOptions: { placement: "insideGrid" },
                location: 'se'
            },
            series: [
              {
                  showLabel: true,
                  label: '标准组',
                  color: '#5FAB78'
              },
              {
                  showLabel: true,
                  label: '测试组',
                  color: '#d8b83f'
              }
            ],
            cursor: {
                show: true
            }
        });

    });
</script>
<%
    }
%>