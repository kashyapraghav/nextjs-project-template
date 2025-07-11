@echo off
echo 🚀 Chat with Data - Local Setup (Windows)
echo ========================================

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org
    pause
    exit /b 1
)

echo ✅ Node.js detected: 
node --version

REM Check if npm is available
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not available. Please install npm
    pause
    exit /b 1
)

echo ✅ npm detected:
npm --version

REM Install dependencies
echo.
echo 📦 Installing dependencies...
npm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully

REM Check if .env.local exists
if not exist ".env.local" (
    echo.
    echo ⚙️  Creating environment configuration...
    (
        echo # OpenRouter API Configuration
        echo OPENROUTER_API_KEY=your_openrouter_api_key_here
        echo.
        echo # Database Configuration ^(Optional^)
        echo DB_CONNECTION_STRING=your_db_connection_string_here
        echo.
        echo # Site URL for OpenRouter
        echo NEXT_PUBLIC_SITE_URL=http://localhost:3000
    ) > .env.local
    echo ✅ Created .env.local file
    echo ⚠️  IMPORTANT: Please update your OpenRouter API key in .env.local
) else (
    echo ✅ Environment file already exists
)

echo.
echo 🎉 Setup completed successfully!
echo.
echo Next steps:
echo 1. Get your OpenRouter API key from https://openrouter.ai
echo 2. Update the OPENROUTER_API_KEY in .env.local file
echo 3. Run 'npm run dev' to start the development server
echo 4. Open http://localhost:3000 in your browser
echo.
echo For detailed instructions, see README.md
echo.
pause
