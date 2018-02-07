// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/* CANVAS DRAWINGS */

$(document).on('turbolinks:load', function(){
  
  // draw calories' progress canvases in the main tab
  if ( $('#calories_left_canvas').length ) { drawCaloriesLeftCanvas(); }
  if ( $('#calories_burned_canvas').length ) { drawCaloriesBurnedCanvas(); }
  if ( $('#calories_eaten_canvas').length ) { drawCaloriesEatenCanvas(); }

  // expand the main panel on root path entry
  if ( $('#rolled').length ) { document.getElementById('rolled').style.right = '600px'; }
  
  $('#close_flash_message').click(function() {
    $('#flash_message').hide();
  });

  // manage calendar tab view
  $('#open_calendar_tab').click({id: 'open_calendar_tab'}, changeActiveCalendarTab);
  $('#open_food_tab').click({id: 'open_food_tab'}, changeActiveCalendarTab);
  $('#open_exercise_tab').click({id: 'open_exercise_tab'}, changeActiveCalendarTab);
  $('#open_goals_tab').click({id: 'open_goals_tab'}, changeActiveCalendarTab);

  // manage DailyActivity tab view - bind event to #calendar_tab so it stays active on ajax change
  $('#calendar_tab').on('click', '#open_food_table', {id: 'open_food_table'}, changeActiveDayTab);
  $('#calendar_tab').on('click', '#open_exercise_table', {id: 'open_exercise_table'}, changeActiveDayTab);
  $('#calendar_tab').on('click', '.calendar-link', function(){
    $("#day_tab").hide();
    $("#calendar_default").show();
  });

  // remove item from the foods/exercises list without refreshing
  $('#calendar_tab').on('click', '.body-remove a', function() {
    // change caloric values in calendar/affected day cell
    var id = $('#day_date_hidden').html();
    var amount = parseInt( $(this).parent().siblings(".body-calories").html() , 10 );
    var type = $(".day-table-active").attr("id");
    if (type == 'food_table') {
      var node = $("#" + id + " .cell-foods-count");
    } else {
      var node = $("#" + id + " .cell-exercises-count");
    }
    var value = parseInt( node.html() , 10 ) - amount;
    node.html( value );

    // remove nod
    $(this).parent().parent().remove();
  })

  // roll the main panel when requested root path
  $('#panel_link').click( function(evt){
    evt.preventDefault();
    var link = $(this).attr("href");
    setTimeout( function(){ window.location.href = link }, 1000 );
    document.getElementsByClassName('side-panel')[0].style.right = '0px';
  } )
});

function changeActiveDayTab(event) {
  $('.active-day-tab').removeClass('active-day-tab');
  $('#' + event.data.id).addClass('active-day-tab');
  $('.day-table-active').removeClass('day-table-active');
  $("#" + event.data.id.substr(5)).addClass('day-table-active');
}
function changeActiveCalendarTab(event) {
  $(".activity-active").removeClass('activity-active');
  $(".tab-active").removeClass('tab-active');
  $("#" + event.data.id).addClass('activity-active');
  $("#" + event.data.id.substr(5)).addClass('tab-active');
}

function drawCaloriesEatenCanvas(){
  var canvas = document.getElementById("calories_eaten_canvas");
  var ctx = canvas.getContext("2d");

  var current_value = parseInt(document.getElementById('calories-eaten').innerText)
  var total_value = parseInt(document.getElementById('calories-food-hidden').innerText)
  var progress = current_value / total_value
  if (progress > 1) { progress = 1 }
  
  drawSmallCaloriesCanvas(ctx, progress, '#16dc6d');
}

function drawCaloriesBurnedCanvas(){
  var canvas = document.getElementById("calories_burned_canvas");
  var ctx = canvas.getContext("2d");

  var current_value = parseInt(document.getElementById('calories-burned').innerText)
  var total_value = parseInt(document.getElementById('calories-exercise-hidden').innerText)
  var progress = current_value / total_value
  if (progress > 1) { progress = 1 }
  
  drawSmallCaloriesCanvas(ctx, progress, '#ff5833');
}


function drawSmallCaloriesCanvas(ctx, innerSquareSize, color) {
  ctx.beginPath();
  ctx.rect(1, 1, 42, 42);
  ctx.lineWidth = 2;
  ctx.strokeStyle = '#5b4573';
  ctx.stroke();

  var squareSize = 42 * innerSquareSize;
  var XYcoords = 23 - (22 * innerSquareSize);   
  ctx.fillStyle = color;
  ctx.fillRect(XYcoords, XYcoords, squareSize, squareSize);
}

function drawCaloriesLeftCanvas(){
  var canvas = document.getElementById("calories_left_canvas");
  var ctx = canvas.getContext("2d");
  ctx.beginPath();
  ctx.moveTo(canvas.width / 2, 4); // draw a square 
  ctx.lineTo(canvas.width - 4, canvas.height / 2);
  ctx.lineTo(canvas.width / 2, canvas.height - 4);
  ctx.lineTo(4, canvas.height / 2);
  ctx.lineTo(canvas.width / 2, 4);

  ctx.lineWidth = 8;
  ctx.strokeStyle = '#5b4573';
  ctx.lineCap = 'round';
  ctx.stroke();

  drawCaloriesLeftProgress();
}

function drawCaloriesLeftProgress(){
  var canvas = document.getElementById("calories_left_canvas");
  var ctx = canvas.getContext("2d");

  var current_value = parseInt(document.getElementById('calories-left-value').innerText)
  var total_value = parseInt(document.getElementById('calories-food-hidden').innerText)
  var progress = (total_value - current_value) / total_value

  ctx.beginPath();
  ctx.moveTo(canvas.width / 2, 4);

  var line_progress, step; 
  if (progress > 0) {
    step = (progress).toFixed(2) // assign progress value accounting for past drawn lines and round to 2 digits after dot
    line_progress = step >= 0.25 ? 1 : (step / 0.25) // check if there is more than 25% of progress

    ctx.lineTo( (canvas.width / 2) + ( (canvas.width / 2 - 4) * line_progress ), 
                4 + ( (canvas.height / 2 - 4) * line_progress) ); // draw remaining line
  }
  if (progress > 0.25) {
    step = (progress - 0.25).toFixed(2)
    line_progress = step >= 0.25 ? 1 : (step / 0.25)

    ctx.lineTo( ( (canvas.width - 4) - ( (canvas.width / 2 - 4) * line_progress) ), 
                (canvas.height / 2) + ((canvas.height / 2 - 4) * line_progress) ); 
  } 
  if (progress > 0.5) {
    step = (progress - 0.50).toFixed(2)
    line_progress = step >= 0.25 ? 1 : (step / 0.25)

    ctx.lineTo( (canvas.width / 2) - ( (canvas.width / 2 - 4) * line_progress), 
                (canvas.height - 4) - ( (canvas.height / 2 - 4) * line_progress) ); 
  } 
  if (progress > 0.75) {
    step = (progress - 0.75).toFixed(2)
    line_progress = step >= 0.25 ? 1 : (step / 0.25)

    ctx.lineTo( 4 + ( (canvas.width / 2 - 4) * line_progress), 
                (canvas.height / 2) - ( (canvas.height / 2 - 4) * line_progress) ); 
  }

  ctx.lineWidth = 8;
  ctx.strokeStyle = '#16dc6d';
  ctx.lineCap = 'round';
  ctx.stroke();
}