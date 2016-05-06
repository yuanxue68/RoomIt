class @Cropper
  constructor: (@originalWidth, @originalHeight, @ratio)->
    @preview = $('#preview')
    @cropX = $('#crop_x')  
    @cropY = $('#crop_y')
    @cropW = $('#crop_w')
    @cropH = $('#crop_h')
    $('#crop-box').Jcrop({
      onChange: @updateCrop,
      onSelect: @updateCrop,
      setSelect: [0, 0, 500, 500],
      aspectRatio: 1
    })
  updateCrop: (coords)=>
    rx = 100/coords.w
    ry = 100/coords.h
    @updateCss(rx, ry, coords)
    @updateForm(coords)

  updateCss: (rx, ry, coords)=>
    @preview.css({
      width: Math.round(rx * @originalWidth) + 'px',
      height: Math.round(ry * @originalHeight) + 'px',
      marginLeft: '-' + Math.round(rx * coords.x) + 'px',
      marginTop: '-' + Math.round(ry *coords.y) + 'px'
    })

  updateForm: (coords)=>
    @cropX.val(Math.round(coords.x * @ratio))
    @cropY.val(Math.round(coords.y * @ratio))
    @cropW.val(Math.round(coords.w * @ratio))
    @cropH.val(Math.round(coords.w * @ratio))
###
  updateCss: (rx, ry)=>
    @preview.css({
      width: Math.round(rx * @original_width) + 'px',
			height: Math.round(ry * @original_height) + 'px',
			marginLeft: '-' + Math.round(rx * coords.x) + 'px',
			marginTop: '-' + Math.round(ry * coords.y) + 'px' 
    })
  update_form: (coords)=>
 		@crop_x.val(Math.round(coords.x * @ratio))
		@crop_y.val(Math.round(coords.y * @ratio))
		@crop_w.val(Math.round(coords.w * @ratio))
		@crop_h.val(Math.round(coords.h * @ratio))   
###
