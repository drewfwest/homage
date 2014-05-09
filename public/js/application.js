$(document).ready(function () {
  $('#search-reference').submit(searchReference)
});

function searchReference(event) {
  event.preventDefault();
console.log(this.action)
  var ajaxRequest = $.ajax({
    url: this.action,
    type: this.method,
    data: {title: $(this).find("[name='title']").val() }
  })
  displayMessage('Searching for your reference...')
  ajaxRequest.done(displayResult)
  ajaxRequest.fail(requestFailure)
}

function displayMessage(message) {
  $('#search-reference').prepend('<h2 id="message">' + message +'</h2>')
}

function displayResult(apiResults) {
  $('#search-reference').prepend('<h1>' + apiResults.result + '</h1>')
  console.log("I love you")
}

function requestFailure() {
  return
}