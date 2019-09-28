class Message {

  constructor(message) {
    this.id = message.id 
    this.content = message.content 
    this.created_at = message.created_at
    this.username = message.username
  }

  renderMessage() {
    return `<div class="message"><span class="user-name">${this.username}</span> <span class="date">${this.created_at.slice(5, 10).replace("-", "/")}</span><br><br><span class="content">${this.content}</span></div><br>`
  }
}

class sortMessage {

  constructor(message) {
    //this.id = message.id
    this.content = message.content
    //this.created_at = message.created_at
    this.username = message.username
  }

  renderMessage() {
    return `<div class="message"><span class="user-name">${this.username}</span> <span class="date"></span><br><br><span class="content">${this.content}</span></div><br>`
  }
}

function clearSettings() {
  let settingsDiv;

  settingsDiv = document.querySelector('#settings').innerHTML = "";
  document.querySelector('#info-bar').firstChild.innerHTML = "";
}


function showChannelForm(event) {
  event.preventDefault();
  const channelForm = document.getElementById("channelForm");

  const html =
    `<form onsubmit="createChannel(); return false;">
    <input type='text' id='name' placeholder="find or create channel..." />    
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
      document.getElementById("channels").innerHTML += `<li><a href='#' onclick='showMessages(event);' data-id='${channel.name}' data-class='channels'>${channel.name}</a><a class="deleteButton" onclick="deleteRoom(event);" data-id="${channel.name}" data-class="channels" href="#">x</a></li>`;
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
  let id, messageView, roomName;
  event.preventDefault();
  clearSettings();

  roomName = event.currentTarget.innerHTML;
  document.querySelector('#info-bar').insertAdjacentHTML('afterbegin', `<h2 id="room-name">${roomName}</h2>`);

  messageView = document.getElementById('showMessages');
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

function deleteRoom(event) {

  let id, room;
  event.preventDefault();
  id = getEvent(event);
  fetch('/rooms/' + id, {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
  console.log(document.querySelector(`[data-id='${id}']`));
  room = document.querySelector(`[data-id='${id}']`);
  let parent = room.parentNode;
  while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
  }
}

function sortMessages(event) {
  event.preventDefault();
  let messages, messageDiv;
  
  messageDiv = document.querySelector('#showMessages');
  messages = messageDiv.querySelectorAll('.message');
  messageDiv.innerHTML = ''

  let messagesArray = Array.from(messages);
  let sortedArray = messagesArray.sort((a, b) => {
    
    var nameA = a.children[0].innerText.toUpperCase(); // ignore upper and lowercase
    var nameB = b.children[0].innerText.toUpperCase(); // ignore upper and lowercase
    if (nameA < nameB) {
      return -1;
    }
    if (nameA > nameB) {
      return 1;
    }

    // names must be equal
    return 0;
  });

  for (var i = 0; i < sortedArray.length; i++) {
    messageDiv.appendChild(sortedArray[i]);
  }

 }

