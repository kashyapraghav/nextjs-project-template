#!/bin/bash

# Chat with Data - Local Setup Script
# This script helps you set up the application on your local machine

echo "🚀 Chat with Data - Local Setup"
echo "================================"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18 or higher is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"

# Check if npm is available
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not available. Please install npm"
    exit 1
fi

echo "✅ npm $(npm -v) detected"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✅ Dependencies installed successfully"

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo ""
    echo "⚙️  Creating environment configuration..."
    cat > .env.local << EOL
# OpenRouter API Configuration
OPENROUTER_API_KEY=your_openrouter_api_key_here

# Database Configuration (Optional)
DB_CONNECTION_STRING=your_db_connection_string_here

# Site URL for OpenRouter
NEXT_PUBLIC_SITE_URL=http://localhost:3000
EOL
    echo "✅ Created .env.local file"
    echo "⚠️  IMPORTANT: Please update your OpenRouter API key in .env.local"
else
    echo "✅ Environment file already exists"
fi

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Get your OpenRouter API key from https://openrouter.ai"
echo "2. Update the OPENROUTER_API_KEY in .env.local file"
echo "3. Run 'npm run dev' to start the development server"
echo "4. Open http://localhost:3000 in your browser"
echo ""
echo "For detailed instructions, see README.md"
