class window.NoJobAppender
  constructor: (@container) ->

  toggle: ->
    if @container.find('.job').length == 0
      $(@template()).hide().prependTo(@container).slideDown('fast') if @container.find('.no_job_message').length == 0
    else
      @container.find('.no_job_message').slideUp('fast', ->
        $(@).remove())

  template: ->
    """
      <div class="no_job_message mainContent span-23" >
        <h1>No hay ofertas con ese criterio de búsqueda</h1>
      </div>
    """

