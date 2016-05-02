$(document).on "page:change", ->
  $('.slider').slider full_width:true
  $('select').material_select()
  $(".button-collapse").sideNav({
    menuWidth: 350
  })
  
  
