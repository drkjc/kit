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

// event.preventDefault();
// const channelForm = document.getElementById("channelForm");

// const html =
//   `<form onsubmit="createChannel(); return false;">
//     <label>Name: </label>
//     <input type='text' id='name'/>
//     <input type='submit' value='submit'/>    
//     </form>`

// channelForm.innerHTML = html;
// }

// function createChannel() {
//   const channel = {
//     name: document.getElementById('name').value
//   }

//   fetch('/rooms', {
//     method: 'POST',
//     body: JSON.stringify({ channel }),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     }
//   })
//     .then(response => response.json())
//     .then(channel => {
//       document.getElementById("channels").innerHTML += `<li><a href="rooms/${channel.name}">${channel.name}</a></li>`;
//       let channelFormDiv = document.getElementById('channelForm');
//       channelFormDiv.innerHTML = '';
//     });
// }



function showMessages(event) {
  console.log("You're here")
  fetch('/rooms', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
  .then(response => response.json())
  .then(room => {
    console.log(room);
  })
}