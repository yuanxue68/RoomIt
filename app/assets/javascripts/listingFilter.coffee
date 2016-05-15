class @ListingFilter
  constructor: ->
    @rentSlider =  @createSlider()
    @form = $('#filter-form')
    $('#open-side').on 'click', @showFilter
    $('#filter-reset').on 'click', @reset

  showFilter: ->
    $('.button-collapse').sideNav('show')
  
  reset: (e)=>
    e.preventDefault()
    @form[0].reset()
    @rentSlider.noUiSlider.set([0, 3000])

  getSerialize: =>
    rent = @rentSlider.noUiSlider.get()
    "#{@form.serialize()}&minRent=#{rent[0]}&maxRent=#{rent[1]}"

  createSlider: ->
    slider = document.getElementById('rent-slider')
    noUiSlider.create(slider, {
      start: [0, 3000],
      connect: true,
      step: 1,
      range: {
        'min': 0,
        'max': 10000
      },
      format: wNumb({
        decimals: 0
      })
    })
    slider
  
