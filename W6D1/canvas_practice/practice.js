document.addEventListener("DOMContentLoaded", function(){

  let canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  let ctx = canvas.getContext('2d');
  ctx.fillStyle = "orange";
  ctx.fillRect(0,0,500,700)

  ctx.beginPath();
  ctx.arc(200,200,100,0,2 * Math.PI);
  ctx.strokeStyle ='white';
  ctx.lineWidth = 5;
  ctx.stroke();
});
