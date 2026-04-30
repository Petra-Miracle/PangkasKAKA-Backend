# ✅ PangkasKAKA Backend - Setup Checklist

Use this checklist to ensure your backend is properly configured for development and deployment.

## 🏗️ Initial Setup (First Time)

- [ ] **Clone Repository**
  ```bash
  git clone <repository-url>
  cd PangkasKAKA-Backend
  ```

- [ ] **Install Node.js & PostgreSQL**
  - Node.js 16+ from https://nodejs.org
  - PostgreSQL from https://www.postgresql.org/download/

- [ ] **Install Dependencies**
  ```bash
  npm install
  ```

- [ ] **Setup Environment File**
  ```bash
  cp .env.example .env
  # Edit .env with your local database credentials
  ```

- [ ] **Create PostgreSQL Database**
  ```bash
  # Option 1: Using psql command
  createdb pangkaskaka

  # Option 2: Using PostgreSQL GUI (pgAdmin)
  # Create new database named: pangkaskaka
  ```

- [ ] **Run Prisma Migrations**
  ```bash
  npx prisma migrate dev --name initial_setup
  ```

- [ ] **Verify Setup**
  ```bash
  npx prisma studio
  # Should open http://localhost:5555 with database explorer
  ```

- [ ] **Start Development Server**
  ```bash
  npm run dev
  # Server should run on http://localhost:3000
  ```

---

## 👥 Team Collaboration Setup

When starting work on existing repository:

- [ ] **Pull Latest Changes**
  ```bash
  git pull origin main
  ```

- [ ] **Install/Update Dependencies**
  ```bash
  npm install
  ```

- [ ] **Apply Pending Migrations**
  ```bash
  npx prisma migrate deploy
  ```

- [ ] **Start Development**
  ```bash
  npm run dev
  ```

---

## 💾 Before Committing Changes

- [ ] **Database Schema Modified?**
  - [ ] Create migration
    ```bash
    npx prisma migrate dev --name describe_change
    ```
  - [ ] Commit migration files in `PangkasDB/prisma/migrations/`

- [ ] **Dependencies Added/Updated?**
  - [ ] Test locally first
    ```bash
    npm install
    npm run dev
    ```
  - [ ] Commit `package.json` and `package-lock.json`

- [ ] **Environment Variables Changed?**
  - [ ] Update `.env.example` if needed
  - [ ] ❌ Do NOT commit actual `.env` file

- [ ] **Code Quality**
  - [ ] Tested locally
  - [ ] No console errors
  - [ ] Database operations work

---

## 📤 Pushing to Repository

```bash
# 1. Check status
git status

# 2. Add files
git add .

# 3. Commit with clear message
git commit -m "Add feature: describe your changes"

# 4. Push to remote
git push origin main
```

**Files that should be in git:**
- ✅ `src/` - Source code
- ✅ `PangkasDB/prisma/schema.prisma` - Database schema
- ✅ `PangkasDB/prisma/migrations/` - Migration history
- ✅ `package.json` - Dependencies list
- ✅ `package-lock.json` - Locked versions
- ✅ `.env.example` - Template (no real values!)
- ✅ `.gitignore` - Exclusion rules
- ✅ `README.md` - Documentation

**Files that should NOT be in git:**
- ❌ `.env` - Local secrets
- ❌ `node_modules/` - Auto-installed
- ❌ `.vscode/` - Personal IDE settings
- ❌ `dist/` - Build outputs

---

## 🚀 Deployment Checklist

### Pre-Deployment

- [ ] **All Tests Pass Locally**
  ```bash
  npm run dev  # Start and test manually
  ```

- [ ] **Latest Changes Committed**
  ```bash
  git status  # Should show nothing
  ```

- [ ] **Dependencies Updated**
  ```bash
  npm install
  ```

- [ ] **Database Backup Created**
  ```bash
  pg_dump -U user -d pangkaskaka > backup_production_$(date +%Y%m%d_%H%M%S).sql
  ```

### Deployment

- [ ] **Set Production Environment**
  ```env
  NODE_ENV=production
  DATABASE_URL=postgresql://prod_user:password@prod_host/pangkaskaka
  ```

- [ ] **Apply Migrations**
  ```bash
  npx prisma migrate deploy
  ```

- [ ] **Start Production Server**
  ```bash
  npm start
  ```

- [ ] **Verify Server Running**
  - Check http://your-production-url/api/health (if endpoint exists)
  - Check logs for errors

- [ ] **Monitor for Issues**
  - Check error logs
  - Verify database connections
  - Test core API endpoints

### Post-Deployment

- [ ] **Verify All Features Work**
  - [ ] Authentication endpoints
  - [ ] Barber management
  - [ ] Order management
  - [ ] Database operations

- [ ] **Document Changes**
  - [ ] Update CHANGELOG if exists
  - [ ] Notify team of deployment

---

## 🔄 Common Daily Tasks

### Start of Day
```bash
git pull origin main
npm install
npx prisma migrate deploy
npm run dev
```

### During Development
```bash
# After schema changes
npx prisma migrate dev --name describe_change

# After dependency changes
npm install

# Check database
npx prisma studio
```

### End of Day
```bash
# Commit your changes
git add .
git commit -m "Describe your changes"
git push origin main
```

---

## 🆘 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| npm install fails | `npm cache clean --force && npm install` |
| Can't connect to DB | Check PostgreSQL running, verify DATABASE_URL |
| Migration fails | `npx prisma migrate reset` (dev only) |
| Prisma client errors | `npx prisma generate` then `npm install` |
| Port already in use | Change PORT in .env or kill existing process |

---

## 📚 Reference

- 📖 [DATABASE_SETUP.md](./DATABASE_SETUP.md) - Detailed database guide
- 📖 [README.md](./README.md) - Project overview
- 🔗 [Prisma Docs](https://www.prisma.io/docs/)
- 🔗 [PostgreSQL Docs](https://www.postgresql.org/docs/)

---

**Print this checklist and check items as you go!**
