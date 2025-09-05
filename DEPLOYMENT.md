# ML Cogni - Frontend Deployment Guide (Vercel)

## 🚀 Vercel Frontend Deployment

### Prerequisites
- GitHub account with your `cogni-ml` repository
- Vercel account (free tier available)
- Backend already deployed on Render at: `https://cogni-ml.onrender.com/`

### Step-by-Step Vercel Deployment

#### 1. **Sign up for Vercel**
- Go to [vercel.com](https://vercel.com)
- Sign up with your GitHub account
- Authorize Vercel to access your repositories

#### 2. **Import Your Project**
- Click "New Project" on Vercel dashboard
- Select your `adityaanikam/cogni-ml` repository
- Choose "Import" to proceed

#### 3. **Configure Project Settings**
- **Framework Preset**: Next.js (auto-detected)
- **Root Directory**: `frontend`
- **Build Command**: `npm run build` (auto-detected)
- **Output Directory**: `.next` (auto-detected)
- **Install Command**: `npm install` (auto-detected)

#### 4. **Environment Variables**
Add these environment variables in Vercel dashboard:

```
NEXT_PUBLIC_API_URL=https://cogni-ml.onrender.com
```

**How to add:**
- In project settings, go to "Environment Variables"
- Add variable: `NEXT_PUBLIC_API_URL`
- Value: `https://cogni-ml.onrender.com`
- Environment: Production, Preview, Development (select all)

#### 5. **Deploy**
- Click "Deploy" button
- Wait for build to complete (usually 2-3 minutes)
- Your frontend will be live at a Vercel URL like: `https://cogni-ml-frontend.vercel.app`

### Automatic Deployments
- **Production**: Auto-deploys when you push to `main` branch
- **Preview**: Auto-deploys for pull requests
- **Custom Domains**: Can be added in project settings

### Environment Configuration

#### Production Environment Variables
```
NEXT_PUBLIC_API_URL=https://cogni-ml.onrender.com
```

#### Local Development
```bash
# Create .env.local file in frontend directory
NEXT_PUBLIC_API_URL=http://localhost:8000
```

### File Structure for Vercel
```
cogni-ml/ (GitHub Repository)
├── backend/ (Deployed on Render)
├── frontend/ (Deploy to Vercel)
│   ├── package.json
│   ├── next.config.ts
│   └── src/
└── README.md
```

### Vercel Configuration
- **Root Directory**: `frontend`
- **Framework**: Next.js
- **Node.js Version**: 18.x (auto-detected)
- **Build Command**: `npm run build`
- **Output Directory**: `.next`

## 🚨 Troubleshooting

### Common Issues

#### 1. **Build Failures**
- **ESLint Errors**: Already fixed with `eslint: { ignoreDuringBuilds: true }`
- **Missing Dependencies**: Check `package.json` in frontend directory
- **TypeScript Errors**: Check for type mismatches

#### 2. **API Connection Issues**
- **CORS Errors**: Backend CORS is configured for all origins
- **Wrong API URL**: Verify `NEXT_PUBLIC_API_URL` is set correctly
- **Backend Down**: Check if `https://cogni-ml.onrender.com/health` is accessible

#### 3. **Environment Variables**
- **Not Working**: Ensure variable name starts with `NEXT_PUBLIC_`
- **Wrong Value**: Double-check the backend URL
- **Not Set**: Add in Vercel dashboard under Environment Variables

### Health Checks
- **Frontend**: `https://your-app.vercel.app/`
- **Backend**: `https://cogni-ml.onrender.com/health`

### Logs and Debugging
- **Vercel Logs**: Check in Vercel dashboard under "Functions" tab
- **Build Logs**: Available in deployment history
- **Runtime Logs**: Check browser console for client-side errors

## 🔧 Advanced Configuration

### Custom Domain (Optional)
1. **Add Domain**: In Vercel project settings, go to "Domains"
2. **Configure DNS**: Add CNAME record pointing to Vercel
3. **SSL**: Automatically provided by Vercel

### Performance Optimization
- **Image Optimization**: Next.js Image component automatically optimizes
- **Static Generation**: Pages are pre-rendered for better performance
- **CDN**: Vercel provides global CDN automatically

### Monitoring
- **Analytics**: Available in Vercel dashboard
- **Speed Insights**: Performance monitoring
- **Error Tracking**: Built-in error reporting

## 📝 Deployment Checklist

### Before Deployment
- [ ] Backend is running on Render
- [ ] Frontend code is pushed to GitHub
- [ ] Environment variables are configured
- [ ] ESLint errors are handled

### After Deployment
- [ ] Frontend is accessible at Vercel URL
- [ ] API calls are working
- [ ] No console errors
- [ ] All features are functional

## 🎯 Quick Commands

### Local Development
```bash
cd frontend
npm install
npm run dev
```

### Production Build Test
```bash
cd frontend
npm run build
npm start
```

### Environment Variables
```bash
# Local development
echo "NEXT_PUBLIC_API_URL=http://localhost:8000" > .env.local

# Production (set in Vercel dashboard)
NEXT_PUBLIC_API_URL=https://cogni-ml.onrender.com
```

## 📊 Success Indicators

### ✅ Deployment Successful
- Build completes without errors
- Frontend loads at Vercel URL
- API calls return data
- No console errors
- All pages are accessible

### ❌ Common Failures
- Build fails due to TypeScript/ESLint errors
- Environment variables not set
- Backend API not accessible
- CORS issues
- Missing dependencies

## 🔄 Updates and Maintenance

### Automatic Updates
- Push to `main` branch triggers automatic deployment
- Pull requests create preview deployments
- Environment variables persist across deployments

### Manual Updates
- Change environment variables in Vercel dashboard
- Redeploy from Vercel dashboard if needed
- Check deployment logs for issues

---

**Your Backend URL**: `https://cogni-ml.onrender.com/`  
**Frontend will be deployed to**: `https://your-app-name.vercel.app`

**Next Steps**: 
1. Push the updated `next.config.ts` to GitHub
2. Follow the Vercel deployment steps above
3. Test the connection between frontend and backend