class Message {

  constructor(message) {
    this.id = message.id 
    this.content = message.content
    this.room_id = message.room_id 
    this.user_id = message.user_id
    this.created_at = message.created_at
  }

  renderMessage() {
    return `<span class="message">${this.content} ${this.created_at.slice(5, 10).replace("-", ":")}</span><br>`
  }
}

function clearSettings() {
  let settingsDiv;

  settingsDiv = document.querySelector('#settings').innerHTML = "";
}


function showChannelForm(event) {
  event.preventDefault();
  const channelForm = document.getElementById("channelForm");

  const html =
    `<form onsubmit="createChannel(); return false;">
    <input type='text' id='name'/>    
    </form>`

  channelForm.innerHTML = html;
} 

function createChannel() {
  const channel = {
      name: document.getElementById('name').value
  }

  fetch('/rooms', {
    method: 'POST',
    body: JSON.stringify({ channel }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }})
    .then(response => response.json())
    .then(channel => {
      document.getElementById("channels").innerHTML += `<a href='#' onclick='showMessages(event);' data-id='${channel.name}' data-class='channels'>${channel.name}<a>`;
  });
  let channelFormDiv = document.getElementById('channelForm');
  channelFormDiv.innerHTML = '';
}

function getEvent(event) {
  let id;
  if (event.currentTarget.dataset.class === "contacts") {
    id = event.currentTarget.dataset.id;
  } else if (event.currentTarget.dataset.class === "channels") {
    id = event.currentTarget.dataset.id;
  }
  return id;
}

function createMessageForm(id) {

  const messageForm = document.getElementById("messageForm");

  const html = `<form name='form' id='form' onsubmit='createMessage(event);'><input type='text' id='text' placeholder='send message...'/><input type='hidden' name='room' value="${id}"/></form>`

  messageForm.innerHTML = html; 
}


function showMessages(event) {
  event.preventDefault();
  clearSettings();
  let id
  let messageView = document.getElementById('showMessages');

  id = getEvent(event);
  createMessageForm(id);
  
  console.log(id)
  fetch('/rooms/' + id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
    .then(response => response.json())
    .then(room => {
      messageView.innerHTML += room.messages.map(message => {
        let m = new Message(message)
        return m.renderMessage()
      }).join('');
      messageView.scrollTop = messageView.scrollHeight;
    })
  messageView.innerHTML = '';
}

function setAttributes(el, attrs) {
  for (var key in attrs) {
    el.setAttribute(key, attrs[key]);
  }
}
 

function createMessage(event) {
  event.preventDefault();
  let messageView = document.getElementById('showMessages');
  let message = {
    content: document.getElementById('text').value,
    id: document.form.elements['room'].value
  } 

  console.log(message)
  fetch('/messages', {
    method: 'POST',
    body: JSON.stringify({ message }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
  .then(response => response.json())
  .then(message => {
    console.log(message);
  
    document.getElementById('showMessages').innerHTML += `<span>${message.content}</span><br>`
    let m = document.getElementById('showMessages').lastChild.previousSibling.classList.add("message");

    messageView.scrollTop = messageView.scrollHeight;
  })
  document.getElementById('text').value = " ";
}

