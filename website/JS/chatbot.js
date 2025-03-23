import config from './config.json' with {type: "json"};

window.addEventListener('load', function () {
    const sendButton = document.getElementById('chatbot-input-button');
    const messageInput = document.getElementById('chatbot-input-text');
    messageInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            sendButton.click();
        }
    });
    sendButton.addEventListener('click', async () => {
        sendButton.disabed = true;
        await sendMessage();
        sendButton.disabed = false;
    }
    );
});

function addMessage(message, isUser = false) {
    const messageContainer = document.createElement('div');
    messageContainer.className = "chatbot-message";
    if (isUser) {
        messageContainer.className = "chatbot-message chatbot-message-right";
    }
    const messageText = document.createElement('p');
    messageText.classList.add('chatbot-message-text');
    messageText.innerHTML = formatMessage(message); // Changed to innerHTML and format the message

    const messageTime = document.createElement('p');
    messageTime.classList.add('chatbot-message-time');
    messageTime.textContent = `Sent ${new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: true })}`;

    messageContainer.appendChild(messageText);
    messageContainer.appendChild(messageTime);

    document.getElementById('chatbot-messages').appendChild(messageContainer);
    // Scroll to the bottom of the message container
    messageContainer.scrollIntoView({ behavior: 'smooth' });
}

function formatMessage(message) {
    // Replace **word** with <b>word</b>
    message = message.replace(/\*\*(.*?)\*\*/g, '<b>$1</b>');
    // Replace [link text](link url) with <a href="link url">link text</a>
    message = message.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2">$1</a>');
    return message;
}

async function sendMessage() {
    const messageInput = document.getElementById('chatbot-input-text');
    const message = messageInput.value;
    if (message) {
        addMessage(message, true);
        messageInput.value = '';
        // Send message to server
        const req = await fetch(`${config.apiURL}/chat`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ message: message + " format the response in an html paragraph with proper spacing and use of bold and links. dont format it as a code block just keep it as plain text" }),
            mode: 'cors' // Added CORS support
        }).catch(error => {
            console.error('Error:', error);
            addMessage('Sorry, I am not available right now. Please try again later.');
        });
        const res = await req.json();
        if (res.response) {
            addMessage(res.response);
        } else {
            addMessage('Sorry, I am not available right now. Please try again later.');
        }
    }
}

function goToUrl(url) {
    window.location.href
};