class window.NoJobAppender
  constructor: (@container, @jobs) ->

  toggle: ->
    if @no_jobs()
      if @no_job_message_exists()
        @attach_no_job_message()
    else
      @remove_no_job_message()

  remove_no_job_message: ->
    @no_job_message().slideUp('fast', -> $(@).remove())

  attach_no_job_message: ->
    $(@template()).hide().prependTo(@container).slideDown('fast')

  no_job_message_exists: ->
    @no_job_message().length == 0

  no_jobs: ->
    @jobs == 0

  no_job_message: ->
    @container.find('.no_job_message')

  template: ->
    """
      <div class="no_job_message mainContent span-23" >
        <h1>No hay ofertas con ese criterio de búsqueda</h1>
      </div>
    """

