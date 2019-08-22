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

// function createChannel() {
//     const channel = {
//         name: document.getElementById('name').value 
//     }
//     fetch('/rooms/', {
//         method: 'POST',
//         body: JSON.stringify({channel}),
//         headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json'
//         }
//     }).then(response => response.text() )
//     .then(channel => {
//         console.log(channel)
//         document.getElementById("channels").append += `<li><a href="rooms/${channel.name}">${channel.name}</a></li>`;
//         let channelFormDiv = document.getElementById('channelForm');
//         channelFormDiv.innerHTML = '';
//     }) 

    function createChannel() {
        const channel = {
            name: document.getElementById('name').value
        }

        console.log(channel)
        fetch('/rooms', {
            method: 'POST',
            body: JSON.stringify({ channel }),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => response.text())
            .then(channel => {
                console.log(channel)
                document.getElementById("channels").append += `<li><a href="rooms/${channel.name}">${channel.name}</a></li>`;
                let channelFormDiv = document.getElementById('channelForm');
                channelFormDiv.innerHTML = '';
            })
}

//submit form createChannel();
//createChannel posts to rooms create route
//grabs json