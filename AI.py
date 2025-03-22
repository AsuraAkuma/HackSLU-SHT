import requests

# Replace with your OpenRouter API key
API_KEY = "sk-or-v1-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"
API_URL = "https://openrouter.ai/api/v1/chat/completions"

# Define the headers for the API request
headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

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

def mental_health_chatbot():
    print("Hello! I'm here to listen. How are you feeling today? (Type 'exit' to stop)")
    while True:
        user_input = input("You: ")
        if user_input.lower() == "exit":
            print("Chatbot: Take care! Remember, you're not alone.")
            break
        response = chat_with_ai(user_input)
        print(f"Chatbot: {response}")

mental_health_chatbot()


