var glOpCnt;
var chart;
var glLocation;
var gl_strUnitsScale;
var gl_strCostScale;
var gl_strMainCostAxisName;

var GLMainOptions = {series:[],categories:[]};

  // rgb(24,172,66); 
  // 18AC42
  // rgb(6,134,34);
  // 068622


function initComp(strCostScale,strUnitsScale)
{
	glOpCnt = -1;           
	GLMainOptions.series = [];
	GLMainOptions.categories = [];
	
	gl_strUnitsScale = strUnitsScale;
	gl_strCostScale = strCostScale;
	
	if(strCostScale == '')
	{
		gl_strMainCostAxisName = '';
	}
	else
	{
		gl_strMainCostAxisName = 'Cost';
	}
		

	GLMainOptions.series[0] = { 
		name: "Daily Usage",
		type: 'column',                 
		color: '#068622',
		yAxis: 1,
		data : []
		/*
		Data has the following structure:
		data : [{ 
						y: 0,
						drilldown: {
								name: '',
								categories: [],
								data: [],
				}}]
		*/
	};

	GLMainOptions.series[1] = { 
				name: "Daily Cost",
				type: 'spline',         
				color: '#4572A7',       
				yAxis: 0,                                       
				data : []
				/*
				Data has the following structure:
				data : [{ 
								y: 0,
								drilldown: {
										name: '',
										categories: [],
										data: [],
						}}]
				*/
		};              

};


function initLocation(strLocation)
{
	glLocation = strLocation;
}

function compStartDay(strStartDate) 
{
	var phrase  = new String(strStartDate);
	var temp = phrase.split(" ");
	strPart1 = temp[0];

	GLMainOptions.categories.push(strPart1);

	var data1 = { 
							y: 0,
							color: '#068622',

							drilldown: {
									name: temp[0],
									yAxis: 1,
									type: 'column',
									categories: [],
									data: [],
									color: '#068622'
							}};
							
	var data2 = { 
							y: 0,
							color: '#4572A7',
							drilldown: {
									name: temp[0],
									yAxis: 0,
									type: 'spline',
									categories: [],
									data: [],
									color: '#4572A7'
							}};     
							
	GLMainOptions.series[0].data.push(data1);                       
	GLMainOptions.series[1].data.push(data2);               

	glOpCnt++;

};


function compAddValueAndDate(strValue,strValueDate,strCost)
{
	var phrase  = new String(strValueDate);
	var temp = phrase.split(" ");	
	var vNum = parseFloat(strValue);		
	GLMainOptions.series[0].data[glOpCnt].y = Math.round((GLMainOptions.series[0].data[glOpCnt].y + parseFloat(strValue)/1000)*1000)/1000;
	GLMainOptions.series[0].data[glOpCnt].drilldown.data.push(parseFloat(strValue)/1000);				  
	GLMainOptions.series[0].data[glOpCnt].drilldown.categories.push(temp[1]);			

	vNum = parseFloat(strCost);
	GLMainOptions.series[1].data[glOpCnt].y = Math.round((GLMainOptions.series[1].data[glOpCnt].y + Math.round(vNum*100)/100)*100)/100;
	GLMainOptions.series[1].data[glOpCnt].drilldown.data.push(parseFloat(strCost));	
	GLMainOptions.series[1].data[glOpCnt].drilldown.categories.push(temp[1]);		            
}


Highcharts.visualize = function(options) 
{
	options.xAxis.categories = [];
	options.categories = [];
	options.xAxis.categories = GLMainOptions.categories;            
	options.categories = GLMainOptions.categories;
	options.series = [];

	for(i=0; i < glOpCnt; i++)
	{
		if( GLMainOptions.series[0].data[i].drilldown.categories.length == 1)
		{
			GLMainOptions.series[0].data[i].drilldown.categories = [];
			var temp = GLMainOptions.series[0].data[i].drilldown.name;
			GLMainOptions.series[0].data[i].drilldown.categories.push(temp);
		}

		if( GLMainOptions.series[1].data[i].drilldown.categories.length == 1)
		{
			GLMainOptions.series[1].data[i].drilldown.categories = [];
			var temp = GLMainOptions.series[1].data[i].drilldown.name;
			GLMainOptions.series[1].data[i].drilldown.categories.push(temp);
		}                       
	}


	options.series[0] = GLMainOptions.series[0];
	options.series[1] = GLMainOptions.series[1];
	
	chart = new Highcharts.Chart(options);
}

