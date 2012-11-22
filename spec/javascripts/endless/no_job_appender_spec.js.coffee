#= require 'application'

describe 'NoJobAppender', ->
  describe 'toggle', ->
    it 'should append the no jobs div if no jobs are supplied', ->
      empty_job_container = $("<div></div>")
      new NoJobAppender(empty_job_container).toggle()
      empty_job_container.find('.no_job_message').length.should.not.equal(0)

    it 'should not append the no jobs div if no jobs are supplied but the div is already there', ->
      empty_job_container = $("<div><div class='no_job_message'></div></div>")
      new NoJobAppender(empty_job_container).toggle()
      empty_job_container.find('.no_job_message').length.should.equal(1)

    it 'should remove the no jobs div if jobs are supplied', ->
      job_container = $("<div><div class='job'></div></div>")
      new NoJobAppender(job_container).toggle()
      job_container.find('.no_job_message').length.should.equal(0)
