# TikTok Clone

A full-featured TikTok-like prototype with frontend, backend, and database integration. This project serves as an example for a video-sharing and social media network.

## Features
- **Video upload and streaming**  
- **User profiles and authentication**  
- **Comment and like functionality**  
- **Database support with MongoDB**

---

## Requirements
To run this project locally, you need the following software installed:
- **Node.js** (version 18 or higher)  
- **Git** (to clone the repository)  
- **MongoDB** (for the database)  

The batch file (`setup.bat`) will install everything automatically.

---

## Installation and Setup

### 1. **Automatic Setup**
1. Download the `setup.bat` file from the repository.  
2. Run `setup.bat` as an administrator.  
   - It will automatically install all required dependencies.  
   - Clone the repository locally.  
   - Start MongoDB, the backend server, and the frontend server.

### 2. **Manual Setup** (if preferred)
If you want to set up the project manually:
1. Clone the repository:
   ```bash
   git clone https://github.com/USERNAME/REPOSITORY.git

## Install the dependencies:
# Backend:

cd backend
npm install

# FrontEnd:

cd frontend
npm install

## How to start the servers
# Start MongoDB:

mongod --dbpath C:\data\db

# BackEnd Server:

cd backend
npm run dev

# Frontend server:

cd frontend
npm start

## Usage:

Open your browser and go to http://localhost:3000.
Sign up or log in to test the platform's features.

## Folder Structure:

tiktok-clone/
├── backend/          # Backend server (Node.js, Express)
├── frontend/         # Frontend application (React)
├── setup.bat         # Automated setup script
└── README.md         # Project description

## Contact:

For questions or support, feel free to contact:
Carthedev (On discord)
