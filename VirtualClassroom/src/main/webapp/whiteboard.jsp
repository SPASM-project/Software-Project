
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0"/>
       <title><%out.println(request.getParameter("classname"));%> Board</title>
        <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="style.css" type="text/css" rel="stylesheet"/>
        <link rel="stylesheet" href="../../../node_modules/sweetalert2/dist/sweetalert2.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
         @import url('https://fonts.googleapis.com/css?family=Mukta');
 :root{}
 body {
     margin: 0px;
     /* padding: 30px; */
     font-family: "Mukta";
     background: #313131;
 }
 
 /*-- --added --
	#custom-button {
  padding: 10px;
  color: white;
  background-color: #009578;
  border: 1px solid #000;
  border-radius: 5px;
  cursor: pointer;
}

#custom-button:hover {
  background-color: #00b28f;
}
*/
#custom-text {
  margin-left: 10px;
  font-family: sans-serif;
  color: #aaa;
}
	
	
	
	/*end*/
 
 canvas {
     /* box-shadow: -3px 2px 9px 6px black; */
     cursor: pointer;
     /* background-color: aliceblue; */
 }
/* .tools {
     display: flex;
     justify-content: center;
     flex-direction: row;
     /* margin-top: 15px; */
    /* background-color: rgb(102, 101, 101);
     padding: 8px;
 }*/
 .tools .color-field {
     height :40px;
     width: 40px;
     min-height: 40px;
     min-width: 40px;
     cursor: pointer;
     display: inline-block;
     box-sizing: border-box;
     border-radius: 50%;
     border: 2px solid white;
     align-self: center;
     margin:0 10px;

 }
 
 .tools .color-field-eraser {
     height :40px;
     width: 40px;
     min-height: 40px;
     min-width: 40px;
     cursor: pointer;
     display: inline-block;
     box-sizing: border-box;
     border-radius: 0%;
     border: 2px solid white;
     align-self: center;
    margin:0 10px;
   

 }
 .tools .button {
     align-self: center;
     width: 100px;
     height: 40px;
     border: 2px solid white;
     cursor: pointer;
     color: white;
     background: #222;
     font-weight: bold;
     margin: 0 10px;
 }
 .color-picker {
     align-self: center;
     margin: 0 10px;
     height: 50px;
 }
 .pen_range {
     align-self: center;
     margin: 0 15p0;
 }
    </style>
    </head>
    <!-- declaration.... -->
<%!String code; %>
<!-- session management.... -->
<%
if (request.getParameter("code") == null) {
	response.sendRedirect("CreateTeacher.jsp");
}
%>
<!-- getting value.... -->
<%
	code = request.getParameter("code");
	String classname=request.getParameter("classname");
		
	session.setAttribute("classcode", code);
	session.setAttribute("classname", classname);
	System.out.println("classcode in People.jsp:" + code);
%>
<body>
<div class="field">
    <div class="pos-f-t">
  <div class="collapse fixed-top mt-5" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
       <div class="tools">
        
        <div onClick="change_color(this)" class="color-field" style="background: red;"></div>
        <div onClick="change_color(this)" class="color-field" style="background: green;"></div>
        <div onClick="change_color(this)" class="color-field" style="background: blue;"></div>
        <div onClick="change_color(this)" class="color-field" style="background: yellow;"></div>

		<input type="hidden" value="<%=classname %>" name="class" id="class">
        <input onInput="draw_color = this.value" type="color" class="color-picker">
        <input type="range" onInput="draw_width = this.value" min="1" max="100" class="pen-range">
        <div onClick="eraser(this)" class="color-field-eraser" style="background: #fff;"></div>s
        <input type="file" id="uploader"  onchange="return fileValidation()" hidden="hidden">
        <button type="button" class="btn btn-outline-secondary" id="custom-button"><i class="fa fa-paperclip" aria-hidden="true"></i>  Add</button>
		
        
        <button id="save" class="btn btn-info" onClick="save()">Save</button>
       
        
        <button class="btn btn-light " onClick="undo_last()" type="button" class="button">Undo</button>
        <button class="btn btn-light " onClick="clear_canvas()" type="button" class="button">Clear</button>
    </div>
    </div>
  </div>
  <nav class="navbar navbar-light fixed-top bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </nav>
</div>
   
    <canvas id="canvas"></canvas>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	

