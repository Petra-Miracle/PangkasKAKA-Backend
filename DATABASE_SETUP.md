# 📊 Database Setup & Maintenance Guide

## Overview
This backend uses **PostgreSQL** with **Prisma ORM** for database management and migrations.

## Prerequisites
- PostgreSQL 12+ installed locally
- Node.js 16+ installed
- npm or yarn package manager

## Initial Setup

### 1. Install Dependencies
```bash
npm install
```

### 2. Configure Database Connection
Create a `.env` file in the root directory (copy from `.env.example`):
```bash
cp .env.example .env
```

Edit `.env` and replace database credentials:
```
DATABASE_URL="postgresql://username:password@localhost:5432/pangkaskaka"
```

**For local development:**
```
DATABASE_URL="postgresql://root:@localhost:5432/pangkaskaka"
```

### 3. Create Database
```bash
# Create PostgreSQL database manually or using psql:
createdb pangkaskaka
```

### 4. Run Prisma Migrations
```bash
# Apply all pending migrations
npx prisma migrate deploy

# Or for development with seed data:
npx prisma migrate dev --name initial_setup
```

### 5. Verify Setup
```bash
# View database schema in Prisma Studio
npx prisma studio
```

---

## Daily Database Maintenance

### Running the Application
```bash
# Production mode
npm start

# Development mode (with auto-reload)
npm run dev
```

### Database Inspection
```bash
# Open Prisma Studio (GUI database viewer)
npx prisma studio

# View database schema
npx prisma db pull
```

### Common Operations

#### View Database Migrations Status
```bash
npx prisma migrate status
```

#### Check for Schema Drift
```bash
npx prisma db push
```

#### Reset Database (⚠️ Development only)
```bash
npx prisma migrate reset
```

---

## Migration Management

### Creating New Migrations

After modifying `schema.prisma`:

```bash
# For development - applies changes to dev database
npx prisma migrate dev --name add_new_table

# For production - creates migration without applying
npx prisma migrate create --name add_new_table
```

### Viewing Migration History
```bash
ls PangkasDB/prisma/migrations/
```

### Rolling Back (Development)
```bash
# Remove the latest migration
rm PangkasDB/prisma/migrations/[latest_migration_folder]

# Reset database to specific migration
npx prisma migrate reset
```

---

## Production Deployment

### 1. Set Production Environment
```
NODE_ENV=production
DATABASE_URL="postgresql://prod_user:prod_password@prod_host:5432/pangkaskaka"
```

### 2. Apply Migrations
```bash
npx prisma migrate deploy
```

### 3. Verify Connection
```bash
npx prisma db execute --stdin < /dev/null
```

---

## Backup & Recovery

### Backup Database
```bash
# PostgreSQL dump
pg_dump -U root -d pangkaskaka > backup_$(date +%Y%m%d_%H%M%S).sql
```

### Restore from Backup
```bash
psql -U root -d pangkaskaka < backup_file.sql
```

---

## Troubleshooting

### Issue: npm install fails
```bash
# Clear npm cache and reinstall
npm cache clean --force
rm package-lock.json
npm install
```

### Issue: Database connection error
```bash
# Check PostgreSQL is running:
# Windows: Services > PostgreSQL
# Linux: sudo systemctl status postgresql
# macOS: brew services list

# Verify DATABASE_URL in .env file
# Test connection: psql -U root -d pangkaskaka
```

### Issue: Migration conflicts
```bash
# Reset to clean state (development only)
npx prisma migrate reset

# Then reapply migrations
npx prisma migrate deploy
```

### Issue: Schema out of sync
```bash
# Pull current database schema
npx prisma db pull

# Or push local schema to database
npx prisma db push
```

---

## Important Notes

✅ **Always:**
- Commit `.env.example` (never commit `.env`)
- Run migrations before deploying
- Test migrations in development first
- Keep migration history in version control

❌ **Never:**
- Modify migration files after they're committed
- Use `prisma db push` directly on production
- Share `.env` file with team members
- Delete migration folders manually

---

## Repository Structure
```
PangkasKAKA-Backend/
├── PangkasDB/
│   └── prisma/
│       ├── schema.prisma (Database schema definition)
│       └── migrations/ (Migration history)
├── src/
│   ├── controllers/ (Request handlers)
│   ├── services/ (Business logic)
│   ├── repositories/ (Database queries)
│   └── routes/ (API endpoints)
├── .env (Local secrets - NOT in git)
├── .env.example (Template - commit this)
└── package.json (Dependencies)
```

---

## Quick Reference Commands

```bash
# Setup
npm install
cp .env.example .env
npx prisma migrate deploy

# Development
npm run dev
npx prisma studio

# Migrations
npx prisma migrate dev --name <name>
npx prisma migrate status

# Testing
npm test

# Production Deploy
NODE_ENV=production npx prisma migrate deploy
npm start
```

---

For more information, visit:
- [Prisma Documentation](https://www.prisma.io/docs/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
