# 💾 Backup and Restore Script for PangkasKAKA Database
# 
# This script helps backup and restore PostgreSQL databases
# Usage: bash backup_restore.sh [backup|restore] [options]

set -e

# Configuration
BACKUP_DIR="./backups"
DB_NAME="${DB_NAME:-pangkaskaka}"
DB_USER="${DB_USER:-root}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_${TIMESTAMP}.sql"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Main functions
backup_database() {
    print_header "Database Backup"
    print_info "Database: $DB_NAME"
    print_info "Host: $DB_HOST:$DB_PORT"
    print_info "User: $DB_USER"
    print_info "Backup File: $BACKUP_FILE"
    
    echo ""
    
    if pg_dump -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" > "$BACKUP_FILE"; then
        local file_size=$(du -h "$BACKUP_FILE" | cut -f1)
        print_success "Database backed up successfully!"
        print_success "File size: $file_size"
        echo ""
        echo "📍 Backup saved to: $BACKUP_FILE"
    else
        print_error "Failed to backup database"
        echo "Make sure:"
        echo "  - PostgreSQL is running"
        echo "  - Database '$DB_NAME' exists"
        echo "  - User '$DB_USER' can connect"
        exit 1
    fi
}

restore_database() {
    local restore_file="$1"
    
    if [ -z "$restore_file" ] || [ ! -f "$restore_file" ]; then
        print_error "Backup file not found: $restore_file"
        echo "Usage: bash backup_restore.sh restore <backup_file>"
        exit 1
    fi
    
    print_header "Database Restore"
    print_info "Database: $DB_NAME"
    print_info "Host: $DB_HOST:$DB_PORT"
    print_info "User: $DB_USER"
    print_info "Source File: $restore_file"
    echo ""
    
    read -p "⚠️  This will overwrite database '$DB_NAME'. Continue? (yes/no): " -r confirm
    if [ "$confirm" != "yes" ]; then
        print_info "Restore cancelled"
        exit 0
    fi
    
    echo ""
    
    if psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" < "$restore_file"; then
        print_success "Database restored successfully!"
        echo ""
        echo "Run migrations to ensure schema is up-to-date:"
        echo "  npx prisma migrate deploy"
    else
        print_error "Failed to restore database"
        echo "Make sure:"
        echo "  - PostgreSQL is running"
        echo "  - Database '$DB_NAME' exists and is empty"
        echo "  - Backup file is valid"
        exit 1
    fi
}

list_backups() {
    print_header "Available Backups"
    
    if [ -z "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]; then
        print_info "No backups found in $BACKUP_DIR"
        exit 0
    fi
    
    echo "Recent backups:"
    ls -lh "$BACKUP_DIR" | tail -n +2 | while read -r line; do
        filename=$(echo "$line" | awk '{print $NF}')
        filesize=$(echo "$line" | awk '{print $5}')
        date=$(echo "$line" | awk '{print $6, $7, $8}')
        printf "  %-40s | %8s | %s\n" "$filename" "$filesize" "$date"
    done
}

cleanup_old_backups() {
    local days="${1:-30}"
    print_header "Cleanup Old Backups"
    print_info "Removing backups older than $days days..."
    
    find "$BACKUP_DIR" -name "backup_*.sql" -type f -mtime +"$days" -delete
    
    print_success "Cleanup completed!"
    print_info "Run 'bash backup_restore.sh list' to see remaining backups"
}

show_usage() {
    echo "PangkasKAKA Database Backup & Restore Tool"
    echo ""
    echo "Usage:"
    echo "  bash backup_restore.sh <command> [options]"
    echo ""
    echo "Commands:"
    echo "  backup              Create database backup"
    echo "  restore <file>      Restore from backup file"
    echo "  list                List all backups"
    echo "  cleanup [days]      Remove backups older than N days (default: 30)"
    echo ""
    echo "Examples:"
    echo "  # Create backup"
    echo "  bash backup_restore.sh backup"
    echo ""
    echo "  # List backups"
    echo "  bash backup_restore.sh list"
    echo ""
    echo "  # Restore from specific backup"
    echo "  bash backup_restore.sh restore ./backups/backup_pangkaskaka_20231201_102345.sql"
    echo ""
    echo "  # Delete backups older than 7 days"
    echo "  bash backup_restore.sh cleanup 7"
    echo ""
    echo "Environment Variables:"
    echo "  DB_NAME       Database name (default: pangkaskaka)"
    echo "  DB_USER       Database user (default: root)"
    echo "  DB_HOST       Database host (default: localhost)"
    echo "  DB_PORT       Database port (default: 5432)"
    echo ""
    echo "Examples:"
    echo "  DB_HOST=prod.example.com bash backup_restore.sh backup"
    echo "  DB_USER=produser DB_HOST=prod.example.com bash backup_restore.sh backup"
}

# Main script
case "${1:-help}" in
    backup)
        backup_database
        ;;
    restore)
        restore_database "$2"
        ;;
    list)
        list_backups
        ;;
    cleanup)
        cleanup_old_backups "$2"
        ;;
    help|-h|--help)
        show_usage
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_usage
        exit 1
        ;;
esac
