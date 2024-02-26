<%-- 
    Document   : manger
    Created on : Jul 3, 2023, 8:58:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard HTML Template</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="Hmanage.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>
                <!-- row -->
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">PROFIT</h2>
                            <form action="listorder" id="f">
                               
                              Year  <select onchange="changeYear()" name="year" class="form-select-lg">
                                  
                                    <option value="${requestScope.year1}">${requestScope.year1}</option>
                                    <option value="2021">2021</option>
                                    <option  value="2022">2022</option>
                                    <option  value="2023">2023</option>
                                </select>
                            
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                    
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">LIST PRODUCT SOLD</h2>
                            
                               
                             Month       <select onchange="changeYear()" name="month" class="form-select-lg">
                                  <option ${requestScope.month1}>${requestScope.month1}</option>
                                    <option value="1">1</option>
                                    <option  value="2">2</option>
                                    <option  value="3">3</option>
                                    <option  value="4">4</option>
                                    <option  value="5">5</option>
                                    <option  value="6">6</option>
                                    <option  value="7">7</option>
                                    <option  value="8">8</option>
                                    <option  value="9">9</option>
                                    <option  value="10">10</option>
                                    <option  value="11">11</option>
                                    <option  value="12">12</option>
                                    
                                </select>
                             <input type="hidden" name="month" value="${month}">
                            </form>
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                    
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller">
                            <h2 class="tm-block-title">Storage Information</h2>
                            <div id="pieChartContainer">
                                <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                            </div>                        
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">Notification List</h2>
                            <div class="tm-notification-items">
                                <div class="media tm-notification-item"> 
                                    <div  ><img src="https://media.istockphoto.com/id/673291928/vi/vec-to/h%C3%B3a-%C4%91%C6%A1n-xanh-dolar-money.jpg?s=1024x1024&w=is&k=20&c=T-XhDE97HC0kx3-aZDo2-DyAgtAQJ2oyXEMo6RP-iis=" style="width: 120px; height: 100px" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <c:forEach items="${requestScope.listRe}" var="c">
                                            <p class="tm-block-title" style="color: black">&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   ${c.totalmoney}đ</p>   
                                            <p class="tm-block-title" style="color: black">&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; REVENUE IN THIS MONTH </p>
                                        </c:forEach>

                                    </div>
                                </div>

                                <div class="media tm-notification-item"> 
                                    <div  ><img src="https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png" style="width: 120px; height: 100px" class="rounded-circle"></div>
                                    <div class="media-body">

                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   ${requestScope.listA}</p>   
                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; TOTAL CUSTOMER </p>                                
                                    </div>
                                </div>
                                <div class="media tm-notification-item"> 
                                    <div  ><img src="data:image/png;base64,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" style="width: 120px; height: 100px" class="rounded-circle"></div>
                                    <div class="media-body">

                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   ${requestScope.listP}</p>   
                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; TOTAL PRODUCT STOCK </p>                                
                                    </div>
                                </div>
                                <div class="media tm-notification-item"> 
                                    <div  ><img src="data:image/png;base64,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" style="width: 120px; height: 100px" class="rounded-circle"></div>
                                    <div class="media-body">

                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   ${requestScope.n}</p>   
                                        <p class="tm-block-title" style="color: black">&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; TOTAL PRODUCT SOLD </p>                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                          <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">
TOP Selling Products</h2>
                            <div class="tm-notification-items">
                                <div class="media tm-notification-item"> 
                                   
                                    <div class="media-body">
                                       <c:forEach items="${requestScope.listFE}" var="c">
          <p class="tm-block-title" style="color: black">  <img src="${c.p.image}" style="width: 120px; height: 100px" class="rounded-circle">
              &nbsp;&nbsp;&nbsp; ${c.p.name}  </p>
          <p class="tm-block-title" style="color: black">Quantity ${c.quantity} </p>   
                                    
 </c:forEach>
                                    </div>

                                   
                                                                    </div>
                                   </div>
                        </div>
                    </div>
                                                  <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">Loyal Customer</h2>
                            <div class="tm-notification-items">
                                <div class="media tm-notification-item"> 
                                    <div class="media-body">
                                          <c:forEach items="${requestScope.listCR}" var="c">
          <p class="tm-block-title" style="color: black">            <img src="https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png" style="width: 120px; height: 100px" class="rounded-circle">
                                            &nbsp;&nbsp;   ${c.accountdetail.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${c.totalmoney}đ </p>
                                                   </c:forEach>
                                    </div>
                                
                                </div>
                                         
                                   </div>
                        </div>
                    </div>
                                        
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                            <h2 class="tm-block-title">Orders List</h2>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ORDER NO.</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">PHONE</th>                                    
                                        <th scope="col">LOCATION</th>
                                        <th scope="col"> DATE</th>
                                        <th scope="col">TOTALMONEY</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listO}" var="c">
                                        <tr>
                                            <th scope="row"><b>${c.oid}</b></th>
                                            <td>
                                                ${c.accountdetail.name}
                                            </td>
                                            <td><b> ${c.accountdetail.phone}</b></td>
                                            <td><b> ${c.accountdetail.address}</b></td>
                                            <td><b>${c.date}</b></td>
                                            <td>${c.totalmoney}đ</td>

                                        </tr>
                                    </c:forEach>



                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            Chart.defaults.global.defaultFontColor = 'white';
            let ctxLine,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    lineChart;
            barChart, pieChart;
            // DOM is ready
            $(function () {
                drawLineChart(); // Line Chart
                drawBarChart(); // Bar Chart
                drawPieChart(); // Pie Chart

                $(window).resize(function () {
                    updateLineChart();
                    updateBarChart();
                });
            })
        </script>
        <script >
          const width_threshold = 480;

