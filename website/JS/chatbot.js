window.addEventListener('load', function () {

});

function addMessage(message) {
    const messageContainer = document.createElement('div');
    messageContainer.classList.add('chatbot-message');

    const messageText = document.createElement('p');
    messageText.classList.add('chatbot-message-text');
    messageText.textContent = message;

    const messageTime = document.createElement('p');
    messageTime.classList.add('chatbot-message-time');
    messageTime.textContent = `Sent ${new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: true })}`;

    messageContainer.appendChild(messageText);
    messageContainer.appendChild(messageTime);

    document.getElementById('chatbot-messages').appendChild(messageContainer);
}

async function sendMessage(message) {
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