from flask import Flask, jsonify, request
import requests
import json
from dbConnect import getConnection  # Import the correct function
import bcrypt 
from flask_cors import CORS  # Import CORS

# Replace with your OpenRouter API key
with open('config.json', 'r') as file:
    data = json.load(file)

API_KEY = data["APIKEY"]
API_URL = "https://openrouter.ai/api/v1/chat/completions"

# Define the headers for the API request
headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": ["http://127.0.0.1:3000", "http://localhost:3000","http://localhost"]}})

# Test the database connection when the app starts
conn = getConnection()  # Try to get the connection
if conn:
    print("Connection successful!")
    conn.close()  # Close the connection after testing
else:
    print("Failed to connect to the database.")


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

@app.route('/api/ping', methods=['GET'])
def ping():
    return "Welcome to the chatbot!"

# Sign up endpoint
@app.route('/api/signup', methods=['POST'])
def signup():
    data = request.get_json()

    # Ensure username, password, and email are provided
    if not data or 'username' not in data or 'password' not in data or 'email' not in data:
        return jsonify({"error": "Username, password, and email are required"}), 200
    
    username = data['username']
    password = data['password']
    email = data['email']
    
    # Hash the password before saving it
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    conn = getConnection()
    cursor = conn.cursor()

    # Check if the username already exists
    cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = cursor.fetchone()

    if user:
        cursor.close()
        conn.close()
        return jsonify({"error": "Username already exists"}), 200
    
    # Check if the email already exists
    cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
    user_by_email = cursor.fetchone()

    if user_by_email:
        cursor.close()
        conn.close()
        return jsonify({"error": "Email already exists"}), 200

    # Insert the user into the database
    cursor.execute("INSERT INTO users (username, password, email) VALUES (%s, %s, %s)", (username, hashed_password, email))
    conn.commit()

    user_id = cursor.lastrowid  # Get the newly created user's ID
    cursor.close()
    conn.close()

    return jsonify({"message": "User created successfully", "user_id": user_id}), 200

# Login endpoint
@app.route('/api/login', methods=['POST'])
def login():
    data = request.get_json()

    if not data or 'username' not in data or 'password' not in data:
        return jsonify({"error": "Username and password are required"}), 200

    username = data['username']
    password = data['password']

    conn = getConnection()
    cursor = conn.cursor(dictionary=True)

    # Fetch the user by username
    cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
    user = cursor.fetchone()

    if user and bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
        user_id = user['user_id']
        cursor.close()
        conn.close()
        print("Hashed password from the database:", user['password'])
        return jsonify({"message": "Login successful", "user_id": user_id}), 200

    cursor.close()
    conn.close()
    return jsonify({"error": "Invalid username or password"}), 401

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.get_json()

    # Check if the message is in the request
    if not data or "message" not in data:
        return jsonify({"error": "Message is required"}), 200

    user_message = data["message"]

    # Get the chatbot's response
    bot_response = chat_with_ai(user_message)

    return jsonify({"response": bot_response})


@app.route('/api/professionals', methods=['GET'])
def get_professionals():
    conn = getConnection()  # Use the correct connection function
    cursor = conn.cursor(dictionary=True)

    # Query to fetch all professionals
    query = "SELECT * FROM professionals"
    cursor.execute(query)

    professionals = cursor.fetchall()  # Fetch all professionals

    cursor.close()
    conn.close()

    if professionals:
        return jsonify(professionals), 200  # Return list of professionals
    else:
        return jsonify({"error": "No professionals found"}), 404  # Not Found


@app.route('/api/appointments/<int:user_id>/<int:appt_id>', methods=['GET'])
def get_appointments(user_id, appt_id):
    conn = getConnection()  # Use the correct connection function
    cursor = conn.cursor(dictionary=True)

    query = "SELECT * FROM appointments WHERE user_id = %s AND appt_id = %s"
    cursor.execute(query, (user_id, appt_id))

    appointment = cursor.fetchone()  # Fetch one appointment

    cursor.close()
    conn.close()

    if appointment:
        return jsonify({
            "appointment_id": appointment["appt_id"],
            "user_id": appointment["user_id"],
            "date": appointment["date"],
            "time": appointment["time"],
            "created_at": appointment["created_at"],
            "description": appointment["description"]
        }), 200
    else:
        return jsonify({"error": "Appointment not found"}), 404

@app.route('/api/appointments/<int:user_id>', methods=['POST'])
def create_appointments(user_id):
    data = request.get_json()

    if not data or "date" not in data or "time" not in data or "description" not in data:
        return jsonify({"error": "Missing required fields"}), 200  # Bad Request

    conn = getConnection()  # Use the correct connection function
    cursor = conn.cursor()

    try:
        cursor.execute("""
            INSERT INTO appointments (user_id, date, time, description)
            VALUES (%s, %s, %s, %s)
        """, (user_id, data["date"], data["time"], data["description"]))

        conn.commit()  # Save changes
        appt_id = cursor.lastrowid  # Get the inserted appointment ID
        
        # Fetch the newly created appointment to return all details
        cursor.execute("SELECT * FROM appointments WHERE appt_id = %s", (appt_id,))
        new_appointment = cursor.fetchone()

        conn.close()

        return jsonify({
            "message": "Appointment created",
            "appointment_id": new_appointment["appt_id"],
            "user_id": new_appointment["user_id"],
            "date": new_appointment["date"],
            "time": new_appointment["time"],
            "created_at": new_appointment["created_at"],
            "description": new_appointment["description"]
        }), 200  # Created
    except Exception as e:
        conn.rollback()  # Undo changes if an error occurs
        conn.close()
        return jsonify({"error": str(e)}), 500  # Internal Server Error

@app.route('/api/appointments/<int:user_id>/<int:appt_id>', methods=['DELETE'])
def delete_appointments(user_id, appt_id):
    conn = getConnection()  # Use the correct connection function
    cursor = conn.cursor()

    try:
        # Check if the appointment exists for the given user
        cursor.execute("SELECT * FROM appointments WHERE appt_id = %s AND user_id = %s", (appt_id, user_id))
        appointment = cursor.fetchone()

        if not appointment:
            conn.close()
            return jsonify({"error": "Appointment not found"}), 404  # Not Found

        # Delete the appointment
        cursor.execute("DELETE FROM appointments WHERE appt_id = %s AND user_id = %s", (appt_id, user_id))
        conn.commit()
        conn.close()

        return jsonify({
            "message": "Appointment deleted",
            "appointment_id": appointment["appt_id"],
            "user_id": appointment["user_id"],
            "date": appointment["date"],
            "time": appointment["time"],
            "created_at": appointment["created_at"],
            "description": appointment["description"]
        }), 200  # Success
    except Exception as e:
        conn.rollback()  # Undo changes if an error occurs
        conn.close()
        return jsonify({"error": str(e)}), 500  # Internal Server Error

if __name__ == '__main__':
    app.run(debug=True, port=5504)