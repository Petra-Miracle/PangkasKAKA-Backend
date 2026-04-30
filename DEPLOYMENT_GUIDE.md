# 🚀 Deployment Guide for PangkasKAKA Backend

This guide covers deploying your backend to production while maintaining database integrity.

---

## Table of Contents

1. [Pre-Deployment Checklist](#pre-deployment-checklist)
2. [Deployment Options](#deployment-options)
3. [Database Migration](#database-migration)
4. [Environment Configuration](#environment-configuration)
5. [Monitoring & Rollback](#monitoring--rollback)
6. [Common Hosting Providers](#common-hosting-providers)

---

## Pre-Deployment Checklist

### Code Review
- [ ] All changes committed to git
- [ ] Code reviewed by team member
- [ ] Tests pass locally (`npm run dev`)
- [ ] No console errors
- [ ] Linting passes (if configured)

### Database Preparation
- [ ] Database migrations created (`npx prisma migrate dev`)
- [ ] Migration tested locally with sample data
- [ ] Backup of production database created
- [ ] Migration SQL reviewed for any issues
- [ ] Estimated migration time calculated

### Configuration
- [ ] `.env` file prepared with production values
- [ ] Production DATABASE_URL verified
- [ ] All required environment variables set
- [ ] Secrets stored securely (not in git)
- [ ] CORS origin configured correctly

### Final Verification
- [ ] Latest code pulled from main branch
- [ ] Dependencies up-to-date
- [ ] All migrations committed
- [ ] Documentation updated
- [ ] Deployment window scheduled

---

## Deployment Options

### Option 1: Heroku (Easiest for Small Projects)

**Prerequisites:**
- Heroku account
- Heroku CLI installed
- PostgreSQL database on Heroku

**Deploy:**
```bash
# 1. Login to Heroku
heroku login

# 2. Create app
heroku create your-app-name

# 3. Set production DATABASE_URL
heroku config:set DATABASE_URL="postgresql://..." --app your-app-name

# 4. Deploy code
git push heroku main

# 5. Apply migrations
heroku run npx prisma migrate deploy --app your-app-name

# 6. View logs
heroku logs --tail --app your-app-name
```

**Monitor:**
```bash
heroku logs --tail --app your-app-name
heroku open --app your-app-name
```

---

### Option 2: AWS EC2 (More Control)

**Prerequisites:**
- AWS account
- EC2 instance (Ubuntu 20.04+)
- PostgreSQL database (RDS or self-hosted)
- SSH access

**Setup Server:**
```bash
# 1. SSH into server
ssh -i your-key.pem ubuntu@your-server-ip

# 2. Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3. Install Git
sudo apt-get install -y git

# 4. Clone repository
cd /home/ubuntu
git clone https://github.com/your-repo.git
cd PangkasKAKA-Backend

# 5. Install dependencies
npm install

# 6. Create .env file
nano .env
# Add production values

# 7. Run migrations
npx prisma migrate deploy

# 8. Install PM2 for process management
sudo npm install -g pm2

# 9. Start application
pm2 start src/index.js --name "pangkaskaka-api"
pm2 startup
pm2 save

# 10. Install and setup Nginx (reverse proxy)
sudo apt-get install -y nginx
sudo nano /etc/nginx/sites-available/default
# Configure as reverse proxy to localhost:3000
sudo systemctl restart nginx
```

**Update Deployment:**
```bash
cd /home/ubuntu/PangkasKAKA-Backend
git pull origin main
npm install
npx prisma migrate deploy
pm2 restart pangkaskaka-api
```

---

### Option 3: DigitalOcean App Platform (Balanced)

**Prerequisites:**
- DigitalOcean account
- GitHub repository connected

**Deploy via Web UI:**
1. Create App
2. Select your GitHub repository
3. Configure build commands:
   ```
   npm install
   npx prisma migrate deploy
   ```
4. Set environment variables (DATABASE_URL, etc.)
5. Deploy!

**Monitor in Dashboard:**
- View logs
- Check metrics
- Manage environment variables

---

## Database Migration

### Before Production Deployment

**1. Create Database Backup:**
```bash
pg_dump -U user -d pangkaskaka > backup_before_deploy.sql
```

**2. Test Migration Locally:**
```bash
# Create test database
createdb pangkaskaka_test

# Restore backup to test DB
psql -U user -d pangkaskaka_test < backup_before_deploy.sql

# Apply migration
DATABASE_URL="postgresql://user:pass@localhost/pangkaskaka_test" \
npx prisma migrate deploy

# Verify
npx prisma studio
```

**3. Check Migration SQL:**
```bash
# View what will be executed
cat PangkasDB/prisma/migrations/[timestamp]_[name]/migration.sql
```

### Apply to Production

**Option A: Using CI/CD (Recommended):**
```yaml
# .github/workflows/deploy.yml (example)
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '18'
      - run: npm install
      - run: npx prisma migrate deploy
      - run: npm start
```

**Option B: Manual (Less Safe):**
```bash
# 1. SSH to production server
ssh user@production-server

# 2. Pull latest code
cd /var/www/app
git pull origin main

# 3. Install dependencies
npm install

# 4. Backup database
pg_dump -U user -d pangkaskaka > backup_pre_migration.sql

# 5. Apply migrations
npx prisma migrate deploy

# 6. Restart application
systemctl restart pangkaskaka

# 7. Verify
curl http://localhost:3000/api/health
```

---

## Environment Configuration

### Production .env Template
```env
# Server
PORT=3000
NODE_ENV=production

# Database (PostgreSQL)
DATABASE_URL="postgresql://produser:strongpassword@db.production.com:5432/pangkaskaka"

# CORS
# CORS_ORIGIN=https://yourdomain.com

# Security (Optional)
# JWT_SECRET=your_super_secret_key_change_in_production
# API_KEY=your_api_key
```

### Security Best Practices
- ✅ Use strong database passwords (20+ characters)
- ✅ Store secrets in environment variables only
- ✅ Rotate API keys regularly
- ✅ Use HTTPS only
- ✅ Keep dependencies updated
- ❌ Never commit .env to git
- ❌ Never share database credentials

---

## Monitoring & Rollback

### Monitor Deployment

**Check Application Logs:**
```bash
# Using PM2
pm2 logs

# Using Docker
docker logs container_name

# Using Cloud Provider
# Check provider dashboard or CLI
```

**Monitor Database:**
```bash
# Check connections
psql -U user -d pangkaskaka -c "SELECT datname, count(*) FROM pg_stat_activity GROUP BY datname;"

# Check slow queries
# Check database size
psql -U user -d pangkaskaka -c "\l+"
```

### Rollback if Issues

**Quick Rollback (Last Commit):**
```bash
# If deployment just happened
git revert HEAD
git push origin main
```

**Database Rollback (If Migration Failed):**
```bash
# Stop application
systemctl stop pangkaskaka

# Restore backup
psql -U user -d pangkaskaka < backup_pre_migration.sql

# Revert code to previous version
git checkout previous_commit

# Restart
systemctl start pangkaskaka
```

**Verify After Rollback:**
```bash
npx prisma migrate status
curl http://localhost:3000/api/health
```

---

## Common Hosting Providers

| Provider | Difficulty | Cost | Best For |
|----------|-----------|------|----------|
| **Heroku** | Easy | Medium | Quick deployments, small projects |
| **AWS EC2** | Medium | Low-High | Custom control, scaling |
| **DigitalOcean** | Easy-Medium | Low | Simple apps, good documentation |
| **Railway** | Easy | Low-Medium | Modern deployment, good DX |
| **Render** | Easy | Low-Medium | Simple replacement for Heroku |
| **Fly.io** | Medium | Low | Global deployment |
| **Google Cloud Run** | Medium | Pay-per-use | Serverless option |

---

## Deployment Troubleshooting

### Issue: Migration fails in production

**Check:**
```bash
# Check migration status
npx prisma migrate status

# View current database schema
npx prisma db pull

# Check PostgreSQL logs
sudo tail -f /var/log/postgresql/postgresql.log
```

**Fix:**
```bash
# Restore backup
psql -U user -d pangkaskaka < backup.sql

# Fix schema issue
# Re-run migration after fix
```

### Issue: Connection timeout

**Check:**
```bash
# Test connection
psql -U user -h hostname -d pangkaskaka -c "SELECT 1"

# Check firewall
sudo ufw status

# Check PostgreSQL running
sudo systemctl status postgresql
```

### Issue: Slow response after deployment

**Investigate:**
```bash
# Check resource usage
top
free -h
df -h

# Check database size
psql -d pangkaskaka -c "SELECT pg_size_pretty(pg_database_size('pangkaskaka'))"

# Check slow queries
# Enable query logging in PostgreSQL
```

---

## Post-Deployment Verification

After deployment, verify everything works:

```bash
# 1. Health check
curl https://yourdomain.com/api/health

# 2. Database connection
npx prisma studio

# 3. Test key endpoints
curl https://yourdomain.com/api/auth/status
curl https://yourdomain.com/api/barbers

# 4. Check logs for errors
# tail -f /var/log/app.log

# 5. Monitor performance
# Use APM tool (New Relic, DataDog, etc.)
```

---

## References

- [Prisma Deployment Guide](https://www.prisma.io/docs/orm/prisma-migrate/deployment)
- [Node.js Production Best Practices](https://nodejs.org/en/docs/guides/nodejs-app-showcase/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

---

**Last Updated:** April 2026
