from flask import Flask, jsonify, request
import requests

# Replace with your OpenRouter API key
API_KEY = "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"
API_URL = "https://openrouter.ai/api/v1/chat/completions"

# Define the headers for the API request
headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

app = Flask(__name__)

# Function to interact with the AI chatbot (from ai.py)
def chat_with_ai(user_input):
    data = {
        "model": "deepseek/deepseek-chat:free",
        "messages": [{"role": "user", "content": user_input}]
    }
    response = requests.post(API_URL, json=data, headers=headers)
    if response.status_code == 200:
        return response.json()["choices"][0]["message"]["content"]
    else:
        return "Sorry, I'm having trouble processing your request right now. Please try again later."

@app.route('/')
def home():
    return "Welcome to the chatbot!"

@app.route('/chat', methods=['POST'])
def chat():
    data = request.get_json()

    # Check if the message is in the request
    if not data or "message" not in data:
        return jsonify({"error": "Message is required"}), 400

    user_message = data["message"]

    # Get the chatbot's response
    bot_response = chat_with_ai(user_message)

    return jsonify({"response": bot_response})

if __name__ == '__main__':
    app.run(debug=True, port=5001)
