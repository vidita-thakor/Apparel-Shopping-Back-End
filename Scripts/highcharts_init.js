$(function () {
    var chart;
    $(document).ready(function() {
    Highcharts.setOptions({
        colors: ['#32353A']
    });
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column',
                margin: [ 50, 30, 80, 60]
            },
            title: {
                text: 'Visits this month'
            },
            xAxis: {
                categories: [
                    '04-10-2013',
                    '04-11-2013',
                    '04-12-2013',
                    '04-13-2013',
                    '04-14-2013',
                    '04-15-2013',
                    '04-16-2013',
                    '04-17-2013',
                    '04-18-2013',
                    '04-19-2013',
                    '04-20-2013',
                    '04-21-2013',
                    '04-22-2013',
                    '04-23-2013',
                    '04-24-2013',
                    '04-25-2013',
                    '04-26-2013',
                    '04-27-2013'


                ],
                labels: {
                    rotation: -45,
                    align: 'right',
                    style: {
                        fontSize: '9px',
                        fontFamily: 'Tahoma, Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Visits'
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.x +'</b><br/>'+
                        'Visits: '+ Highcharts.numberFormat(this.y, 0);
                }
            },
                series: [{
                name: 'Visits',
                data: [1134, 1029, 1626, 2210, 1019, 1209, 2319, 4118, 1418,
                    1127, 1465, 1375, 1026, 1654, 1423, 1142, 3312, 1126],
                dataLabels: {
                    enabled: false,
                    rotation: 0,
                    color: '#F07E01',
                    align: 'right',
                    x: -3,
                    y: 20,
                    formatter: function() {
                        return this.y;
                    },
                    style: {
                        fontSize: '11px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }, 
                pointWidth: 20
            }]
        });
    });
    
});
