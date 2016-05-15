class Favorite
  constructor: ->
    $(document).on 'click', '#create-favorite', @onClickCreate
    $(document).on 'click', '#destroy-favorite', @onClickDestroy

  onClickCreate: (e)=>
    url = $("#create-favorite").attr "href"
    id = $("#post_id").val()
    $.ajax
      method: "POST"
      url: url
      data: {post: id}
      success: (data)->
        newElement = "<a class='btn right' id='destroy-favorite' data-remote='true'
href='/favorites/#{data.id}'><i class='fa fa-star-half-empty'></i> Unfavorite</a>"
        $('#create-favorite').remove()
        $(".post-buttons").append(newElement)
    false

  onClickDestroy: (e)=>
    $.ajax
      method: "DELETE"
      url: $("#destroy-favorite").attr "href"
      success: (data)->
        newElement = "<a class='btn right' id='create-favorite' data-remote='true'
href='/favorites'><i class='fa fa-star-o'></i> Favorite</a>"
        $('#destroy-favorite').remove()
        $(".post-buttons").append(newElement)
    false

$(document).ready ->
  new Favorite()
