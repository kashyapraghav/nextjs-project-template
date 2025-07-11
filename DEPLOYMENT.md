# Deployment Guide - Chat with Data

This guide provides multiple options for deploying and running the Chat with Data application locally and in production.

## 🏠 Local Development

### Quick Start (Recommended)

1. **Download/Clone the project**
2. **Run the setup script:**
   - **Linux/Mac**: `chmod +x setup.sh && ./setup.sh`
   - **Windows**: Double-click `setup.bat` or run in Command Prompt
3. **Add your OpenRouter API key** to `.env.local`
4. **Start the application**: `npm run dev`
5. **Open**: http://localhost:3000

### Manual Setup

```bash
# Install dependencies
npm install

# Create environment file
cp .env.example .env.local

# Edit .env.local with your API key
# Start development server
npm run dev
```

## 🐳 Docker Setup

### Using Docker Compose (Easiest)

Create `docker-compose.yml`:

```yaml
version: '3.8'
services:
  chat-with-data:
    build: .
    ports:
      - "3000:3000"
    environment:
      - OPENROUTER_API_KEY=your_api_key_here
      - NEXT_PUBLIC_SITE_URL=http://localhost:3000
    volumes:
      - ./.env.local:/app/.env.local
```

Run with:
```bash
docker-compose up --build
```

### Using Docker Directly

```bash
# Build the image
docker build -t chat-with-data .

# Run the container
docker run -p 3000:3000 \
  -e OPENROUTER_API_KEY=your_api_key_here \
  -e NEXT_PUBLIC_SITE_URL=http://localhost:3000 \
  chat-with-data
```

## ☁️ Cloud Deployment

### Vercel (Recommended)

1. **Push to GitHub**
2. **Connect to Vercel**
3. **Add Environment Variables:**
   - `OPENROUTER_API_KEY`
   - `NEXT_PUBLIC_SITE_URL`
4. **Deploy automatically**

### Netlify

1. **Build Command**: `npm run build`
2. **Publish Directory**: `.next`
3. **Add Environment Variables**
4. **Deploy**

### Railway

1. **Connect GitHub repository**
2. **Add environment variables**
3. **Deploy with one click**

### AWS/Azure/GCP

Use the Docker image for container-based deployments on:
- AWS ECS/Fargate
- Azure Container Instances
- Google Cloud Run

## 🔧 Environment Variables

### Required
```env
OPENROUTER_API_KEY=sk-or-v1-your-key-here
```

### Optional
```env
# Database connection (for real data)
DB_CONNECTION_STRING=your_database_url

# Site URL (for OpenRouter referrer)
NEXT_PUBLIC_SITE_URL=https://yourdomain.com

# Custom port (if needed)
PORT=3000
```

## 🗄️ Database Integration

### SQL Server
```env
DB_CONNECTION_STRING=Server=localhost;Database=YourDB;User Id=user;Password=pass;
```

### PostgreSQL
```env
DB_CONNECTION_STRING=postgresql://user:pass@localhost:5432/yourdb
```

### MySQL
```env
DB_CONNECTION_STRING=mysql://user:pass@localhost:3306/yourdb
```

### MS Fabric
Configure your Fabric workspace connection string according to Microsoft's documentation.

## 🚀 Performance Optimization

### Production Build
```bash
npm run build
npm start
```

### Caching Strategy
- Enable Redis for query result caching
- Use CDN for static assets
- Implement database connection pooling

### Monitoring
- Add application monitoring (e.g., Sentry)
- Set up logging aggregation
- Monitor API usage and costs

## 🔒 Security Checklist

- [ ] API keys stored in environment variables
- [ ] Database connections use SSL
- [ ] Input validation implemented
- [ ] Rate limiting configured
- [ ] CORS properly configured
- [ ] Authentication added (if needed)

## 🐛 Troubleshooting

### Common Issues

**Port Already in Use**
```bash
# Kill process on port 3000
lsof -ti:3000 | xargs kill -9
# Or use different port
PORT=3001 npm run dev
```

**API Key Issues**
- Verify key is correct in `.env.local`
- Check OpenRouter account has credits
- Ensure no extra spaces in the key

**Build Errors**
```bash
# Clear Next.js cache
rm -rf .next
npm run build
```

**Database Connection**
- Test connection string separately
- Check firewall settings
- Verify credentials and permissions

## 📊 Monitoring & Analytics

### Application Metrics
- Response times
- Error rates
- API usage
- User interactions

### Database Performance
- Query execution times
- Connection pool usage
- Index effectiveness

### Cost Monitoring
- OpenRouter API usage
- Database query costs
- Infrastructure expenses

## 🔄 Updates & Maintenance

### Updating Dependencies
```bash
npm update
npm audit fix
```

### Database Migrations
- Plan schema changes carefully
- Test migrations in staging
- Backup before production updates

### API Key Rotation
- Generate new OpenRouter key
- Update environment variables
- Monitor for any issues

## 📞 Support

For deployment issues:
1. Check the troubleshooting section
2. Review application logs
3. Verify environment configuration
4. Test API connectivity

---

**Happy Deploying!** 🚀
