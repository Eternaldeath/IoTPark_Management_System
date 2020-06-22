//--------------
//- AREA CHART -
//--------------
// 创建 2d 画板
var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
// This will get the first returned node in the jQuery collection.
var areaChart = new Chart(areaChartCanvas);


// 日期
var date = new Date();
console.log(date.getDate());

// 数据集--近 7 日当日收入
var areaChartDataCur = {
    labels: [date.getDate()-6, date.getDate()-5, date.getDate()-4, date.getDate()-3, date.getDate()-2, date.getDate()-1, date.getDate()],
    datasets: [
    //     {
    //     label: "Electronics",
    //     fillColor: "rgba(210, 214, 222, 1)",
    //     strokeColor: "rgba(210, 214, 222, 1)",
    //     pointColor: "rgba(210, 214, 222, 1)",
    //     pointStrokeColor: "#c1c7d1",
    //     pointHighlightFill: "#fff",
    //     pointHighlightStroke: "rgba(220,220,220,1)",
    //     data: [65, 59, 80, 81, 56, 55, 40,100]
    // },
        //对比，暂时不需要
        {
            label: "Digital Goods",
            fillColor: "rgba(60,141,188,0.9)",
            strokeColor: "rgba(60,141,188,0.8)",
            pointColor: "#3b8bba",
            pointStrokeColor: "rgba(60,141,188,1)",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(60,141,188,1)",
            data: [curIncome[0], curIncome[1], curIncome[2], curIncome[3], curIncome[4], curIncome[5], curIncome[6]]
        }
    ]
};

// 数据集--近 7 日总收入
var areaChartDataSum = {
    labels: [date.getDate()-6, date.getDate()-5, date.getDate()-4, date.getDate()-3, date.getDate()-2, date.getDate()-1, date.getDate()],
    datasets: [{
            label: "Digital Goods",
            fillColor: "rgba(60,141,188,0.9)",
            strokeColor: "rgba(60,141,188,0.8)",
            pointColor: "#3b8bba",
            pointStrokeColor: "rgba(60,141,188,1)",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(60,141,188,1)",
            data: [sumIncome[0], sumIncome[1], sumIncome[2], sumIncome[3], sumIncome[4], sumIncome[5], sumIncome[6]]
        }
    ]
};

// 数据集--停车场总收入
var areaChartDataPark = {
    labels: ["桂系公园园内停车场","桂系公园停车场","三江公园停车场"],
    datasets: [{
        label: "Digital Goods",
        fillColor: "rgba(60,141,188,0.9)",
        strokeColor: "rgba(60,141,188,0.8)",
        pointColor: "#3b8bba",
        pointStrokeColor: "rgba(60,141,188,1)",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(60,141,188,1)",
        data: [fPark,sPark,thPark]
    }
    ]
};

var areaChartOptions = {
    //Boolean - If we should show the scale at all
    showScale: true,
    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines: false,
    //String - Colour of the grid lines
    scaleGridLineColor: "rgba(0,0,0,.05)",
    //Number - Width of the grid lines
    scaleGridLineWidth: 1,
    //Boolean - Whether to show horizontal lines (except X axis)
    scaleShowHorizontalLines: true,
    //Boolean - Whether to show vertical lines (except Y axis)
    scaleShowVerticalLines: true,
    //Boolean - Whether the line is curved between points
    bezierCurve: true,
    //Number - Tension of the bezier curve between points
    bezierCurveTension: 0.3,
    //Boolean - Whether to show a dot for each point
    pointDot: false,
    //Number - Radius of each point dot in pixels
    pointDotRadius: 4,
    //Number - Pixel width of point dot stroke
    pointDotStrokeWidth: 1,
    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
    pointHitDetectionRadius: 20,
    //Boolean - Whether to show a stroke for datasets
    datasetStroke: true,
    //Number - Pixel width of dataset stroke
    datasetStrokeWidth: 2,
    //Boolean - Whether to fill the dataset with a color
    datasetFill: true,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
    //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: true,
    //Boolean - whether to make the chart responsive to window resizing
    responsive: true
};

//绘制 area_line
areaChart.Line(areaChartDataSum, areaChartOptions);

//-------------
//- LINE CHART -
//--------------
var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
var lineChart = new Chart(lineChartCanvas);
var lineChartOptions = areaChartOptions;
lineChartOptions.datasetFill = false;
lineChart.Line(areaChartDataCur, lineChartOptions);



// 饼状图
//-------------
//- PIE CHART -
//-------------
// Get context with jQuery - using jQuery's .get() method.
var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
var pieChart = new Chart(pieChartCanvas);
var PieData = [{
    value: vipIncome,
    color: "#f56954",
    highlight: "#f56954",
    label: "VIP 用户"
},
    {
        value: normalIncome,
        color: "#00a65a",
        highlight: "#00a65a",
        label: "普通用户"
    },

];
var pieOptions = {
    //Boolean - Whether we should show a stroke on each segment
    segmentShowStroke: true,
    //String - The colour of each segment stroke
    segmentStrokeColor: "#fff",
    //Number - The width of each segment stroke
    segmentStrokeWidth: 2,
    //Number - The percentage of the chart that we cut out of the middle
    percentageInnerCutout: 50, // This is 0 for Pie charts
    //Number - Amount of animation steps
    animationSteps: 100,
    //String - Animation easing effect
    animationEasing: "easeOutBounce",
    //Boolean - Whether we animate the rotation of the Doughnut
    animateRotate: true,
    //Boolean - Whether we animate scaling the Doughnut from the centre
    animateScale: false,
    //Boolean - whether to make the chart responsive to window resizing
    responsive: true,
    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: true,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
};
//Create pie or douhnut chart
// You can switch between pie and douhnut using the method below.
pieChart.Doughnut(PieData, pieOptions);

//-------------
//- BAR CHART -
//-------------
// 停车场收入占比
var barChartCanvas = $("#barChart").get(0).getContext("2d");
var barChart = new Chart(barChartCanvas);
var barChartData = areaChartDataPark;
barChartData.datasets[0].fillColor = "#00a65a";
barChartData.datasets[0].strokeColor = "#00a65a";
barChartData.datasets[0].pointColor = "#00a65a";
var barChartOptions = {
    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
    scaleBeginAtZero: true,
    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines: true,
    //String - Colour of the grid lines
    scaleGridLineColor: "rgba(0,0,0,.05)",
    //Number - Width of the grid lines
    scaleGridLineWidth: 1,
    //Boolean - Whether to show horizontal lines (except X axis)
    scaleShowHorizontalLines: true,
    //Boolean - Whether to show vertical lines (except Y axis)
    scaleShowVerticalLines: true,
    //Boolean - If there is a stroke on each bar
    barShowStroke: true,
    //Number - Pixel width of the bar stroke
    barStrokeWidth: 2,
    //Number - Spacing between each of the X value sets
    barValueSpacing: 5,
    //Number - Spacing between data sets within X values
    barDatasetSpacing: 1,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
    //Boolean - whether to make the chart responsive
    responsive: true,
    maintainAspectRatio: true
};

barChartOptions.datasetFill = false;
barChart.Bar(barChartData, barChartOptions);

// 激活导航位置
setSidebarActive("charts-chartjs");