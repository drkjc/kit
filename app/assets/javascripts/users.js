function clearMessages() {
  let showMessages, messageForm;

  showMessages = document.querySelector('#showMessages').innerHTML = ""
  messageForm = document.querySelector('#messageForm').innerHTML = "";
  document.querySelector('#info-bar').lastChild.innerHTML = "Settings";
}

function filterUsers() {
  var input, filter, ul, li, a, i, txtValue;

  input = document.getElementById('search');
  filter = document.getElementById('search').value.toUpperCase();
  ul = document.getElementById('usersList');
  li = ul.getElementsByTagName('li');

  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    txtValue = a.textContent || a.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1 ) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}

function showSettings(event) {
  let settingsDiv, userID;
  event.preventDefault(); 
  clearMessages();

  settingsDiv = document.querySelector('#settings');
  userID = parseInt(document.querySelector('h1').dataset.id);
  
  fetch(`/users/${userID}`, {
    method: 'GET',
    headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }})
  .then(resp => resp.json() )
  .then(user => {
    console.log(user);
    settingsDiv.insertAdjacentHTML("beforeend", `<span class="set-title">Username: </span><br> <span id='settings-name'>${user.name}</span><hr><br>`);
    settingsDiv.insertAdjacentHTML("beforeend",`<span class="set-title">Email: </span><br> <span id='settings-email'> ${user.email}</span>`)
  })
  settingsDiv.innerHTML = ""
}