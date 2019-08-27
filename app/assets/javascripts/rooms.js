function showChannelForm(event) {
  event.preventDefault();
  const channelForm = document.getElementById("channelForm");

  const html =
    `<form onsubmit="createChannel(); return false;">
    <label>Name: </label>
    <input type='text' id='name'/>
    <input type='submit' value='submit'/>    
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
      document.getElementById("channels").innerHTML += `<li><a href="rooms/${channel.name}">${channel.name}</a></li>`;
      let channelFormDiv = document.getElementById('channelForm');
      channelFormDiv.innerHTML = '';
  });
}

function getEvent(event) {
  let id;
  if (event.currentTarget.dataset.class === "contacts") {
    id = document.getElementById('contacts').firstElementChild.dataset.id;
  } else if (event.currentTarget.dataset.class === "channels") {
    id = document.getElementById('channels').firstElementChild.dataset.id;
  }
  return id;
}

function createMessageForm(id) {
  const messageForm = document.getElementById("messageForm");

  const html = "<form onsubmit='createMessage(); return false;'><input type='text' id='" + id + "' placeholder='send message...'/><input type='submit' value='submit'/></form>"

  messageForm.innerHTML = html;
}


function showMessages(event) {
  event.preventDefault();
  let id;
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
      let messageView = document.getElementById('showMessages');
      room.messages.forEach(function(message) {
        messageView.innerHTML += `<span class="message">${message.content}</span><br>`
      });
    })
}

function createMessage(event) {

  let message = {
    content: document.getElementById('messageForm').value
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
  })
}

