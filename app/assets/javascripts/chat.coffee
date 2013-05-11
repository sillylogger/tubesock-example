$ ->
  socket = new WebSocket("ws://#{window.location.host}/chat")

  $form = $("form#chat")

  $form.on "submit", (event) ->

    event.preventDefault()
    $input = $form.find("input#message")
    content = $input.val()

    socket.send(JSON.stringify(message: { content: content }))
    $input.val("")

  $output = $("#output")

  socket.onmessage = (event) ->
    $output.append(JSON.parse(event.data).message.content + "\n")
