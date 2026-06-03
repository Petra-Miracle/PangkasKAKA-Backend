# 🚀 Vercel Deployment Guide

Panduan lengkap untuk deploy PangkasKAKA Backend ke Vercel.

---

## 📋 Pre-Deployment Checklist

- [ ] GitHub repository created and code pushed
- [ ] `.env` file added to `.gitignore`
- [ ] PostgreSQL database ready (Vercel Postgres atau external provider)
- [ ] Environment variables prepared
- [ ] Latest code committed to `main` branch

---

## 🔧 Setup Steps

### 1. Connect Repository to Vercel

```bash
# Option A: Via Vercel Dashboard
# 1. Go to https://vercel.com/dashboard
# 2. Click "New Project"
# 3. Select your GitHub repository
# 4. Click "Import"

# Option B: Via Vercel CLI
vercel
# Follow prompts to link your project
```

### 2. Configure Environment Variables

In Vercel Dashboard:
1. Go to **Settings → Environment Variables**
2. Add the following variables:

```
DATABASE_URL=postgresql://username:password@host:5432/pangkaskaka
JWT_SECRET=your-secret-key-here
CORS_ORIGIN=https://your-frontend-domain.com
NODE_ENV=production
```

**Important:**
- Get `DATABASE_URL` from your PostgreSQL provider
- Use strong `JWT_SECRET` (min 32 characters)
- Set `CORS_ORIGIN` to your frontend domain

### 3. Deploy

```bash
# Option 1: Automatic (GitHub push)
git push origin main
# Vercel automatically deploys

# Option 2: Manual
vercel --prod
```

---

## ❌ Common Errors & Solutions

### Error: "Command 'npm run vercel-build' exited with 1"

#### Cause 1: Missing Prisma Generate
**Error Message:**
```
[build] ERROR: prisma CLI not found
```

**Solution:**
- Ensure `prisma` is in `dependencies` (not `devDependencies`)
- Run: `npm install`
- Commit `package-lock.json`

#### Cause 2: Missing DATABASE_URL at Build Time
**Error Message:**
```
Error: Cannot find required environment variable DATABASE_URL
```

**Solution:**
- Vercel's Prisma generation doesn't need database connection for `npx prisma generate`
- But if error persists, add dummy DATABASE_URL temporarily for build
- Or use `prisma.skipEngine=true` if needed

#### Cause 3: Path Issues (Windows vs Linux)
**Error Message:**
```
[build] ERROR: schema file not found
```

**Solution:**
- Already fixed in `scripts/build.cjs` - using cross-platform paths
- Script now uses `npx prisma` instead of direct node path
- Works on Windows, macOS, and Linux

### Error: "Cannot find module '@prisma/client'"

**Solution:**
```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
git add package-lock.json
git commit -m "Fix: Update dependencies"
git push origin main
```

### Error: "Database Connection Failed"

**This happens at runtime, not build:**

1. Check `DATABASE_URL` in Vercel Environment Variables
2. Verify PostgreSQL database is running and accessible
3. Test connection locally:
   ```bash
   DATABASE_URL="your-prod-url" npx prisma db push
   ```
4. Check firewall/security group allows Vercel IPs

### Error: "401 Unauthorized" on API Calls

**This is application logic, not deployment issue:**

1. Check JWT_SECRET matches in:
   - Vercel Environment Variables
   - Your authentication code
2. Verify token is being sent in Authorization header: `Bearer <token>`

---

## 🔍 Debugging Tips

### View Vercel Build Logs

```bash
# Via CLI
vercel logs --follow

# Or in Vercel Dashboard:
# Project → Deployments → Click deployment → View logs
```

### Test Build Locally

```bash
# Simulate Vercel build environment
npm install
npm run build
npm run start
```

### Check if Build Command Runs

In `vercel.json`:
```json
{
  "version": 2,
  "buildCommand": "npm run build",
  "installCommand": "npm install"
}
```

---

## 📦 Deployment Flow

```
1. Push to GitHub (main branch)
   ↓
2. Vercel detects push
   ↓
3. Installs dependencies (npm install)
   ↓
4. Runs build command (npm run vercel-build)
   ↓
5. Generates Prisma Client
   ↓
6. Deploys to Vercel's serverless platform
   ↓
7. API ready at https://your-project.vercel.app
```

---

## 🌐 Database Configuration

### Using Vercel Postgres (Easiest)

```bash
# 1. In Vercel Dashboard, add "Vercel Postgres" database
# 2. Get DATABASE_URL from dashboard
# 3. Add to environment variables
# 4. Deploy
```

### Using External PostgreSQL (e.g., Neon, Railway, Supabase)

```bash
# 1. Create PostgreSQL database on provider
# 2. Get connection string
# 3. Add DATABASE_URL to Vercel Environment Variables
# 4. Update .env.example with new provider URL
# 5. Deploy
```

### Migrate Database on First Deploy

```bash
# After first successful deploy, run:
vercel env pull  # Get production .env
npx prisma migrate deploy  # Apply migrations
```

---

## ✅ Verify Deployment

```bash
# 1. Check health endpoint
curl https://your-project.vercel.app/

# Expected response:
# {"message":"PangkasKAKA API is running smoothly!"}

# 2. Check database connection
curl https://your-project.vercel.app/api/barbershops

# 3. Check logs
vercel logs --follow
```

---

## 🔐 Security Best Practices

- ✅ Never commit `.env` file
- ✅ Use strong JWT_SECRET (32+ chars, mix of uppercase, lowercase, numbers, symbols)
- ✅ Set `CORS_ORIGIN` to specific frontend domain (not `*`)
- ✅ Use HTTPS only (Vercel provides free SSL)
- ✅ Rotate `JWT_SECRET` periodically in production
- ✅ Keep PostgreSQL credentials secure (use environment variables only)

---

## 📞 Support

For Vercel-specific issues:
- [Vercel Docs](https://vercel.com/docs)
- [Vercel Support](https://vercel.com/support)

For Prisma issues:
- [Prisma Docs](https://www.prisma.io/docs)
- [Prisma Community](https://www.prisma.io/community)
