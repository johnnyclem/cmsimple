class CMSimple.Panels.PageMetadata extends Spine.Controller

  elements:
    'form' : 'form'
    '.mercury-modal-content' : 'content'

  events:
    'submit form' : 'submit'

  constructor: (container, @modal)->
    super el: container

  submit: (e)->
    e.preventDefault()
    page = CMSimple.Editor.current_page.fromForm(@form)
    page.save
      ajax:
        error: @proxy @error
      success: @proxy @success

  success: (page)->
    @modal.hide()

  error: (event, data)->
    @content.html event.responseText
    alert('Please fill in the required fields.')

