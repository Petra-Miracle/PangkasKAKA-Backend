const { execSync } = require('child_process');
const { existsSync } = require('fs');
const { resolve } = require('path');

try {
  execSync('git config core.hooksPath .githooks', { stdio: 'ignore' });
} catch (_) {}

const cwd = process.cwd();
const prismaCli = resolve(cwd, 'node_modules/prisma/build/index.js');
const schema = resolve(cwd, 'PangkasDB/prisma/schema.prisma');

console.log('[build] cwd:', cwd);
console.log('[build] prisma CLI exists:', existsSync(prismaCli));
console.log('[build] schema exists:', existsSync(schema));

if (!existsSync(prismaCli)) {
  console.error('[build] ERROR: prisma CLI not found');
  process.exit(1);
}

if (!existsSync(schema)) {
  console.error('[build] ERROR: schema file not found');
  process.exit(1);
}

try {
  execSync(
    'node ' + prismaCli + ' generate --schema=' + schema,
    { stdio: 'inherit', cwd }
  );
  console.log('[build] OK');
} catch (err) {
  console.error('[build] ERROR:', err.message);
  process.exit(1);
}
