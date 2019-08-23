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

function showContacts(event) {
  event.preventDefault();

  fetch('/users', {
    method: 'GET', 
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
  }})
  .then(response => response.json())
  .then(users => {
    console.log(users)
  });
}
