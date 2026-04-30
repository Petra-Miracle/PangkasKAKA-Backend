@echo off
REM 💾 Backup and Restore Script for PangkasKAKA Database (Windows)
REM This script helps backup and restore PostgreSQL databases
REM Usage: backup_restore.bat [backup|restore] [options]

setlocal enabledelayedexpansion

REM Configuration
set "BACKUP_DIR=backups"
set "DB_NAME=pangkaskaka"
set "DB_USER=root"
set "DB_HOST=localhost"
set "DB_PORT=5432"

REM Get timestamp
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
set "TIMESTAMP=!mydate!_!mytime!"
set "BACKUP_FILE=!BACKUP_DIR!\backup_!DB_NAME!_!TIMESTAMP!.sql"

REM Create backup directory
if not exist "!BACKUP_DIR!" mkdir "!BACKUP_DIR!"

REM Main commands
if "%1"=="backup" (
    call :backup_database
) else if "%1"=="restore" (
    call :restore_database "%2"
) else if "%1"=="list" (
    call :list_backups
) else if "%1"=="cleanup" (
    call :cleanup_old_backups "%2"
) else (
    call :show_usage
)

goto :end

REM ===== FUNCTIONS =====

:backup_database
echo.
echo ================ Database Backup ================
echo Database: !DB_NAME!
echo Host: !DB_HOST!:!DB_PORT!
echo User: !DB_USER!
echo Backup File: !BACKUP_FILE!
echo.

pg_dump -U !DB_USER! -h !DB_HOST! -p !DB_PORT! -d !DB_NAME! > "!BACKUP_FILE!"

if !errorlevel! equ 0 (
    for %%A in ("!BACKUP_FILE!") do set "filesize=%%~zA"
    echo.
    echo ✓ Database backed up successfully!
    echo ✓ Backup file: !BACKUP_FILE!
    echo.
) else (
    echo ✗ Failed to backup database
    echo.
    echo Make sure:
    echo   - PostgreSQL is installed and running
    echo   - pg_dump is in your PATH
    echo   - Database '!DB_NAME!' exists
    echo   - User '!DB_USER!' can connect
    exit /b 1
)
goto :eof

:restore_database
setlocal
set "RESTORE_FILE=%~1"

if not exist "!RESTORE_FILE!" (
    echo ✗ Backup file not found: !RESTORE_FILE!
    echo.
    echo Usage: backup_restore.bat restore "path\to\backup.sql"
    exit /b 1
)

echo.
echo =============== Database Restore ==============
echo Database: !DB_NAME!
echo Host: !DB_HOST!:!DB_PORT!
echo User: !DB_USER!
echo Source File: !RESTORE_FILE!
echo.

set /p "confirm=⚠️  This will overwrite database '!DB_NAME!'. Continue? (yes/no): "

if /i not "!confirm!"=="yes" (
    echo ℹ Restore cancelled
    goto :eof
)

echo.
psql -U !DB_USER! -h !DB_HOST! -p !DB_PORT! -d !DB_NAME! < "!RESTORE_FILE!"

if !errorlevel! equ 0 (
    echo.
    echo ✓ Database restored successfully!
    echo.
    echo Run migrations to ensure schema is up-to-date:
    echo   npx prisma migrate deploy
) else (
    echo.
    echo ✗ Failed to restore database
    echo.
    echo Make sure:
    echo   - PostgreSQL is running
    echo   - Database '!DB_NAME!' exists
    echo   - Backup file is valid
    exit /b 1
)
endlocal
goto :eof

:list_backups
echo.
echo ================ Available Backups =============
echo.

if exist "!BACKUP_DIR!\*" (
    dir /b /o-d "!BACKUP_DIR!" 2>nul | findstr "backup_.*\.sql" >nul
    if !errorlevel! equ 0 (
        echo Recent backups:
        for /f "tokens=*" %%a in ('dir /b /o-d "!BACKUP_DIR!" 2^>nul') do (
            if "%%a" neq "" echo   %%a
        )
    ) else (
        echo ℹ No backups found in !BACKUP_DIR!
    )
) else (
    echo ℹ No backups directory found
)
echo.
goto :eof

:cleanup_old_backups
set "DAYS=30"
if not "%~1"=="" set "DAYS=%~1"

echo.
echo ============= Cleanup Old Backups ==============
echo ℹ Backup cleanup feature requires manual deletion on Windows
echo ℹ Please delete files in '!BACKUP_DIR!' older than !DAYS! days manually
echo.
goto :eof

:show_usage
echo.
echo PangkasKAKA Database Backup ^& Restore Tool (Windows)
echo.
echo Usage:
echo   backup_restore.bat ^<command^> [options]
echo.
echo Commands:
echo   backup              Create database backup
echo   restore ^<file^>     Restore from backup file
echo   list                List all backups
echo   cleanup [days]      Remove backups older than N days
echo.
echo Examples:
echo.
echo   # Create backup
echo   backup_restore.bat backup
echo.
echo   # List backups
echo   backup_restore.bat list
echo.
echo   # Restore from specific backup
echo   backup_restore.bat restore backups\backup_pangkaskaka_20231201_102345.sql
echo.
echo Environment Setup:
echo   Make sure psql and pg_dump are in your PATH
echo   - Add PostgreSQL bin folder to PATH
echo   - Or set PGPATH environment variable
echo.

:end
endlocal
