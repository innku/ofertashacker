class window.SpinnerApp
  constructor: (@elem) ->
    @spinner_class = 'spinner_wrapper'

  rise: () ->
    @elem.prepend(@template())
    new Spinner(@spinner_options()).spin(@spinner()[0])

  spinner_options: -> {}

  hide: () ->
    @spinner().remove()
    
  spinner: () ->
    @elem.find(".#{@spinner_class}")

  template: () ->
    $("""
      <div class='#{@spinner_class}'><div>
      """)

