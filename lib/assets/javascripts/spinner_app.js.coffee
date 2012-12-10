class window.SpinnerApp
  constructor: (@elem) ->
    @spinner_class = 'spinner_wrapper'

  rise: () ->
    if @spinner().length == 0
      @elem.append(@template())
      new Spinner(@spinner_options()).spin(@spinner()[0])

  hide: () ->
    setTimeout( (() => 
      @spinner().fadeOut('slow', -> $(@).remove())
    ), 500)

  spinner_options: -> {
    lines: 9
    length: 4
    width: 2
    radius: 5
    corners: 1
    rotate: 0
    trail: 60
    speed: 2
    color: '#FFF'
  }
    
  spinner: () ->
    @elem.find(".#{@spinner_class}")

  template: () ->
    $("""
      <div class='#{@spinner_class}'><div>
      """)
