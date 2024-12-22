@echo off
REM ==========================================
REM TikTok-ähnliche Website Hosting Setup (Automatisch)
REM ==========================================

echo [INFO] Starte automatisches Setup...

REM ====================
REM Schritt 1: Node.js installieren
REM ====================
echo [INFO] Prüfe Node.js...
node -v >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [INFO] Node.js wird heruntergeladen und installiert...
    curl -o node-setup.msi https://nodejs.org/dist/v18.18.0/node-v18.18.0-x64.msi
    msiexec /i node-setup.msi /quiet /norestart
    del node-setup.msi
)

REM ====================
REM Schritt 2: Git installieren
REM ====================
echo [INFO] Prüfe Git...
git --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [INFO] Git wird heruntergeladen und installiert...
    curl -o git-setup.exe https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe
    start /wait git-setup.exe /VERYSILENT /NORESTART
    del git-setup.exe
)

REM ====================
REM Schritt 3: MongoDB installieren
REM ====================
echo [INFO] Prüfe MongoDB...
mongod --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [INFO] MongoDB wird heruntergeladen und installiert...
    curl -o mongodb-setup.msi https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-6.0.6-signed.msi
    msiexec /i mongodb-setup.msi /quiet /norestart
    del mongodb-setup.msi
)

REM ====================
REM Schritt 4: Projekt klonen
REM ====================
echo [INFO] Klone das Projekt-Repository...
if not exist "tiktok-clone" (
    git clone https://github.com/KeySystemGUI/Tiktok2.git tiktok-clone
)
cd tiktok-clone

REM ====================
REM Schritt 5: Abhängigkeiten installieren (Backend und Frontend)
REM ====================
echo [INFO] Installiere Abhängigkeiten...
cd backend
npm install --silent
cd ..
cd frontend
npm install --silent
cd ..

REM ====================
REM Schritt 6: MongoDB-Datenbankordner erstellen
REM ====================
echo [INFO] Erstelle Datenbankordner...
if not exist "C:\data\db" (
    mkdir "C:\data\db"
)

REM ====================
REM Schritt 7: Server starten
REM ====================
echo [INFO] Starte MongoDB...
start /B mongod --dbpath "C:\data\db"

echo [INFO] Starte Backend-Server...
cd backend
start /B npm run dev
cd ..

echo [INFO] Starte Frontend-Server...
cd frontend
start /B npm start
cd ..

REM ====================
REM Schritt 8: Website im Browser öffnen
REM ====================
echo [INFO] Öffne die Website im Browser...
start http://localhost:3000

echo [INFO] Setup abgeschlossen. Alle Dienste wurden gestartet!
pause
