$(document).on "page:change", ->
  $('#upload-profile').change ->
    $('#upload-profile-form').submit()
