window.addEventListener('load', function () {
    // Page loaded
    // Variables
    const messageContainer = document.getElementById('chat-box-messages');
    const messageInput = document.getElementById('chat-box-input');
    const messageSend = document.getElementById('chat-box-send');
    let messages = [];

});

// Functions
function addMessage(message) {
    messages.push(message);
    const messageElement = document.createElement('div');
    messageElement.classList.add('chat-box-message');

    const messageHeader = document.createElement('div');
    messageHeader.classList.add('chat-box-message-header');

    const avatar = document.createElement('img');
    avatar.classList.add('chat-box-message-header-avatar');
    avatar.src = './media/user-nurse-solid.svg';
    avatar.alt = 'Avatar';

    const userName = document.createElement('p');
    userName.classList.add('chat-box-message-header-user');
    userName.textContent = 'SHT Bot';

    const messageText = document.createElement('p');
    messageText.classList.add('chat-box-message-text');
    messageText.textContent = message;

    const messageTime = document.createElement('p');
    messageTime.classList.add('chat-box-message-time');
    messageTime.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

    messageHeader.appendChild(avatar);
    messageHeader.appendChild(userName);
    messageElement.appendChild(messageHeader);
    messageElement.appendChild(messageText);
    messageElement.appendChild(messageTime);

    messageContainer.appendChild(messageElement);
    // Scroll to bottom
    messageContainer.scrollTop = messageContainer.scrollHeight;
}

async function sendMessage() {
    const message = messageInput.value;
    if (message) {
        addMessage(message);
        messageInput.value = '';
        // Send message to server
        const req = await fetch('http://localhost:3000/message', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ message })
        }).catch(error => {
            console.error('Error:', error);
            addMessage('Sorry, I am not available right now. Please try again later.');
        });
        const res = await req.json();
        if (!res.success) {
            addMessage(res.error);
        }
    }
}