<script>

<!-- --added -->
const realFileBtn = document.getElementById("uploader");
const customBtn = document.getElementById("custom-button");
const customTxt = document.getElementById("custom-text");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

realFileBtn.addEventListener("change", function() {
  if (realFileBtn.value) {
    customTxt.innerHTML = realFileBtn.value.match(
      /[\/\\]([\w\d\s\.\-\(\)]+)$/
    )[1];
  } else {
    customTxt.innerHTML = "No file chosen, yet.";
  }
});
<!--end-->





const reader=new FileReader();
const img=new Image();

 const canvas = document.querySelector("#canvas");

 canvas.width = window.innerWidth;
 canvas.height = window.innerHeight-9;

 let context = canvas.getContext("2d");
 let start_background_color="white";
 context.fillStyle =  start_background_color;
 

 context.fillRect(0, 0, canvas.width, canvas.height);

let draw_color = "black";
let draw_width = "2";
let is_drawing = false;

let restore_array = [];
let index = -1;

function change_color(element) {
    draw_color = element.style.background;
}
function eraser(element) {
	//alert();
    draw_color = element.style.background;
}

canvas.addEventListener("touchstart",start,false);
canvas.addEventListener("touchmove",draw,false);
canvas.addEventListener("mousedown",start,false);
canvas.addEventListener("mousemove",draw,false);



canvas.addEventListener("touchend",stop,false);
canvas.addEventListener("mouseup",stop,false);
canvas.addEventListener("mouseout",stop,false);

function start(event) {
    is_drawing = true;
    context.beginPath();
    context.moveTo(event.clientX - canvas.offsetLeft,
                  event.clientY - canvas.offsetTop);
                  event.preventDefault();
                  
}

function draw(event){
    if(is_drawing){
        context.lineTo(event.clientX - canvas.offsetLeft,
                       event.clientY - canvas.offsetTop);
      
                       context.strokeStyle = draw_color;
                       context.lineWidth = draw_width;
                       context.lineCap = "round";
                       context.lineJoin = "round";
                       context.stroke();
    }
    event.preventDefault();
}   

function stop(event) {
    if(is_drawing) {
        context.stroke();
        context.closePath();
        is_drawing=false;
    }
    event.preventDefault();
    if(event.type != 'mouseout'){
        restore_array.push(context.getImageData(0,0,canvas.width,canvas.height));
        index += 1;
        console.log(restore_array);
   }
}  
function clear_canvas() {
    context.fillStyle = start_background_color;
    context.clearRect(0,0,canvas.width,canvas.height);
    context.fillRect(0,0,canvas.width,canvas.height);
    restore_array = [];
    index = -1;
}   

function undo_last() {
    if (index <= 0) {
        clear_canvas();
    }
    else {
        index -=1;
        restore_array.pop();
        context.putImageData(restore_array[index], 0, 0);
    }
    

}   
const timeElapsed = Date.now();
const today = new Date(timeElapsed);
const sub=document.getElementById('class').value;
function save(){
	alert(sub);
	var canvas = document.getElementById("canvas");
	canvas.toBlob(function(blob) {
	    saveAs(blob, today.toDateString()+"_"+sub+".png");
	});
}

const uploadImage = (e) => {
	reader.onload = () => {
		 img.onload =() => {
			 //canvas.width = img.width;
			 img.width=100;
			 img.height=100;
			 //canvas.height = img.height;
			 context.drawImage(img, 100	, 100);
		 };
		 img.src =reader.result;
	};
	reader.readAsDataURL(e.target.files[0]);
	};
document.getElementById("uploader").addEventListener("change", uploadImage);


function fileValidation(){
    var fileInput = document.getElementById('uploader');
    var filePath = fileInput.value;
    var allowedExtensions = /(\.png)$/i;
    if(!allowedExtensions.exec(filePath)){
       
        Swal.fire('Oops...', 'Please upload file having extensions /.png /.jpg / only.!', 'error');
        fileInput.value ='';
        filePath='';
        return false;
    }else{
        	if(fileInput.files[0].size/(1024*1024)>=8){
        		Swal.fire('Oops...', 'File size must be smaller than 8..!', 'error');
        		fileInput.value ='';
                filePath='';
                return false;
        	}
        	else{
        		return true;
        	}
        }
    }


</script>



</body>
</html>