/**
 * Created by T420 on 5/21/2018.
 */
var Dashboard = function () {
    var baseUrl = $('#site_meta').attr('data-baseurl')
    var tableStatistic = null;

    var Constants = {
        URL: {
            SUMMARY_CHART_DATA: baseUrl + '/manager/dashboard/summary',
            TOP10_CHART_DATA: baseUrl + '/manager/dashboard/top10'
        },
        ID: {
            CHART_TOP10: 'top10-chart',
            CHART_SUMMARY: 'summary-chart',
        }
    }
    var initSummaryChart = function () {
        $.ajax({
            'url': Constants.URL.SUMMARY_CHART_DATA,
            'type': 'POST',
            'data': {},
            'success': function (data) {
                if (data != null) {
                    drawSummaryChart(data);
                } else {
                    toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
                }
            },
            'error': function (err, msg) {
                toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
            }

        })
    }

    var initTop10Chart = function () {
        $.ajax({
            'url': Constants.URL.TOP10_CHART_DATA,
            'type': 'POST',
            'data': {},
            'success': function (data) {
                if (data != null && data.data != null) {
                    drawTop10Chart(data.data);
                } else {
                    toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
                }
            },
            'error': function (err, msg) {
                toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
            }

        })
    }

    var drawSummaryChart = function (data) {
        var summaryChart = Highcharts.chart(Constants.ID.CHART_SUMMARY, {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Tổng quan đề tài'
            },
            credits: {
                enabled: false
            },
            tooltip: {
                pointFormatter: function (point) {
                    return '<b>' + this.name + '</b>: ' + this.info + ' đề tài';
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Số lượng',
                colorByPoint: true,
                data: [{
                    name: 'Đã khảo sát',
                    y: data.done / (data.done + data.new),
                    info: data.done
                }, {
                    name: 'Chưa khảo sát',
                    y: data.new / (data.done + data.new),
                    info: data.new
                }]
            }]
        });
    }

    var drawTop10Chart = function (data) {
        var categories = [];
        var seriesTotal = [];
        var seriesDone = [];
        var seriesSeen = [];
        var seriesNew = [];
        if (data.length == 0) {
            return;
        }
        for (var i = 0; i < data.length; i++) {
            categories.push(data[i].code);
            seriesTotal.push(data[i].surveyors_count);
            seriesDone.push(data[i].done);
            seriesSeen.push(data[i].seen);
            seriesNew.push(data[i].new);
        }
        console.log(data);
        var top10Chart = Highcharts.chart(Constants.ID.CHART_TOP10, {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Tổng quan top 10 đã khảo sát theo số lượng URL'
            },
            xAxis: {
                categories: categories
            },
            credits: {
                enabled: false
            },
            yAxis: {
                allowDecimals: false,
                title: {
                    text: 'Số người khảo sát'
                }
            },
            series: [
                {
                    'name':'Tổng số',
                    'data': seriesTotal
                },
                {
                    'name':'Hoàn thành',
                    'data': seriesDone
                },
                {
                    'name':'Đã xem',
                    'data': seriesSeen
                },
                {
                    'name':'Chưa xem',
                    'data': seriesNew
                },
            ]
        });
    }


    return {
        init: function () {
            initSummaryChart();
            initTop10Chart();
        }
    }


}

$(document).ready(function () {
    Dashboard().init();
});