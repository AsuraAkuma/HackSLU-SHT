# HackSLU Team "SHT"

## Team
- Henry Wang
- Justin Zhang
- Patrick Suarez
- Adam Gardener

## Project
An online website capable with a specialized AI chatbot trained on therapy and support. Capable of offering generated insight, providing hotline resources, referencing mental health professionals working for the platform, allowing scheduling of consulting with said professionals, all while keeping a modern and clean UI design free of clutter and pleasing to the eye. 
- Operates on python and SQL for referencing the database of professional mental health professionals.

## Technologies Used
- **Backend:** Python (Flask), MySQL
- **Frontend:** HTML, CSS, JavaScript
- **APIs:** Custom REST API (see `website/JS/config.json` for endpoint)
- **Other:** CSV for resource/therapist lists

## Setup Instructions
### Prerequisites
- Python 3.11+
- MySQL server
- Node.js (optional, for advanced JS tooling)

### Backend Setup
1. Navigate to the `server/` directory.
2. (Optional) Create and activate a Python virtual environment:
	- Windows PowerShell: `python -m venv myenv; .\myenv\Scripts\Activate.ps1`
3. Install required Python packages:
	- `pip install flask mysql-connector-python requests`
4. Configure MySQL using `shtsql.sql` and update `config.json` as needed.
5. Run the backend server:
	- `python app.py`

### Frontend Setup
1. Open `website/index.html` in your browser.
2. Ensure the API URL in `website/JS/config.json` is correct.
3. For PHP pages, use a local server (e.g., XAMPP, WAMP) and place files in the `htdocs` directory.

## Functionality
- **User Registration/Login:** Secure authentication via PHP and JS.
- **Appointment Scheduling:** Users can book appointments with professionals.
- **Resource List:** Browse mental health resources from CSV data.
- **Chatbot:** Interactive chatbot powered by backend AI (see `server/AI.py`).
- **Professional Directory:** View and contact therapists.
- **Confirmation & Notifications:** Users receive appointment confirmations and updates.

---
For more details, see code comments and configuration files in each directory.
