class @GMap
  constructor: (@map)->
    @markers = []
    @infoWindows = []
    @filter = new ListingFilter()
    @filter.form.on 'change', @updateMarkers
    @filter.rentSlider.noUiSlider.on 'set', @updateMarkers
    @map.addListener 'idle', @updateMarkers

  addMarker: (post)=>
    marker  = new google.maps.Marker({
      position: {
        lat: post.latitude,
        lng: post.longitude
      },
      map: @map,
      title: post.title
    })
    infoWindow = new google.maps.InfoWindow({
      content: @getInfoWinContentString(post)
    })
    marker.addListener 'click', =>
      infoWindow.open(@map, marker)
    @infoWindows.push infoWindow
    marker

  getInfoWinContentString: (post)=>
    contentString = "<div class='info-window'>"+
      "<h5 class='center-align'>"+
        "#{post.street_address}"+
      "</h5>"+
      "<div class='row'>"+
        "<div class='col s4'>"+
          "<i class='fa fa-usd'></i> #{post.price}"+
        "</div>"+
        "<div class='col s4'>"+
          "<i class='fa fa-bed'></i> Bedroom: #{post.bedroom}"+
        "</div>"+
        "<div class='col s4'>"+
          "<i class='fa fa-female'></i> Bathroom: #{post.bathroom}"+
        "</div>"+
      "</div>"+
      "<div class='center-align'>"+
        "<a href='/posts/#{post.id}' target='_blank' class='btn'>More Info</a>"+
      "</div>"+
    "</div>"

  addMarkersToMap: (listings)=>
    for post in listings
      marker = @addMarker(post)
      @markers.push(marker)

  deleteMarkers: =>
    openedMarker = null
    openedInfoWindow = null
    for marker, i in @markers
      map = @infoWindows[i].getMap()
      if(map != null && typeof map != "undefined")
        openedMarker = @markers[i] 
        openedInfoWindow = @infoWindows[i]
      else
        marker.setMap(null)
    if(openedMarker && openedInfoWindow)
      @markers = [openedMarker]
      @infoWindows = [openedInfoWindow]
    else
      @markers = []
      @infoWindows = []

  populateMarkers: (listings)=>
    @deleteMarkers()
    @addMarkersToMap(listings)

  showFailerMsg: =>  

  updateUrl: (url)=>
    history.pushState({}, "newListing", url)
    
  getSearchQuery: =>
    bounds = @map.getBounds()
    swLat = bounds.getSouthWest().lat()
    swLng = bounds.getSouthWest().lng()
    neLat = bounds.getNorthEast().lat()
    neLng = bounds.getNorthEast().lng()
    zoom = @map.getZoom()
    "#{@filter.getSerialize()}&zoom=#{zoom}&swLat=#{swLat}&swLng=#{swLng}&neLat=#{neLat}&neLng=#{neLng}"

  updateMarkers: =>
    url = "/posts?#{@getSearchQuery()}"
    @updateUrl(url)
    $.ajax({
      url: url,
      dataType: "json" 
    })
    .done(@populateMarkers)
    .fail(@showFailerMsg)



