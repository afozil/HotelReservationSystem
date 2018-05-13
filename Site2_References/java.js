/*For preloadImages*/
function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		preloadimg1 = newImage("../images/home_link.jpg");
		preloadimg1 = newImage("../images/sitemap_link.jpg");
		preloadimg1 = newImage("../images/contact_link.jpg");
		preloadimg1 = newImage("../images/rss_link.jpg");
		preloadimg1 = newImage("../images/serchBtn.gif");
		
		preloadFlag = true;
	}
}
/*code end for preloadImages*/


function clearTip(field)
{
	if(field.defaultValue == field.value)
	field.value = "";
}

function writeTip(field)
{
	if(field.value == "")
		field.value = field.defaultValue;
}	


function validationsearch()
	{
		if ((document.frmsearch.search.value.replace(/^\s*|\s*$/g,"") == "")||(document.frmsearch.search.value.replace(/^\s*|\s*$/g,"") == "Search here..."))
		{
			alert ('Please enter search text');
			document.frmsearch.search.focus();
			return false;
		}
	}



/*Ajax Activex object*/
	var xmlHttp
	function show_Ajax_Call(fld, c)
	{ 
	  
	   var obj = document.getElementById(c);
      // alert(obj);
	   if (obj)
		obj.innerHTML = '';
			
	  var url=fld+"&sid=" + Math.random();
		//alert(url)
		xmlHttp=GetXmlHttpObject(function () { stateChanged(c); })
		xmlHttp.open("GET", url , true)
		xmlHttp.send(null)
	} 

	function stateChanged(c) 
	{ 
		if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")    // KEEP GET AN ERROR HERE
		{ 
			var obj = document.getElementById(c);
			if (obj) obj.innerHTML =xmlHttp.responseText;
			//alert (xmlHttp.responseText);    
		} 
		else
		{
			document.getElementById(c).innerHTML='';
		}
	
	} 

function GetXmlHttpObject(handler)
	{ 
		var objXmlHttp=null
		
		if (navigator.userAgent.indexOf("Opera")>=0)
		{
			alert("This example doesn't work in Opera") 
			return 
		}
	
		if (navigator.userAgent.indexOf("MSIE")>=0)
		{ 
			var strName="Msxml2.XMLHTTP"
			if (navigator.appVersion.indexOf("MSIE 5.5")>=0)
			{
				strName="Microsoft.XMLHTTP"
			} 
		
			try
			{ 
				objXmlHttp=new ActiveXObject(strName)
				objXmlHttp.onreadystatechange=handler 
				return objXmlHttp
			} 
			
			catch(e)
			{ 
				alert("Error. Scripting for ActiveX might be disabled") 
				return 
			} 
		} 
		if (navigator.userAgent.indexOf("Mozilla")>=0)
			{
				objXmlHttp=new XMLHttpRequest()
				objXmlHttp.onload=handler
				objXmlHttp.onerror=handler 
				return objXmlHttp
			}
	} 

/*Ajax Activex object code ended*/
	function HideDisplay(id)
	{
		if (document.getElementById(id).style.display=="none")
			{
			document.getElementById(id).style.display = "block";
			//document.getElementById(id).style.left=parseInt(event.clientX+5)+'px'
			//document.getElementById(id).style.top=parseInt(event.clientY+5)+'px'

			}
		else
		{
			document.getElementById(id).style.display = "none";
			//document.getElementById('loginsection').style.display = "block";
		}
	}
	
	function HideDetails(id)
	{
			document.getElementById(id).style.display = "none";
	}
	
	function displayBlock(id,imgId)
	{
		if (document.getElementById(id).style.display=="none")
			{
				document.getElementById(id).style.display = "block";
				
				document.getElementById(imgId).src = "../admin/images/productnvMinus.gif";
			}
		else
		 {
			 document.getElementById(imgId).src = "../admin/images/procuctnvPlus.gif";
			 document.getElementById(id).style.display = "none";
		 }
	}

// Browser safe opacity handling function

function closeMyPopup(divid) {
	document.getElementById(divid).style.display = "none";
}

function fireMyPopup(Id) {
	//setOpacity( 0,Id );
	//alert(alert(document.getElementById(Id).style.display));
	if(document.getElementById(Id).style.display == "block")
	{
		
		document.getElementById(Id).style.display = "none";
		//fadeOutMyPopup(Id);
	}
	else
	{
		
		document.getElementById(Id).style.display = "block";
		//fadeInMyPopup(Id);
	}
	
}
