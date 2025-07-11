# 📥 Download & Local Setup Instructions

## Quick Start Guide for Local Machine

### 🎯 What You're Getting

A complete **Chat with Data** application that includes:
- ✅ AI-powered natural language data analysis
- ✅ SQL, DAX, and Python query generation
- ✅ Modern React/Next.js interface
- ✅ Excel/CSV export functionality
- ✅ Docker support for easy deployment
- ✅ Production-ready configuration

### 📋 Prerequisites

Before you start, make sure you have:
- **Node.js 18+** (Download from [nodejs.org](https://nodejs.org))
- **npm** (comes with Node.js)
- **OpenRouter API Key** (Get from [openrouter.ai](https://openrouter.ai))

### 🚀 Method 1: Automated Setup (Recommended)

1. **Download/Extract** the project files to your local machine
2. **Open terminal/command prompt** in the project folder
3. **Run the setup script:**

   **On Windows:**
   ```cmd
   setup.bat
   ```

   **On Mac/Linux:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

4. **Add your API key** to `.env.local`:
   ```env
   OPENROUTER_API_KEY=your_actual_api_key_here
   ```

5. **Start the application:**
   ```bash
   npm run dev
   ```

6. **Open your browser:** http://localhost:3000

### 🛠️ Method 2: Manual Setup

```bash
# 1. Install dependencies
npm install

# 2. Copy environment template
cp .env.example .env.local

# 3. Edit .env.local with your API key
# OPENROUTER_API_KEY=your_key_here

# 4. Start development server
npm run dev

# 5. Open http://localhost:3000
```

### 🐳 Method 3: Docker Setup

```bash
# 1. Make sure Docker is installed
# 2. Add your API key to .env.local
# 3. Run with Docker Compose
docker-compose up --build

# Or with Docker directly
docker build -t chat-with-data .
docker run -p 3000:3000 --env-file .env.local chat-with-data
```

### 🔑 Getting Your OpenRouter API Key

1. Visit [openrouter.ai](https://openrouter.ai)
2. Sign up for a free account
3. Go to "API Keys" section
4. Generate a new key
5. Copy and paste it into your `.env.local` file

### 📁 Project Structure Overview

```
chat-with-data/
├── 📄 README.md              # Detailed documentation
├── 📄 DEPLOYMENT.md          # Deployment guide
├── 📄 setup.sh/.bat          # Automated setup scripts
├── 🐳 Dockerfile             # Docker configuration
├── 🐳 docker-compose.yml     # Docker Compose setup
├── ⚙️ .env.example           # Environment template
├── 📦 package.json           # Dependencies
├── 🎨 src/
│   ├── 📱 app/               # Next.js app router
│   │   ├── 🔌 api/           # Backend API endpoints
│   │   ├── 🎨 globals.css    # Global styles
│   │   ├── 📄 layout.tsx     # Root layout
│   │   └── 🏠 page.tsx       # Main chat interface
│   ├── 🧩 components/        # React components
│   │   ├── 💬 ChatWindow.tsx
│   │   ├── 📊 TableList.tsx
│   │   ├── ⚙️ SystemPromptEditor.tsx
│   │   ├── 📈 ReportPanel.tsx
│   │   └── 🎨 ui/            # shadcn/ui components
│   ├── ⚙️ config/            # Configuration files
│   ├── 🔧 types/             # TypeScript definitions
│   └── 📚 lib/               # Utility functions
└── 🔧 Configuration files...
```

### 🎮 Testing the Application

Once running, try these example queries:

1. **Basic Analysis:**
   - "Show me the top 10 customers by revenue"
   - "List all products in Electronics category"

2. **Advanced Queries:**
   - "Join customers and orders tables"
   - "Create a sales report for last quarter"
   - "Generate Python code to analyze trends"

3. **Export Features:**
   - Click "Export Excel" after running queries
   - Download results in CSV/JSON format

### 🔧 Customization Options

1. **AI Behavior:** Click "Edit System Prompt" to customize AI responses
2. **Database:** Update connection string in `.env.local` for real data
3. **Styling:** Modify Tailwind classes in components for custom look
4. **Tables:** Update mock data in `src/app/page.tsx` to match your schema

### 🐛 Troubleshooting

**Port 3000 already in use:**
```bash
# Kill process on port 3000
npx kill-port 3000
# Or use different port
PORT=3001 npm run dev
```

**API Key Issues:**
- Verify key is correct (no extra spaces)
- Check OpenRouter account has credits
- Ensure key is in `.env.local` not `.env.example`

**Build Errors:**
```bash
# Clear cache and reinstall
rm -rf .next node_modules
npm install
npm run dev
```

### 📞 Need Help?

1. Check `README.md` for detailed documentation
2. Review `DEPLOYMENT.md` for production setup
3. Verify all prerequisites are installed
4. Ensure API key is correctly configured

### 🚀 Production Deployment

For production deployment:
1. **Build:** `npm run build`
2. **Start:** `npm start`
3. **Deploy:** Use Vercel, Netlify, or Docker
4. **Monitor:** Check logs and performance

---

**🎉 You're all set! Start chatting with your data!**

The application will be available at: **http://localhost:3000**