// On document ready, call visualize on the data.

$(document).ready(function() 
{               
	//initComp();
	//refreshGraph("EMPTY");
});
						
function refreshGraph(strTitle)
{
	function setMainChart() {
		chart.xAxis[0].setCategories(GLMainOptions.categories);
		
		if(chart.xAxis[0].categories.length>32)
		{
			chart.xAxis[0].options.labels.step=2;
		}
		else
		{
			chart.xAxis[0].options.labels.step=1;
		}                       
		
		chart.series[1].remove();
		chart.series[0].remove();
		chart.addSeries(GLMainOptions.series[0]);
		chart.addSeries(GLMainOptions.series[1]);
	};
		
	function CommaFormatted(amount)
	{
		var delimiter = ","; // replace comma if desired
		var a = amount.split('.',2)
		var d = a[1];
		var i = parseInt(a[0]);
		if(isNaN(i)) { return ''; }
		var minus = '';
		if(i < 0) { minus = '-'; }
		i = Math.abs(i);
		var n = new String(i);
		var a = [];
		while(n.length > 3)
		{
			var nn = n.substr(n.length-3);
			a.unshift(nn);
			n = n.substr(0,n.length-3);
		}
		if(n.length > 0) { a.unshift(n); }
		n = a.join(delimiter);
		if(d.length < 1) { amount = n; }
		else { amount = n + '.' + d; }
		amount = minus + amount;
		return amount;
	}               
		
	function CurrencyFormatted(amount)
	{
		var i = parseFloat(amount);
		if(isNaN(i)) { i = 0.00; }
		var minus = '';
		if(i < 0) { minus = '-'; }
		i = Math.abs(i);
		i = parseInt((i + .005) * 100);
		i = i / 100;
		s = new String(i);
		if(s.indexOf('.') < 0) { s += '.00'; }
		if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
		s = minus + s;
		return s;
	}               
		
	function setChart(name, categories, data, color) {
		chart.xAxis[0].setCategories(categories);
		
		if(chart.xAxis[0].categories.length>32)
		{
				chart.xAxis[0].options.labels.step=2;
		}
		else
		{
				chart.xAxis[0].options.labels.step=1;
		}
		
		chart.series[1].remove();       
		chart.series[0].remove();
		
		idx = jQuery.inArray(name,GLMainOptions.categories);
	
		chart.addSeries({
				name: "Detailed Usage",
				yAxis: 1,
				type: 'column',
				data: data,
				color: color || 'white'
		});                             

		chart.addSeries({
				name: "Detailed Cost",
				yAxis: 0,
				type: GLMainOptions.series[1].data[idx].drilldown.type,
				data: GLMainOptions.series[1].data[idx].drilldown.data,
				color: GLMainOptions.series[1].data[idx].drilldown.color || 'white'
		});                             
	}
							
	options = {
		   chart: {
				  renderTo: 'container',
				  defaultSeriesType: 'column'
		   },
		   colors: ['#068622'],
		   title: {
				  text: strTitle
		   },
		   xAxis: {     categories: [],
								labels: {
								rotation: -60,
								align: 'right'
								}
		   },
		   yAxis: [{
								title: {
										//text: 'Cost',
										text : gl_strMainCostAxisName,
										style: {
												color: '#4572A7'
														}                                                       
												},
								labels: {
										formatter: function() {
												if(this.value<0)
												{
														return '';
												}
												else
												{
														return CommaFormatted(CurrencyFormatted(this.value)) + ' ' + gl_strCostScale;
														}
										},
										style: {
												color: '#4572A7'
										}
								}                                                       
								},
								{
								title: {
										text: 'Usage',
										style: {
														color: '#068622'
														}                                                       
												},                                                              
								opposite: true,
								labels: {
										formatter: function() {
												return this.value + ' ' + gl_strUnitsScale;
										},
										style: {
												color: '#068622'
										}
								}                                               
								}                                                 
				],
				plotOptions: {
										column: {
												cursor: 'pointer',
												point: {
														events: {
																click: function() {
																		var drilldown = this.drilldown;
																		if (drilldown) { // drill down
																				setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
																		} else { // restore
																				setMainChart();
																		}
																}
														}
												}                               
										}
								},                 
		   tooltip: {
				  formatter: function() {
						 return '<b>'+ this.series.name +'<\/b><br/>'+
								this.y +' '+ this.x.toLowerCase();
				  }
		   }
		};
	Highcharts.visualize( options);
};
  