function drawLineChart() {
  if ($("#lineChart").length) {
    ctxLine = document.getElementById("lineChart").getContext("2d");
    optionsLine = {
      scales: {
        yAxes: [
          {
            scaleLabel: {
              display: true,
              labelString: "Hits"
            }
          }
        ]
      }
    };

    // Set aspect ratio based on window width
    optionsLine.maintainAspectRatio =
      $(window).width() < width_threshold ? false : true;

    configLine = {
      type: "line",
      data: {
        labels: [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          
        ],
        datasets: [
          {
            label: "REVENUE YEAR",
            data: [
          <c:forEach items="${requestScope.year}" var="c">
                                      "${c.totalmoney}",
          </c:forEach>
            ],
            fill: false,
            borderColor: "rgb(75, 192, 192)",
            cubicInterpolationMode: "monotone",
            pointRadius: 0
          },
         
        ]
      },
      options: optionsLine
    };

    lineChart = new Chart(ctxLine, configLine);
  }
}

function drawBarChart() {
  if ($("#barChart").length) {
    ctxBar = document.getElementById("barChart").getContext("2d");

    optionsBar = {
      responsive: true,
      scales: {
        yAxes: [
          {
            barPercentage: 0.2,
            ticks: {
              beginAtZero: true
            },
            scaleLabel: {
              display: true,
              labelString: "Hits"
            }
          }
        ]
      }
    };

    optionsBar.maintainAspectRatio =
      $(window).width() < width_threshold ? false : true;

    /**
     * COLOR CODES
     * Red: #F7604D
     * Aqua: #4ED6B8
     * Green: #A8D582
     * Yellow: #D7D768
     * Purple: #9D66CC
     * Orange: #DB9C3F
     * Blue: #3889FC
     */

    configBar = {
      type: "horizontalBar",
      data: {
          
        labels: [
          <c:forEach items="${requestScope.listC}" var="c">
                                  "${c.name}",
          </c:forEach>
        ],
        datasets: [
          {
            label: "# of Hits",
            data: [
              <c:forEach items="${requestScope.listOL}" var="c">
                          "${c.quantity}",
              </c:forEach>
            ],
            backgroundColor: [
              "#F7604D",
              "#4ED6B8",
              "#A8D582",
              "#D7D768",
              "#9D66CC",
              "#DB9C3F",
              "#3889FC"
            ],
            borderWidth: 0
          }
        ]
      },
      options: optionsBar
    };

    barChart = new Chart(ctxBar, configBar);
  }
}

function drawPieChart() {
  if ($("#pieChart").length) {
    var chartHeight = 300;

    $("#pieChartContainer").css("height", chartHeight + "px");

    ctxPie = document.getElementById("pieChart").getContext("2d");

    optionsPie = {
      responsive: true,
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 10,
          top: 10,
          bottom: 10
        }
      },
      legend: {
        position: "top"
      }
    };

    configPie = {
      type: "pie",
      data: {
        datasets: [
          {
            data: [
                 "${requestScope.p1}",  "${requestScope.p2}",  "${requestScope.p3}",  "${requestScope.p4}",  "${requestScope.p5}",
            ],
            backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582"],
            label: "Storage"
          }
        ],
        labels: [
                        <c:forEach items="${requestScope.listC}" var="c">
                        "${c.name}",
                        </c:forEach>
        ]
      },
      options: optionsPie
    };

    pieChart = new Chart(ctxPie, configPie);
  }
}

function updateLineChart() {
  if (lineChart) {
    lineChart.options = optionsLine;
    lineChart.update();
  }
}

function updateBarChart() {
  if (barChart) {
    barChart.options = optionsBar;
    barChart.update();
  }
}
function changeYear(){
    document.getElementById('f').submit();
   
    }
    function c(){

    document.getElementById('c').submit();
    }


        </script>
    </body>

</html>