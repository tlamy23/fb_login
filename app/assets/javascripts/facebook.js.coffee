jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: '289674577850267', cookie: true)

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

  $(document).bind("fb.loaded", ->
  FB.getLoginStatus((response)  ->
    if(response.status == "connected")
      location.href ="/auth/facebook/callback?#{$.param({ signed_request: response.authResponse.signedRequest })}"))

      