function loadXMLDoc(dname)
{
	if (window.XMLHttpRequest)
	{
		xhttp=new XMLHttpRequest();

	}
	else
	{
		xhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.open("GET",dname,false);
	xhttp.send("");
	return xhttp.responseXML;
};


function refreshResult (strXmlFile,strXsltFile) {
	xml2=loadXMLDoc(strXmlFile);
	xsl2=loadXMLDoc(strXsltFile);
	// code for IE
	if (window.ActiveXObject)
	{
		var element = document.getElementById("example");
		while (element.firstChild) {
		  element.removeChild(element.firstChild);
		}       

		ex=xml2.transformNode(xsl2);
		document.getElementById("example").innerHTML=ex;
		
		div = document.getElementById("example");

		runScripts(div); //run all scripts now contained in the target div element                      
	}
	// code for Mozilla, Firefox, Opera, etc.
	else if (document.implementation && document.implementation.createDocument)
	{

		xsltProcessor=new XSLTProcessor();
		xsltProcessor.importStylesheet(xsl2);
		resultDocument = xsltProcessor.transformToFragment(xml2,document);
		
		var element = document.getElementById("example");
		while (element.firstChild) {
		  element.removeChild(element.firstChild);
		}
		
		document.getElementById("example").appendChild(resultDocument);
		
		runScripts(document.getElementById("example")); //run all scripts now contained in the target div element       
	}
	
	refreshGraph("Energy Usage Information for:" + glLocation);
};


function runScripts(e) {
	if (e.nodeType != 1) return; //if it's not an element node, return

	if (e.tagName.toLowerCase() == 'script') {
			eval(e.text); //run the script
	}
	else {
		var n = e.firstChild;
		while ( n ) {
			if ( n.nodeType == 1 ) runScripts( n ); //if it's an element node, recurse
			n = n.nextSibling;
		}
	}
}

function displayResult(xmlDataFileStr,xsltDataFileStr)
{
	xml=loadXMLDoc(xmlDataFileStr);
	xsl=loadXMLDoc(xsltDataFileStr);
	// code for IE
	if (window.ActiveXObject)
	{
		ex=xml.transformNode(xsl);
		document.getElementById("example").innerHTML=ex;
		div = document.getElementById("example");
		runScripts(div); //run all scripts now contained in the target div element
	}
	// code for Mozilla, Firefox, Opera, etc.
	else if (document.implementation && document.implementation.createDocument)
	{
		xsltProcessor=new XSLTProcessor();
		xsltProcessor.importStylesheet(xsl);
		resultDocument = xsltProcessor.transformToFragment(xml,document);
		document.getElementById("example").appendChild(resultDocument);
	}
	refreshGraph("Energy Usage Information for:" + glLocation);
				
};

function savePageAs(fileName)
{
  if(!fileName){fileName = location.href.toString(); }
  var X=new XMLHttpRequest, data="";
  X.open('GET', fileName, false );
  X.send('');   
  data = X.responseText;
  return window.open( "data:x-application/external;charset=utf-8," + escape(data));
}//end savePageAs   		